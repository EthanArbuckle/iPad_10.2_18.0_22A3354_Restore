@implementation UIFontDescriptor

- (UIFontDescriptor)fontDescriptorWithSymbolicTraits:(UIFontDescriptorSymbolicTraits)symbolicTraits
{
  return -[UIFontDescriptor fontDescriptorWithSymbolicTraits:mask:](self, "fontDescriptorWithSymbolicTraits:mask:", *(_QWORD *)&symbolicTraits, 0xFFFFFFFFLL);
}

- (UIFontDescriptor)initWithCoder:(NSCoder *)coder
{
  id v5;
  NSInteger v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t *v12;

  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    if (initWithCoder__onceToken_0 != -1)
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_19);
    v5 = -[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", initWithCoder__allowedClasses_0, CFSTR("UIFontDescriptorAttributes"));
    v6 = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("UIFontDescriptorOptions"));
    v7 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("NSCTFontUIUsageAttribute"));
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8278]);
    if ((v8 & 1) != 0 || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8280]))
    {
      v9 = objc_msgSend(v5, "objectForKey:", CFSTR("NSCTFontUIUsageOverrideAttribute"));
      if (v9)
        goto LABEL_7;
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        v12 = (uint64_t *)MEMORY[0x1E0CA8268];
        if (!v8)
          v12 = (uint64_t *)MEMORY[0x1E0CA8270];
        v9 = *v12;
        if (*v12)
        {
LABEL_7:
          v10 = (void *)objc_msgSend(v5, "mutableCopy");
          objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("NSCTFontUIUsageAttribute"));
          objc_msgSend(v10, "removeObjectForKey:", CFSTR("NSCTFontUIUsageOverrideAttribute"));
          v5 = v10;
        }
      }
    }
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  return (UIFontDescriptor *)-[UIFontDescriptor _swapWithFontAttributes:options:](self, "_swapWithFontAttributes:options:", v5, v6);
}

- (CGFloat)pointSize
{
  id v2;
  CGFloat result;

  v2 = -[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSFontSizeAttribute"));
  if (!v2)
    return 0.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

+ (UIFontDescriptor)preferredFontDescriptorWithTextStyle:(UIFontTextStyle)style compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  NSString *v6;
  uint64_t v7;

  v6 = -[UITraitCollection preferredContentSizeCategory](traitCollection, "preferredContentSizeCategory");
  v7 = __UIGetLegibilityWeight(traitCollection);
  return (UIFontDescriptor *)__UIFontDescriptorWithTextStyle((uint64_t)style, (uint64_t)v6, 0, 0, 0, 0, v7);
}

+ (UIFontDescriptor)fontDescriptorWithFontAttributes:(NSDictionary *)attributes
{
  return (UIFontDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithFontAttributes:", attributes);
}

- (id)_swapWithFontAttributes:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = +[UIFontDescriptor _createMungledDictionary:](UIFontDescriptor, "_createMungledDictionary:", a3);
  v6 = (void *)CTFontDescriptorCreateWithAttributesAndOptions();

  return v6;
}

+ (id)_createMungledDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v9;
  __int128 v10;

  if (!a3)
    return objc_alloc_init(MEMORY[0x1E0C99D80]);
  v3 = a3;
  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("NSFontMatrixAttribute"));
  if (v4 && (v5 = (void *)v4, v6 = *MEMORY[0x1E0CA8378], !objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CA8378])))
  {
    v3 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "CGAffineTransformValue", 0, 0, 0, 0, 0, 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v10, 48);
    objc_msgSend(v3, "setObject:forKey:", v9, v6);

  }
  else
  {
    v7 = v3;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIFontDescriptor;
  -[UIFontDescriptor dealloc](&v3, sel_dealloc);
}

- (UIFontDescriptor)initWithFontAttributes:(NSDictionary *)attributes
{
  return (UIFontDescriptor *)-[UIFontDescriptor _swapWithFontAttributes:options:](self, "_swapWithFontAttributes:options:", attributes, 0);
}

