@implementation _PFCameraMetadataAVMetadataObject

- (_PFCameraMetadataAVMetadataObject)initWithType:(id)a3 bounds:(CGRect)a4 confidence:(int)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  _PFCameraMetadataAVMetadataObject *v13;
  _PFCameraMetadataAVMetadataObject *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_PFCameraMetadataAVMetadataObject;
  v13 = -[_PFCameraMetadataAVMetadataObject init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_bounds.origin.x = x;
    v13->_bounds.origin.y = y;
    v13->_bounds.size.width = width;
    v13->_bounds.size.height = height;
    objc_storeStrong((id *)&v13->_type, a3);
    v14->_confidence = a5;
  }

  return v14;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)objectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 type:(id)a4
{
  CGSize v5;
  uint64_t v6;
  id v7;
  id v8;
  const __CFDictionary *v9;
  void *v10;
  uint64_t v11;
  _PFCameraMetadataAVMetadataObject *v12;
  _PFCameraMetadataAVMetadataObject *v13;
  CGRect v15;

  v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v15.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v15.size = v5;
  v6 = *MEMORY[0x1E0D05088];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGRectMakeWithDictionaryRepresentation(v9, &v15);

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D05020]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "intValue");
  v12 = [_PFCameraMetadataAVMetadataObject alloc];
  v13 = -[_PFCameraMetadataAVMetadataObject initWithType:bounds:confidence:](v12, "initWithType:bounds:confidence:", v7, v11, *(_OWORD *)&v15.origin, *(_OWORD *)&v15.size);

  return v13;
}

+ (id)humanFaceObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "objectWithFigEmbeddedCaptureDeviceObjectDictionary:type:", a3, *MEMORY[0x1E0C8AA38]);
}

+ (id)humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "objectWithFigEmbeddedCaptureDeviceObjectDictionary:type:", a3, *MEMORY[0x1E0C8AA40]);
}

+ (id)catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "objectWithFigEmbeddedCaptureDeviceObjectDictionary:type:", a3, *MEMORY[0x1E0C8AA10]);
}

+ (id)dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "objectWithFigEmbeddedCaptureDeviceObjectDictionary:type:", a3, *MEMORY[0x1E0C8AA20]);
}

+ (id)salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "objectWithFigEmbeddedCaptureDeviceObjectDictionary:type:", a3, *MEMORY[0x1E0C8AA58]);
}

@end
