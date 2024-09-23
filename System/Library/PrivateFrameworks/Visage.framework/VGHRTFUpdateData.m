@implementation VGHRTFUpdateData

- (id)initEmpty
{
  VGHRTFUpdateData *v2;
  VGHRTFUpdateData *v3;
  VGHRTFUpdateData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VGHRTFUpdateData;
  v2 = -[VGHRTFUpdateData init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (unint64_t)step
{
  return self->_step;
}

- (void)setStep:(unint64_t)a3
{
  self->_step = a3;
}

- (VGHRTFCaptureUpdateData)captureUpdateData
{
  return self->_captureUpdateData;
}

- (void)setCaptureUpdateData:(id)a3
{
  objc_storeStrong((id *)&self->_captureUpdateData, a3);
}

- (VGHRTFPostProcessUpdateData)postProcessUpdateData
{
  return self->_postProcessUpdateData;
}

- (void)setPostProcessUpdateData:(id)a3
{
  objc_storeStrong((id *)&self->_postProcessUpdateData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessUpdateData, 0);
  objc_storeStrong((id *)&self->_captureUpdateData, 0);
}

@end
