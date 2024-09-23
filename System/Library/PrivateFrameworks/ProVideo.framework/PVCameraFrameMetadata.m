@implementation PVCameraFrameMetadata

+ (id)frameMetadata:(int64_t)a3 :(id)a4 :(double)a5 :(int64_t)a6 :(int64_t)a7
{
  double var3;
  double var2;
  double var1;
  double var0;
  PVCameraFrameMetadata *v15;

  var3 = a4.var3;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v15 = objc_alloc_init(PVCameraFrameMetadata);
  v15->_cameraPosition = a3;
  v15->_orientation.x = var0;
  v15->_orientation.y = var1;
  v15->_orientation.z = var2;
  v15->_orientation.w = var3;
  v15->_rollRadians = a5;
  v15->_interfaceOrientation = a6;
  v15->_captureVideoOrientation = a7;
  return v15;
}

+ (id)frameMetadataWithAngle:(int64_t)a3 :(id)a4 :(double)a5 :(int64_t)a6 :(double)a7
{
  double var3;
  double var2;
  double var1;
  double var0;
  PVCameraFrameMetadata *v15;

  var3 = a4.var3;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v15 = objc_alloc_init(PVCameraFrameMetadata);
  v15->_cameraPosition = a3;
  v15->_orientation.y = var1;
  v15->_orientation.z = var2;
  v15->_orientation.w = var3;
  v15->_rollRadians = a5;
  v15->_interfaceOrientation = a6;
  v15->_captureHorizonAngle = a7;
  v15->_orientation.x = var0;
  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[PVCameraFrameMetadata cameraPosition](self, "cameraPosition");
  -[PVCameraFrameMetadata orientation](self, "orientation");
  v7 = v6;
  -[PVCameraFrameMetadata orientation](self, "orientation");
  v9 = v8;
  -[PVCameraFrameMetadata orientation](self, "orientation");
  v11 = v10;
  -[PVCameraFrameMetadata orientation](self, "orientation");
  v13 = v12;
  -[PVCameraFrameMetadata rollRadians](self, "rollRadians");
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PVCameraFrameMetadata captureVideoOrientation](self, "captureVideoOrientation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> camPos: %ld | orientation: <%f %f %f %f> | rollRad: %f | AVCaptureVideoOrientation: %@ | interfaceOrientation: %ld"), v4, self, v5, v7, v9, v11, v13, v15, v16, -[PVCameraFrameMetadata interfaceOrientation](self, "interfaceOrientation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)orientation
{
  double x;
  double y;
  double z;
  double w;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  x = self->_orientation.x;
  y = self->_orientation.y;
  z = self->_orientation.z;
  w = self->_orientation.w;
  result.var3 = w;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (double)rollRadians
{
  return self->_rollRadians;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (int64_t)captureVideoOrientation
{
  return self->_captureVideoOrientation;
}

- (double)captureHorizonAngle
{
  return self->_captureHorizonAngle;
}

@end
