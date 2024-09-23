@implementation TIImageCacheItem

- (void)dealloc
{
  objc_super v3;

  -[TIImageCacheItem _callDataReleaseHandler](self, "_callDataReleaseHandler");
  CGColorRelease(self->_formatColor);
  v3.receiver = self;
  v3.super_class = (Class)TIImageCacheItem;
  -[TIImageCacheItem dealloc](&v3, sel_dealloc);
}

- (void)_callDataReleaseHandler
{
  void (**dataReleaseHandler)(id, SEL);
  id v4;

  dataReleaseHandler = (void (**)(id, SEL))self->_dataReleaseHandler;
  if (dataReleaseHandler)
  {
    dataReleaseHandler[2](dataReleaseHandler, a2);
    v4 = self->_dataReleaseHandler;
    self->_dataReleaseHandler = 0;

  }
}

- (TIImageCacheItem)initWithCoder:(id)a3
{
  id v4;
  TIImageCacheItem *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGColorSpace *DeviceRGB;
  uint64_t v15;
  NSData *data;
  objc_super v18;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIImageCacheItem;
  v5 = -[TIImageCacheItem init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (v8 = objc_retainAutorelease(v6), !strcmp((const char *)objc_msgSend(v8, "objCType"), "{CGSize=dd}")))
      objc_msgSend(v8, "getValue:", &v5->_size);
    else
      v5->_size = (CGSize)*MEMORY[0x1E0C9D820];
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
    v5->_scale = v9;
    v5->_format = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("format"));
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasFormatColor")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("formatColor_0"));
      components[0] = v10;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("formatColor_1"));
      components[1] = v11;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("formatColor_2"));
      components[2] = v12;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("formatColor_3"));
      components[3] = v13;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v5->_formatColor = CGColorCreate(DeviceRGB, components);
      CGColorSpaceRelease(DeviceRGB);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v15 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const CGFloat *Components;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_size, "{CGSize=dd}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("size"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("scale"), self->_scale);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_format, CFSTR("format"));
  if (self->_formatColor)
  {
    objc_msgSend(v6, "encodeBool:forKey:", 1, CFSTR("hasFormatColor"));
    Components = CGColorGetComponents(self->_formatColor);
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("formatColor_0"), *Components);
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("formatColor_1"), Components[1]);
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("formatColor_2"), Components[2]);
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("formatColor_3"), Components[3]);
  }
  objc_msgSend(v6, "encodeObject:forKey:", self->_data, CFSTR("data"));

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

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unsigned)format
{
  return self->_format;
}

- (void)setFormat:(unsigned __int8)a3
{
  self->_format = a3;
}

- (CGColor)formatColor
{
  return self->_formatColor;
}

- (void)setFormatColor:(CGColor *)a3
{
  self->_formatColor = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (id)dataReleaseHandler
{
  return self->_dataReleaseHandler;
}

- (void)setDataReleaseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataReleaseHandler, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)cacheItemWithSize:(CGSize)a3 format:(unsigned __int8)a4 formatColor:(CGColor *)a5 scale:(double)a6 data:(id)a7
{
  return (id)objc_msgSend(a1, "cacheItemWithSize:format:formatColor:scale:data:dataReleaseHandler:", a4, a5, a7, 0, a3.width, a3.height, a6);
}

+ (id)cacheItemWithSize:(CGSize)a3 format:(unsigned __int8)a4 formatColor:(CGColor *)a5 scale:(double)a6 data:(id)a7 dataReleaseHandler:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  CGFloat *v17;
  CGColorRef v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;

  height = a3.height;
  width = a3.width;
  v15 = a7;
  v16 = a8;
  v17 = (CGFloat *)objc_alloc_init((Class)a1);
  v17[6] = width;
  v17[7] = height;
  *((_BYTE *)v17 + 8) = a4;
  v18 = CGColorRetain(a5);
  v17[2] = a6;
  v19 = (void *)*((_QWORD *)v17 + 4);
  *((_QWORD *)v17 + 3) = v18;
  *((_QWORD *)v17 + 4) = v15;
  v20 = v15;

  v21 = objc_msgSend(v16, "copy");
  v22 = (void *)*((_QWORD *)v17 + 5);
  *((_QWORD *)v17 + 5) = v21;

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
