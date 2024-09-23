@implementation OADShape3D

+ (id)nullShape3D
{
  void *v2;
  OADShape3D *v3;
  void *v4;

  v2 = (void *)+[OADShape3D nullShape3D]::theNullShape3D;
  if (!+[OADShape3D nullShape3D]::theNullShape3D)
  {
    v3 = objc_alloc_init(OADShape3D);
    v4 = (void *)+[OADShape3D nullShape3D]::theNullShape3D;
    +[OADShape3D nullShape3D]::theNullShape3D = (uint64_t)v3;

    objc_msgSend((id)+[OADShape3D nullShape3D]::theNullShape3D, "setMaterial:", 0);
    v2 = (void *)+[OADShape3D nullShape3D]::theNullShape3D;
  }
  return v2;
}

- (OADShape3D)init
{
  OADShape3D *v2;
  OADShape3D *v3;
  OADBevel *mTopBevel;
  OADBevel *mBottomBevel;
  OADColor *mExtrusionColor;
  OADColor *mContourColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OADShape3D;
  v2 = -[OADShape3D init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    mTopBevel = v2->mTopBevel;
    v2->mTopBevel = 0;

    mBottomBevel = v3->mBottomBevel;
    v3->mBottomBevel = 0;

    mExtrusionColor = v3->mExtrusionColor;
    v3->mExtrusionColor = 0;

    v3->mExtrusionHeight = 0.0;
    mContourColor = v3->mContourColor;
    v3->mContourColor = 0;

    *(_QWORD *)&v3->mContourWidth = 0;
    v3->mMaterial = 8;
  }
  return v3;
}

- (void)setMaterial:(int)a3
{
  self->mMaterial = a3;
}

- (void)setTopBevel:(id)a3
{
  objc_storeStrong((id *)&self->mTopBevel, a3);
}

- (void)setContourColor:(id)a3
{
  objc_storeStrong((id *)&self->mContourColor, a3);
}

- (void)setContourWidth:(float)a3
{
  self->mContourWidth = a3;
}

- (void)setBottomBevel:(id)a3
{
  objc_storeStrong((id *)&self->mBottomBevel, a3);
}

- (void)setExtrusionHeight:(float)a3
{
  self->mExtrusionHeight = a3;
}

- (void)setShapeDepth:(float)a3
{
  self->mShapeDepth = a3;
}

- (void)setExtrusionColor:(id)a3
{
  objc_storeStrong((id *)&self->mExtrusionColor, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OADBevel copyWithZone:](self->mTopBevel, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[OADBevel copyWithZone:](self->mBottomBevel, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[OADColor copyWithZone:](self->mExtrusionColor, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  *(float *)(v5 + 32) = self->mExtrusionHeight;
  v12 = -[OADColor copyWithZone:](self->mContourColor, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  *(float *)(v5 + 48) = self->mContourWidth;
  *(float *)(v5 + 52) = self->mShapeDepth;
  *(_DWORD *)(v5 + 56) = self->mMaterial;
  return (id)v5;
}

- (id)topBevel
{
  return self->mTopBevel;
}

- (id)bottomBevel
{
  return self->mBottomBevel;
}

- (id)extrusionColor
{
  return self->mExtrusionColor;
}

- (float)extrusionHeight
{
  return self->mExtrusionHeight;
}

- (id)contourColor
{
  return self->mContourColor;
}

- (float)contourWidth
{
  return self->mContourWidth;
}

- (float)shapeDepth
{
  return self->mShapeDepth;
}

- (int)material
{
  return self->mMaterial;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[OADBevel hash](self->mTopBevel, "hash");
  v4 = -[OADBevel hash](self->mBottomBevel, "hash");
  v5 = -[OADColor hash](self->mExtrusionColor, "hash");
  return v4 ^ v3 ^ v5 ^ -[OADColor hash](self->mContourColor, "hash") ^ (unint64_t)self->mExtrusionHeight ^ (unint64_t)self->mContourWidth ^ (unint64_t)self->mShapeDepth ^ self->mMaterial;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  OADBevel *mTopBevel;
  void *v8;
  OADBevel *mBottomBevel;
  void *v10;
  OADColor *mExtrusionColor;
  void *v12;
  OADColor *mContourColor;
  void *v14;
  float mExtrusionHeight;
  float v16;
  float mContourWidth;
  float v18;
  float mShapeDepth;
  float v20;
  int mMaterial;
  BOOL v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = v4) != 0)
  {
    v6 = v5;
    mTopBevel = self->mTopBevel;
    objc_msgSend(v5, "topBevel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADBevel isEqual:](mTopBevel, "isEqual:", v8))
    {
      mBottomBevel = self->mBottomBevel;
      objc_msgSend(v6, "bottomBevel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[OADBevel isEqual:](mBottomBevel, "isEqual:", v10))
      {
        mExtrusionColor = self->mExtrusionColor;
        objc_msgSend(v6, "extrusionColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[OADColor isEqual:](mExtrusionColor, "isEqual:", v12))
        {
          mContourColor = self->mContourColor;
          objc_msgSend(v6, "contourColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[OADColor isEqual:](mContourColor, "isEqual:", v14)
            && (mExtrusionHeight = self->mExtrusionHeight, objc_msgSend(v6, "extrusionHeight"), mExtrusionHeight == v16)
            && (mContourWidth = self->mContourWidth, objc_msgSend(v6, "contourWidth"), mContourWidth == v18)
            && (mShapeDepth = self->mShapeDepth, objc_msgSend(v6, "shapeDepth"), mShapeDepth == v20))
          {
            mMaterial = self->mMaterial;
            v22 = mMaterial == objc_msgSend(v6, "material");
          }
          else
          {
            v22 = 0;
          }

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADShape3D;
  -[OADShape3D description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContourColor, 0);
  objc_storeStrong((id *)&self->mExtrusionColor, 0);
  objc_storeStrong((id *)&self->mBottomBevel, 0);
  objc_storeStrong((id *)&self->mTopBevel, 0);
}

@end
