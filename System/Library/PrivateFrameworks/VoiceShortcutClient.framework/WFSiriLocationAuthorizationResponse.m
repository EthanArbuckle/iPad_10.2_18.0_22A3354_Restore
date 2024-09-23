@implementation WFSiriLocationAuthorizationResponse

- (WFSiriLocationAuthorizationResponse)initWithError:(id)a3
{
  WFSiriLocationAuthorizationResponse *v3;
  WFSiriLocationAuthorizationResponse *v4;
  WFSiriLocationAuthorizationResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSiriLocationAuthorizationResponse;
  v3 = -[WFSiriActionResponse initWithError:](&v7, sel_initWithError_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_didAuthorize = 0;
    v5 = v3;
  }

  return v4;
}

- (WFSiriLocationAuthorizationResponse)initWithDidAuthorize:(BOOL)a3
{
  WFSiriLocationAuthorizationResponse *v4;
  WFSiriLocationAuthorizationResponse *v5;
  WFSiriLocationAuthorizationResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSiriLocationAuthorizationResponse;
  v4 = -[WFSiriActionResponse initWithError:](&v8, sel_initWithError_, 0);
  v5 = v4;
  if (v4)
  {
    v4->_didAuthorize = a3;
    v6 = v4;
  }

  return v5;
}

- (WFSiriLocationAuthorizationResponse)initWithCoder:(id)a3
{
  id v4;
  WFSiriLocationAuthorizationResponse *v5;
  WFSiriLocationAuthorizationResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSiriLocationAuthorizationResponse;
  v5 = -[WFSiriActionResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_didAuthorize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didAuthorize"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSiriLocationAuthorizationResponse;
  v4 = a3;
  -[WFSiriActionResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[WFSiriLocationAuthorizationResponse didAuthorize](self, "didAuthorize", v5.receiver, v5.super_class), CFSTR("didAuthorize"));

}

- (BOOL)didAuthorize
{
  return self->_didAuthorize;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
