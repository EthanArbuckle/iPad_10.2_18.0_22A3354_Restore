@implementation SBVoiceControlPresentationSource

+ (id)sourceFromBluetoothDevice:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)a1), "_initWithSourceType:", 1);
  v7 = (void *)v6;
  if (v6)
    objc_storeStrong((id *)(v6 + 8), a3);

  return v7;
}

+ (id)sourceFromHeadsetButton
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithSourceType:", 2);
}

+ (id)sourceFromHomeButton
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithSourceType:", 0);
}

- (id)_initWithSourceType:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBVoiceControlPresentationSource;
  result = -[SBVoiceControlPresentationSource init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 2) = a3;
  return result;
}

- (BluetoothDevice)bluetoothDevice
{
  void *v5;
  void *v6;

  if (-[SBVoiceControlPresentationSource sourceType](self, "sourceType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVoiceControlPresentationSource.m"), 41, CFSTR("%@ can only be called when the source type is Bluetooth"), v6);

  }
  return self->_bluetoothDevice;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
}

@end
