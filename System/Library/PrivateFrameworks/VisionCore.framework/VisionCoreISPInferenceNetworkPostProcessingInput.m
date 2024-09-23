@implementation VisionCoreISPInferenceNetworkPostProcessingInput

- (VisionCoreISPInferenceNetworkPostProcessingInput)initWithInputImageBuffer:(__CVBuffer *)a3 inputImageOrientation:(unsigned int)a4 inferenceOutputNamedObjects:(id)a5
{
  id v9;
  VisionCoreISPInferenceNetworkPostProcessingInput *v10;
  objc_super v12;

  v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)VisionCoreISPInferenceNetworkPostProcessingInput;
  v10 = -[VisionCoreISPInferenceNetworkPostProcessingInput init](&v12, sel_init);
  if (v10)
  {
    v10->_inputImageBuffer = CVPixelBufferRetain(a3);
    v10->_inputImageOrientation = a4;
    objc_storeStrong((id *)&v10->_inferenceOutputNamedObjects, a5);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_inputImageBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreISPInferenceNetworkPostProcessingInput;
  -[VisionCoreISPInferenceNetworkPostProcessingInput dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)inputImageBuffer
{
  return self->_inputImageBuffer;
}

- (unsigned)inputImageOrientation
{
  return self->_inputImageOrientation;
}

- (VisionCoreNamedObjects)inferenceOutputNamedObjects
{
  return self->_inferenceOutputNamedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferenceOutputNamedObjects, 0);
}

@end
