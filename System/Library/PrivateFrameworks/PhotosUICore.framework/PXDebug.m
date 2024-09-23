@implementation PXDebug

- (void)setPreviewImage:(CGImage *)a3
{
  id v4;

  if (self->_previewImage != a3)
  {
    self->_previewImage = a3;
    if (a3)
    {
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", a3);
      -[PXDebug setImage:](self, "setImage:", v4);

    }
    else
    {
      -[PXDebug setImage:](self, "setImage:", 0);
    }
  }
}

- (id)layer
{
  return 0;
}

- (id)__dbg_snapshotImage
{
  void *v3;
  void *v4;

  -[PXDebug image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebug alpha](self, "alpha");
  objc_msgSend(v3, "px_imageByApplyingAlpha:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGImage)previewImage
{
  return self->_previewImage;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  self->_backgroundColor = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
