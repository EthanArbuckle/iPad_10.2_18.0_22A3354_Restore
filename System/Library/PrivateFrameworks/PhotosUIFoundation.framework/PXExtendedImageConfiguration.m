@implementation PXExtendedImageConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_imageConfiguration, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

- (PXExtendedImageConfiguration)initWithImageName:(id)a3 isSystemImage:(BOOL)a4 accessibilityLabel:(id)a5 tintColor:(id)a6 imageConfiguration:(id)a7 inBundle:(id)a8
{
  id v15;
  id v16;
  id v17;
  PXExtendedImageConfiguration *v18;
  PXExtendedImageConfiguration *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PXExtendedImageConfiguration;
  v18 = -[PXExtendedImageConfiguration init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageName, a3);
    v19->_isSystemImage = a4;
    objc_storeStrong((id *)&v19->_accessibilityLabel, a5);
    objc_storeStrong((id *)&v19->_tintColor, a6);
    objc_storeStrong((id *)&v19->_imageConfiguration, a7);
    objc_storeStrong((id *)&v19->_bundle, a8);
  }

  return v19;
}

- (PXExtendedImageConfiguration)initWithImageName:(id)a3
{
  return -[PXExtendedImageConfiguration initWithImageName:isSystemImage:accessibilityLabel:tintColor:imageConfiguration:inBundle:](self, "initWithImageName:isSystemImage:accessibilityLabel:tintColor:imageConfiguration:inBundle:", a3, 0, 0, 0, 0, 0);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isSystemImage
{
  return self->_isSystemImage;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (UIImageConfiguration)imageConfiguration
{
  return self->_imageConfiguration;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (PXExtendedImageConfiguration)initWithImageName:(id)a3 isSystemImage:(BOOL)a4
{
  return -[PXExtendedImageConfiguration initWithImageName:isSystemImage:accessibilityLabel:tintColor:imageConfiguration:inBundle:](self, "initWithImageName:isSystemImage:accessibilityLabel:tintColor:imageConfiguration:inBundle:", a3, a4, 0, 0, 0, 0);
}

- (PXExtendedImageConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExtendedImageConfiguration.m"), 37, CFSTR("%s is not available as initializer"), "-[PXExtendedImageConfiguration init]");

  abort();
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

@end
