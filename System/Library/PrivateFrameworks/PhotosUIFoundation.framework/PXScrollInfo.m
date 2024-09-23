@implementation PXScrollInfo

- (unint64_t)hash
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;

  v3 = -[PXScrollInfo axis](self, "axis");
  v4 = -[PXScrollInfo isPagingEnabled](self, "isPagingEnabled");
  v5 = 4;
  if (!v4)
    v5 = 0;
  return v5 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  int v7;
  BOOL v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[PXScrollInfo axis](self, "axis");
    if (v6 == objc_msgSend(v5, "axis")
      && (v7 = -[PXScrollInfo isPagingEnabled](self, "isPagingEnabled"),
          v7 == objc_msgSend(v5, "isPagingEnabled")))
    {
      -[PXScrollInfo interpageSpacing](self, "interpageSpacing");
      v11 = v10;
      v13 = v12;
      objc_msgSend(v5, "interpageSpacing");
      v8 = 0;
      if (v11 == v15 && v13 == v14)
      {
        -[PXScrollInfo pagingOrigin](self, "pagingOrigin");
        v17 = v16;
        v19 = v18;
        objc_msgSend(v5, "pagingOrigin");
        v8 = v19 == v21 && v17 == v20;
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_axis;
  *((_BYTE *)result + 8) = self->_pagingEnabled;
  *(CGSize *)((char *)result + 24) = self->_interpageSpacing;
  *(CGPoint *)((char *)result + 40) = self->_pagingOrigin;
  return result;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (BOOL)isPagingEnabled
{
  return self->_pagingEnabled;
}

- (void)setPagingEnabled:(BOOL)a3
{
  self->_pagingEnabled = a3;
}

- (CGSize)interpageSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interpageSpacing.width;
  height = self->_interpageSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterpageSpacing:(CGSize)a3
{
  self->_interpageSpacing = a3;
}

- (CGPoint)pagingOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_pagingOrigin.x;
  y = self->_pagingOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPagingOrigin:(CGPoint)a3
{
  self->_pagingOrigin = a3;
}

@end
