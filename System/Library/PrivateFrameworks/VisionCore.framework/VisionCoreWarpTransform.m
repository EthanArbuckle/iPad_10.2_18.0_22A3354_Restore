@implementation VisionCoreWarpTransform

- (VisionCoreWarpTransform)initWithWarpTransform:(__n128)a3 affineTransform:(__n128)a4 UUID:(float)a5 reprojectionError:(uint64_t)a6
{
  id v11;
  VisionCoreWarpTransform *v12;
  uint64_t v13;
  NSUUID *UUID;
  __int128 v15;
  __int128 v16;
  objc_super v21;

  v11 = a8;
  v21.receiver = a1;
  v21.super_class = (Class)VisionCoreWarpTransform;
  v12 = -[VisionCoreWarpTransform init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    *(__n128 *)v12->_anon_20 = a2;
    *(__n128 *)&v12->_anon_20[16] = a3;
    *(__n128 *)&v12->_anon_20[32] = a4;
    v15 = *a7;
    v16 = a7[2];
    *(_OWORD *)&v12->_affineTransform.c = a7[1];
    *(_OWORD *)&v12->_affineTransform.tx = v16;
    *(_OWORD *)&v12->_affineTransform.a = v15;
    v12->_reprojectionError = a5;
    v12->_groupID = 0;
  }

  return v12;
}

- (VisionCoreWarpTransform)initWithWarpTransform:(__n128)a3 affineTransform:(__n128)a4 UUID:(uint64_t)a5 reprojectionError:(__int128 *)a6 groupID:(void *)a7
{
  id v11;
  VisionCoreWarpTransform *v12;
  uint64_t v13;
  NSUUID *UUID;
  __int128 v15;
  __int128 v16;
  objc_super v21;

  v11 = a7;
  v21.receiver = a1;
  v21.super_class = (Class)VisionCoreWarpTransform;
  v12 = -[VisionCoreWarpTransform init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    *(__n128 *)v12->_anon_20 = a2;
    *(__n128 *)&v12->_anon_20[16] = a3;
    *(__n128 *)&v12->_anon_20[32] = a4;
    v15 = *a6;
    v16 = a6[2];
    *(_OWORD *)&v12->_affineTransform.c = a6[1];
    *(_OWORD *)&v12->_affineTransform.tx = v16;
    *(_OWORD *)&v12->_affineTransform.a = v15;
    v12->_reprojectionError = 0.0;
    v12->_groupID = a8;
  }

  return v12;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (__n128)warpTransform
{
  return a1[2];
}

- (CGAffineTransform)affineTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (float)reprojectionError
{
  return self->_reprojectionError;
}

- (int)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
