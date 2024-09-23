@implementation PVFaceDetection

+ (id)faceDetection:(int64_t)a3 :(BOOL)a4 :(double)a5 :(BOOL)a6 :(double)a7 :(CGRect)a8 :(int64_t)a9 :(id *)a10 :(id)a11
{
  unsigned int v12;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVMetadataFaceObject *v22;
  PVFaceDetection *v23;
  unint64_t v24;
  PVFaceDetection *v25;
  uint64_t v26;
  __int128 v27;
  AVMetadataFaceObject *faceObject;

  v12 = a9;
  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v22 = (AVMetadataFaceObject *)a11;
  v23 = objc_alloc_init(PVFaceDetection);
  v25 = v23;
  v23->_ID = a3;
  v23->_hasRollAngle = a4;
  v23->_hasYawAngle = a6;
  v23->_rollAngleInDegrees = a5;
  v23->_yawAngleInDegrees = a7;
  v23->_boundingBox.origin.x = x;
  v23->_boundingBox.origin.y = y;
  v23->_boundingBox.size.width = width;
  v23->_boundingBox.size.height = height;
  v26 = (int)v12;
  if (v12 >= 5)
    v26 = 0;
  LODWORD(v24) = PVCardinalAnglesDegrees[qword_1B304FAF8[v26]];
  v23->_detectionHorizonAngle = (double)v24;
  v27 = *(_OWORD *)&a10->var0;
  v23->_time.epoch = a10->var3;
  *(_OWORD *)&v23->_time.value = v27;
  faceObject = v23->_faceObject;
  v23->_faceObject = v22;

  return v25;
}

+ (id)faceDetectionWithAngle:(int64_t)a3 :(BOOL)a4 :(double)a5 :(BOOL)a6 :(double)a7 :(CGRect)a8 :(double)a9 :(id *)a10 :(id)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVMetadataFaceObject *v22;
  PVFaceDetection *v23;
  __int128 v24;
  AVMetadataFaceObject *faceObject;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v22 = (AVMetadataFaceObject *)a11;
  v23 = objc_alloc_init(PVFaceDetection);
  v23->_ID = a3;
  v23->_hasRollAngle = a4;
  v23->_hasYawAngle = a6;
  v23->_rollAngleInDegrees = a5;
  v23->_yawAngleInDegrees = a7;
  v23->_boundingBox.origin.x = x;
  v23->_boundingBox.origin.y = y;
  v23->_boundingBox.size.width = width;
  v23->_boundingBox.size.height = height;
  v23->_detectionHorizonAngle = a9;
  v24 = *(_OWORD *)&a10->var0;
  v23->_time.epoch = a10->var3;
  *(_OWORD *)&v23->_time.value = v24;
  faceObject = v23->_faceObject;
  v23->_faceObject = v22;

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PVFaceDetection isEqualToFaceDetection:](self, "isEqualToFaceDetection:", v4);

  return v5;
}

- (BOOL)isEqualToFaceDetection:(id)a3
{
  id v4;
  int64_t v5;
  int v6;
  double v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  CMTime v31;
  CMTime time1;
  CGRect v33;
  CGRect v34;

  v4 = a3;
  v5 = -[PVFaceDetection ID](self, "ID");
  if (v5 != objc_msgSend(v4, "ID"))
    goto LABEL_12;
  v6 = -[PVFaceDetection hasRollAngle](self, "hasRollAngle");
  if (v6 != objc_msgSend(v4, "hasRollAngle"))
    goto LABEL_12;
  if (-[PVFaceDetection hasRollAngle](self, "hasRollAngle"))
  {
    -[PVFaceDetection rollAngleInDegrees](self, "rollAngleInDegrees");
    v8 = v7;
    objc_msgSend(v4, "rollAngleInDegrees");
    if (v8 != v9)
      goto LABEL_12;
  }
  v10 = -[PVFaceDetection hasYawAngle](self, "hasYawAngle");
  if (v10 != objc_msgSend(v4, "hasYawAngle"))
    goto LABEL_12;
  if (-[PVFaceDetection hasYawAngle](self, "hasYawAngle"))
  {
    -[PVFaceDetection yawAngleInDegrees](self, "yawAngleInDegrees");
    v12 = v11;
    objc_msgSend(v4, "yawAngleInDegrees");
    if (v12 != v13)
      goto LABEL_12;
  }
  -[PVFaceDetection boundingBox](self, "boundingBox");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v4, "boundingBox");
  v34.origin.x = v22;
  v34.origin.y = v23;
  v34.size.width = v24;
  v34.size.height = v25;
  v33.origin.x = v15;
  v33.origin.y = v17;
  v33.size.width = v19;
  v33.size.height = v21;
  if (!CGRectEqualToRect(v33, v34))
    goto LABEL_12;
  -[PVFaceDetection detectionHorizonAngle](self, "detectionHorizonAngle");
  v27 = v26;
  objc_msgSend(v4, "detectionHorizonAngle");
  if (v27 == v28)
  {
    -[PVFaceDetection time](self, "time");
    if (v4)
      objc_msgSend(v4, "time");
    else
      memset(&v31, 0, sizeof(v31));
    v29 = CMTimeCompare(&time1, &v31) == 0;
  }
  else
  {
LABEL_12:
    v29 = 0;
  }

  return v29;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> ID=%llu rollAngle=%.1f bbox={{%.2f,%.2f},{%.2f,%.2f}}"), objc_opt_class(), self, self->_ID, *(_QWORD *)&self->_rollAngleInDegrees, *(_QWORD *)&self->_boundingBox.origin.x, *(_QWORD *)&self->_boundingBox.origin.y, *(_QWORD *)&self->_boundingBox.size.width, *(_QWORD *)&self->_boundingBox.size.height);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t ID;
  double rollAngleInDegrees;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double detectionHorizonAngle;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  ID = self->_ID;
  rollAngleInDegrees = self->_rollAngleInDegrees;
  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  detectionHorizonAngle = self->_detectionHorizonAngle;
  time = (CMTime)self->_time;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> ID=%llu rollAngle=%.1f° bbox={{%.2f,%.2f},{%.2f,%.2f}} orientation=%.1f° time=%f"), v4, self, ID, *(_QWORD *)&rollAngleInDegrees, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&detectionHorizonAngle, CMTimeGetSeconds(&time));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)ID
{
  return self->_ID;
}

- (BOOL)hasRollAngle
{
  return self->_hasRollAngle;
}

- (double)rollAngleInDegrees
{
  return self->_rollAngleInDegrees;
}

- (BOOL)hasYawAngle
{
  return self->_hasYawAngle;
}

- (double)yawAngleInDegrees
{
  return self->_yawAngleInDegrees;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)detectionOrientation
{
  return self->_detectionOrientation;
}

- (double)detectionHorizonAngle
{
  return self->_detectionHorizonAngle;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (AVMetadataFaceObject)faceObject
{
  return self->_faceObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceObject, 0);
}

@end
