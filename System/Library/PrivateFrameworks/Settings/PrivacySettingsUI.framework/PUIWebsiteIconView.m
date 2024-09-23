@implementation PUIWebsiteIconView

void __PUIWebsiteIconView_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  PSBlankIconImage();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  PUIWebsiteIconView_iconSize_0 = v1;
  PUIWebsiteIconView_iconSize_1 = v2;

  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "continuousCornerRadius");
  PUIWebsiteIconView_cornerRadius = v3;

}

@end
