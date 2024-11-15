@implementation _UIImageViewPretiledImageWrapper

- (UIImage)pretiledImage
{
  return self->_pretiledImage;
}

+ (id)cacheValueWithPretiledImage:(id)a3 cacheKey:(id)a4
{
  id v6;
  id v7;
  _UIImageViewPretiledImageWrapper *v8;
  id *p_isa;
  id *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(_UIImageViewPretiledImageWrapper);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pretiledImage, a3);
    objc_storeStrong(p_isa + 2, a4);
    v10 = p_isa;
  }

  return p_isa;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)qword_1ECD82548, "removeObjectForKey:", self->_cacheKey);
  v3.receiver = self;
  v3.super_class = (Class)_UIImageViewPretiledImageWrapper;
  -[_UIImageViewPretiledImageWrapper dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[UIImage hash](self->_pretiledImage, "hash");
}

- (BOOL)isEqual:(id)a3
{
  UIImage **v4;
  BOOL v5;

  v4 = (UIImage **)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_pretiledImage == v4[1];

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; pretiledImage = %@>"),
               objc_opt_class(),
               self,
               self->_pretiledImage);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_pretiledImage, 0);
}

@end
