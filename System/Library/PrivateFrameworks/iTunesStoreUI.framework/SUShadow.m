@implementation SUShadow

- (SUShadow)initWithCoder:(id)a3
{
  SUShadow *v4;
  CGFloat v5;
  CGFloat v6;
  float v7;
  float v8;

  v4 = -[SUShadow init](self, "init");
  if (v4)
  {
    v4->_color = (UIColor *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    objc_msgSend(a3, "decodeCGSizeForKey:", CFSTR("offset"));
    v4->_offset.width = v5;
    v4->_offset.height = v6;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("opacity"));
    v4->_opacity = v7;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("radius"));
    v4->_radius = v8;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  self->_color = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUShadow;
  -[SUShadow dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 8) = self->_color;
  *(CGSize *)(v4 + 16) = self->_offset;
  *(double *)(v4 + 32) = self->_opacity;
  *(double *)(v4 + 40) = self->_radius;
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  double opacity;
  double radius;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUShadow.m"), 53, CFSTR("Only supports keyed archiving"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_color, CFSTR("color"));
  objc_msgSend(a3, "encodeCGSize:forKey:", CFSTR("offset"), self->_offset.width, self->_offset.height);
  opacity = self->_opacity;
  *(float *)&opacity = opacity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("opacity"), opacity);
  radius = self->_radius;
  *(float *)&radius = radius;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("radius"), radius);
}

- (void)applyToLayer:(id)a3
{
  UIColor *color;
  double v6;

  color = self->_color;
  if (color)
    objc_msgSend(a3, "setShadowColor:", -[UIColor CGColor](color, "CGColor"));
  objc_msgSend(a3, "setShadowOffset:", self->_offset.width, self->_offset.height);
  v6 = fmax(self->_opacity, 0.0);
  if (v6 > 1.0)
    v6 = 1.0;
  *(float *)&v6 = v6;
  objc_msgSend(a3, "setShadowOpacity:", v6);
  objc_msgSend(a3, "setShadowRadius:", fabs(self->_radius));
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CGSize)offset
{
  double width;
  double height;
  CGSize result;

  width = self->_offset.width;
  height = self->_offset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  self->_offset = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

@end
