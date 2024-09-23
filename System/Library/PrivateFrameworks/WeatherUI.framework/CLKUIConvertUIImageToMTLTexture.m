@implementation CLKUIConvertUIImageToMTLTexture

void *__CLKUIConvertUIImageToMTLTexture_block_invoke(_QWORD *a1, uint64_t a2)
{
  return memcpy((void *)(a1[7] + a1[8] * a2), (const void *)(a1[4] + (a1[5] + ~a2) * a1[6]), a1[8]);
}

id __CLKUIConvertUIImageToMTLTexture_block_invoke_2(uint64_t *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v10[3];
  _QWORD v11[3];

  objc_msgSend(a2, "blitCommandEncoder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[7] * a1[6];
  v5 = a1[8];
  v11[0] = a1[6];
  v11[1] = v5;
  v11[2] = 1;
  v6 = a1[4];
  v7 = a1[5];
  memset(v10, 0, sizeof(v10));
  objc_msgSend(v3, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v6, 0, v4, v4 * v5, v11, v7, 0, 0, v10);
  objc_msgSend(v3, "endEncoding");
  v8 = (id)a1[5];

  return v8;
}

@end
