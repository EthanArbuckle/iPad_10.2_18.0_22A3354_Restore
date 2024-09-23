@implementation _UISSecureControlTag

+ (unint64_t)cacheLimit
{
  return 10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISSecureControlTag)initWithCategory:(id)a3 cornerStyle:(int64_t)a4 cornerRadius:(double)a5 baseForegroundColor:(CGColor *)a6 baseBackgroundColor:(CGColor *)a7 imagePlacement:(unint64_t)a8 size:(CGSize)a9
{
  CGFloat height;
  CGFloat width;
  id v18;
  _UISSecureControlTag *v19;
  _UISSecureControlTag *v20;
  objc_super v22;

  height = a9.height;
  width = a9.width;
  v18 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_UISSecureControlTag;
  v19 = -[_UISSecureControlTag init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_category, a3);
    v20->_cornerRadius = a5;
    v20->_cornerStyle = a4;
    v20->_baseForegroundColor = CGColorRetain(a6);
    v20->_baseBackgroundColor = CGColorRetain(a7);
    v20->_imagePlacement = a8;
    v20->_size.width = width;
    v20->_size.height = height;
  }

  return v20;
}

- (_UISSecureControlTag)initWithCoder:(id)a3
{
  id v4;
  _UISSecureControlTag *v5;
  uint64_t v6;
  _UISSecureControlCategory *category;
  float v8;
  CGFloat v9;
  CGFloat v10;
  CGColorSpace *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v21;
  CGFloat v22[4];
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UISSecureControlTag;
  v5 = -[_UISSecureControlTag init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v6 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (_UISSecureControlCategory *)v6;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("cornerRadius"));
    v5->_cornerRadius = v8;
    v5->_cornerStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cornerStyle"));
    v5->_imagePlacement = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("imagePlacement"));
    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("size"));
    v5->_size.width = v9;
    v5->_size.height = v10;
    v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("foregroundColorRed")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("foregroundColorRed"));
      components[0] = v12;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("foregroundColorGreen"));
      components[1] = v13;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("foregroundColorBlue"));
      components[2] = v14;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("foregroundColorAlpha"));
      components[3] = v15;
      v5->_baseForegroundColor = CGColorCreate(v11, components);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("backgroundColorRed")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("backgroundColorRed"));
      v22[0] = v16;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("backgroundColorGreen"));
      v22[1] = v17;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("backgroundColorBlue"));
      v22[2] = v18;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("backgroundColorAlpha"));
      v22[3] = v19;
      v5->_baseBackgroundColor = CGColorCreate(v11, v22);
    }
    CGColorSpaceRelease(v11);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_baseForegroundColor);
  CGColorRelease(self->_baseBackgroundColor);
  v3.receiver = self;
  v3.super_class = (Class)_UISSecureControlTag;
  -[_UISSecureControlTag dealloc](&v3, sel_dealloc);
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  return -[_UISSecureControlCategory authenticationMessageContextForStyle:](self->_category, "authenticationMessageContextForStyle:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double cornerRadius;
  CGColor *baseForegroundColor;
  CGColor *baseBackgroundColor;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_category, CFSTR("category"));
  cornerRadius = self->_cornerRadius;
  *(float *)&cornerRadius = cornerRadius;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("cornerRadius"), cornerRadius);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_cornerStyle, CFSTR("cornerStyle"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_imagePlacement, CFSTR("imagePlacement"));
  objc_msgSend(v4, "encodeSize:forKey:", CFSTR("size"), self->_size.width, self->_size.height);
  baseForegroundColor = self->_baseForegroundColor;
  if (baseForegroundColor)
  {
    UISGetColorSRGBComponents(baseForegroundColor, (uint64_t)&v8);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("foregroundColorRed"), v8);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("foregroundColorGreen"), v9);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("foregroundColorBlue"), v10);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("foregroundColorAlpha"), v11);
  }
  baseBackgroundColor = self->_baseBackgroundColor;
  if (baseBackgroundColor)
  {
    UISGetColorSRGBComponents(baseBackgroundColor, (uint64_t)&v8);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("backgroundColorRed"), v8);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("backgroundColorGreen"), v9);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("backgroundColorBlue"), v10);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("backgroundColorAlpha"), v11);
  }

}

