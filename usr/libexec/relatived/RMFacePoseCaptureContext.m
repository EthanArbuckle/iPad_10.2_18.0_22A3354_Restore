@implementation RMFacePoseCaptureContext

- (unint64_t)cameraID
{
  return self->_cameraID;
}

- (void)setCameraID:(unint64_t)a3
{
  self->_cameraID = a3;
}

- (BOOL)isBuiltInCamera
{
  return self->_builtInCamera;
}

- (void)setBuiltInCamera:(BOOL)a3
{
  self->_builtInCamera = a3;
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
  objc_storeStrong((id *)&self->_captureSession, a3);
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(id)a3
{
  objc_storeStrong((id *)&self->_captureDevice, a3);
}

- (AVCaptureDeviceInput)captureDeviceInput
{
  return self->_captureDeviceInput;
}

- (void)setCaptureDeviceInput:(id)a3
{
  objc_storeStrong((id *)&self->_captureDeviceInput, a3);
}

- (AVCaptureVideoDataOutput)videoDataOutput
{
  return self->_videoDataOutput;
}

- (void)setVideoDataOutput:(id)a3
{
  objc_storeStrong((id *)&self->_videoDataOutput, a3);
}

- (AVCaptureMetadataOutput)metadataOutput
{
  return self->_metadataOutput;
}

- (void)setMetadataOutput:(id)a3
{
  objc_storeStrong((id *)&self->_metadataOutput, a3);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  self->_mediaType = (NSString *)a3;
}

- (CVAFaceTracking)faceKit
{
  return self->_faceKit;
}

- (void)setFaceKit:(CVAFaceTracking *)a3
{
  self->_faceKit = a3;
}

- (BOOL)supportsFaceKitMetadata
{
  return self->_supportsFaceKitMetadata;
}

- (void)setSupportsFaceKitMetadata:(BOOL)a3
{
  self->_supportsFaceKitMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_captureDeviceInput, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end
