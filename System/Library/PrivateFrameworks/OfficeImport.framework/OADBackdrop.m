@implementation OADBackdrop

- (OADBackdrop)init
{
  OADBackdrop *v2;
  OADBackdrop *v3;
  OADPoint3D *mAnchor;
  OADVector3D *mNormal;
  OADVector3D *mUp;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADBackdrop;
  v2 = -[OADBackdrop init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    mAnchor = v2->mAnchor;
    v2->mAnchor = 0;

    mNormal = v3->mNormal;
    v3->mNormal = 0;

    mUp = v3->mUp;
    v3->mUp = 0;

  }
  return v3;
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
  v6 = -[OADPoint3D copyWithZone:](self->mAnchor, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[OADVector3D copyWithZone:](self->mNormal, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[OADVector3D copyWithZone:](self->mUp, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (id)anchor
{
  return self->mAnchor;
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->mAnchor, a3);
}

- (id)normal
{
  return self->mNormal;
}

- (void)setNormal:(id)a3
{
  objc_storeStrong((id *)&self->mNormal, a3);
}

- (id)up
{
  return self->mUp;
}

- (void)setUp:(id)a3
{
  objc_storeStrong((id *)&self->mUp, a3);
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[OADPoint3D hash](self->mAnchor, "hash");
  v4 = -[OADVector3D hash](self->mNormal, "hash") ^ v3;
  return v4 ^ -[OADVector3D hash](self->mUp, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  OADPoint3D *mAnchor;
  void *v8;
  OADVector3D *mNormal;
  void *v10;
  OADVector3D *mUp;
  void *v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = v4) != 0)
  {
    v6 = v5;
    mAnchor = self->mAnchor;
    objc_msgSend(v5, "anchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADPoint3D isEqual:](mAnchor, "isEqual:", v8))
    {
      mNormal = self->mNormal;
      objc_msgSend(v6, "normal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[OADVector3D isEqual:](mNormal, "isEqual:", v10))
      {
        mUp = self->mUp;
        objc_msgSend(v6, "up");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[OADVector3D isEqual:](mUp, "isEqual:", v12);

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
  v3.super_class = (Class)OADBackdrop;
  -[OADBackdrop description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mUp, 0);
  objc_storeStrong((id *)&self->mNormal, 0);
  objc_storeStrong((id *)&self->mAnchor, 0);
}

@end
