SynthDef.new(\viola,
{|vib=6, grain=0, echoOn=0, scrub=0, room=0.3, bits=24, slide=0, echo=0, delay=0, rate=1, verb=0.33, sus=1, slidefrom=1, lpf=20000, amp=1, freq=0, buf=0, hpf=0, pan=0|
var osc, env;
amp = amp / 2;
freq = Line.ar(freq * slidefrom, freq * (1 + slide), sus);
freq = Vibrato.kr(freq, rate: vib);
freq=freq;
osc=Decimator.ar(LPF.ar(HPF.ar(PMOsc.ar(freq, Vibrato.kr(freq, delay: (sus * 0.25), rate: vib, depth: 0.008), 10, mul: (amp / 2)), hpf), (lpf + 1)), rate: 44100, bits: bits);
env=EnvGen.ar(Env.perc((0.25 * sus), (2.5 * sus), level: amp, releaseTime: sus), doneAction: 2);
	Out.ar(0, Pan2.ar(FreeVerb.ar(osc * env, verb, room), pan))}).add;