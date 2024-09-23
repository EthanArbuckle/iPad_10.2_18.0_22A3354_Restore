@implementation UISDisplaySingleRectShape

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

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISDisplaySingleRectShape;
  v3 = a3;
  -[UISDisplayShape encodeWithXPCDictionary:](&v4, sel_encodeWithXPCDictionary_, v3);
  BSSerializeCGRectToXPCDictionaryWithKey();

}

- (UISDisplaySingleRectShape)initWithXPCDictionary:(id)a3
{
  id v4;
  UISDisplaySingleRectShape *v5;
  UISDisplaySingleRectShape *v6;
  CGRect *p_rect;
  objc_class *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISDisplaySingleRectShape;
  v5 = -[UISDisplayShape initWithXPCDictionary:](&v13, sel_initWithXPCDictionary_, v4);
  v6 = v5;
  if (v5)
  {
    p_rect = &v5->_rect;
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    *(_QWORD *)&p_rect->origin.x = v8;
    v6->_rect.origin.y = v9;
    v6->_rect.size.width = v10;
    v6->_rect.size.height = v11;
  }

  return v6;
}

- (UISDisplaySingleRectShape)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UISDisplaySingleRectShape *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)UISDisplaySingleRectShape;
  result = -[UISDisplaySingleRectShape init](&v8, sel_init);
  if (result)
  {
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  UISDisplaySingleRectShape *v4;
  UISDisplaySingleRectShape *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  CGRect v20;
  CGRect v21;

  v4 = (UISDisplaySingleRectShape *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v18 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UISDisplaySingleRectShape rect](self, "rect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UISDisplaySingleRectShape rect](v5, "rect");
    v21.origin.x = v14;
    v21.origin.y = v15;
    v21.size.width = v16;
    v21.size.height = v17;
    v20.origin.x = v7;
    v20.origin.y = v9;
    v20.size.width = v11;
    v20.size.height = v13;
    v18 = CGRectEqualToRect(v20, v21);
  }
  else
  {
LABEL_5:
    v18 = 0;
  }
LABEL_7:

  return v18;
}

- (unint64_t)hash
{
  int8x16_t v2;

  v2 = veorq_s8((int8x16_t)vcvtq_s64_f64((float64x2_t)self->_rect.origin), (int8x16_t)vcvtq_s64_f64((float64x2_t)self->_rect.size));
  return (unint64_t)veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("single rect: {%g, %g, %g, %g}"), *(_QWORD *)&self->_rect.origin.x, *(_QWORD *)&self->_rect.origin.y, *(_QWORD *)&self->_rect.size.width, *(_QWORD *)&self->_rect.size.height);
}

@end
