@implementation AVAudioPCMBuffer

void *__49__AVAudioPCMBuffer_RCAdditions__extractChannels___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1[5];
  v2 = a1[6];
  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5 + 1;
  return memcpy(*(void **)(v2 + 16 * v5 + 16), *(const void **)(v3 + 16 * a2 + 16), *(unsigned int *)(v3 + 16 * a2 + 12));
}

@end
