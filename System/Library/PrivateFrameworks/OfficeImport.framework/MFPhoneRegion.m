@implementation MFPhoneRegion

- (MFPhoneRegion)initWithRects:(id)a3 in_bounds:(CGRect)a4 in_dc:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  MFPhoneRegion *v13;
  MFPhoneRegion *v14;
  OITSUBezierPath *v15;
  OITSUBezierPath *m_path;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  OITSUBezierPath *v22;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)MFPhoneRegion;
  v13 = -[MFPhoneRegion init](&v31, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->m_bounds.origin.x = x;
    v13->m_bounds.origin.y = y;
    v13->m_bounds.size.width = width;
    v13->m_bounds.size.height = height;
    v15 = objc_alloc_init(OITSUBezierPath);
    m_path = v14->m_path;
    v14->m_path = v15;

    objc_msgSend(v12, "getCurrentTransform");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "getTransformMatrix");
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v25 = 0u;
    }
    v28 = v25;
    v29 = v26;
    v30 = v27;

    objc_msgSend(v11, "objectEnumerator");
    v19 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v20, "nextObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v14->m_path;
      if (!v21)
        break;
      objc_msgSend(v21, "CGRectValue");
      v19 = v21;
      -[OITSUBezierPath appendBezierPathWithRect:](v22, "appendBezierPathWithRect:");
    }
    v24[0] = v28;
    v24[1] = v29;
    v24[2] = v30;
    -[OITSUBezierPath transformUsingAffineTransform:](v22, "transformUsingAffineTransform:", v24);

  }
  return v14;
}

- (MFPhoneRegion)initWithPath:(id)a3 in_bounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  MFPhoneRegion *v10;
  void *v11;
  uint64_t v12;
  OITSUBezierPath *m_path;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFPhoneRegion;
  v10 = -[MFPhoneRegion init](&v15, sel_init);
  if (v10)
  {
    objc_msgSend(v9, "getBezierPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    m_path = v10->m_path;
    v10->m_path = (OITSUBezierPath *)v12;

    v10->m_bounds.origin.x = x;
    v10->m_bounds.origin.y = y;
    v10->m_bounds.size.width = width;
    v10->m_bounds.size.height = height;
  }

  return v10;
}

- (id)pathForClippingWithDeviceContext:(id)a3
{
  id v4;
  OITSUBezierPath *m_path;
  void *v6;

  v4 = a3;
  m_path = self->m_path;
  if (m_path && !-[OITSUBezierPath isEmpty](m_path, "isEmpty"))
  {
    v6 = (void *)-[OITSUBezierPath copy](self->m_path, "copy");
    objc_msgSend(v6, "setWindingRule:", objc_msgSend(v4, "getPolyFillMode") != 2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)fill:(id)a3 in_brush:(id)a4
{
  objc_msgSend(a4, "fillPath:in_path:", a3, self->m_path);
  return 0;
}

- (int)frame:(id)a3 in_brush:(id)a4
{
  return 0;
}

- (int)invert:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_path, 0);
}

@end
