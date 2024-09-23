@implementation PCSCurrentIdentity

- (PCSCurrentIdentity)initWithIdentity:(_PCSIdentityData *)a3 currentItemPointerModificationTime:(id)a4
{
  id v6;
  PCSCurrentIdentity *v7;
  PCSCurrentIdentity *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PCSCurrentIdentity;
  v7 = -[PCSCurrentIdentity init](&v10, sel_init);
  if (v7)
  {
    v7->_identity = (_PCSIdentityData *)CFRetain(a3);
    -[PCSCurrentIdentity setCurrentItemPointerModificationTime:](v7, "setCurrentItemPointerModificationTime:", v6);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  _PCSIdentityData *identity;
  objc_super v4;

  identity = self->_identity;
  if (identity)
  {
    self->_identity = 0;
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)PCSCurrentIdentity;
  -[PCSCurrentIdentity dealloc](&v4, sel_dealloc);
}

- (_PCSIdentityData)identity
{
  return self->_identity;
}

- (NSDate)currentItemPointerModificationTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentItemPointerModificationTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItemPointerModificationTime, 0);
}

@end
