@implementation VGHRTFDepthCalibrationData

- (NSData)lensDistortionLut
{
  return self->_lensDistortionLut;
}

- (void)setLensDistortionLut:(id)a3
{
  objc_storeStrong((id *)&self->_lensDistortionLut, a3);
}

- (__n128)intrinsicMatrix
{
  return a1[2];
}

- (__n128)setIntrinsicMatrix:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

- (double)intrinsicMatrixReferenceDimension
{
  return *(double *)(a1 + 16);
}

- (void)setIntrinsicMatrixReferenceDimension:(VGHRTFDepthCalibrationData *)self
{
  uint64_t v2;

  *(_QWORD *)self->_intrinsicMatrixReferenceDimension = v2;
}

- (double)lensDistortionCenter
{
  return *(double *)(a1 + 24);
}

- (void)setLensDistortionCenter:(VGHRTFDepthCalibrationData *)self
{
  uint64_t v2;

  *(_QWORD *)self->_lensDistortionCenter = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lensDistortionLut, 0);
}

@end
