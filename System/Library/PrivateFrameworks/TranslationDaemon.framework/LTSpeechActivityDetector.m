@implementation LTSpeechActivityDetector

void __48___LTSpeechActivityDetector_addSpeechAudioData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length") >> 1;
  v3 = objc_alloc(MEMORY[0x24BDB1838]);
  objc_msgSend(*(id *)(a1 + 40), "nativeAudioFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "initWithPCMFormat:frameCapacity:", v4, v2);

  objc_msgSend(v5, "setFrameLength:", v2);
  memcpy(*(void **)objc_msgSend(v5, "int16ChannelData"), (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "analyzeAudioBuffer:atAudioFramePosition:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) += v2;

}

@end
