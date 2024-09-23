@implementation VRXResponse

- (VRXResponse)initWithModel:(id)a3 responseType:(int64_t)a4
{
  id v7;
  VRXResponse *v8;
  VRXResponse *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VRXResponse;
  v8 = -[VRXResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, a3);
    v9->_responseType = a4;
  }

  return v9;
}

- (NSData)model
{
  return self->_model;
}

- (int64_t)responseType
{
  return self->_responseType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
