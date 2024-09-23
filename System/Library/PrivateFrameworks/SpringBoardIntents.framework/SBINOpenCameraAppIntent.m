@implementation SBINOpenCameraAppIntent

- (SBINOpenCameraAppIntent)initWithCaptureDevice:(unint64_t)a3 captureMode:(unint64_t)a4 systemContext:(id)a5
{
  SBINOpenCameraAppIntent *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBINOpenCameraAppIntent;
  result = -[SBINAppIntent initWithIdentifier:systemContext:](&v8, sel_initWithIdentifier_systemContext_, CFSTR("OpenCamera"), a5);
  if (result)
  {
    result->_captureDevice = a3;
    result->_captureMode = a4;
  }
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBINOpenCameraAppIntent *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__SBINOpenCameraAppIntent_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_25190EC20;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

void __56__SBINOpenCameraAppIntent_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)SBINOpenCameraAppIntent;
  objc_msgSendSuper2(&v7, sel_appendDescriptionToFormatter_, v2);
  v3 = *(void **)(a1 + 32);
  NSStringFromSBINCameraCaptureDevice(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("captureDevice"));

  v5 = *(void **)(a1 + 32);
  NSStringFromSBINCameraCaptureMode(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("captureMode"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBINOpenCameraAppIntent;
  v7 = -[SBINAppIntent isEqual:](&v9, sel_isEqual_, v4)
    && (objc_opt_self(),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0)
    && self->_captureDevice == v4[3]
    && self->_captureMode == v4[4];

  return v7;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBINOpenCameraAppIntent;
  return self->_captureDevice ^ -[SBINAppIntent hash](&v3, sel_hash) ^ self->_captureMode;
}

- (unint64_t)captureDevice
{
  return self->_captureDevice;
}

- (unint64_t)captureMode
{
  return self->_captureMode;
}

@end
