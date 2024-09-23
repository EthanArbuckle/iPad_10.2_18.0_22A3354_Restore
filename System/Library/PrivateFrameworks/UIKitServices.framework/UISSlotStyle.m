@implementation UISSlotStyle

+ (id)slotStyleWithAccessibilityButtonShapes:(unint64_t)a3 accessibilityContrast:(unint64_t)a4 displayRange:(unint64_t)a5 displayScale:(unsigned __int8)a6 layoutDirection:(unint64_t)a7 legibilityWeight:(unint64_t)a8 localization:(id)a9 preferredContentSizeCategory:(unint64_t)a10 tintColor:(CGColor *)a11 userInterfaceIdiom:(unint64_t)a12 userInterfaceStyle:(unint64_t)a13
{
  uint64_t v15;
  id v19;
  UISSlotStyle *v20;

  v15 = a6;
  v19 = a9;
  v20 = -[UISSlotStyle initWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:]([UISSlotStyle alloc], "initWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:", a3, a4, a5, v15, a7, a8, v19, a10, a11, a12, a13);

  return v20;
}

- (UISSlotStyle)initWithAccessibilityButtonShapes:(unint64_t)a3 accessibilityContrast:(unint64_t)a4 displayRange:(unint64_t)a5 displayScale:(unsigned __int8)a6 layoutDirection:(unint64_t)a7 legibilityWeight:(unint64_t)a8 localization:(id)a9 preferredContentSizeCategory:(unint64_t)a10 tintColor:(CGColor *)a11 userInterfaceIdiom:(unint64_t)a12 userInterfaceStyle:(unint64_t)a13
{
  char v13;
  char v14;
  char v16;
  char v17;
  char v18;
  id v20;
  UISSlotStyle *v21;
  uint64_t v22;
  NSString *localization;
  objc_super v25;

  v13 = a8;
  v14 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v20 = a9;
  v25.receiver = self;
  v25.super_class = (Class)UISSlotStyle;
  v21 = -[UISSlotStyle init](&v25, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v20, "copy");
    localization = v21->_localization;
    v21->_localization = (NSString *)v22;

    v21->_tintColor = CGColorRetain(a11);
    v21->_fields.all = v18 & 1 | (2 * (v17 & 1)) & 3 | (4 * (v16 & 3)) & 0xF | (16 * (a6 & 7)) & 0x7F | ((v14 & 1) << 7) | ((v13 & 1) << 8) & 0xE1FF | ((a10 & 0xF) << 9) | ((a12 & 7) << 13) | ((a13 & 1) << 16) | v21->_fields.all & 0xFFFE0000;
  }

  return v21;
}

