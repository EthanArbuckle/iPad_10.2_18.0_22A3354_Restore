@implementation SASRequestOptionsNullableAccess

- (SASRequestOptionsNullableAccess)initWithActivationDeviceIdentifier:(id)a3 requestInfo:(id)a4
{
  id v7;
  id v8;
  SASRequestOptionsNullableAccess *v9;
  SASRequestOptionsNullableAccess *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SASRequestOptionsNullableAccess;
  v9 = -[SASRequestOptionsNullableAccess init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activationDeviceIdentifier, a3);
    objc_storeStrong((id *)&v10->_requestInfo, a4);
  }

  return v10;
}

- (NSString)activationDeviceIdentifier
{
  return self->_activationDeviceIdentifier;
}

- (AFRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_activationDeviceIdentifier, 0);
}

@end