- (UIFontDescriptor)fontDescriptorWithSymbolicTraits:(unsigned int)a3 mask:(unsigned int)a4
{
  CTFontDescriptorRef CopyWithSymbolicTraits;

  CopyWithSymbolicTraits = CTFontDescriptorCreateCopyWithSymbolicTraits((CTFontDescriptorRef)self, a3, a4);
  return (UIFontDescriptor *)(id)CFMakeCollectable(CopyWithSymbolicTraits);
}

- (UIFontDescriptor)fontDescriptorWithDesign:(UIFontDescriptorSystemDesign)design
{
  int v5;
  char v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UIFontDescriptor *v12;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!-[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSCTFontUIUsageAttribute")))
    return 0;
  v5 = CTFontDescriptorCanCreateWithTextStyle();
  v6 = v5;
  if (v5)
    v7 = (const __CFString *)*MEMORY[0x1E0CA8408];
  else
    v7 = CFSTR("NSCTFontTraitsAttribute");
  v8 = (void *)objc_msgSend(-[UIFontDescriptor objectForKey:](self, "objectForKey:", v7), "mutableCopy");
  v17 = CFSTR("NSCTFontUIFontDesignTrait");
  v18[0] = design;
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  if (v8)
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);
  if (-[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSFontNameAttribute"))
    || -[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSFontFaceAttribute")))
  {
    v10 = (void *)-[NSDictionary mutableCopyWithZone:](-[UIFontDescriptor fontAttributes](self, "fontAttributes"), "mutableCopyWithZone:", 0);
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("NSFontNameAttribute"));
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("NSFontFaceAttribute"));
    if (v8)
      v11 = v8;
    else
      v11 = (void *)v9;
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("NSCTFontTraitsAttribute"));
    if ((v6 & 1) == 0)
      objc_msgSend(v10, "removeObjectForKey:", CFSTR("NSCTFontUIUsageAttribute"));
    v12 = +[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", v10);

  }
  else
  {
    if (v8)
      v14 = (uint64_t)v8;
    else
      v14 = v9;
    v15 = CFSTR("NSCTFontTraitsAttribute");
    v16 = v14;
    v12 = -[UIFontDescriptor fontDescriptorByAddingAttributes:](self, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  }

  return v12;
}

+ (id)preferredFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 options:(unint64_t)a5
{
  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, +[UIFont _preferredContentSizeCategory:](UIFont, "_preferredContentSizeCategory:", a5), 0, *(uint64_t *)&a4, 0, 0, -1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UIFontDescriptor)preferredFontDescriptorWithTextStyle:(UIFontTextStyle)style
{
  return (UIFontDescriptor *)__UIFontDescriptorWithTextStyle((uint64_t)style, +[UIFont preferredContentSizeCategory](UIFont, "preferredContentSizeCategory"), 0, 0, 0, 0, -1);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (id)defaultFontDescriptorWithTextStyle:(id)a3
{
  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 1, 0, 0, 0, -1);
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD *v14;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = -[UIFontDescriptor fontAttributes](self, "fontAttributes");
    v6 = -[NSDictionary objectForKey:](v5, "objectForKey:", CFSTR("NSCTFontUIUsageAttribute"));
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA8268]);
    v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA8270]);
    v9 = -[NSDictionary objectForKey:](v5, "objectForKey:", CFSTR("NSColor"));
    v10 = v9;
    v11 = v7 | v8;
    if ((v11 & 1) != 0 || v9)
    {
      v12 = (void *)-[NSDictionary mutableCopy](v5, "mutableCopy");
      v13 = v12;
      if (v11)
      {
        v14 = (_QWORD *)MEMORY[0x1E0CA8278];
        if (!v7)
          v14 = (_QWORD *)MEMORY[0x1E0CA8280];
        objc_msgSend(v12, "setObject:forKey:", *v14, CFSTR("NSCTFontUIUsageAttribute"));
        objc_msgSend(v13, "setObject:forKey:", v6, CFSTR("NSCTFontUIUsageOverrideAttribute"));
      }
      if (v10)
        objc_msgSend(v13, "removeObjectForKey:", CFSTR("NSColor"));
      v5 = v13;
    }
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("UIFontDescriptorAttributes"));
    objc_msgSend(a3, "encodeInteger:forKey:", CTFontDescriptorGetOptions(), CFSTR("UIFontDescriptorOptions"));
  }
}