- (UISSlotStyle)initWithStyle:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UISSlotStyle *v13;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v16 = objc_msgSend(v3, "accessibilityButtonShapes");
  v15 = objc_msgSend(v3, "accessibilityContrast");
  v4 = objc_msgSend(v3, "displayRange");
  v5 = objc_msgSend(v3, "displayScale");
  v6 = objc_msgSend(v3, "layoutDirection");
  v7 = objc_msgSend(v3, "legibilityWeight");
  objc_msgSend(v3, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "preferredContentSizeCategory");
  v10 = objc_msgSend(v3, "tintColor");
  v11 = objc_msgSend(v3, "userInterfaceIdiom");
  v12 = objc_msgSend(v3, "userInterfaceStyle");

  v13 = -[UISSlotStyle initWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:](self, "initWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:", v16, v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (UISSlotStyle)initWithCoder:(id)a3
{
  id v4;
  UISSlotStyle *v5;
  uint64_t v6;
  NSString *localization;
  CGColorSpace *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v14;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UISSlotStyle;
  v5 = -[UISSlotStyle init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localization"));
    v6 = objc_claimAutoreleasedReturnValue();
    localization = v5->_localization;
    v5->_localization = (NSString *)v6;

    v5->_fields.all = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fieldsAll"));
    v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tintColorRed"));
    components[0] = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tintColorGreen"));
    components[1] = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tintColorBlue"));
    components[2] = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tintColorAlpha"));
    components[3] = v12;
    v5->_tintColor = CGColorCreate(v8, components);
    CGColorSpaceRelease(v8);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_tintColor);
  v3.receiver = self;
  v3.super_class = (Class)UISSlotStyle;
  -[UISSlotStyle dealloc](&v3, sel_dealloc);
}

- (unint64_t)accessibilityButtonShapes
{
  return self->_fields.all & 1;
}

- (unint64_t)accessibilityContrast
{
  return ((unint64_t)self->_fields.all >> 1) & 1;
}

- (unint64_t)displayRange
{
  return ((unint64_t)self->_fields.all >> 2) & 3;
}

- (unsigned)displayScale
{
  return (LOBYTE(self->_fields.all) >> 4) & 7;
}

- (unint64_t)layoutDirection
{
  return ((unint64_t)self->_fields.all >> 7) & 1;
}

- (unint64_t)legibilityWeight
{
  return ((unint64_t)self->_fields.all >> 8) & 1;
}

- (unint64_t)preferredContentSizeCategory
{
  return ((unint64_t)self->_fields.all >> 9) & 0xF;
}

- (unint64_t)userInterfaceIdiom
{
  return (unsigned __int16)self->_fields.all >> 13;
}

- (unint64_t)userInterfaceStyle
{
  return ((unint64_t)self->_fields.all >> 16) & 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localization;
  id v5;
  double v6[5];

  v6[4] = *(double *)MEMORY[0x1E0C80C00];
  localization = self->_localization;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localization, CFSTR("localization"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fields.all, CFSTR("fieldsAll"));
  UISGetColorSRGBComponents(self->_tintColor, (uint64_t)v6);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tintColorRed"), v6[0]);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tintColorGreen"), v6[1]);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tintColorBlue"), v6[2]);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tintColorAlpha"), v6[3]);

}

- (unint64_t)hash
{
  uint64_t all;
  NSUInteger v4;

  all = self->_fields.all;
  v4 = -[NSString hash](self->_localization, "hash") ^ all;
  return v4 ^ CFHash(self->_tintColor);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *localization;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_fields.all == *((_DWORD *)v4 + 6)
    && ((localization = self->_localization, localization == *((NSString **)v4 + 1))
     || -[NSString isEqual:](localization, "isEqual:"))
    && CGColorEqualToColor(self->_tintColor, *((CGColorRef *)v4 + 2));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)localization
{
  return self->_localization;
}

- (CGColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localization, 0);
}

- (NSArray)assetAppearanceNames
{
  NSArray *result;
  unint64_t v4;

  result = -[UISSlotStyle accessibilityContrast](self, "accessibilityContrast");
  if (result != (NSArray *)1)
  {
    if (result)
      return result;
    v4 = -[UISSlotStyle userInterfaceStyle](self, "userInterfaceStyle");
    if (!v4)
      return (NSArray *)&unk_1E2CBB450;
    if (v4 == 1)
      return (NSArray *)&unk_1E2CBB468;
  }
  if (-[UISSlotStyle userInterfaceStyle](self, "userInterfaceStyle"))
    return (NSArray *)&unk_1E2CBB498;
  else
    return (NSArray *)&unk_1E2CBB480;
}

- (int64_t)assetDeviceIdiom
{
  unint64_t v2;

  v2 = -[UISSlotStyle userInterfaceIdiom](self, "userInterfaceIdiom");
  if (v2 > 7)
    return 7;
  else
    return qword_1908958B0[v2];
}

- (double)assetScaleFactor
{
  return (double)-[UISSlotStyle displayScale](self, "displayScale");
}

- (int64_t)assetLayoutDirection
{
  if (-[UISSlotStyle layoutDirection](self, "layoutDirection"))
    return 4;
  else
    return 5;
}

