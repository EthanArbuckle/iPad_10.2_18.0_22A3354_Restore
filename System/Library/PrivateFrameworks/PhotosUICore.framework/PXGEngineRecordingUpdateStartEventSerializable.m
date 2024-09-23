@implementation PXGEngineRecordingUpdateStartEventSerializable

- (PXGEngineRecordingUpdateStartEventSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGEngineRecordingUpdateStartEventSerializable *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXGEngineRecordingUpdateStartEventSerializable;
  v5 = -[PXGEngineRecordingUpdateStartEventSerializable init](&v16, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("targetTimestamp"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    v5->_targetTimestamp = v9;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("needsUpdate"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntValue");

    v5->_needsUpdate = v11;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pendingUpdateEntities"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    v14 = objc_msgSend(v13, "unsignedIntValue");

    v5->_pendingUpdateEntities = v14;
  }

  return v5;
}

- (id)createSerializableObject
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("targetTimestamp");
  -[PXGEngineRecordingUpdateStartEventSerializable targetTimestamp](self, "targetTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("needsUpdate");
  v4 = -[PXGEngineRecordingUpdateStartEventSerializable needsUpdate](self, "needsUpdate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("pendingUpdateEntities");
  v6 = -[PXGEngineRecordingUpdateStartEventSerializable pendingUpdateEntities](self, "pendingUpdateEntities");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)targetTimestamp
{
  return self->_targetTimestamp;
}

- (void)setTargetTimestamp:(double)a3
{
  self->_targetTimestamp = a3;
}

- (unint64_t)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(unint64_t)a3
{
  self->_needsUpdate = a3;
}

- (unint64_t)pendingUpdateEntities
{
  return self->_pendingUpdateEntities;
}

- (void)setPendingUpdateEntities:(unint64_t)a3
{
  self->_pendingUpdateEntities = a3;
}

@end
