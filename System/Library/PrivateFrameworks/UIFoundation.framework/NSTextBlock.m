@implementation NSTextBlock

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSTextBlock setVersion:](NSTextBlock, "setVersion:", 1);
    __NSTextBlockClass = (uint64_t)a1;
  }
}

- (NSTextBlock)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextBlock;
  return -[NSTextBlock init](&v3, sel_init);
}

- (void)_createFloatStorage
{
  _OWORD *propVals;

  propVals = self->_propVals;
  if (!propVals)
  {
    propVals = NSZoneMalloc((NSZone *)-[NSTextBlock zone](self, "zone"), 0xA0uLL);
    self->_propVals = propVals;
  }
  propVals[8] = 0u;
  propVals[9] = 0u;
  propVals[6] = 0u;
  propVals[7] = 0u;
  propVals[4] = 0u;
  propVals[5] = 0u;
  propVals[2] = 0u;
  propVals[3] = 0u;
  *propVals = 0u;
  propVals[1] = 0u;
}

- (void)_destroyFloatStorage
{
  void *propVals;
  NSZone *v4;

  propVals = self->_propVals;
  if (propVals)
  {
    v4 = (NSZone *)MEMORY[0x18D7913AC](propVals, a2);
    NSZoneFree(v4, self->_propVals);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSTextBlock _destroyFloatStorage](self, "_destroyFloatStorage");

  v3.receiver = self;
  v3.super_class = (Class)NSTextBlock;
  -[NSTextBlock dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t propMask;
  unint64_t typeMask;
  uint64_t i;
  double v8;
  id primParamVal;
  double *propVals;
  uint64_t v11;
  unsigned int v12;
  int v13;
  double v14;
  float v15;
  id *p_primParamVal;
  id *p_otherParamVals;
  id otherParamVals;
  int v19;
  int v20;
  int v21;
  float v22[20];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    propMask = self->_propMask;
    if (propMask)
      objc_msgSend(a3, "encodeInteger:forKey:", propMask, CFSTR("NSValueTypes"));
    typeMask = self->_typeMask;
    if (typeMask)
      objc_msgSend(a3, "encodeInteger:forKey:", typeMask, CFSTR("NSFlags"));
    if (self->_propVals)
    {
      for (i = 0; i != 20; ++i)
      {
        v8 = *((double *)self->_propVals + i);
        if (v8 != 0.0)
          objc_msgSend(a3, "encodeDouble:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSParam%lu"), i), v8);
      }
    }
    primParamVal = self->_primParamVal;
    if (primParamVal)
      objc_msgSend(a3, "encodeObject:forKey:", primParamVal, CFSTR("NSBackgroundColor"));
    if (self->_otherParamVals)
      objc_msgSend(a3, "encodeObject:forKey:");
  }
  else
  {
    propVals = (double *)self->_propVals;
    v20 = self->_propMask;
    v21 = 0;
    v19 = self->_typeMask;
    if (propVals)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      do
      {
        v14 = propVals[v11];
        if (v14 != 0.0)
        {
          v13 |= 1 << v11;
          v15 = v14;
          v22[v12++] = v15;
        }
        ++v11;
      }
      while (v11 != 20);
      v21 = v13;
    }
    else
    {
      v13 = 0;
      v12 = 0;
    }
    p_primParamVal = &self->_primParamVal;
    if (self->_primParamVal)
    {
      v13 |= 0x10000000u;
      v21 = v13;
    }
    otherParamVals = self->_otherParamVals;
    p_otherParamVals = &self->_otherParamVals;
    if (otherParamVals)
      v21 = v13 | 0x20000000;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "III", &v21, &v20, &v19);
    if (v12)
      objc_msgSend(a3, "encodeArrayOfObjCType:count:at:", "f", v12, v22);
    if (*p_primParamVal)
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@", p_primParamVal);
    if (*p_otherParamVals)
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@", p_otherParamVals);
  }
}

