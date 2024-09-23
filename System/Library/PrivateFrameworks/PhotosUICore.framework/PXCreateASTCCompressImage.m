@implementation PXCreateASTCCompressImage

void __PXCreateASTCCompressImage_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0CBC840];
  v2 = *MEMORY[0x1E0CBC848];
  v7[0] = *MEMORY[0x1E0CBCA18];
  v7[1] = v2;
  v3 = *MEMORY[0x1E0C9AE50];
  v8[0] = v1;
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E0CBC830];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)PXCreateASTCCompressImage_properties;
  PXCreateASTCCompressImage_properties = v5;

}

uint64_t __PXCreateASTCCompressImage_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  PXCreateASTCCompressImage_deviceSupportsASTC = result;
  return result;
}

@end
