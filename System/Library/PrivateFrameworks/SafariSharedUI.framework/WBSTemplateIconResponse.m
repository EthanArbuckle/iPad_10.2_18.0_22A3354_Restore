@implementation WBSTemplateIconResponse

+ (id)responseWithURL:(id)a3 image:(id)a4 highlightedImage:(id)a5 themeColor:(id)a6 isMonogram:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:image:highlightedImage:themeColor:isMonogram:", v15, v14, v13, v12, v7);

  return v16;
}

- (WBSTemplateIconResponse)initWithURL:(id)a3
{

  return 0;
}

- (WBSTemplateIconResponse)initWithURL:(id)a3 image:(id)a4 highlightedImage:(id)a5 themeColor:(id)a6 isMonogram:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  WBSTemplateIconResponse *v16;
  WBSTemplateIconResponse *v17;
  WBSTemplateIconResponse *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WBSTemplateIconResponse;
  v16 = -[WBSSiteMetadataResponse initWithURL:](&v20, sel_initWithURL_, a3);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_image, a4);
    objc_storeStrong((id *)&v17->_highlightedImage, a5);
    objc_storeStrong((id *)&v17->_themeColor, a6);
    v17->_monogram = a7;
    v18 = v17;
  }

  return v17;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)highlightedImage
{
  return self->_highlightedImage;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (BOOL)isMonogram
{
  return self->_monogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_highlightedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