- (NSTextBlock)initWithCoder:(id)a3
{
  NSTextBlock *v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  int32x4_t v18;
  uint32x4_t v19;
  int32x4_t v20;
  int v21;
  int8x16_t v22;
  int32x4_t v23;
  uint64_t v24;
  int v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v30;
  uint64_t v31;
  id v32;
  objc_super v33;
  float v34[15];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)NSTextBlock;
  v4 = -[NSTextBlock init](&v33, sel_init);
  if (!v4)
    return v4;
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSValueTypes")))
      v4->_propMask = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NSValueTypes"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSFlags")))
      v4->_typeMask = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSFlags"));
    for (i = 0; i != 20; ++i)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSParam%lu"), i);
      if (objc_msgSend(a3, "containsValueForKey:", v6))
      {
        if (!v4->_propVals)
          -[NSTextBlock _createFloatStorage](v4, "_createFloatStorage");
        objc_msgSend(a3, "decodeDoubleForKey:", v6);
        *((_QWORD *)v4->_propVals + i) = v7;
      }
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSBackgroundColor")))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      if (__NSTextBlockPrimaryColorClass_onceToken != -1)
        dispatch_once(&__NSTextBlockPrimaryColorClass_onceToken, &__block_literal_global_28);
      v9 = __NSTextBlockPrimaryColorClass_colorClass;
      if (__NSTextBlockSecondaryColorClass_onceToken != -1)
        dispatch_once(&__NSTextBlockSecondaryColorClass_onceToken, &__block_literal_global_253);
      v4->_primParamVal = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, __NSTextBlockSecondaryColorClass_colorClass, 0), CFSTR("NSBackgroundColor"));
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSBorderColors")))
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      if (__NSTextBlockPrimaryColorClass_onceToken != -1)
        dispatch_once(&__NSTextBlockPrimaryColorClass_onceToken, &__block_literal_global_28);
      v14 = __NSTextBlockPrimaryColorClass_colorClass;
      if (__NSTextBlockSecondaryColorClass_onceToken != -1)
        dispatch_once(&__NSTextBlockSecondaryColorClass_onceToken, &__block_literal_global_253);
      v4->_otherParamVals = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, __NSTextBlockSecondaryColorClass_colorClass, 0), CFSTR("NSBorderColors"));
    }
    return v4;
  }
  v15 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextBlock"));
  if (v15 != 1)
  {
    v27 = v15;
    v28 = _NSFullMethodName();
    NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v28, 1, v27);

    return 0;
  }
  v31 = 0;
  v32 = 0;
  v30 = 0;
  objc_msgSend(a3, "decodeValuesOfObjCTypes:", "III", (char *)&v31 + 4, &v31, &v30);
  v16 = v30;
  v4->_propMask = v31;
  v4->_typeMask = v16;
  v17 = HIDWORD(v31);
  if (HIDWORD(v31))
  {
    v18 = (int32x4_t)xmmword_18D6CC160;
    v19 = (uint32x4_t)vdupq_n_s32(HIDWORD(v31));
    v20 = 0uLL;
    v21 = 20;
    v22.i64[0] = 0x100000001;
    v22.i64[1] = 0x100000001;
    v23.i64[0] = 0x400000004;
    v23.i64[1] = 0x400000004;
    do
    {
      v20 = vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vshlq_u32(v19, (uint32x4_t)vnegq_s32(v18)), v22), v20);
      v18 = vaddq_s32(v18, v23);
      v21 -= 4;
    }
    while (v21);
    if (vaddvq_s32(v20))
    {
      objc_msgSend(a3, "decodeArrayOfObjCType:count:at:", "f");
      -[NSTextBlock _createFloatStorage](v4, "_createFloatStorage");
      v24 = 0;
      v25 = 0;
      v17 = HIDWORD(v31);
      do
      {
        if (((v17 >> v24) & 1) != 0)
        {
          v26 = v34[v25++];
          *((double *)v4->_propVals + v24) = v26;
        }
        ++v24;
      }
      while (v24 != 20);
    }
    if ((v17 & 0x10000000) != 0)
    {
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@", &v4->_primParamVal);
      v17 = HIDWORD(v31);
      if ((v31 & 0x2000000000000000) == 0)
      {
LABEL_36:
        if ((v17 & 0x40000000) == 0)
          return v4;
        goto LABEL_41;
      }
    }
    else if ((v17 & 0x20000000) == 0)
    {
      goto LABEL_36;
    }
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@", &v4->_otherParamVals);
    if ((v31 & 0x4000000000000000) == 0)
      return v4;
