@implementation TUIRenderReferenceTransform

- (CGRect)frame
{
  double width;
  double height;
  __int128 v5;
  CGAffineTransform v6;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;

  width = self->_size.width;
  height = self->_size.height;
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeTranslation(&v10, width * -0.5, height * -0.5);
  t1 = v10;
  v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t2.c = v5;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
  CGAffineTransformConcat(&v9, &t1, &t2);
  v10 = v9;
  CGAffineTransformMakeTranslation(&v6, self->_center.x, self->_center.y);
  t1 = v10;
  CGAffineTransformConcat(&v9, &t1, &v6);
  v10 = v9;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = width;
  v11.size.height = height;
  return CGRectApplyAffineTransform(v11, &v9);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  __int128 v10;
  NSString *v11;
  void *v12;
  void *v13;
  CGAffineTransform transform;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromCGSize(self->_size);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromCGPoint(self->_center);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.c = v10;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_transform.tx;
  v11 = NSStringFromCGAffineTransform(&transform);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ size=%@ center=%@ transform=%@>"), v5, v7, v9, v12));

  return v13;
}

- (TUIRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end
