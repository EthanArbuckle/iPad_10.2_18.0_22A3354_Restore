@implementation WBSSVGImageRenderingRequest

- (WBSSVGImageRenderingRequest)initWithURL:(id)a3 extraInfo:(id)a4
{

  return 0;
}

- (WBSSVGImageRenderingRequest)initWithURL:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  WBSSVGImageRenderingRequest *v10;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  height = a4.height;
  width = a4.width;
  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("imageSize");
  v7 = a3;
  -[WBSSVGImageRenderingRequest _imageSizeValueWithSize:](self, "_imageSizeValueWithSize:", width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)WBSSVGImageRenderingRequest;
  v10 = -[WBSSiteMetadataRequest initWithURL:extraInfo:](&v12, sel_initWithURL_extraInfo_, v7, v9);

  return v10;
}

- (WBSSVGImageRenderingRequest)initWithURLs:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  WBSSVGImageRenderingRequest *v10;
  objc_super v12;
  _QWORD v13[2];
  _QWORD v14[3];

  height = a4.height;
  width = a4.width;
  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("imageSize");
  v7 = a3;
  -[WBSSVGImageRenderingRequest _imageSizeValueWithSize:](self, "_imageSizeValueWithSize:", width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("urls");
  v14[0] = v8;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)WBSSVGImageRenderingRequest;
  v10 = -[WBSSiteMetadataRequest initWithURL:extraInfo:](&v12, sel_initWithURL_extraInfo_, 0, v9);

  return v10;
}

- (WBSSVGImageRenderingRequest)initWithSVGContent:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  WBSSVGImageRenderingRequest *v10;
  objc_super v12;
  _QWORD v13[2];
  _QWORD v14[3];

  height = a4.height;
  width = a4.width;
  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("imageSize");
  v7 = a3;
  -[WBSSVGImageRenderingRequest _imageSizeValueWithSize:](self, "_imageSizeValueWithSize:", width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("svgContent");
  v14[0] = v8;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)WBSSVGImageRenderingRequest;
  v10 = -[WBSSiteMetadataRequest initWithURL:extraInfo:](&v12, sel_initWithURL_extraInfo_, 0, v9);

  return v10;
}

- (id)_imageSizeValueWithSize:(CGSize)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", a3.width, a3.height);
}

- (CGSize)imageSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("imageSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSString)svgContent
{
  void *v2;
  void *v3;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("svgContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)urls
{
  void *v2;
  void *v3;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("urls"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

@end
