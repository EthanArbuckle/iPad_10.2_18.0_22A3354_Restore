@implementation NSShadow

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)shadowColor
{
  NSColor *shadowColor;

  objc_sync_enter(self);
  if ((self->_shadowFlags & 1) != 0)
    shadowColor = self->_shadowColor;
  else
    shadowColor = (NSColor *)objc_msgSend((id)objc_opt_class(), "defaultShadowColor");
  objc_sync_exit(self);
  return shadowColor;
}

- (unint64_t)hash
{
  return (unint64_t)((double)(uint64_t)self->_shadowBlurRadius * 10.0)
       + ((uint64_t)(self->_shadowOffset.width * 10.0) << 16)
       + (uint64_t)(self->_shadowOffset.height * 10.0);
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  int v11;
  double v12;
  double v13;
  double v14;
  NSColor *v15;
  uint64_t v16;
  NSColor *v17;
  NSColor *shadowColor;
  NSSize v20;
  NSSize v21;

  if (self == a3)
    goto LABEL_18;
  if (!a3)
    goto LABEL_14;
  if (object_getClass(self) == (Class)__NSShadowClass && object_getClass(a3) == (Class)__NSShadowClass)
  {
    if (self->_shadowOffset.width == *((double *)a3 + 2)
      && self->_shadowOffset.height == *((double *)a3 + 3)
      && self->_shadowBlurRadius == *((double *)a3 + 4))
    {
      if ((self->_shadowFlags & 1) != 0 || (*((_BYTE *)a3 + 8) & 1) != 0)
      {
        shadowColor = self->_shadowColor;
        v17 = (NSColor *)*((_QWORD *)a3 + 5);
        if (shadowColor != v17)
          goto LABEL_10;
      }
      goto LABEL_18;
    }
LABEL_14:
    LOBYTE(v11) = 0;
    return v11;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  -[NSShadow shadowOffset](self, "shadowOffset");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a3, "shadowOffset");
  v21.width = v9;
  v21.height = v10;
  v20.width = v6;
  v20.height = v8;
  v11 = NSEqualSizes(v20, v21);
  if (v11)
  {
    -[NSShadow shadowBlurRadius](self, "shadowBlurRadius");
    v13 = v12;
    objc_msgSend(a3, "shadowBlurRadius");
    if (v13 == v14)
    {
      v15 = -[NSShadow shadowColor](self, "shadowColor");
      v16 = objc_msgSend(a3, "shadowColor");
      if (v15 != (NSColor *)v16)
      {
        v17 = (NSColor *)v16;
        shadowColor = v15;
LABEL_10:
        LOBYTE(v11) = -[NSColor isEqual:](shadowColor, "isEqual:", v17);
        return v11;
      }
LABEL_18:
      LOBYTE(v11) = 1;
      return v11;
    }
    goto LABEL_14;
  }
  return v11;
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
  self->_shadowOffset = shadowOffset;
}

- (CGFloat)shadowBlurRadius
{
  return self->_shadowBlurRadius;
}

- (void)setShadowBlurRadius:(CGFloat)shadowBlurRadius
{
  self->_shadowBlurRadius = shadowBlurRadius;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSShadow;
  -[NSShadow dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithShadow:", self);
}

- (NSShadow)initWithShadow:(id)a3
{
  NSShadow *v4;
  NSShadow *v5;
  unint64_t v7;

  v4 = -[NSShadow init](self, "init");
  v5 = v4;
  if (a3 && v4)
  {
    if (object_getClass(v4) == (Class)__NSShadowClass && object_getClass(a3) == (Class)__NSShadowClass)
    {
      v5->_shadowOffset = (CGSize)*((_OWORD *)a3 + 1);
      v5->_shadowBlurRadius = *((double *)a3 + 4);
      v7 = *((_QWORD *)a3 + 1);
      v5->_shadowFlags = v7;
      if ((v7 & 1) != 0)
        v5->_shadowColor = (NSColor *)objc_msgSend(*((id *)a3 + 5), "copyWithZone:", -[NSShadow zone](v5, "zone"));
    }
    else
    {
      objc_msgSend(a3, "shadowOffset");
      -[NSShadow setShadowOffset:](v5, "setShadowOffset:");
      objc_msgSend(a3, "shadowBlurRadius");
      -[NSShadow setShadowBlurRadius:](v5, "setShadowBlurRadius:");
      -[NSShadow setShadowColor:](v5, "setShadowColor:", objc_msgSend(a3, "shadowColor"));
    }
  }
  return v5;
}

- (NSShadow)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSShadow;
  return -[NSShadow init](&v3, sel_init);
}

- (void)setShadowColor:(id)shadowColor
{
  NSColor *v5;

  objc_sync_enter(self);
  self->_shadowFlags |= 1uLL;
  v5 = self->_shadowColor;
  if (v5 != shadowColor)
  {

    self->_shadowColor = (NSColor *)objc_msgSend(shadowColor, "copyWithZone:", -[NSShadow zone](self, "zone"));
  }
  objc_sync_exit(self);
}

