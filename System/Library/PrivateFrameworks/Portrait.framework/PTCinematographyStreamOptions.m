@implementation PTCinematographyStreamOptions

- (PTCinematographyStreamOptions)init
{
  PTCinematographyStreamOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PTCinematographyStreamOptions;
  result = -[PTCinematographyStreamOptions init](&v3, sel_init);
  if (result)
  {
    result->_snapshotPolicy = 0;
    result->_overrideFrameSnapshotPolicy = 0;
  }
  return result;
}

- (PTCinematographyStreamOptions)initWithOptions:(id)a3
{
  id v4;
  PTCinematographyStreamOptions *v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  uint64_t v9;
  NSDictionary *cinematographyParameters;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PTCinematographyStreamOptions;
  v5 = -[PTCinematographyStreamOptions init](&v12, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "version");
    objc_msgSend(v4, "fixedFocusNormalizedRectSize");
    v5->_fixedFocusNormalizedRectSize.width = v6;
    v5->_fixedFocusNormalizedRectSize.height = v7;
    objc_msgSend(v4, "cinematographyParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    cinematographyParameters = v5->_cinematographyParameters;
    v5->_cinematographyParameters = (NSDictionary *)v9;

    v5->_snapshotPolicy = objc_msgSend(v4, "_snapshotPolicy");
    v5->_overrideFrameSnapshotPolicy = objc_msgSend(v4, "_overrideFrameSnapshotPolicy");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PTCinematographyStreamOptions initWithOptions:]([PTCinematographyStreamOptions alloc], "initWithOptions:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PTCinematographyStreamOptions initWithOptions:]([PTCinematographyStreamOptions alloc], "initWithOptions:", self);
}

- (unint64_t)_snapshotPolicy
{
  return self->_snapshotPolicy;
}

- (void)_setSnapshotPolicy:(unint64_t)a3
{
  self->_snapshotPolicy = a3;
}

- (BOOL)_overrideFrameSnapshotPolicy
{
  return self->_overrideFrameSnapshotPolicy;
}

- (void)_setOverrideFrameSnapshotPolicy:(BOOL)a3
{
  self->_overrideFrameSnapshotPolicy = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (CGSize)fixedFocusNormalizedRectSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_fixedFocusNormalizedRectSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFixedFocusNormalizedRectSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_fixedFocusNormalizedRectSize, &v3, 16, 1, 0);
}

- (NSDictionary)cinematographyParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCinematographyParameters:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cinematographyParameters, 0);
}

@end
