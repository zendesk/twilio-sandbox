#!/usr/bin/env ruby

puts "Dial A1 and put him in C1"
`curl -X POST "https://carcher-voicedev.fwd.wf/dial_agent" -d '{ "agent_name": "a1", "conference_name": "c1" }' -H "Content-Type: application/json"`

sleep(10)

puts "Put customer 'on hold' in C2"
`curl -X POST "https://carcher-voicedev.fwd.wf/put_caller_in_conference/c2"`

sleep(10)

puts "Put A1 him in C3"
`curl -X POST "https://carcher-voicedev.fwd.wf/put_agent_in_conference" -d '{ "agent_name": "a1", "conference_name": "c3" }' -H "Content-Type: application/json"`

puts "Dial A2 and put him in C3"
`curl -X POST "https://carcher-voicedev.fwd.wf/dial_agent" -d '{ "agent_name": "a2", "conference_name": "c3" }' -H "Content-Type: application/json"`

puts "Put A2 in C2 with caller"
`curl -X POST "https://carcher-voicedev.fwd.wf/put_agent_in_conference" -d '{ "agent_name": "a2", "conference_name": "c2" }' -H "Content-Type: application/json"`

sleep(10)

puts "Put a customer in a conference"
`curl -X POST "https://carcher-voicedev.fwd.wf/put_caller_in_conference"`

sleep(10)

puts "Play music to a customer"
`curl "https://carcher-voicedev.fwd.wf/run/hold/customer"`

puts "Dial A2 and put him in a conference"
`curl -X POST "https://carcher-voicedev.fwd.wf/dial_agent/a2"`

sleep(10)

puts "Remove A1 from a conference"
`curl -X POST "https://carcher-voicedev.fwd.wf/hangup/a1"`

puts "Put a customer in a conference"
`curl -X POST "https://carcher-voicedev.fwd.wf/put_caller_in_conference"`

# Hang up all
# curl -X POST "https://carcher-voicedev.fwd.wf/hangup_all"