- (unint64_t)failGradeForStyle:(id)a3
{
  return -1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _UISSecureControlCategory *category;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) != 0
    && ((category = self->_category, category == *((_UISSecureControlCategory **)v4 + 1))
     || -[_UISSecureControlCategory isEqual:](category, "isEqual:"))
    && self->_cornerRadius == *((double *)v4 + 2)
    && self->_cornerStyle == *((_QWORD *)v4 + 3)
    && self->_imagePlacement == *((_QWORD *)v4 + 6)
    && (self->_size.width == *((double *)v4 + 7) ? (v6 = self->_size.height == *((double *)v4 + 8)) : (v6 = 0),
        v6 && CGColorEqualToColor(self->_baseForegroundColor, *((CGColorRef *)v4 + 4)))
    && CGColorEqualToColor(self->_baseBackgroundColor, *((CGColorRef *)v4 + 5));

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  double cornerRadius;
  int64_t cornerStyle;
  unint64_t imagePlacement;
  double width;
  double height;
  CGColor *baseForegroundColor;
  CFHashCode v11;
  CFHashCode baseBackgroundColor;

  v3 = +[_UISSecureControlTag hash](_UISSecureControlTag, "hash");
  v4 = -[_UISSecureControlCategory hash](self->_category, "hash");
  cornerRadius = self->_cornerRadius;
  cornerStyle = self->_cornerStyle;
  imagePlacement = self->_imagePlacement;
  width = self->_size.width;
  height = self->_size.height;
  baseForegroundColor = self->_baseForegroundColor;
  if (baseForegroundColor)
    v11 = CFHash(baseForegroundColor);
  else
    v11 = 0;
  baseBackgroundColor = (CFHashCode)self->_baseBackgroundColor;
  if (baseBackgroundColor)
    baseBackgroundColor = CFHash((CFTypeRef)baseBackgroundColor);
  return v4 ^ v3 ^ cornerStyle ^ imagePlacement ^ (unint64_t)cornerRadius ^ (unint64_t)width ^ (unint64_t)height ^ v11 ^ baseBackgroundColor;
}

- (BOOL)isValid
{
  int v3;
  unint64_t imagePlacement;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  CGColor *baseForegroundColor;
  CGColor *baseBackgroundColor;

  v3 = -[_UISSecureControlCategory isValid](self->_category, "isValid");
  if (v3)
  {
    if (self->_cornerRadius < 0.0
      || (unint64_t)(self->_cornerStyle + 1) > 5
      || ((imagePlacement = self->_imagePlacement, v5 = imagePlacement > 8, v6 = (1 << imagePlacement) & 0x116, !v5)
        ? (v7 = v6 == 0)
        : (v7 = 1),
          v7 || self->_size.width <= 0.0 || self->_size.height <= 0.0))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      baseForegroundColor = self->_baseForegroundColor;
      if (!baseForegroundColor || (v3 = UISIsColorInDisplayP3Gamut(baseForegroundColor)) != 0)
      {
        baseBackgroundColor = self->_baseBackgroundColor;
        if (baseBackgroundColor)
          LOBYTE(v3) = UISIsColorInDisplayP3Gamut(baseBackgroundColor);
        else
          LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (id)resolvedStyleForStyle:(id)a3
{
  return (id)objc_msgSend(a3, "copyWithChangeBlock:", &__block_literal_global_0);
}

- (unsigned)secureNameForStyle:(id)a3
{
  return -[_UISSecureControlCategory secureName](self->_category, "secureName", a3);
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 54;
}

- (_UISSecureControlCategory)category
{
  return self->_category;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (CGColor)baseForegroundColor
{
  return self->_baseForegroundColor;
}

- (CGColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (unint64_t)imagePlacement
{
  return self->_imagePlacement;
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
  objc_storeStrong((id *)&self->_category, 0);
}

@end
