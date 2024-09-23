@implementation IPAScaleImageSizePolicy

- (IPAScaleImageSizePolicy)initWithScale:(double)a3
{
  IPAScaleImageSizePolicy *result;
  double v7;
  objc_super v8;

  if (a3 <= 0.0 || a3 >= 100.0)
  {
    v7 = a3;
    _PFAssertContinueHandler();
  }
  v8.receiver = self;
  v8.super_class = (Class)IPAScaleImageSizePolicy;
  result = -[IPAScaleImageSizePolicy init](&v8, sel_init, *(_QWORD *)&v7);
  if (result)
    result->_scale = a3;
  return result;
}

- (CGSize)transformSize:(CGSize)a3
{
  double scale;
  double v4;
  double v5;
  CGSize result;

  scale = self->_scale;
  v4 = round(a3.width * scale);
  v5 = round(a3.height * scale);
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)transformScaleForSize:(CGSize)a3
{
  return self->_scale;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> scale=%f"), objc_opt_class(), self, *(_QWORD *)&self->_scale);
}

- (IPAScaleImageSizePolicy)initWithCoder:(id)a3
{
  id v3;
  IPAScaleImageSizePolicy *v4;
  float v5;
  float v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPAScaleImageSizePolicy;
  v3 = a3;
  v4 = -[IPAImageSizePolicy initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("scale"), v8.receiver, v8.super_class);
  v6 = v5;

  v4->_scale = v6;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double scale;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IPAScaleImageSizePolicy;
  v4 = a3;
  -[IPAImageSizePolicy encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  scale = self->_scale;
  *(float *)&scale = scale;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("scale"), scale, v6.receiver, v6.super_class);

}

- (BOOL)isEqual:(id)a3
{
  return self->_scale == *((double *)a3 + 1);
}

- (unint64_t)hash
{
  return (unint64_t)self->_scale;
}

@end
