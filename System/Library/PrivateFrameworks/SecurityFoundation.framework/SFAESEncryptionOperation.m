@implementation SFAESEncryptionOperation

- (SFAESEncryptionOperation)initWithKeySpecifier:(id)a3 mode:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFAESEncryptionOperation;
  return -[SFSymmetricEncryptionOperation initWithKeySpecifier:mode:](&v5, sel_initWithKeySpecifier_mode_, a3, a4);
}

- (SFAESEncryptionOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAESEncryptionOperation;
  return -[SFSymmetricEncryptionOperation initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_aesEncryptionOperationInternal, 0);
}

@end
