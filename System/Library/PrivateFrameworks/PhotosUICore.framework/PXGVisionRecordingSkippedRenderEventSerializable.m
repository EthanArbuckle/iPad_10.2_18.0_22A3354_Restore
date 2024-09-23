@implementation PXGVisionRecordingSkippedRenderEventSerializable

- (PXGVisionRecordingSkippedRenderEventSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGVisionRecordingSkippedRenderEventSerializable *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGVisionRecordingSkippedRenderEventSerializable;
  v5 = -[PXGVisionRecordingSkippedRenderEventSerializable init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reason = objc_msgSend(v6, "unsignedIntValue");

  }
  return v5;
}

- (id)createSerializableObject
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_reason);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end
