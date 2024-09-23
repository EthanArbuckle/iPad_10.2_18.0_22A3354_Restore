@implementation PXGViewRecordingViewSerializable

- (PXGViewRecordingViewSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGViewRecordingViewSerializable *v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  NSString *payloadViewClass;
  void *v12;
  id v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXGViewRecordingViewSerializable;
  v5 = -[PXGViewRecordingViewSerializable init](&v15, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spriteIndex"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntValue");

    v5->_spriteIndex = v8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("presentationType"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v9, "unsignedIntValue");

    v5->_presentationType = v8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("payloadViewClass"));
    v10 = objc_claimAutoreleasedReturnValue();
    payloadViewClass = v5->_payloadViewClass;
    v5->_payloadViewClass = (NSString *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("needsParenting"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    LOBYTE(v12) = objc_msgSend(v13, "BOOLValue");

    v5->_needsParenting = (char)v12;
  }

  return v5;
}

- (id)createSerializableObject
{
  unsigned int v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("spriteIndex");
  v3 = -[PXGViewRecordingViewSerializable spriteIndex](self, "spriteIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("presentationType");
  v5 = -[PXGViewRecordingViewSerializable presentationType](self, "presentationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("payloadViewClass");
  -[PXGViewRecordingViewSerializable payloadViewClass](self, "payloadViewClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("needsParenting");
  v8 = -[PXGViewRecordingViewSerializable needsParenting](self, "needsParenting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unsigned)spriteIndex
{
  return self->_spriteIndex;
}

- (void)setSpriteIndex:(unsigned int)a3
{
  self->_spriteIndex = a3;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(unsigned __int8)a3
{
  self->_presentationType = a3;
}

- (NSString)payloadViewClass
{
  return self->_payloadViewClass;
}

- (void)setPayloadViewClass:(id)a3
{
  objc_storeStrong((id *)&self->_payloadViewClass, a3);
}

- (BOOL)needsParenting
{
  return self->_needsParenting;
}

- (void)setNeedsParenting:(BOOL)a3
{
  self->_needsParenting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadViewClass, 0);
}

@end
