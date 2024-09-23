@implementation _DUIVisibleDroppedItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIVisibleDroppedItem)init
{
  _DUIVisibleDroppedItem *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DUIVisibleDroppedItem;
  result = -[_DUIVisibleDroppedItem init](&v5, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_appliedTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_appliedTransform.c = v4;
    *(_OWORD *)&result->_appliedTransform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (_DUIVisibleDroppedItem)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_DUIVisibleDroppedItem;
  v5 = -[_DUIVisibleDroppedItem init](&v19, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 13) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemIndex"));
    objc_msgSend(v4, "ui_decodeCAPoint3DForKey:", CFSTR("center"));
    *((_QWORD *)v5 + 1) = v6;
    *((_QWORD *)v5 + 2) = v7;
    *((_QWORD *)v5 + 3) = v8;
    v9 = (__int128 *)(v5 + 136);
    if (v4)
    {
      objc_msgSend(v4, "decodeCGAffineTransformForKey:", CFSTR("appliedTransform"));
      *v9 = v16;
      *(_OWORD *)(v5 + 152) = v17;
      *(_OWORD *)(v5 + 168) = v18;
      objc_msgSend(v4, "_uikit_decodeSPVector3DForKey:", CFSTR("velocity"));
      *((_OWORD *)v5 + 2) = v16;
      *((_OWORD *)v5 + 3) = v17;
      objc_msgSend(v4, "_uikit_decodeSPVector3DForKey:", CFSTR("targetVelocity"));
    }
    else
    {
      *(_OWORD *)(v5 + 152) = 0u;
      *(_OWORD *)(v5 + 168) = 0u;
      *v9 = 0u;
      *((_OWORD *)v5 + 2) = 0u;
      *((_OWORD *)v5 + 3) = 0u;
      v16 = 0u;
      v17 = 0u;
    }
    *((_OWORD *)v5 + 4) = v16;
    *((_OWORD *)v5 + 5) = v17;
    v5[96] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("constrainSize"), v16, v17);
    v5[97] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("flipped"));
    v5[98] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("precisionMode"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rotation"));
    *((_QWORD *)v5 + 16) = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preview"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageComponent"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v13;

  }
  return (_DUIVisibleDroppedItem *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t itemIndex;
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  itemIndex = self->_itemIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", itemIndex, CFSTR("itemIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageComponent, CFSTR("imageComponent"));
  v6 = *(_OWORD *)&self->_appliedTransform.c;
  v9 = *(_OWORD *)&self->_appliedTransform.a;
  v10 = v6;
  v11 = *(_OWORD *)&self->_appliedTransform.tx;
  objc_msgSend(v5, "encodeCGAffineTransform:forKey:", &v9, CFSTR("appliedTransform"));
  objc_msgSend(v5, "ui_encodeCAPoint3D:forKey:", CFSTR("center"), self->_center.x, self->_center.y, self->_center.z);
  v7 = *(_OWORD *)&self->_velocity3D.var0.z;
  v9 = *(_OWORD *)&self->_velocity3D.var0.x;
  v10 = v7;
  objc_msgSend(v5, "_uikit_encodeSPVector3D:forKey:", &v9, CFSTR("velocity"));
  v8 = *(_OWORD *)&self->_targetVelocity3D.var0.z;
  v9 = *(_OWORD *)&self->_targetVelocity3D.var0.x;
  v10 = v8;
  objc_msgSend(v5, "_uikit_encodeSPVector3D:forKey:", &v9, CFSTR("targetVelocity"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_constrainSize, CFSTR("constrainSize"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_flipped, CFSTR("flipped"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_precisionMode, CFSTR("precisionMode"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("rotation"), self->_rotation);
  objc_msgSend(v5, "encodeObject:forKey:", self->_preview, CFSTR("preview"));

}

- (CGVector)velocity
{
  double x;
  double y;
  CGVector result;

  x = self->_velocity3D.var0.x;
  y = self->_velocity3D.var0.y;
  result.dy = y;
  result.dx = x;
  return result;
}

- (void)setVelocity:(CGVector)a3
{
  self->_velocity3D.var0.x = a3.dx;
  *(_OWORD *)&self->_velocity3D.var0.y = *(unint64_t *)&a3.dy;
  self->_velocity3D.var0._padding = 0.0;
}

- (CGVector)targetVelocity
{
  double x;
  double y;
  CGVector result;

  x = self->_targetVelocity3D.var0.x;
  y = self->_targetVelocity3D.var0.y;
  result.dy = y;
  result.dx = x;
  return result;
}

- (void)setTargetVelocity:(CGVector)a3
{
  self->_targetVelocity3D.var0.x = a3.dx;
  *(_OWORD *)&self->_targetVelocity3D.var0.y = *(unint64_t *)&a3.dy;
  self->_targetVelocity3D.var0._padding = 0.0;
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
  self->_center.x = a3.x;
  self->_center.y = a3.y;
  self->_center.z = 0.0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  _DUIPreview *preview;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v10 = *(_OWORD *)&self->_itemIndex;
  preview = self->_preview;
  _NSStringFromCAPoint3D(self->_center.x, self->_center.y, self->_center.z);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(x = %f, y = %f, z = %f)"), *(_QWORD *)&self->_velocity3D.var0.x, *(_QWORD *)&self->_velocity3D.var0.y, *(_QWORD *)&self->_velocity3D.var0.z);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: itemIndex=%lu imageComponent=%@ preview=%@ center=%@ velocity=%@>"), v4, self, v10, preview, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)createSnapshotView
{
  void *v3;
  void *v4;
  void *v5;

  -[_DUIVisibleDroppedItem imageComponent](self, "imageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_DUIVisibleDroppedItem preview](self, "preview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createSnapshotViewForPreview:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
}

- (_DUIImageComponent)imageComponent
{
  return self->_imageComponent;
}

- (void)setImageComponent:(id)a3
{
  objc_storeStrong((id *)&self->_imageComponent, a3);
}

- (_DUIPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (CGAffineTransform)appliedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].d;
  return self;
}

- (void)setAppliedTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_appliedTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_appliedTransform.c = v4;
  *(_OWORD *)&self->_appliedTransform.a = v3;
}

- ($1352053F64C5A5C6DA1735287371E169)velocity3D
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  $1352053F64C5A5C6DA1735287371E169 result;

  v3 = *(_OWORD *)&self->_velocity3D.var0.x;
  v4 = *(_OWORD *)&self->_velocity3D.var0.z;
  *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setVelocity3D:(id)a3
{
  _OWORD *v3;
  __int128 v4;

  v4 = v3[1];
  *(_OWORD *)&self->_velocity3D.var0.x = *v3;
  *(_OWORD *)&self->_velocity3D.var0.z = v4;
}

- ($1352053F64C5A5C6DA1735287371E169)targetVelocity3D
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  $1352053F64C5A5C6DA1735287371E169 result;

  v3 = *(_OWORD *)&self->_targetVelocity3D.var0.x;
  v4 = *(_OWORD *)&self->_targetVelocity3D.var0.z;
  *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setTargetVelocity3D:(id)a3
{
  _OWORD *v3;
  __int128 v4;

  v4 = v3[1];
  *(_OWORD *)&self->_targetVelocity3D.var0.x = *v3;
  *(_OWORD *)&self->_targetVelocity3D.var0.z = v4;
}

- (BOOL)constrainSize
{
  return self->_constrainSize;
}

- (void)setConstrainSize:(BOOL)a3
{
  self->_constrainSize = a3;
}

- (BOOL)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (BOOL)precisionMode
{
  return self->_precisionMode;
}

- (void)setPrecisionMode:(BOOL)a3
{
  self->_precisionMode = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_imageComponent, 0);
}

@end
