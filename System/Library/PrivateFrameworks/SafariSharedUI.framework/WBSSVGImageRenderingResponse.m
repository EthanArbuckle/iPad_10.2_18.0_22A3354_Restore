@implementation WBSSVGImageRenderingResponse

- (WBSSVGImageRenderingResponse)initWithURL:(id)a3
{
  return -[WBSSVGImageRenderingResponse initWithURL:image:](self, "initWithURL:image:", a3, 0);
}

- (WBSSVGImageRenderingResponse)initWithURL:(id)a3 image:(id)a4
{
  id v7;
  WBSSVGImageRenderingResponse *v8;
  WBSSVGImageRenderingResponse *v9;
  WBSSVGImageRenderingResponse *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSSVGImageRenderingResponse;
  v8 = -[WBSSiteMetadataResponse initWithURL:](&v12, sel_initWithURL_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a4);
    v10 = v9;
  }

  return v9;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