+ (id)defaultFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 options:(unint64_t)a5
{
  uint64_t v5;
  id result;

  v5 = *(_QWORD *)&a4;
  result = (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 1, *(uint64_t *)&a4, 0, 0, -1);
  if ((_DWORD)v5)
    return (id)objc_msgSend(result, "fontDescriptorWithSymbolicTraits:mask:", v5, v5);
  return result;
}

uint64_t __34__UIFontDescriptor_initWithCoder___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  initWithCoder__allowedClasses_0 = result;
  return result;
}

- (UIFontDescriptor)init
{
  return -[UIFontDescriptor initWithFontAttributes:](self, "initWithFontAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionary"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UIFontDescriptor initWithFontAttributes:](+[UIFontDescriptor allocWithZone:](UIFontDescriptor, "allocWithZone:", a3), "initWithFontAttributes:", self->_attributes);
}

+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 weight:(double)a4
{
  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 0, 0, 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4), -1);
}

+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 design:(id)a4 weight:(double)a5
{
  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 0, 0, (uint64_t)a4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5), -1);
}

+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 design:(id)a4 weight:(double)a5 compatibleWithTraitCollection:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = objc_msgSend(a6, "preferredContentSizeCategory");
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v12 = __UIGetLegibilityWeight(a6);
  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, v10, 0, 0, (uint64_t)a4, v11, v12);
}

+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 design:(id)a5 weight:(double)a6 compatibleWithTraitCollection:(id)a7
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v10 = *(_QWORD *)&a4;
  v12 = objc_msgSend(a7, "preferredContentSizeCategory");
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v14 = __UIGetLegibilityWeight(a7);
  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, v12, 0, v10, (uint64_t)a5, v13, v14);
}

+ (UIFontDescriptor)fontDescriptorWithName:(NSString *)fontName size:(CGFloat)size
{
  id v7;
  void *v8;
  void *v9;

  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", fontName, CFSTR("NSFontNameAttribute"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", size), CFSTR("NSFontSizeAttribute"), 0);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFontAttributes:", v8);

  return (UIFontDescriptor *)v9;
}

- (NSDictionary)fontAttributes
{
  return (NSDictionary *)self->_attributes;
}

- (id)_attributes
{
  NSLog((NSString *)CFSTR("Usage of -[UIFontDescriptor _attributes] detected. This method is UIKit's internal use only."), a2);
  return 0;
}

- (NSString)postscriptName
{
  NSString *result;

  result = -[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSCTFontPostScriptNameAttribute"));
  if (!result)
    return (NSString *)-[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSFontNameAttribute"));
  return result;
}

+ (UIFontDescriptor)fontDescriptorWithName:(NSString *)fontName matrix:(CGAffineTransform *)matrix
{
  id v7;
  void *v8;
  void *v9;

  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", fontName, CFSTR("NSFontNameAttribute"), objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", matrix, "{CGAffineTransform=dddddd}"), CFSTR("NSFontMatrixAttribute"), 0);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFontAttributes:", v8);

  return (UIFontDescriptor *)v9;
}

- (id)objectForKey:(UIFontDescriptorAttributeName)anAttribute
{
  return (id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", anAttribute);
}

- (NSArray)matchingFontDescriptorsWithMandatoryKeys:(NSSet *)mandatoryKeys
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)matchingFontDescriptorWithMandatoryKeys:(id)a3
{
  return 0;
}

