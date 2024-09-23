@implementation PXSampleInboxMediaProvider

- (int)requestImageForPreviewItem:(id)a3 targetSize:(CGSize)a4 resultHandler:(id)a5
{
  void (**v5)(id, void *, _QWORD);
  void *v6;

  v5 = (void (**)(id, void *, _QWORD))a5;
  +[PXSampleInboxMediaProvider _mockImage](PXSampleInboxMediaProvider, "_mockImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v5[2](v5, v6, 0);

  return 1;
}

+ (id)_mockImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 57.0, 57.0);
  objc_msgSend(v2, "imageWithActions:", &__block_literal_global_48651);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __40__PXSampleInboxMediaProvider__mockImage__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = (double)arc4random_uniform(0xFFu) / 255.0;
  v4 = (double)arc4random_uniform(0x80u) / 255.0 + 0.5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v3, v4, (double)arc4random_uniform(0x80u) / 255.0 + 0.5, 1.0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFill");
  objc_msgSend(v2, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v2, "fillRect:");

}

@end
