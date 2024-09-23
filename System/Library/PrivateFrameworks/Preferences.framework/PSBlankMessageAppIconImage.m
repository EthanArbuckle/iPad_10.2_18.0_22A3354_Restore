@implementation PSBlankMessageAppIconImage

void __PSBlankMessageAppIconImage_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A878]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareImageForDescriptor:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = (void *)MEMORY[0x1E0CEA638];
    v4 = objc_msgSend(v1, "CGImage");
    objc_msgSend(v2, "scale");
    objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageByPreparingThumbnailOfSize:", PSSizeForMessagesIcon());
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)PSBlankMessageAppIconImage_result;
    PSBlankMessageAppIconImage_result = v6;

  }
}

@end
