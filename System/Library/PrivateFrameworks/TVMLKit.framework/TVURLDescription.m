@implementation TVURLDescription

- (id)initUrlWithProperties:(id)a3 imageSize:(CGSize)a4 focusSizeIncrease:(double)a5 cropCode:(id)a6 urlFormat:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  TVURLDescription *v16;
  TVURLDescription *v17;
  objc_super v19;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)TVURLDescription;
  v16 = -[TVURLDescription init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[TVURLDescription setUrl:](v16, "setUrl:", v13);
    -[TVURLDescription setImageSize:](v17, "setImageSize:", width, height);
    -[TVURLDescription setFocusSizeIncrease:](v17, "setFocusSizeIncrease:", a5);
    -[TVURLDescription setCropCode:](v17, "setCropCode:", v14);
    -[TVURLDescription setUrlFormat:](v17, "setUrlFormat:", v15);
  }

  return v17;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (double)focusSizeIncrease
{
  return self->_focusSizeIncrease;
}

- (void)setFocusSizeIncrease:(double)a3
{
  self->_focusSizeIncrease = a3;
}

- (NSString)cropCode
{
  return self->_cropCode;
}

- (void)setCropCode:(id)a3
{
  objc_storeStrong((id *)&self->_cropCode, a3);
}

- (NSString)urlFormat
{
  return self->_urlFormat;
}

- (void)setUrlFormat:(id)a3
{
  objc_storeStrong((id *)&self->_urlFormat, a3);
}

- (BOOL)centerGrowth
{
  return self->_centerGrowth;
}

- (void)setCenterGrowth:(BOOL)a3
{
  self->_centerGrowth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlFormat, 0);
  objc_storeStrong((id *)&self->_cropCode, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
