@implementation PFCStoredLayout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  double backgroundZorder;
  double foregroundZorder;
  double timeElementZorder;
  double imageAOTBrightness;
  id v12;

  x = self->_originalCrop.origin.x;
  y = self->_originalCrop.origin.y;
  width = self->_originalCrop.size.width;
  height = self->_originalCrop.size.height;
  v12 = a3;
  objc_msgSend(v12, "encodeCGRect:forKey:", CFSTR("originalCrop"), x, y, width, height);
  objc_msgSend(v12, "encodeObject:forKey:", self->_baseImageName, CFSTR("baseImageName"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_maskImageName, CFSTR("maskImageName"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_timePosition, CFSTR("timePosition"));
  objc_msgSend(v12, "encodeCGRect:forKey:", CFSTR("timeRect"), self->_timeRect.origin.x, self->_timeRect.origin.y, self->_timeRect.size.width, self->_timeRect.size.height);
  backgroundZorder = self->_backgroundZorder;
  *(float *)&backgroundZorder = backgroundZorder;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("backgroundZorder"), backgroundZorder);
  foregroundZorder = self->_foregroundZorder;
  *(float *)&foregroundZorder = foregroundZorder;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("foregroundZorder"), foregroundZorder);
  timeElementZorder = self->_timeElementZorder;
  *(float *)&timeElementZorder = timeElementZorder;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("timeElementZorder"), timeElementZorder);
  imageAOTBrightness = self->_imageAOTBrightness;
  *(float *)&imageAOTBrightness = imageAOTBrightness;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("imageAOTBrightness"), imageAOTBrightness);
  objc_msgSend(v12, "encodeBool:forKey:", self->_userEdited, CFSTR("userEdited"));

}

- (PFCStoredLayout)initWithCoder:(id)a3
{
  id v4;
  PFCStoredLayout *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  NSString *baseImageName;
  uint64_t v12;
  NSString *maskImageName;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  float v18;
  float v19;
  float v20;
  float v21;
  NSData *colorInfo;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PFCStoredLayout;
  v5 = -[PFCStoredLayout init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("originalCrop"));
    v5->_originalCrop.origin.x = v6;
    v5->_originalCrop.origin.y = v7;
    v5->_originalCrop.size.width = v8;
    v5->_originalCrop.size.height = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseImageName"));
    v10 = objc_claimAutoreleasedReturnValue();
    baseImageName = v5->_baseImageName;
    v5->_baseImageName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maskImageName"));
    v12 = objc_claimAutoreleasedReturnValue();
    maskImageName = v5->_maskImageName;
    v5->_maskImageName = (NSString *)v12;

    v5->_timePosition = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timePosition"));
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("timeRect"));
    v5->_timeRect.origin.x = v14;
    v5->_timeRect.origin.y = v15;
    v5->_timeRect.size.width = v16;
    v5->_timeRect.size.height = v17;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("backgroundZorder"));
    v5->_backgroundZorder = v18;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("foregroundZorder"));
    v5->_foregroundZorder = v19;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("timeElementZorder"));
    v5->_timeElementZorder = v20;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("imageAOTBrightness"));
    v5->_imageAOTBrightness = v21;
    v5->_userEdited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userEdited"));
    colorInfo = v5->_colorInfo;
    v5->_colorInfo = 0;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setOriginalCrop:", self->_originalCrop.origin.x, self->_originalCrop.origin.y, self->_originalCrop.size.width, self->_originalCrop.size.height);
  v6 = (void *)-[NSString copyWithZone:](self->_baseImageName, "copyWithZone:", a3);
  objc_msgSend(v5, "setBaseImageName:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_maskImageName, "copyWithZone:", a3);
  objc_msgSend(v5, "setMaskImageName:", v7);

  objc_msgSend(v5, "setTimePosition:", self->_timePosition);
  objc_msgSend(v5, "setTimeRect:", self->_timeRect.origin.x, self->_timeRect.origin.y, self->_timeRect.size.width, self->_timeRect.size.height);
  objc_msgSend(v5, "setBackgroundZorder:", self->_backgroundZorder);
  objc_msgSend(v5, "setForegroundZorder:", self->_foregroundZorder);
  objc_msgSend(v5, "setTimeElementZorder:", self->_timeElementZorder);
  objc_msgSend(v5, "setImageAOTBrightness:", self->_imageAOTBrightness);
  objc_msgSend(v5, "setUserEdited:", self->_userEdited);
  objc_msgSend(v5, "setColorInfo:", 0);
  return v5;
}

- (CGRect)originalCrop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalCrop.origin.x;
  y = self->_originalCrop.origin.y;
  width = self->_originalCrop.size.width;
  height = self->_originalCrop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalCrop:(CGRect)a3
{
  self->_originalCrop = a3;
}

- (NSString)baseImageName
{
  return self->_baseImageName;
}

- (void)setBaseImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)maskImageName
{
  return self->_maskImageName;
}

- (void)setMaskImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)timePosition
{
  return self->_timePosition;
}

- (void)setTimePosition:(unint64_t)a3
{
  self->_timePosition = a3;
}

- (CGRect)timeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timeRect.origin.x;
  y = self->_timeRect.origin.y;
  width = self->_timeRect.size.width;
  height = self->_timeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTimeRect:(CGRect)a3
{
  self->_timeRect = a3;
}

- (double)backgroundZorder
{
  return self->_backgroundZorder;
}

- (void)setBackgroundZorder:(double)a3
{
  self->_backgroundZorder = a3;
}

- (double)foregroundZorder
{
  return self->_foregroundZorder;
}

- (void)setForegroundZorder:(double)a3
{
  self->_foregroundZorder = a3;
}

- (double)timeElementZorder
{
  return self->_timeElementZorder;
}

- (void)setTimeElementZorder:(double)a3
{
  self->_timeElementZorder = a3;
}

- (double)imageAOTBrightness
{
  return self->_imageAOTBrightness;
}

- (void)setImageAOTBrightness:(double)a3
{
  self->_imageAOTBrightness = a3;
}

- (BOOL)userEdited
{
  return self->_userEdited;
}

- (void)setUserEdited:(BOOL)a3
{
  self->_userEdited = a3;
}

- (NSData)colorInfo
{
  return self->_colorInfo;
}

- (void)setColorInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorInfo, 0);
  objc_storeStrong((id *)&self->_maskImageName, 0);
  objc_storeStrong((id *)&self->_baseImageName, 0);
}

@end