- (__CFString)fontContentSizeCategory
{
  __CFString *result;
  __CFString **v3;

  result = -[UISSlotStyle preferredContentSizeCategory](self, "preferredContentSizeCategory");
  switch((unint64_t)result)
  {
    case 0uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA8228];
      goto LABEL_14;
    case 1uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA8218];
      goto LABEL_14;
    case 2uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA8210];
      goto LABEL_14;
    case 3uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA8208];
      goto LABEL_14;
    case 4uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA8220];
      goto LABEL_14;
    case 5uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA8230];
      goto LABEL_14;
    case 6uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA8238];
      goto LABEL_14;
    case 7uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA81E8];
      goto LABEL_14;
    case 8uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA81E0];
      goto LABEL_14;
    case 9uLL:
      v3 = (__CFString **)MEMORY[0x1E0CA81F0];
      goto LABEL_14;
    case 0xAuLL:
      v3 = (__CFString **)MEMORY[0x1E0CA81F8];
      goto LABEL_14;
    case 0xBuLL:
      v3 = (__CFString **)MEMORY[0x1E0CA8200];
LABEL_14:
      result = *v3;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)fontLegibilityWeight
{
  return -[UISSlotStyle legibilityWeight](self, "legibilityWeight") != 0;
}

- (double)graphicsDisabledAlpha
{
  return dbl_1908958F0[-[UISSlotStyle userInterfaceStyle](self, "userInterfaceStyle") == 0];
}

- (BOOL)hasAccessibilityContentSizeCategory
{
  return -[UISSlotStyle preferredContentSizeCategory](self, "preferredContentSizeCategory") - 7 < 5;
}

- (id)assetGlyphWithName:(id)a3 glyphSize:(int64_t)a4 glyphWeight:(int64_t)a5 glyphPointSize:(double)a6
{
  id v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (_MergedGlobals_10 != -1)
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_6);
  v11 = -[UISSlotStyle legibilityWeight](self, "legibilityWeight");
  v12 = 7;
  if (a5 < 7)
    v12 = a5;
  v13 = v12 + 2;
  v26 = 0u;
  v27 = 0u;
  if (v11 == 1)
    v14 = v13;
  else
    v14 = a5;
  v28 = 0uLL;
  v29 = 0uLL;
  -[UISSlotStyle assetAppearanceNames](self, "assetAppearanceNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v20 = (void *)qword_1ECDA58E0;
        -[UISSlotStyle assetScaleFactor](self, "assetScaleFactor");
        objc_msgSend(v20, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v10, -[UISSlotStyle assetDeviceIdiom](self, "assetDeviceIdiom"), -[UISSlotStyle assetLayoutDirection](self, "assetLayoutDirection"), a4, v14, v19, v21, a6);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          goto LABEL_18;
        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v16)
        continue;
      break;
    }
  }
  v23 = 0;
LABEL_18:

  return v23;
}

void __85__UISSlotStyle_Convenience__assetGlyphWithName_glyphSize_glyphWeight_glyphPointSize___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D1A6A8]);
  objc_msgSend(MEMORY[0x1E0D89780], "public");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithName:fromBundle:error:", CFSTR("Assets"), v3, 0);
  v2 = (void *)qword_1ECDA58E0;
  qword_1ECDA58E0 = v1;

}

