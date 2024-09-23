@implementation PKApplyVerificationPage

- (PKApplyVerificationPage)initWithDictonary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PKApplyVerificationPage *v7;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("verificationType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKApplyVerificationTypeFromString(v5);

  v7 = -[PKApplyVerificationPage initWithDictionary:type:codeLength:fieldOptions:](self, "initWithDictionary:type:codeLength:fieldOptions:", v4, v6, objc_msgSend(v4, "PKIntegerForKey:", CFSTR("verificationCodeLength")), 0);
  return v7;
}

- (PKApplyVerificationPage)initWithDictionary:(id)a3 type:(unint64_t)a4 codeLength:(unint64_t)a5 fieldOptions:(id)a6
{
  id v10;
  id v11;
  PKApplyVerificationPage *v12;
  objc_super v14;

  v10 = a3;
  v11 = a6;
  if (a4)
  {
    if (a4 != 1 || a5)
    {
      v14.receiver = self;
      v14.super_class = (Class)PKApplyVerificationPage;
      v12 = -[PKDynamicProvisioningFieldsPageContent initWithDictionary:fieldOptions:businessChatIdentifier:](&v14, sel_initWithDictionary_fieldOptions_businessChatIdentifier_, v10, v11, 0);
      if (v12)
      {
        v12->_verificationType = a4;
        v12->_verificationCodeLength = a5;
      }
      self = v12;
      a5 = (unint64_t)self;
    }
  }
  else
  {
    a5 = 0;
  }

  return (PKApplyVerificationPage *)a5;
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (unint64_t)verificationCodeLength
{
  return self->_verificationCodeLength;
}

@end