LABEL_41:
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@", &v32);

  }
  return v4;
}

- (void)_setValue:(double)a3 type:(unint64_t)a4 forParameter:(unint64_t)a5
{
  double *propVals;
  int v10;
  unint64_t v11;

  if (a5 > 0x13)
    goto LABEL_7;
  propVals = (double *)self->_propVals;
  if (a3 == 0.0)
  {
    if (!propVals)
      goto LABEL_7;
  }
  else if (!propVals)
  {
    -[NSTextBlock _createFloatStorage](self, "_createFloatStorage");
    propVals = (double *)self->_propVals;
  }
  propVals[a5] = a3;
LABEL_7:
  v10 = 1 << a5;
  if (a4 == 1)
    v11 = self->_propMask | v10;
  else
    v11 = self->_propMask & ~v10;
  self->_propMask = v11;
}

- (double)_valueForParameter:(unint64_t)a3
{
  double result;
  double *propVals;

  result = 0.0;
  if (a3 <= 0x13)
  {
    propVals = (double *)self->_propVals;
    if (propVals)
      return propVals[a3];
  }
  return result;
}

- (unint64_t)_valueTypeForParameter:(unint64_t)a3
{
  return (self->_propMask & (1 << a3)) != 0;
}

- (void)_takeValuesFromTextBlock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *propVals;
  void *v8;
  void *v9;

  if (*((_QWORD *)a3 + 1))
  {
    -[NSTextBlock _createFloatStorage](self, "_createFloatStorage");
    v5 = 0;
    v6 = *((_QWORD *)a3 + 1);
    propVals = (char *)self->_propVals;
    do
    {
      *(_QWORD *)&propVals[v5] = *(_QWORD *)(v6 + v5);
      v5 += 8;
    }
    while (v5 != 160);
  }
  self->_propMask = *((_QWORD *)a3 + 2);
  self->_typeMask = *((_QWORD *)a3 + 3);
  v8 = (void *)*((_QWORD *)a3 + 4);
  if (v8)
    self->_primParamVal = (id)objc_msgSend(v8, "copy");
  v9 = (void *)*((_QWORD *)a3 + 5);
  if (v9)
    self->_otherParamVals = (id)objc_msgSend(v9, "mutableCopy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "_takeValuesFromTextBlock:", self);
  return v4;
}

- (void)setContentWidth:(CGFloat)val type:(NSTextBlockValueType)type
{
  -[NSTextBlock setValue:type:forDimension:](self, "setValue:type:forDimension:", type, 0, val);
}

- (CGFloat)contentWidth
{
  CGFloat result;

  -[NSTextBlock valueForDimension:](self, "valueForDimension:", 0);
  return result;
}

- (NSTextBlockValueType)contentWidthValueType
{
  return -[NSTextBlock valueTypeForDimension:](self, "valueTypeForDimension:", 0);
}

- (void)setWidth:(CGFloat)val type:(NSTextBlockValueType)type forLayer:(NSTextBlockLayer)layer edge:(NSRectEdge)edge
{
  -[NSTextBlock _setValue:type:forParameter:](self, "_setValue:type:forParameter:", type, edge + 4 * layer + 12, val);
}

- (CGFloat)widthForLayer:(NSTextBlockLayer)layer edge:(NSRectEdge)edge
{
  CGFloat result;

  -[NSTextBlock _valueForParameter:](self, "_valueForParameter:", edge + 4 * layer + 12);
  return result;
}

- (NSTextBlockValueType)widthValueTypeForLayer:(NSTextBlockLayer)layer edge:(NSRectEdge)edge
{
  return -[NSTextBlock _valueTypeForParameter:](self, "_valueTypeForParameter:", edge + 4 * layer + 12);
}