- (id)assetGlyphWithName:(id)a3 glyphSize:(int64_t)a4 textStyle:(__CFString *)a5
{
  id v7;
  uint64_t i;
  void *v9;

  v7 = a3;
  -[UISSlotStyle fontContentSizeCategory](self, "fontContentSizeCategory");
  CTFontDescriptorGetTextStyleSize();
  for (i = 0; i != 9; ++i)
  {
    if (*(double *)(MEMORY[0x1E0CA8240] + 8 * i) > NAN)
      break;
  }
  -[UISSlotStyle assetGlyphWithName:glyphSize:glyphWeight:glyphPointSize:](self, "assetGlyphWithName:glyphSize:glyphWeight:glyphPointSize:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithChangeBlock:(id)a3
{
  void (**v4)(id, UISMutableSlotStyle *);
  UISMutableSlotStyle *v5;
  objc_class *v6;

  v4 = (void (**)(id, UISMutableSlotStyle *))a3;
  v5 = -[UISSlotStyle initWithStyle:]([UISMutableSlotStyle alloc], "initWithStyle:", self);
  v4[2](v4, v5);

  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    object_setClass(v5, v6);
  }
  return v5;
}

- (unint64_t)gradeWithOnlyFails:(unint64_t)a3 allowedLocalizations:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  char v12;

  v6 = a4;
  v7 = 0;
  v8 = 1;
  do
  {
    if ((v8 & a3) == 0)
      goto LABEL_27;
    if (v8 <= 31)
    {
      switch(v8)
      {
        case 1:
          v9 = -[UISSlotStyle accessibilityContrast](self, "accessibilityContrast");
          break;
        case 2:
          if (-[UISSlotStyle displayRange](self, "displayRange") > 2)
            goto LABEL_26;
          goto LABEL_27;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_27;
        case 4:
          if (!-[UISSlotStyle displayScale](self, "displayScale")
            || -[UISSlotStyle displayScale](self, "displayScale") >= 5)
          {
            goto LABEL_26;
          }
          goto LABEL_27;
        case 8:
          v9 = -[UISSlotStyle layoutDirection](self, "layoutDirection");
          break;
        default:
          if (v8 != 16)
            goto LABEL_27;
          v9 = -[UISSlotStyle legibilityWeight](self, "legibilityWeight");
          break;
      }
LABEL_25:
      if (v9 <= 1)
        goto LABEL_27;
      goto LABEL_26;
    }
    if (v8 <= 127)
    {
      if (v8 == 32)
      {
        if (-[UISSlotStyle preferredContentSizeCategory](self, "preferredContentSizeCategory") > 0xB)
          goto LABEL_26;
      }
      else if (v8 == 64 && -[UISSlotStyle userInterfaceIdiom](self, "userInterfaceIdiom") > 7)
      {
        goto LABEL_26;
      }
    }
    else
    {
      if (v8 == 128)
      {
        v9 = -[UISSlotStyle userInterfaceStyle](self, "userInterfaceStyle");
        goto LABEL_25;
      }
      if (v8 != 256)
      {
        if (v8 != 512)
          goto LABEL_27;
        if ((UISIsColorInDisplayP3Gamut(-[UISSlotStyle tintColor](self, "tintColor")) & 1) != 0)
          break;
LABEL_26:
        v7 |= v8;
        goto LABEL_27;
      }
      -[UISSlotStyle localization](self, "localization");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "containsObject:", v11);

      if ((v12 & 1) == 0)
        goto LABEL_26;
    }
LABEL_27:
    v10 = (unint64_t)v8 >= 0x101;
    v8 *= 2;
  }
  while (!v10);

  return v7;
}

- (__CTFont)newFontForTextStyle:(__CFString *)a3 attributes:(__CFDictionary *)a4
{
  const void *v5;
  __CFDictionary *MutableCopy;
  void *v8;
  const __CTFontDescriptor *v9;
  __CTFont *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (const void *)*MEMORY[0x1E0CA8368];
  if (a4)
  {
    if (CFDictionaryContainsKey(a4, (const void *)*MEMORY[0x1E0CA8368]))
    {
      MutableCopy = (__CFDictionary *)CFRetain(a4);
    }
    else
    {
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, a4);
      CFDictionarySetValue(MutableCopy, v5, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[UISSlotStyle fontLegibilityWeight](self, "fontLegibilityWeight")));
    }
  }
  else
  {
    v12 = *MEMORY[0x1E0CA8368];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[UISSlotStyle fontLegibilityWeight](self, "fontLegibilityWeight", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    MutableCopy = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

  }
  -[UISSlotStyle fontContentSizeCategory](self, "fontContentSizeCategory");
  v9 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  if (MutableCopy)
    CFRelease(MutableCopy);
  v10 = CTFontCreateWithFontDescriptor(v9, 0.0, 0);
  if (v9)
    CFRelease(v9);
  return v10;
}

@end
