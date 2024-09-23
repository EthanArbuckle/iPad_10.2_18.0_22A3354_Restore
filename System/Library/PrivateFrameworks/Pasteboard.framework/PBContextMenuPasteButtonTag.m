@implementation PBContextMenuPasteButtonTag

- (PBContextMenuPasteButtonTag)initWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 layoutSize:(int64_t)a6 hasTrailingGutter:(BOOL)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  PBContextMenuPasteButtonTag *result;
  objc_super v15;

  y = a5.y;
  x = a5.x;
  height = a4.height;
  width = a4.width;
  v15.receiver = self;
  v15.super_class = (Class)PBContextMenuPasteButtonTag;
  result = -[PBContextMenuPasteButtonTag init](&v15, sel_init);
  if (result)
  {
    result->_secureName = a3;
    result->_size.width = width;
    result->_size.height = height;
    result->_titleOrigin.x = x;
    result->_titleOrigin.y = y;
    result->_layoutSize = a6;
    result->_hasTrailingGutter = a7;
  }
  return result;
}

- (PBContextMenuPasteButtonTag)initWithCoder:(id)a3
{
  id v4;
  PBContextMenuPasteButtonTag *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBContextMenuPasteButtonTag;
  v5 = -[PBPasteButtonTag initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_secureName = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("secureName"));
    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("size"));
    v5->_size.width = v6;
    v5->_size.height = v7;
    objc_msgSend(v4, "decodePointForKey:", CFSTR("titleOrigin"));
    v5->_titleOrigin.x = v8;
    v5->_titleOrigin.y = v9;
    v5->_layoutSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutSize"));
    v5->_hasTrailingGutter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasTrailingGutter"));
  }

  return v5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  if (objc_msgSend(a3, "userInterfaceStyle"))
    return 0xA9745AB1695ED68BLL;
  else
    return 0xF635B19E69CD15ECLL;
}

- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegionForStyle:(id)a3
{
  return ($BEA516A46C1BA1F84587E5D243A711F7)(0x5000500050005 * objc_msgSend(a3, "displayScale"));
}

- (float)backgroundStatisticsPassingContrastForStyle:(id)a3
{
  id v4;
  float v5;
  float v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "userInterfaceStyle") == 1)
  {
    v5 = 2.1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PBContextMenuPasteButtonTag;
    -[PBPasteButtonTag backgroundStatisticsPassingContrastForStyle:](&v8, sel_backgroundStatisticsPassingContrastForStyle_, v4);
    v5 = v6;
  }

  return v5;
}

- (float)backgroundStatisticsFailingContrastForStyle:(id)a3
{
  id v4;
  float v5;
  float v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "userInterfaceStyle") == 1)
  {
    v5 = 1.9;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PBContextMenuPasteButtonTag;
    -[PBPasteButtonTag backgroundStatisticsFailingContrastForStyle:](&v8, sel_backgroundStatisticsFailingContrastForStyle_, v4);
    v5 = v6;
  }

  return v5;
}

- (float)backgroundStatisticsForegroundForStyle:(id)a3
{
  uint64_t v3;
  float result;

  v3 = objc_msgSend(a3, "userInterfaceStyle");
  result = NAN;
  if (v3 == 1)
    result = 1.0;
  if (!v3)
    return 0.0;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBContextMenuPasteButtonTag;
  v4 = a3;
  -[PBPasteButtonTag encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_secureName, CFSTR("secureName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeSize:forKey:", CFSTR("size"), self->_size.width, self->_size.height);
  objc_msgSend(v4, "encodePoint:forKey:", CFSTR("titleOrigin"), self->_titleOrigin.x, self->_titleOrigin.y);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_layoutSize, CFSTR("layoutSize"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasTrailingGutter, CFSTR("hasTrailingGutter"));

}

- (unint64_t)hash
{
  uint64_t v3;
  int8x16_t v4;

  v3 = +[PBContextMenuPasteButtonTag hash](PBContextMenuPasteButtonTag, "hash");
  v4 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_size), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_titleOrigin));
  return *(unint64_t *)&veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ self->_hasTrailingGutter ^ self->_layoutSize ^ v3 ^ self->_secureName;
}