- (void)setWidth:(CGFloat)val type:(NSTextBlockValueType)type forLayer:(NSTextBlockLayer)layer
{
  -[NSTextBlock setWidth:type:forLayer:edge:](self, "setWidth:type:forLayer:edge:", type, layer, 0);
  -[NSTextBlock setWidth:type:forLayer:edge:](self, "setWidth:type:forLayer:edge:", type, layer, 1, val);
  -[NSTextBlock setWidth:type:forLayer:edge:](self, "setWidth:type:forLayer:edge:", type, layer, 2, val);
  -[NSTextBlock setWidth:type:forLayer:edge:](self, "setWidth:type:forLayer:edge:", type, layer, 3, val);
}

- (void)setVerticalAlignment:(NSTextBlockVerticalAlignment)verticalAlignment
{
  self->_propMask = ((_DWORD)verticalAlignment << 30) | self->_propMask & 0x3FFFFFFF;
}

- (NSTextBlockVerticalAlignment)verticalAlignment
{
  return (unint64_t)(self->_propMask >> 30);
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
  NSColor *primParamVal;

  primParamVal = (NSColor *)self->_primParamVal;
  if (primParamVal != backgroundColor)
  {

    self->_primParamVal = (id)-[NSColor copy](backgroundColor, "copy");
  }
}

- (NSColor)backgroundColor
{
  return (NSColor *)self->_primParamVal;
}

