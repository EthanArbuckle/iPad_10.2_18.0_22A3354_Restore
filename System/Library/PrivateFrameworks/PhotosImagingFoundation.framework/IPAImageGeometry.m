@implementation IPAImageGeometry

- (IPAImageGeometry)initWithIdentifier:(id)a3 extent:(CGRect)a4 imageQuad:(const Quad2d *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  IPAImageGeometry *v12;
  uint64_t v13;
  NSString *identifier;
  Vector2d V0;
  Vector2d V1;
  Vector2d V3;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  IPAImageGeometry *result;
  objc_super v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  if (v11)
  {
    v22.receiver = self;
    v22.super_class = (Class)IPAImageGeometry;
    v12 = -[IPAImageGeometry init](&v22, sel_init);
    if (v12)
    {
      v13 = objc_msgSend(v11, "copy");
      identifier = v12->_identifier;
      v12->_identifier = (NSString *)v13;

      v12->_extent.origin.x = x;
      v12->_extent.origin.y = y;
      v12->_extent.size.width = width;
      v12->_extent.size.height = height;
      V0 = a5->V0;
      V1 = a5->V1;
      V3 = a5->V3;
      v12->_imageQuad.V2 = a5->V2;
      v12->_imageQuad.V3 = V3;
      v12->_imageQuad.V0 = V0;
      v12->_imageQuad.V1 = V1;
      v12->_domain.origin.x = PA::Quad2d::boundingRect((float64x2_t *)a5);
      v12->_domain.origin.y = v18;
      v12->_domain.size.width = v19;
      v12->_domain.size.height = v20;
    }

    return v12;
  }
  else
  {
    result = (IPAImageGeometry *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (IPAImageGeometry)initWithIdentifier:(id)a3 extent:(CGRect)a4 domain:(CGRect)a5
{
  _QWORD v6[8];

  v6[0] = *(_QWORD *)&a5.origin.x;
  v6[1] = *(_QWORD *)&a5.origin.y;
  *(double *)&v6[2] = a5.origin.x + a5.size.width;
  v6[3] = *(_QWORD *)&a5.origin.y;
  v6[4] = *(_QWORD *)&a5.origin.x;
  *(double *)&v6[5] = a5.origin.y + a5.size.height;
  *(double *)&v6[6] = a5.origin.x + a5.size.width;
  *(double *)&v6[7] = a5.origin.y + a5.size.height;
  return -[IPAImageGeometry initWithIdentifier:extent:imageQuad:](self, "initWithIdentifier:extent:imageQuad:", a3, v6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (IPAImageGeometry)initWithIdentifier:(id)a3 extent:(CGRect)a4
{
  _QWORD v5[8];

  v5[0] = *(_QWORD *)&a4.origin.x;
  v5[1] = *(_QWORD *)&a4.origin.y;
  *(double *)&v5[2] = a4.origin.x + a4.size.width;
  v5[3] = *(_QWORD *)&a4.origin.y;
  v5[4] = *(_QWORD *)&a4.origin.x;
  *(double *)&v5[5] = a4.origin.y + a4.size.height;
  *(double *)&v5[6] = a4.origin.x + a4.size.width;
  *(double *)&v5[7] = a4.origin.y + a4.size.height;
  return -[IPAImageGeometry initWithIdentifier:extent:imageQuad:](self, "initWithIdentifier:extent:imageQuad:", a3, v5);
}

- (IPAImageGeometry)init
{
  IPAImageGeometry *result;

  result = (IPAImageGeometry *)_PFAssertFailHandler();
  __break(1u);
  return result;
}

- (id)identifier
{
  return self->_identifier;
}

- (CGRect)domain
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_domain.origin.x;
  y = self->_domain.origin.y;
  width = self->_domain.size.width;
  height = self->_domain.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)extent
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_extent.origin.x;
  y = self->_extent.origin.y;
  width = self->_extent.size.width;
  height = self->_extent.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (Quad2d)imageQuad
{
  Vector2d V2;
  Vector2d V0;

  V2 = self[1].V2;
  retstr->V0 = self[1].V1;
  retstr->V1 = V2;
  V0 = self[2].V0;
  retstr->V2 = self[1].V3;
  retstr->V3 = V0;
  return self;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" identifier:%@\n"), self->_identifier);
  NSStringFromRect(self->_extent);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" extent:%@\n"), v7);

  NSStringFromRect(self->_domain);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" domain: %@\n"), v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%0.4f %0.4f>"), *(_QWORD *)&self->_imageQuad.V0.X, *(_QWORD *)&self->_imageQuad.V0.Y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%0.4f %0.4f>"), *(_QWORD *)&self->_imageQuad.V1.X, *(_QWORD *)&self->_imageQuad.V1.Y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%0.4f %0.4f>"), *(_QWORD *)&self->_imageQuad.V2.X, *(_QWORD *)&self->_imageQuad.V2.Y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%0.4f %0.4f>"), *(_QWORD *)&self->_imageQuad.V3.X, *(_QWORD *)&self->_imageQuad.V3.Y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<Quad2 %@ %@ %@ %@>"), v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" quad:%@\n"), v14);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)inputGeometryWithImageSize:(CGSize)a3
{
  if (a3.width == *MEMORY[0x1E0C9D820] && a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    _PFAssertFailHandler();
    JUMPOUT(0x1D4CC0DD0);
  }
  return -[IPAImageGeometry initWithIdentifier:extent:]([IPAImageGeometry alloc], "initWithIdentifier:extent:", CFSTR("input"), 0.0, 0.0, a3.width, a3.height);
}

@end