- (UIFontDescriptor)fontDescriptorByAddingAttributes:(NSDictionary *)attributes
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = -[UIFontDescriptor zone](self, "zone");
  v6 = (void *)-[NSDictionary mutableCopyWithZone:](-[UIFontDescriptor fontAttributes](self, "fontAttributes"), "mutableCopyWithZone:", v5);
  objc_msgSend(v6, "addEntriesFromDictionary:", attributes);
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", v5), "initWithFontAttributes:", v6);

  return (UIFontDescriptor *)v7;
}

- (id)_fontDescriptorWithMatrix:(CGAffineTransform *)a3
{
  return -[UIFontDescriptor fontDescriptorByAddingAttributes:](self, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{CGAffineTransform=dddddd}"), CFSTR("NSFontMatrixAttribute")));
}

- (CGAffineTransform)_matrix
{
  CGAffineTransform *result;

  result = -[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSFontMatrixAttribute"));
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform CGAffineTransformValue](result, "CGAffineTransformValue");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (id)_NSAffineTransform
{
  id v2;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v2 = -[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSFontMatrixAttribute"));
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (memset(&v6, 0, sizeof(v6)),
            objc_msgSend(v2, "CGAffineTransformValue"),
            v5 = v6,
            !CGAffineTransformIsIdentity(&v5)))
      {
        v2 = objc_alloc_init(MEMORY[0x1E0CB3478]);
        v4 = v6;
        objc_msgSend(v2, "setTransformStruct:", &v4);
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

- (UIFontDescriptor)fontDescriptorWithMatrix:(CGAffineTransform *)matrix
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)&matrix->c;
  v5[0] = *(_OWORD *)&matrix->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&matrix->tx;
  return (UIFontDescriptor *)-[UIFontDescriptor _fontDescriptorWithMatrix:](self, "_fontDescriptorWithMatrix:", v5);
}

- (CGAffineTransform)matrix
{
  if (self)
    return (CGAffineTransform *)-[CGAffineTransform _matrix](self, "_matrix");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (UIFontDescriptor)fontDescriptorWithSize:(CGFloat)newPointSize
{
  return -[UIFontDescriptor fontDescriptorByAddingAttributes:](self, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", newPointSize), CFSTR("NSFontSizeAttribute")));
}

- (UIFontDescriptor)fontDescriptorWithFace:(NSString *)newFace
{
  void *v5;
  UIFontDescriptor *v6;

  if (!-[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSFontNameAttribute")))
    return -[UIFontDescriptor fontDescriptorByAddingAttributes:](self, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", newFace, CFSTR("NSFontFaceAttribute")));
  v5 = (void *)-[NSDictionary mutableCopyWithZone:](-[UIFontDescriptor fontAttributes](self, "fontAttributes"), "mutableCopyWithZone:", 0);
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("NSFontNameAttribute"));
  objc_msgSend(v5, "setObject:forKey:", newFace, CFSTR("NSFontFaceAttribute"));
  v6 = +[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", v5);

  return v6;
}

- (UIFontDescriptor)fontDescriptorWithFamily:(NSString *)newFamily
{
  void *v5;
  UIFontDescriptor *v6;

  if (!-[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSFontNameAttribute"))
    && !-[UIFontDescriptor objectForKey:](self, "objectForKey:", CFSTR("NSFontFaceAttribute")))
  {
    return -[UIFontDescriptor fontDescriptorByAddingAttributes:](self, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", newFamily, CFSTR("NSFontFamilyAttribute")));
  }
  v5 = (void *)-[NSDictionary mutableCopyWithZone:](-[UIFontDescriptor fontAttributes](self, "fontAttributes"), "mutableCopyWithZone:", 0);
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("NSFontNameAttribute"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("NSFontFaceAttribute"));
  objc_msgSend(v5, "setObject:forKey:", newFamily, CFSTR("NSFontFamilyAttribute"));
  v6 = +[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", v5);

  return v6;
}

- (id)_visibleName
{
  return (id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("NSFontVisibleNameAttribute"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%p> = %@"), objc_opt_class(), self, -[UIFontDescriptor fontAttributes](self, "fontAttributes"));
}

@end
