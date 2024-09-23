@implementation OADCamera

- (OADCamera)init
{
  OADCamera *v2;
  OADCamera *v3;
  OADRotation3D *mRotation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADCamera;
  v2 = -[OADCamera init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    mRotation = v2->mRotation;
    v2->mRotation = 0;

    v3->mCameraType = 0;
    *(_QWORD *)&v3->mFieldOfView = 0x3F80000000000000;
  }
  return v3;
}

- (void)setRotation:(id)a3
{
  objc_storeStrong((id *)&self->mRotation, a3);
}

- (void)setCameraType:(int)a3
{
  self->mCameraType = a3;
}

- (void)setFieldOfView:(float)a3
{
  self->mFieldOfView = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OADRotation3D copyWithZone:](self->mRotation, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 16) = self->mCameraType;
  *(float *)(v5 + 20) = self->mFieldOfView;
  *(float *)(v5 + 24) = self->mZoom;
  return (id)v5;
}

- (id)rotation
{
  return self->mRotation;
}

- (int)cameraType
{
  return self->mCameraType;
}

- (float)fieldOfView
{
  return self->mFieldOfView;
}

- (float)zoom
{
  return self->mZoom;
}

- (void)setZoom:(float)a3
{
  self->mZoom = a3;
}

- (unint64_t)hash
{
  return -[OADRotation3D hash](self->mRotation, "hash") ^ self->mCameraType ^ (unint64_t)self->mFieldOfView ^ (unint64_t)self->mZoom;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  OADRotation3D *mRotation;
  void *v8;
  int mCameraType;
  float mFieldOfView;
  float v11;
  float mZoom;
  float v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = v4) != 0)
  {
    v6 = v5;
    mRotation = self->mRotation;
    objc_msgSend(v5, "rotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADRotation3D isEqual:](mRotation, "isEqual:", v8)
      && (mCameraType = self->mCameraType, mCameraType == objc_msgSend(v6, "cameraType"))
      && (mFieldOfView = self->mFieldOfView, objc_msgSend(v6, "fieldOfView"), mFieldOfView == v11))
    {
      mZoom = self->mZoom;
      objc_msgSend(v6, "zoom");
      v14 = mZoom == v13;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADCamera;
  -[OADCamera description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRotation, 0);
}

@end
