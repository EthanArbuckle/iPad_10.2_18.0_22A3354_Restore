@implementation SiriHearstLongPressButtonContext

- (SiriHearstLongPressButtonContext)initWithSpeechRequestOptions:(id)a3
{
  id v4;
  SiriHearstLongPressButtonContext *v5;
  SiriHearstLongPressButtonContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriHearstLongPressButtonContext;
  v5 = -[SiriContext initWithSpeechRequestOptions:](&v12, sel_initWithSpeechRequestOptions_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_isTemporaryDevice = 0;
    objc_msgSend(v4, "activationDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
      objc_msgSend(v8, "deviceFromIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "device");
        BTDeviceIsTemporaryPaired();
        v6->_isTemporaryDevice = 0;
      }

    }
  }

  return v6;
}

- (BOOL)isTemporaryDevice
{
  return self->_isTemporaryDevice;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContext speechRequestOptions](self, "speechRequestOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriHearstLongPressButtonContext contextOverride:%@ isTemporaryDevice:%@ speechRequestOptions:%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriHearstLongPressButtonContext)initWithCoder:(id)a3
{
  id v4;
  SiriHearstLongPressButtonContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SiriHearstLongPressButtonContext;
  v5 = -[SiriLongPressButtonContext initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_isTemporaryDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTemporaryDevice"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriHearstLongPressButtonContext;
  v4 = a3;
  -[SiriLongPressButtonContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isTemporaryDevice, CFSTR("isTemporaryDevice"), v5.receiver, v5.super_class);

}

@end
