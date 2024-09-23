@implementation WFSiriAppProtectionResponse

- (WFSiriAppProtectionResponse)initWithDidUnlock:(BOOL)a3 andError:(id)a4
{
  WFSiriAppProtectionResponse *v5;
  WFSiriAppProtectionResponse *v6;
  WFSiriAppProtectionResponse *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFSiriAppProtectionResponse;
  v5 = -[WFSiriActionResponse initWithError:](&v9, sel_initWithError_, a4);
  v6 = v5;
  if (v5)
  {
    v5->_didUnlock = a3;
    v7 = v5;
  }

  return v6;
}

- (WFSiriAppProtectionResponse)initWithCoder:(id)a3
{
  id v4;
  WFSiriAppProtectionResponse *v5;
  WFSiriAppProtectionResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSiriAppProtectionResponse;
  v5 = -[WFSiriActionResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_didUnlock = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didUnlock"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSiriAppProtectionResponse;
  v4 = a3;
  -[WFSiriActionResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[WFSiriAppProtectionResponse didUnlock](self, "didUnlock", v5.receiver, v5.super_class), CFSTR("didUnlock"));

}

- (BOOL)didUnlock
{
  return self->_didUnlock;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
