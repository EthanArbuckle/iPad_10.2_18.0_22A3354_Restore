@implementation UIWindowSceneGeometry

+ (id)_calculateEffectiveGeometryForWindowScene:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v6 = objc_msgSend(v4, "interfaceOrientation");

  objc_msgSend(v5, "_setInterfaceOrientation:", v6);
  return v5;
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (id)_init
{
  id result;
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWindowSceneGeometry;
  result = -[UIWindowSceneGeometry init](&v4, sel_init);
  if (result)
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)((char *)result + 56) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)((char *)result + 72) = v3;
    *((_QWORD *)result + 1) = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  UIWindowSceneGeometry *v4;
  UIWindowSceneGeometry *v5;
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
  UIInterfaceOrientation v18;
  BOOL v19;
  CGRect v21;
  CGRect v22;

  v4 = (UIWindowSceneGeometry *)a3;
  if (v4 == self)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIWindowSceneGeometry systemFrame](self, "systemFrame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[UIWindowSceneGeometry systemFrame](v5, "systemFrame");
      v22.origin.x = v14;
      v22.origin.y = v15;
      v22.size.width = v16;
      v22.size.height = v17;
      v21.origin.x = v7;
      v21.origin.y = v9;
      v21.size.width = v11;
      v21.size.height = v13;
      if (CGRectEqualToRect(v21, v22))
      {
        v18 = -[UIWindowSceneGeometry interfaceOrientation](self, "interfaceOrientation");
        v19 = v18 == -[UIWindowSceneGeometry interfaceOrientation](v5, "interfaceOrientation");
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (CGRect)systemFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_systemFrame.origin.x;
  y = self->_systemFrame.origin.y;
  width = self->_systemFrame.size.width;
  height = self->_systemFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIInterfaceOrientation)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -[UIWindowSceneGeometry _init]([UIWindowSceneGeometry alloc], "_init");
  -[UIWindowSceneGeometry systemFrame](self, "systemFrame");
  v4[7] = v5;
  v4[8] = v6;
  v4[9] = v7;
  v4[10] = v8;
  v4[1] = -[UIWindowSceneGeometry interfaceOrientation](self, "interfaceOrientation");
  return v4;
}

- (void)_setSystemFrame:(CGRect)a3
{
  self->_systemFrame = a3;
}

- (CGSize)minimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumSize.width;
  height = self->_minimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIWindowSceneResizingRestrictions)resizingRestrictions
{
  return self->_resizingRestrictions;
}

@end
