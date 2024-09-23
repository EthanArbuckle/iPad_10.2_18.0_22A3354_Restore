@implementation CNVCardImage

- (CNVCardImage)init
{
  CNVCardImage *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNVCardImage)initWithData:(id)a3 cropRects:(id)a4
{
  CNVCardImage *v4;
  id v6;
  CNVCardImage *v7;
  CNVCardImage *v8;

  v4 = (CNVCardImage *)a3;
  if (a3)
  {
    v6 = a4;
    v7 = v4;
    objc_msgSend((id)objc_opt_class(), "sizeOfImageData:", v7);
    v8 = -[CNVCardImage initWithData:cropRects:size:](self, "initWithData:cropRects:size:", v7, v6);

    self = v8;
    v4 = self;
  }

  return v4;
}

- (CNVCardImage)initWithData:(id)a3 cropRects:(id)a4 size:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  NSData *v11;
  NSData *data;
  NSDictionary *v13;
  NSDictionary *cropRects;
  CNVCardImage *v15;
  objc_super v17;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  if (v9
    && (v17.receiver = self,
        v17.super_class = (Class)CNVCardImage,
        (self = -[CNVCardImage init](&v17, sel_init)) != 0))
  {
    v11 = (NSData *)objc_msgSend(v9, "copy");
    data = self->_data;
    self->_data = v11;

    v13 = (NSDictionary *)objc_msgSend(v10, "copy");
    cropRects = self->_cropRects;
    self->_cropRects = v13;

    self->_size.width = width;
    self->_size.height = height;
    self = self;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardImage describePropertiesWithBuilder:](self, "describePropertiesWithBuilder:", v3);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)describePropertiesWithBuilder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CNVCardImage data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ bytes"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v20, "appendName:object:", CFSTR("data"), v8);

  -[CNVCardImage cropRects](self, "cropRects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v20, "appendName:object:", CFSTR("cropRects"), v10);

  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[CNVCardImage size](self, "size");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[CNVCardImage size](self, "size");
  objc_msgSend(v15, "numberWithDouble:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@x%@"), v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v20, "appendName:object:", CFSTR("size"), v18);

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CNVCardMutableImage *v4;
  void *v5;
  void *v6;
  CNVCardMutableImage *v7;

  v4 = [CNVCardMutableImage alloc];
  -[CNVCardImage data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardImage cropRects](self, "cropRects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardImage size](self, "size");
  v7 = -[CNVCardMutableImage initWithData:cropRects:size:](v4, "initWithData:cropRects:size:", v5, v6);

  return v7;
}

+ (CGSize)sizeOfImageData:(id)a3
{
  uint64_t v3;
  const void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v3 = softLinkCGImageSourceCreateWithData_0((uint64_t)a3, 0);
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = (void *)softLinkCGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
    CFRelease(v4);
    objc_msgSend(v5, "objectForKeyedSubscript:", getkCGImagePropertyPixelWidth());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKeyedSubscript:", getkCGImagePropertyPixelHeight());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

  }
  else
  {
    v8 = 0.0;
    v11 = 0.0;
  }
  v12 = v8;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (NSData)data
{
  return self->_data;
}

- (NSDictionary)cropRects
{
  return self->_cropRects;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropRects, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