- (int64_t)initialSampleEventForStyle:(id)a3
{
  return 2;
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
    && self->_secureName == *((_DWORD *)v4 + 3)
    && (self->_size.width == v4[3] ? (v5 = self->_size.height == v4[4]) : (v5 = 0),
        v5
     && (self->_titleOrigin.x == v4[5] ? (v6 = self->_titleOrigin.y == v4[6]) : (v6 = 0),
         v6 && self->_layoutSize == *((_QWORD *)v4 + 2)))
    && self->_hasTrailingGutter == *((unsigned __int8 *)v4 + 8);

  return v7;
}

- (BOOL)isValid
{
  double x;
  double width;
  double y;
  double height;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  int v24;
  _BOOL4 v25;
  _BOOL4 v26;

  if ((self->_secureName & 0xFFFFFFFC) != 0x10000)
    return 0;
  x = self->_titleOrigin.x;
  width = self->_size.width;
  if (x > width)
    return 0;
  y = self->_titleOrigin.y;
  height = self->_size.height;
  if (y > height)
    return 0;
  v6 = ((*(_QWORD *)&width & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  v7 = *(_QWORD *)&width - 1;
  if (width >= 0.0)
  {
    v8 = v6 >= 0x3FE;
    v9 = v6 == 1022;
  }
  else
  {
    v8 = 1;
    v9 = 0;
  }
  if (!v9 && v8)
  {
    v10 = v7 >= 0xFFFFFFFFFFFFELL;
    v11 = v7 == 0xFFFFFFFFFFFFELL;
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  if (!v11 && v10)
    return 0;
  v12 = ((*(_QWORD *)&height & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  v13 = *(_QWORD *)&height - 1;
  if (height >= 0.0)
  {
    v14 = v12 >= 0x3FE;
    v15 = v12 == 1022;
  }
  else
  {
    v14 = 1;
    v15 = 0;
  }
  if (!v15 && v14)
  {
    v16 = v13 >= 0xFFFFFFFFFFFFELL;
    v17 = v13 == 0xFFFFFFFFFFFFELL;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  if (!v17 && v16)
    return 0;
  v18 = *(_QWORD *)&x & 0x7FFFFFFFFFFFFFFFLL;
  v19 = (*(_QWORD *)&x & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  v20 = ((*(_QWORD *)&x & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (x >= 0.0)
    v20 = 0;
  if (self->_titleOrigin.x >= 0.0)
    v19 = 0;
  v23 = __OFSUB__(v18, 0x7FF0000000000000);
  v21 = v18 == 0x7FF0000000000000;
  v22 = v18 - 0x7FF0000000000000 < 0;
  v24 = v18 == 0x7FF0000000000000 || v19;
  if (!(v22 ^ v23 | v21))
    v24 = 1;
  if (((v24 | v20) & 1) != 0)
    return 0;
  v25 = (*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  v26 = ((*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (y >= 0.0)
  {
    v26 = 0;
    v25 = 0;
  }
  if ((*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000)
    v25 = 1;
  if ((*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000)
    v25 = 1;
  return !v25 && !v26 && self->_layoutSize < 3;
}

- (id)resolvedStyleForStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PBContextMenuPasteButtonTag_resolvedStyleForStyle___block_invoke;
  v8[3] = &unk_1E2430C60;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v5, "copyWithChangeBlock:", v8);

  return v6;
}

void __53__PBContextMenuPasteButtonTag_resolvedStyleForStyle___block_invoke(uint64_t a1, void *a2)
{
  CGColorRef CopyWithAlpha;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setAccessibilityButtonShapes:", 0);
  objc_msgSend(v4, "setAccessibilityContrast:", 0);
  objc_msgSend(v4, "setDisplayRange:", 0);
  CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)objc_msgSend(*(id *)(a1 + 32), "baseForegroundColorForStyle:", *(_QWORD *)(a1 + 40)), 0.96);
  objc_msgSend(v4, "setTintColor:", CopyWithAlpha);
  CFRelease(CopyWithAlpha);
  objc_msgSend(v4, "setUserInterfaceIdiom:", 0);

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
  if (!a7)
    return 0;
  (*((void (**)(id, PBContextMenuPasteButtonTag *, id, id, id, id))a7 + 2))(a7, self, a3, a4, a5, a6);
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

- (int64_t)layoutSize
{
  return self->_layoutSize;
}

- (BOOL)hasTrailingGutter
{
  return self->_hasTrailingGutter;
}

@end
