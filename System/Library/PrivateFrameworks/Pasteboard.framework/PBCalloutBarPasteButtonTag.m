@implementation PBCalloutBarPasteButtonTag

- (PBCalloutBarPasteButtonTag)initWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 titleWidth:(double)a6 contentScaleLevel:(unint64_t)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  PBCalloutBarPasteButtonTag *result;
  objc_super v15;

  y = a5.y;
  x = a5.x;
  height = a4.height;
  width = a4.width;
  v15.receiver = self;
  v15.super_class = (Class)PBCalloutBarPasteButtonTag;
  result = -[PBCalloutBarPasteButtonTag init](&v15, sel_init);
  if (result)
  {
    result->_secureName = a3;
    result->_size.width = width;
    result->_size.height = height;
    result->_titleOrigin.x = x;
    result->_titleOrigin.y = y;
    result->_titleWidth = a6;
    result->_contentScaleLevel = a7;
  }
  return result;
}

- (PBCalloutBarPasteButtonTag)initWithCoder:(id)a3
{
  id v4;
  PBCalloutBarPasteButtonTag *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PBCalloutBarPasteButtonTag;
  v5 = -[PBPasteButtonTag initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_secureName = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("secureName"));
    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("size"));
    v5->_size.width = v6;
    v5->_size.height = v7;
    objc_msgSend(v4, "decodePointForKey:", CFSTR("titleOrigin"));
    v5->_titleOrigin.x = v8;
    v5->_titleOrigin.y = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("titleWidth"));
    v5->_titleWidth = v10;
    v5->_contentScaleLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentScaleLevel"));
  }

  return v5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  return 0xA16D1C5A60C000E1;
}

- (float)backgroundStatisticsForegroundForStyle:(id)a3
{
  unint64_t v3;
  float result;

  v3 = objc_msgSend(a3, "userInterfaceStyle");
  result = NAN;
  if (v3 < 2)
    return 1.0;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBCalloutBarPasteButtonTag;
  v4 = a3;
  -[PBPasteButtonTag encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_secureName, CFSTR("secureName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeSize:forKey:", CFSTR("size"), self->_size.width, self->_size.height);
  objc_msgSend(v4, "encodePoint:forKey:", CFSTR("titleOrigin"), self->_titleOrigin.x, self->_titleOrigin.y);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("titleWidth"), self->_titleWidth);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_contentScaleLevel, CFSTR("contentScaleLevel"));

}

- (unint64_t)hash
{
  uint64_t v3;
  int8x16_t v4;

  v3 = +[PBCalloutBarPasteButtonTag hash](PBCalloutBarPasteButtonTag, "hash");
  v4 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_size), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_titleOrigin));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ (unint64_t)self->_titleWidth ^ self->_contentScaleLevel ^ v3 ^ self->_secureName;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;

  v4 = (double *)a3;
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_secureName == *((_DWORD *)v4 + 2)
    && (self->_size.width == v4[4] ? (v5 = self->_size.height == v4[5]) : (v5 = 0),
        v5
     && (self->_titleOrigin.x == v4[6] ? (v6 = self->_titleOrigin.y == v4[7]) : (v6 = 0),
         v6 && self->_titleWidth == v4[2]))
    && self->_contentScaleLevel == *((_QWORD *)v4 + 3);

  return v7;
}

- (BOOL)isValid
{
  double x;
  double width;
  double y;
  double height;
  BOOL v6;
  BOOL v8;
  BOOL v10;
  char v12;
  BOOL v13;
  char v15;

  if ((self->_secureName & 0xFFFFFFFC) != 0x10000)
    return 0;
  if (self->_contentScaleLevel - 1 > 9)
    return 0;
  x = self->_titleOrigin.x;
  width = self->_size.width;
  if (x > width)
    return 0;
  y = self->_titleOrigin.y;
  height = self->_size.height;
  if (y > height || x + self->_titleWidth > width)
    return 0;
  v6 = width < 0.0 || ((*(_QWORD *)&width & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
  if (v6 && (unint64_t)(*(_QWORD *)&width - 1) > 0xFFFFFFFFFFFFELL)
    return 0;
  v8 = height < 0.0 || ((*(_QWORD *)&height & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
  if (v8 && (unint64_t)(*(_QWORD *)&height - 1) > 0xFFFFFFFFFFFFELL)
    return 0;
  v10 = (*(_QWORD *)&x & 0x7FFFFFFFFFFFFFFFLL) == 0;
  if ((unint64_t)(*(_QWORD *)&x - 1) < 0xFFFFFFFFFFFFFLL)
    v10 = 1;
  v12 = ((*(_QWORD *)&x & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && x >= 0.0 || v10;
  v13 = (unint64_t)(*(_QWORD *)&y - 1) < 0xFFFFFFFFFFFFFLL || (*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFLL) == 0;
  v15 = ((*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && y >= 0.0 || v13;
  return v12 & v15;
}

- (id)resolvedStyleForStyle:(id)a3
{
  return (id)objc_msgSend(a3, "copyWithChangeBlock:", &__block_literal_global);
}

void __52__PBCalloutBarPasteButtonTag_resolvedStyleForStyle___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;
  uint64_t v3;
  CGColor *GenericGrayGamma2_2;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setAccessibilityContrast:", 0);
  objc_msgSend(v5, "setDisplayRange:", 0);
  objc_msgSend(v5, "setLayoutDirection:", 0);
  objc_msgSend(v5, "setLegibilityWeight:", 0);
  v2 = objc_msgSend(v5, "preferredContentSizeCategory");
  if (v2 <= 3)
    v3 = 3;
  else
    v3 = v2;
  objc_msgSend(v5, "setPreferredContentSizeCategory:", v3);
  GenericGrayGamma2_2 = CGColorCreateGenericGrayGamma2_2(1.0, 0.96);
  objc_msgSend(v5, "setTintColor:", GenericGrayGamma2_2);
  CGColorRelease(GenericGrayGamma2_2);
  objc_msgSend(v5, "setUserInterfaceIdiom:", 0);
  objc_msgSend(v5, "setUserInterfaceStyle:", 0);

}

- (unsigned)secureNameForStyle:(id)a3
{
  return self->_secureName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8
{
  if (!a3)
    return 0;
  (*((void (**)(id, PBCalloutBarPasteButtonTag *))a3 + 2))(a3, self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGPoint)titleOrigin
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_titleOrigin, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)titleWidth
{
  return self->_titleWidth;
}

- (unint64_t)contentScaleLevel
{
  return self->_contentScaleLevel;
}

@end
