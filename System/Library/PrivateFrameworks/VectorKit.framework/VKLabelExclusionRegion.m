@implementation VKLabelExclusionRegion

- (VKLabelExclusionRegion)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  VKLabelExclusionRegion *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)VKLabelExclusionRegion;
  result = -[VKLabelExclusionRegion init](&v8, sel_init);
  if (result)
  {
    result->_type = 0;
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
  }
  return result;
}

- (VKLabelExclusionRegion)initWithCoder:(id)a3
{
  id v4;
  VKLabelExclusionRegion *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKLabelExclusionRegion;
  v5 = -[VKLabelExclusionRegion init](&v11, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rect.origin.x"));
    v5->_rect.origin.x = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rect.origin.y"));
    v5->_rect.origin.y = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rect.size.width"));
    v5->_rect.size.width = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rect.size.height"));
    v5->_rect.size.height = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v9;

  type = self->_type;
  v9 = a3;
  objc_msgSend(v9, "encodeInt32:forKey:", type, CFSTR("type"));
  x = self->_rect.origin.x;
  *(float *)&x = x;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("rect.origin.x"), x);
  y = self->_rect.origin.y;
  *(float *)&y = y;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("rect.origin.y"), y);
  width = self->_rect.size.width;
  *(float *)&width = width;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("rect.size.width"), width);
  height = self->_rect.size.height;
  *(float *)&height = height;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("rect.size.height"), height);

}

- (unsigned)type
{
  return self->_type;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
