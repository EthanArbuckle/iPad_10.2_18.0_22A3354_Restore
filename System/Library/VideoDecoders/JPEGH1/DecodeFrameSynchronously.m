@implementation DecodeFrameSynchronously

uint64_t __jpeg_DecodeFrameSynchronously_block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!a2 && !*(_BYTE *)(v2 + 240))
    *(_BYTE *)(v2 + 240) = 1;
  return VTDecoderSessionEmitDecodedFrame();
}

@end