- (void)setBorderColor:(NSColor *)color forEdge:(NSRectEdge)edge
{
  NSColor *v5;
  id otherParamVals;
  uint64_t v8;

  v5 = color;
  otherParamVals = self->_otherParamVals;
  if (otherParamVals)
  {
    if (color)
      goto LABEL_3;
LABEL_7:
    v5 = (NSColor *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    goto LABEL_3;
  }
  self->_otherParamVals = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", -[NSTextBlock zone](self, "zone")), "init");
  v8 = 4;
  do
  {
    objc_msgSend(self->_otherParamVals, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
    --v8;
  }
  while (v8);
  otherParamVals = self->_otherParamVals;
  if (!v5)
    goto LABEL_7;
LABEL_3:
  objc_msgSend(otherParamVals, "replaceObjectAtIndex:withObject:", edge, v5);
}

- (NSColor)borderColorForEdge:(NSRectEdge)edge
{
  id otherParamVals;
  NSColor *v4;
  uint64_t v5;

  otherParamVals = self->_otherParamVals;
  if (otherParamVals)
    v4 = (NSColor *)objc_msgSend(otherParamVals, "objectAtIndex:", edge);
  else
    v4 = 0;
  if (__NSTextBlockSecondaryColorClass_onceToken == -1)
  {
    if (!v4)
      return v4;
  }
  else
  {
    dispatch_once(&__NSTextBlockSecondaryColorClass_onceToken, &__block_literal_global_253);
    if (!v4)
      return v4;
  }
  v5 = __NSTextBlockSecondaryColorClass_colorClass;
  if (__NSTextBlockPrimaryColorClass_onceToken != -1)
    dispatch_once(&__NSTextBlockPrimaryColorClass_onceToken, &__block_literal_global_28);
  if ((objc_opt_isKindOfClass() & 1) == 0 && (!v5 || (objc_opt_isKindOfClass() & 1) == 0))
    return 0;
  return v4;
}

- (void)setBorderColor:(NSColor *)color
{
  -[NSTextBlock setBorderColor:forEdge:](self, "setBorderColor:forEdge:", color, 0);
  -[NSTextBlock setBorderColor:forEdge:](self, "setBorderColor:forEdge:", color, 1);
  -[NSTextBlock setBorderColor:forEdge:](self, "setBorderColor:forEdge:", color, 2);
  -[NSTextBlock setBorderColor:forEdge:](self, "setBorderColor:forEdge:", color, 3);
}

- (NSRect)rectForLayoutAtPoint:(NSPoint)startingPoint inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange
{
  NSUInteger length;
  NSUInteger location;
  double height;
  double width;
  double y;
  double x;
  double v12;
  NSLayoutManager *v14;
  NSTextBlockLayoutHelper *v15;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSRect result;

  length = charRange.length;
  location = charRange.location;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v12 = startingPoint.y;
  v14 = -[NSTextContainer layoutManager](textContainer, "layoutManager", startingPoint.x);
  v15 = [NSTextBlockLayoutHelper alloc];
  -[NSLayoutManager textStorage](v14, "textStorage");
  v17 = (double *)-[NSTextBlockLayoutHelper initWithTextBlock:charRange:text:layoutManager:containerWidth:collapseBorders:]((char *)v15, self, location, length, width, v16, v14, 0);
  v18 = v17[20];
  v19 = v17[14] + v17[15] + v17[16];
  v20 = v19 + v17[22] + v17[23] + v17[24];
  if (v20 <= width && v18 + v20 > width)
    v18 = v18 * ((width - v20) / v18);
  v22 = x + v19;
  v23 = v12 + v17[17] + v17[18] + v17[19];

  v24 = v22;
  v25 = v23;
  v26 = v18;
  v27 = y + height - v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (NSRect)boundsRectForContentRect:(NSRect)contentRect inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange
{
  NSUInteger length;
  NSUInteger location;
  double width;
  double height;
  double v10;
  double y;
  double x;
  NSLayoutManager *v14;
  NSTextBlockLayoutHelper *v15;
  uint64_t v16;
  char *v17;
  NSTextBlockVerticalAlignment v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSRect result;

  length = charRange.length;
  location = charRange.location;
  width = rect.size.width;
  height = contentRect.size.height;
  v10 = contentRect.size.width;
  y = contentRect.origin.y;
  x = contentRect.origin.x;
  v14 = -[NSTextContainer layoutManager](textContainer, "layoutManager", contentRect.origin.x, contentRect.origin.y, contentRect.size.width, contentRect.size.height, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  v15 = [NSTextBlockLayoutHelper alloc];
  -[NSLayoutManager textStorage](v14, "textStorage");
  v17 = -[NSTextBlockLayoutHelper initWithTextBlock:charRange:text:layoutManager:containerWidth:collapseBorders:]((char *)v15, self, location, length, width, v16, v14, 0);
  v18 = -[NSTextBlock verticalAlignment](self, "verticalAlignment");
  v19 = *((double *)v17 + 21) - height;
  if (v19 > 0.0)
  {
    height = height + v19;
    if (v18 == NSTextBlockBottomAlignment)
    {
LABEL_5:
      _moveLinesInLayoutManager(v14, *((_QWORD *)v17 + 4), *((_QWORD *)v17 + 5), 0, v19);
      goto LABEL_6;
    }
    if (v18 == NSTextBlockMiddleAlignment)
    {
      v19 = v19 * 0.5;
      goto LABEL_5;
    }
  }
LABEL_6:
  v20 = *((double *)v17 + 14) + *((double *)v17 + 15) + *((double *)v17 + 16);
  v21 = x - v20;
  v22 = *((double *)v17 + 17) + *((double *)v17 + 18) + *((double *)v17 + 19);
  v23 = y - v22;
  v24 = v10 + v20 + *((double *)v17 + 24) + *((double *)v17 + 23) + *((double *)v17 + 22);
  v25 = height + v22 + *((double *)v17 + 27) + *((double *)v17 + 26) + *((double *)v17 + 25);

  v26 = v21;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)drawBackgroundWithFrame:(NSRect)frameRect inView:(NSView *)controlView characterRange:(NSRange)charRange layoutManager:(NSLayoutManager *)layoutManager
{
  NSUInteger length;
  NSUInteger location;
  double height;
  double width;
  double y;
  double x;
  NSTextBlockLayoutHelper *v14;
  uint64_t v15;
  char *v16;
  NSColor *v17;
  NSColor *v18;
  NSColor *v19;
  NSColor *v20;
  NSColor *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;

  length = charRange.length;
  location = charRange.location;
  height = frameRect.size.height;
  width = frameRect.size.width;
  y = frameRect.origin.y;
  x = frameRect.origin.x;
  v14 = [NSTextBlockLayoutHelper alloc];
  -[NSLayoutManager textStorage](layoutManager, "textStorage");
  v16 = -[NSTextBlockLayoutHelper initWithTextBlock:charRange:text:layoutManager:containerWidth:collapseBorders:]((char *)v14, self, location, length, 0.0, v15, layoutManager, 0);
  v17 = -[NSTextBlock backgroundColor](self, "backgroundColor");
  v18 = -[NSTextBlock borderColorForEdge:](self, "borderColorForEdge:", 0);
  v19 = -[NSTextBlock borderColorForEdge:](self, "borderColorForEdge:", 1);
  v20 = -[NSTextBlock borderColorForEdge:](self, "borderColorForEdge:", 2);
  v21 = -[NSTextBlock borderColorForEdge:](self, "borderColorForEdge:", 3);
  v49 = x;
  v50 = y;
  v51 = width;
  v52 = height;
  v23 = *((double *)v16 + 14);
  v22 = *((double *)v16 + 15);
  v24 = *((double *)v16 + 17);
  v25 = *((_QWORD *)v16 + 18);
  v45 = x + v23;
  v46 = v24 + y;
  v26 = v23 + v22;
  v27 = *((double *)v16 + 23);
  v28 = *((double *)v16 + 24);
  v43 = width - (v26 + v27 + v28);
  v44 = v25;
  v30 = *((double *)v16 + 26);
  v29 = *((double *)v16 + 27);
  v47 = v22;
  v48 = height - (v24 + v29);
  v41 = x + v26;
  v42 = v24 + y;
  v37 = x + width - v28 - v27;
  v38 = v24 + y;
  v39 = v27;
  v40 = v48;
  v33 = x + v26;
  v34 = y + height - v29 - v30;
  v35 = v43;
  v36 = v30;
  if (v17)
  {
    -[NSColor set](v17, "set", *(_QWORD *)&v33, *(_QWORD *)&v34, *(_QWORD *)&v35, *(_QWORD *)&v36, *(_QWORD *)&v37, *(_QWORD *)&v38, *(_QWORD *)&v39, *(_QWORD *)&v40, *(_QWORD *)&v41, *(_QWORD *)&v42, *(_QWORD *)&v43, v44, *(_QWORD *)&v45, *(_QWORD *)&v46, *(_QWORD *)&v47, *(_QWORD *)&v48, *(_QWORD *)&v49,
      *(_QWORD *)&v50,
      *(_QWORD *)&v51,
      *(_QWORD *)&v52);
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v49, 1, location, length, v17);
    v22 = *((double *)v16 + 15);
  }
  if (v22 > 0.0 && v18 != 0)
  {
    -[NSColor set](v18, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v45, 1, location, length, v18);
  }
  if (*((double *)v16 + 18) > 0.0 && v19 != 0)
  {
    -[NSColor set](v19, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v41, 1, location, length, v19);
  }
  if (*((double *)v16 + 23) > 0.0 && v20)
  {
    -[NSColor set](v20, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v37, 1, location, length, v20);
  }
  if (*((double *)v16 + 26) > 0.0 && v21)
  {
    -[NSColor set](v21, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v33, 1, location, length, v21);
  }

}

- (id)_attributeDescription
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  NSTextBlockValueType v12;
  NSTextBlockValueType v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSColor *v29;
  NSColor *v30;
  NSColor *v31;
  NSColor *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NSTextBlockValueType v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  NSTextBlockValueType v60;
  NSTextBlockValueType v61;
  NSTextBlockValueType v62;
  NSTextBlockValueType v63;
  NSTextBlockValueType v64;
  NSTextBlockValueType v65;
  NSTextBlockValueType v66;
  NSTextBlockValueType v67;
  NSTextBlockValueType v68;
  NSTextBlockValueType v69;
  NSTextBlockValueType v70;
  NSTextBlockValueType v71;
  NSTextBlockValueType v72;
  NSTextBlockValueType v73;
  NSTextBlockValueType v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  double v78;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  -[NSTextBlock valueForDimension:](self, "valueForDimension:", 0);
  v77 = v4;
  -[NSTextBlock valueForDimension:](self, "valueForDimension:", 1);
  v6 = v5;
  -[NSTextBlock valueForDimension:](self, "valueForDimension:", 2);
  v76 = v7;
  -[NSTextBlock valueForDimension:](self, "valueForDimension:", 4);
  v79 = v8;
  -[NSTextBlock valueForDimension:](self, "valueForDimension:", 5);
  v10 = v9;
  -[NSTextBlock valueForDimension:](self, "valueForDimension:", 6);
  v81 = v11;
  v12 = -[NSTextBlock valueTypeForDimension:](self, "valueTypeForDimension:", 0);
  v64 = -[NSTextBlock valueTypeForDimension:](self, "valueTypeForDimension:", 1);
  v62 = -[NSTextBlock valueTypeForDimension:](self, "valueTypeForDimension:", 2);
  v13 = -[NSTextBlock valueTypeForDimension:](self, "valueTypeForDimension:", 4);
  v71 = -[NSTextBlock valueTypeForDimension:](self, "valueTypeForDimension:", 5);
  v69 = -[NSTextBlock valueTypeForDimension:](self, "valueTypeForDimension:", 6);
  v14 = _colorValForColor(-[NSTextBlock backgroundColor](self, "backgroundColor"));
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", 1, 1);
  v16 = v15;
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", 1, 2);
  v80 = v17;
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", 1, 3);
  v78 = v18;
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", 1, 0);
  v20 = v19;
  v70 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", 1, 1);
  v68 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", 1, 2);
  v67 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", 1, 3);
  v65 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", 1, 0);
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", 0, 1);
  v22 = v21;
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", 0, 2);
  v24 = v23;
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", 0, 3);
  v26 = v25;
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", 0, 0);
  v28 = v27;
  v66 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", 0, 1);
  v63 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", 0, 2);
  v61 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", 0, 3);
  v60 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", 0, 0);
  v29 = -[NSTextBlock borderColorForEdge:](self, "borderColorForEdge:", 1);
  v30 = -[NSTextBlock borderColorForEdge:](self, "borderColorForEdge:", 2);
  v31 = -[NSTextBlock borderColorForEdge:](self, "borderColorForEdge:", 3);
  v32 = -[NSTextBlock borderColorForEdge:](self, "borderColorForEdge:", 0);
  v33 = _colorValForColor(v29);
  v34 = _colorValForColor(v30);
  v75 = _colorValForColor(v31);
  v35 = _colorValForColor(v32);
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", -1, 1);
  v85 = v36;
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", -1, 2);
  v84 = v37;
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", -1, 3);
  v83 = v38;
  -[NSTextBlock widthForLayer:edge:](self, "widthForLayer:edge:", -1, 0);
  v82 = v39;
  v74 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", -1, 1);
  v73 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", -1, 2);
  v72 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", -1, 3);
  v40 = -[NSTextBlock widthValueTypeForLayer:edge:](self, "widthValueTypeForLayer:edge:", -1, 0);
  if (v12 == NSTextBlockPercentageValueType)
    v41 = CFSTR("%");
  else
    v41 = &stru_1E260C7D0;
  objc_msgSend(v3, "appendFormat:", CFSTR("w %g%@ "), v77, v41);
  if (v6 > 0.0 || v76 > 0.0)
  {
    if (v64 == NSTextBlockPercentageValueType)
      v42 = CFSTR("%");
    else
      v42 = &stru_1E260C7D0;
    if (v62 == NSTextBlockPercentageValueType)
      v43 = CFSTR("%");
    else
      v43 = &stru_1E260C7D0;
    objc_msgSend(v3, "appendFormat:", CFSTR("%g%@-%g%@ "), *(_QWORD *)&v6, v42, *(_QWORD *)&v76, v43);
  }
  if (v13 == NSTextBlockPercentageValueType)
    v44 = CFSTR("%");
  else
    v44 = &stru_1E260C7D0;
  objc_msgSend(v3, "appendFormat:", CFSTR("h %g%@ "), v79, v44);
  if (v10 > 0.0 || v81 > 0.0)
  {
    if (v71 == NSTextBlockPercentageValueType)
      v45 = CFSTR("%");
    else
      v45 = &stru_1E260C7D0;
    if (v69 == NSTextBlockPercentageValueType)
      v46 = CFSTR("%");
    else
      v46 = &stru_1E260C7D0;
    objc_msgSend(v3, "appendFormat:", CFSTR("%g%@-%g%@ "), *(_QWORD *)&v10, v45, *(_QWORD *)&v81, v46);
  }
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v3, "appendFormat:", CFSTR("bgc #%.6x "), v14);
  if (v20 > 0.0 || v16 > 0.0 || v80 > 0.0 || v78 > 0.0)
  {
    if (v70 == NSTextBlockPercentageValueType)
      v47 = CFSTR("%");
    else
      v47 = &stru_1E260C7D0;
    if (v68 == NSTextBlockPercentageValueType)
      v48 = CFSTR("%");
    else
      v48 = &stru_1E260C7D0;
    if (v67 == NSTextBlockPercentageValueType)
      v49 = CFSTR("%");
    else
      v49 = &stru_1E260C7D0;
    if (v65 == NSTextBlockPercentageValueType)
      v50 = CFSTR("%");
    else
      v50 = &stru_1E260C7D0;
    objc_msgSend(v3, "appendFormat:", CFSTR("m %g%@ %g%@ %g%@ %g%@ "), *(_QWORD *)&v16, v47, *(_QWORD *)&v80, v48, *(_QWORD *)&v78, v49, *(_QWORD *)&v20, v50);
  }
  if (v28 > 0.0 || v22 > 0.0 || v24 > 0.0 || v26 > 0.0)
  {
    v51 = v66 == NSTextBlockPercentageValueType ? CFSTR("%") : &stru_1E260C7D0;
    v52 = v63 == NSTextBlockPercentageValueType ? CFSTR("%") : &stru_1E260C7D0;
    v53 = v61 == NSTextBlockPercentageValueType ? CFSTR("%") : &stru_1E260C7D0;
    v54 = v60 == NSTextBlockPercentageValueType ? CFSTR("%") : &stru_1E260C7D0;
    objc_msgSend(v3, "appendFormat:", CFSTR("b %g%@ %g%@ %g%@ %g%@ "), *(_QWORD *)&v22, v51, *(_QWORD *)&v24, v52, *(_QWORD *)&v26, v53, *(_QWORD *)&v28, v54);
    if (v35 != 0x7FFFFFFFFFFFFFFFLL
      || v33 != 0x7FFFFFFFFFFFFFFFLL
      || v34 != 0x7FFFFFFFFFFFFFFFLL
      || v75 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("boc"));
      if (v33 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "appendString:", CFSTR(" transparent"));
      else
        objc_msgSend(v3, "appendFormat:", CFSTR(" #%.6x"), v33);
      if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "appendString:", CFSTR(" transparent"));
      else
        objc_msgSend(v3, "appendFormat:", CFSTR(" #%.6x"), v34);
      if (v75 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "appendString:", CFSTR(" transparent"));
      else
        objc_msgSend(v3, "appendFormat:", CFSTR(" #%.6x"), v75);
      if (v35 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "appendString:", CFSTR(" transparent "));
      else
        objc_msgSend(v3, "appendFormat:", CFSTR(" #%.6x "), v35);
    }
  }
  if (v82 > 0.0 || v85 > 0.0 || v84 > 0.0 || v83 > 0.0)
  {
    if (v74 == NSTextBlockPercentageValueType)
      v55 = CFSTR("%");
    else
      v55 = &stru_1E260C7D0;
    if (v73 == NSTextBlockPercentageValueType)
      v56 = CFSTR("%");
    else
      v56 = &stru_1E260C7D0;
    if (v72 == NSTextBlockPercentageValueType)
      v57 = CFSTR("%");
    else
      v57 = &stru_1E260C7D0;
    if (v40 == NSTextBlockPercentageValueType)
      v58 = CFSTR("%");
    else
      v58 = &stru_1E260C7D0;
    objc_msgSend(v3, "appendFormat:", CFSTR("p %g%@ %g%@ %g%@ %g%@ "), *(_QWORD *)&v85, v55, *(_QWORD *)&v84, v56, *(_QWORD *)&v83, v57, *(_QWORD *)&v82, v58);
  }
  return v3;
}

@end
