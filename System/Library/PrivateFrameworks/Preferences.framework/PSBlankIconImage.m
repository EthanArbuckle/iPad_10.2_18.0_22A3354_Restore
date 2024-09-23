@implementation PSBlankIconImage

void __PSBlankIconImage_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareImageForDescriptor:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = (void *)MEMORY[0x1E0CEA638];
    v4 = objc_msgSend(v1, "CGImage");
    objc_msgSend(v2, "scale");
    objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)PSBlankIconImage_result;
    PSBlankIconImage_result = v5;

  }
}

@end
