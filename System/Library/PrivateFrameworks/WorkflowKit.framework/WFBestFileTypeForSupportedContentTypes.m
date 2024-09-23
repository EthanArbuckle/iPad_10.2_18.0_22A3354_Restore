@implementation WFBestFileTypeForSupportedContentTypes

uint64_t __WFBestFileTypeForSupportedContentTypes_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToType:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
