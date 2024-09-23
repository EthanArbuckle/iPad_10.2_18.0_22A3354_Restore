@implementation PKPassSecurePreviewContext

- (PKPassSecurePreviewContext)init
{

  return 0;
}

- (id)_initWithBackgroundColor:(id)a3 primaryColor:(id)a4 secondaryColor:(id)a5 tertiaryColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKPassSecurePreviewContext *v14;
  uint64_t v15;
  NSString *backgroundColor;
  uint64_t v17;
  NSString *primaryColor;
  uint64_t v19;
  NSString *secondaryColor;
  uint64_t v21;
  NSString *tertiaryColor;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKPassSecurePreviewContext;
  v14 = -[PKPassSecurePreviewContext init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    backgroundColor = v14->_backgroundColor;
    v14->_backgroundColor = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    primaryColor = v14->_primaryColor;
    v14->_primaryColor = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    secondaryColor = v14->_secondaryColor;
    v14->_secondaryColor = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    tertiaryColor = v14->_tertiaryColor;
    v14->_tertiaryColor = (NSString *)v21;

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_icon);
  CGImageRelease(self->_image);
  CGImageRelease(self->_backgroundImage);
  v3.receiver = self;
  v3.super_class = (Class)PKPassSecurePreviewContext;
  -[PKPassSecurePreviewContext dealloc](&v3, sel_dealloc);
}

- (void)setIcon:(CGImage *)a3
{
  CGImage *icon;

  icon = self->_icon;
  if (icon != a3)
  {
    CGImageRelease(icon);
    self->_icon = CGImageRetain(a3);
  }
}

- (void)setImage:(CGImage *)a3
{
  CGImage *image;

  image = self->_image;
  if (image != a3)
  {
    CGImageRelease(image);
    self->_image = CGImageRetain(a3);
  }
}

- (void)setBackgroundImage:(CGImage *)a3
{
  CGImage *backgroundImage;

  backgroundImage = self->_backgroundImage;
  if (backgroundImage != a3)
  {
    CGImageRelease(backgroundImage);
    self->_backgroundImage = CGImageRetain(a3);
  }
}

- (CGImage)icon
{
  return self->_icon;
}

- (CGImage)image
{
  return self->_image;
}

- (CGImage)backgroundImage
{
  return self->_backgroundImage;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (void)setTertiaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)tertiaryColor
{
  return self->_tertiaryColor;
}

- (void)setTertiaryColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

+ (id)createMessagesPreviewForPassFileURL:(id)a3 withOutputDirectory:(id)a4
{
  return PKPassSecurePreviewContextCreateMessagesPreview((NSURL *)a3, (NSURL *)a4);
}

+ (id)createMessagesPreviewForPassesFileURL:(id)a3 withOutputDirectory:(id)a4
{
  return (id)PKPassesSecurePreviewContextCreateMessagesPreview((NSURL *)a3, (NSURL *)a4);
}

@end
