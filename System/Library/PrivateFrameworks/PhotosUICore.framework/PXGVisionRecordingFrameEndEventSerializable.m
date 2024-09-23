@implementation PXGVisionRecordingFrameEndEventSerializable

- (PXGVisionRecordingFrameEndEventSerializable)initWithSerializableObject:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGVisionRecordingFrameEndEventSerializable;
  return -[PXGVisionRecordingFrameEndEventSerializable init](&v4, sel_init, a3);
}

- (id)createSerializableObject
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
