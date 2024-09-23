@implementation TVBlurredImageWithOptionsAndOverlayColorForImage

void ___TVBlurredImageWithOptionsAndOverlayColorForImage_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBF648];
  v5 = *MEMORY[0x24BDBF858];
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contextWithOptions:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_TVBlurredImageWithOptionsAndOverlayColorForImage___ciContext;
  _TVBlurredImageWithOptionsAndOverlayColorForImage___ciContext = v3;

}

@end
