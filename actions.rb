#!/usr/bin/env ruby

puts "Dial A1 and put him in C1"
`curl -X POST "https://lukkry-voicedev.fwd.wf/dial_agent" -d { agent_name: "a1", conference_name: "c1" }`

sleep(10)

puts "Put a customer in a conference"
`curl -X POST "https://lukkry-voicedev.fwd.wf/put_caller_in_conference"`

sleep(10)

puts "Play music to a customer"
`curl "https://lukkry-voicedev.fwd.wf/run/hold/customer"`

puts "Dial A2 and put him in a conference"
`curl -X POST "https://lukkry-voicedev.fwd.wf/dial_agent/a2"`

sleep(10)

puts "Remove A1 from a conference"
`curl -X POST "https://lukkry-voicedev.fwd.wf/hangup/a1"`

puts "Put a customer in a conference"
`curl -X POST "https://lukkry-voicedev.fwd.wf/put_caller_in_conference"`

# Hang up all
# curl -X POST "https://lukkry-voicedev.fwd.wf/hangup_all"
