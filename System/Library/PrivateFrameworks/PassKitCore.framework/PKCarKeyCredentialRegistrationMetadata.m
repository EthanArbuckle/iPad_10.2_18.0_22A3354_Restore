@implementation PKCarKeyCredentialRegistrationMetadata

- (PKCarKeyCredentialRegistrationMetadata)initWithMake:(id)a3 model:(id)a4 keyType:(int64_t)a5
{
  id v9;
  id v10;
  PKCarKeyCredentialRegistrationMetadata *v11;
  PKCarKeyCredentialRegistrationMetadata *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKCarKeyCredentialRegistrationMetadata;
  v11 = -[PKCredentialRegistrationMetadata initWithProductType:](&v14, sel_initWithProductType_, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_make, a3);
    objc_storeStrong((id *)&v12->_model, a4);
    v12->_keyType = a5;
  }

  return v12;
}

- (NSString)make
{
  return self->_make;
}

- (NSString)model
{
  return self->_model;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
}

@end
