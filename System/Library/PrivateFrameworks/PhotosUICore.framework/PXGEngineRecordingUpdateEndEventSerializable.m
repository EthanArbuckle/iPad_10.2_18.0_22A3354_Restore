@implementation PXGEngineRecordingUpdateEndEventSerializable

- (PXGEngineRecordingUpdateEndEventSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGEngineRecordingUpdateEndEventSerializable *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGEngineRecordingUpdateEndEventSerializable;
  v5 = -[PXGEngineRecordingUpdateEndEventSerializable init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_updated = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (id)createSerializableObject
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("updated");
  v2 = -[PXGEngineRecordingUpdateEndEventSerializable updated](self, "updated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)updated
{
  return self->_updated;
}

- (void)setUpdated:(BOOL)a3
{
  self->_updated = a3;
}

@end
