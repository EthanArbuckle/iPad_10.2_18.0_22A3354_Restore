@implementation BKDisplayAnnotationShapeContent

+ (id)contentWithSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setShapeSize:", width, height);
  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendSize:withName:", CFSTR("shapeSize"), self->_shapeSize.width, self->_shapeSize.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  BOOL v9;

  v5 = a3;
  if (v5 && (v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    objc_msgSend(v5, "shapeSize");
    v9 = self->_shapeSize.height == v8 && self->_shapeSize.width == v7;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGSize)shapeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_shapeSize.width;
  height = self->_shapeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShapeSize:(CGSize)a3
{
  self->_shapeSize = a3;
}

@end