- (void)applyToGraphicsContext:(id)a3
{
  CGFloat height;
  CGFloat width;
  CGContext *v6;
  CGContext *v7;
  CGColor *v8;
  CGSize v9;
  CGSize v10;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  v6 = (CGContext *)objc_msgSend(a3, "CGContext");
  v7 = v6;
  if ((self->_shadowFlags & 1) != 0)
  {
    v8 = -[NSColor CGColor](self->_shadowColor, "CGColor");
    if (v8)
    {
      v10.width = width;
      v10.height = height;
      CGContextSetShadowWithColor(v7, v10, self->_shadowBlurRadius, v8);
    }
  }
  else
  {
    v9.width = width;
    v9.height = height;
    CGContextSetShadow(v6, v9, self->_shadowBlurRadius);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSShadow setVersion:](NSShadow, "setVersion:", 1);
    __NSShadowClass = (uint64_t)a1;
  }
}

+ (id)shadow
{
  return objc_alloc_init((Class)a1);
}

+ (id)defaultShadowColor
{
  id result;

  result = (id)defaultShadowColor_defaultShadowColor;
  if (!defaultShadowColor_defaultShadowColor)
  {
    result = (id)objc_msgSend((Class)getNSColorClass_2[0](), "colorWithCalibratedRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.333333333);
    defaultShadowColor_defaultShadowColor = (uint64_t)result;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double height;

  if (self->_shadowOffset.width != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSShadowHoriz"));
  height = self->_shadowOffset.height;
  if (height != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSShadowVert"), -height);
  if (self->_shadowBlurRadius != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSShadowBlurRadius"));
  if ((self->_shadowFlags & 1) != 0)
    objc_msgSend(a3, "encodeObject:forKey:", self->_shadowColor, CFSTR("NSShadowColor"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSShadow)initWithCoder:(NSCoder *)coder
{
  CGFloat v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const __CFString *v13;
  CGFloat v14;
  double height;
  double v16;
  double v17;
  double shadowBlurRadius;
  _BOOL4 v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  uint64_t v24;

  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSShadowHoriz")))
  {
    -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NSShadowHoriz"));
    self->_shadowOffset.width = v6;
    if (-[NSCoder error](coder, "error"))
      goto LABEL_29;
    v12 = fabs(self->_shadowOffset.width);
    if (v12 >= INFINITY && v12 <= INFINITY)
    {
      v13 = CFSTR("decoded horizontal offset is invalid");
LABEL_24:
      v22 = _NSSecureDecodingError((uint64_t)self, (uint64_t)a2, (uint64_t)v13, v7, v8, v9, v10, v11, v24);

      -[NSCoder failWithError:](coder, "failWithError:", v22);
      return 0;
    }
  }
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSShadowVert")))
  {
    -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NSShadowVert"));
    self->_shadowOffset.height = v14;
    if (-[NSCoder error](coder, "error"))
      goto LABEL_29;
    height = self->_shadowOffset.height;
    v16 = fabs(height);
    if (v16 >= INFINITY && v16 <= INFINITY)
    {
      v13 = CFSTR("decoded vertical offset is invalid");
      goto LABEL_24;
    }
  }
  else
  {
    height = self->_shadowOffset.height;
  }
  self->_shadowOffset.height = -height;
  if (!-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSShadowBlurRadius")))
    goto LABEL_25;
  -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NSShadowBlurRadius"));
  self->_shadowBlurRadius = v17;
  if (-[NSCoder error](coder, "error"))
  {
LABEL_29:

    return 0;
  }
  shadowBlurRadius = self->_shadowBlurRadius;
  v19 = (*(_QWORD *)&shadowBlurRadius & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  v20 = shadowBlurRadius < 0.0
     && ((*(_QWORD *)&shadowBlurRadius & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (shadowBlurRadius >= 0.0)
    v19 = 0;
  v21 = (*(_QWORD *)&shadowBlurRadius & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v19;
  if ((v21 | v20) == 1)
  {
    v13 = CFSTR("decoded blur radius is invalid");
    goto LABEL_24;
  }
LABEL_25:
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSShadowColor")))
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_8);
    self->_shadowColor = (NSColor *)-[NSCoder decodeTopLevelObjectOfClasses:forKey:error:](coder, "decodeTopLevelObjectOfClasses:forKey:error:", initWithCoder__allowedClasses, CFSTR("NSShadowColor"), 0);
    self->_shadowFlags |= 1uLL;
    if (-[NSCoder error](coder, "error"))
      goto LABEL_29;
  }
  return self;
}

uint64_t __26__NSShadow_initWithCoder___block_invoke()
{
  Class v0;
  uint64_t result;

  v0 = NSClassFromString((NSString *)CFSTR("UIColor"));
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v0, getNSColorClass_2[0](), 0);
  initWithCoder__allowedClasses = result;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("NSShadow %@"), NSStringFromSize(self->_shadowOffset));
  v4 = v3;
  if (self->_shadowBlurRadius != 0.0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" blur = %g"), *(_QWORD *)&self->_shadowBlurRadius);
  if ((self->_shadowFlags & 1) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" color = {%@}"), self->_shadowColor);
  return v4;
}

@end
