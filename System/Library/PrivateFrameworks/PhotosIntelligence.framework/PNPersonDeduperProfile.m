@implementation PNPersonDeduperProfile

- (PNPersonDeduperProfile)init
{
  return (PNPersonDeduperProfile *)-[PNPersonDeduperProfile initForDetectionType:](self, "initForDetectionType:", 1);
}

- (id)initForDetectionType:(signed __int16)a3
{
  int v3;
  PNPersonDeduperProfile *v4;
  PNPersonDeduperProfile *v5;
  double v6;
  int32x2_t v7;
  int64x2_t v8;
  int v9;
  uint64_t v10;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PNPersonDeduperProfile;
  v4 = -[PNPersonDeduperProfile init](&v12, sel_init);
  v5 = v4;
  v6 = 0.215;
  v7 = vdup_n_s32(v3 == 1);
  v8.i64[0] = v7.u32[0];
  v8.i64[1] = v7.u32[1];
  *(int8x16_t *)&v4->_strictMaximumDistance = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v8, 0x3FuLL)), (int8x16_t)xmmword_243FA9F70, (int8x16_t)xmmword_243FA9F60);
  if (v3 != 1)
    v6 = 0.125;
  v4->_fuzzyMaximumDistance = v6;
  v4->_shouldRelaxThreshold = 0;
  v9 = _os_feature_enabled_impl();
  v10 = 11;
  if (v9)
    v10 = 15;
  v5->_faceProcessingVersion = v10;
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PNPersonDeduperProfile strictMaximumDistance](self, "strictMaximumDistance");
  objc_msgSend(v4, "setStrictMaximumDistance:");
  -[PNPersonDeduperProfile normalMaximumDistance](self, "normalMaximumDistance");
  objc_msgSend(v4, "setNormalMaximumDistance:");
  -[PNPersonDeduperProfile fuzzyMaximumDistance](self, "fuzzyMaximumDistance");
  objc_msgSend(v4, "setFuzzyMaximumDistance:");
  objc_msgSend(v4, "setShouldRelaxThreshold:", -[PNPersonDeduperProfile shouldRelaxThreshold](self, "shouldRelaxThreshold"));
  objc_msgSend(v4, "setFaceProcessingVersion:", -[PNPersonDeduperProfile faceProcessingVersion](self, "faceProcessingVersion"));
  return v4;
}

- (BOOL)shouldAdjustThresholdOnAgeType
{
  return -[PNPersonDeduperProfile faceProcessingVersion](self, "faceProcessingVersion") < 6;
}

- (double)strictMaximumDistance
{
  return self->_strictMaximumDistance;
}

- (void)setStrictMaximumDistance:(double)a3
{
  self->_strictMaximumDistance = a3;
}

- (double)normalMaximumDistance
{
  return self->_normalMaximumDistance;
}

- (void)setNormalMaximumDistance:(double)a3
{
  self->_normalMaximumDistance = a3;
}

- (double)fuzzyMaximumDistance
{
  return self->_fuzzyMaximumDistance;
}

- (void)setFuzzyMaximumDistance:(double)a3
{
  self->_fuzzyMaximumDistance = a3;
}

- (BOOL)shouldRelaxThreshold
{
  return self->_shouldRelaxThreshold;
}

- (void)setShouldRelaxThreshold:(BOOL)a3
{
  self->_shouldRelaxThreshold = a3;
}

- (unint64_t)faceProcessingVersion
{
  return self->_faceProcessingVersion;
}

- (void)setFaceProcessingVersion:(unint64_t)a3
{
  self->_faceProcessingVersion = a3;
}

@end
