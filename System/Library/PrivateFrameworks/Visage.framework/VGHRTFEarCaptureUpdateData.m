@implementation VGHRTFEarCaptureUpdateData

- (id)initEmpty
{
  VGHRTFEarCaptureUpdateData *v2;
  VGHRTFEarCaptureUpdateData *v3;
  VGHRTFEarCaptureUpdateData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VGHRTFEarCaptureUpdateData;
  v2 = -[VGHRTFEarCaptureUpdateData init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (unint64_t)progressType
{
  return self->_progressType;
}

- (void)setProgressType:(unint64_t)a3
{
  self->_progressType = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (NSDictionary)leftEarStatusList
{
  return self->_leftEarStatusList;
}

- (void)setLeftEarStatusList:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarStatusList, a3);
}

- (NSDictionary)rightEarStatusList
{
  return self->_rightEarStatusList;
}

- (void)setRightEarStatusList:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarStatusList, a3);
}

- (VGHRTFEarCaptureProcessedData)trackedData
{
  return self->_trackedData;
}

- (void)setTrackedData:(id)a3
{
  objc_storeStrong((id *)&self->_trackedData, a3);
}

- (VGHRTFEarsFrameData)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_trackedData, 0);
  objc_storeStrong((id *)&self->_rightEarStatusList, 0);
  objc_storeStrong((id *)&self->_leftEarStatusList, 0);
}

@end
