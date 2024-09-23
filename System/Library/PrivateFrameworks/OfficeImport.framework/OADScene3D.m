@implementation OADScene3D

+ (id)nullScene3D
{
  void *v2;
  OADScene3D *v3;
  void *v4;

  v2 = (void *)+[OADScene3D nullScene3D]::theNullScene3D;
  if (!+[OADScene3D nullScene3D]::theNullScene3D)
  {
    v3 = objc_alloc_init(OADScene3D);
    v4 = (void *)+[OADScene3D nullScene3D]::theNullScene3D;
    +[OADScene3D nullScene3D]::theNullScene3D = (uint64_t)v3;

    v2 = (void *)+[OADScene3D nullScene3D]::theNullScene3D;
  }
  return v2;
}

- (OADScene3D)init
{
  OADScene3D *v2;
  OADScene3D *v3;
  OADCamera *mCamera;
  OADLightRig *mLightRig;
  OADBackdrop *mBackdrop;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADScene3D;
  v2 = -[OADScene3D init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    mCamera = v2->mCamera;
    v2->mCamera = 0;

    mLightRig = v3->mLightRig;
    v3->mLightRig = 0;

    mBackdrop = v3->mBackdrop;
    v3->mBackdrop = 0;

  }
  return v3;
}

- (void)setCamera:(id)a3
{
  objc_storeStrong((id *)&self->mCamera, a3);
}

- (void)setLightRig:(id)a3
{
  objc_storeStrong((id *)&self->mLightRig, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OADCamera copyWithZone:](self->mCamera, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[OADLightRig copyWithZone:](self->mLightRig, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[OADBackdrop copyWithZone:](self->mBackdrop, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (id)camera
{
  return self->mCamera;
}

- (id)lightRig
{
  return self->mLightRig;
}

- (id)backdrop
{
  return self->mBackdrop;
}

- (void)setBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->mBackdrop, a3);
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[OADCamera hash](self->mCamera, "hash");
  v4 = -[OADLightRig hash](self->mLightRig, "hash") ^ v3;
  return v4 ^ -[OADBackdrop hash](self->mBackdrop, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  OADCamera *mCamera;
  void *v8;
  OADLightRig *mLightRig;
  void *v10;
  OADBackdrop *mBackdrop;
  void *v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = v4) != 0)
  {
    v6 = v5;
    mCamera = self->mCamera;
    objc_msgSend(v5, "camera");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADCamera isEqual:](mCamera, "isEqual:", v8))
    {
      mLightRig = self->mLightRig;
      objc_msgSend(v6, "lightRig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[OADLightRig isEqual:](mLightRig, "isEqual:", v10))
      {
        mBackdrop = self->mBackdrop;
        objc_msgSend(v6, "backdrop");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[OADBackdrop isEqual:](mBackdrop, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADScene3D;
  -[OADScene3D description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBackdrop, 0);
  objc_storeStrong((id *)&self->mLightRig, 0);
  objc_storeStrong((id *)&self->mCamera, 0);
}

@end
