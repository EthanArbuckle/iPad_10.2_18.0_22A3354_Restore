@implementation KTIDSSignInServiceUserInfo

- (KTIDSSignInServiceUserInfo)initWithType:(unint64_t)a3 status:(unint64_t)a4
{
  KTIDSSignInServiceUserInfo *v6;
  KTIDSSignInServiceUserInfo *v7;
  KTIDSSignInServiceUserInfo *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KTIDSSignInServiceUserInfo;
  v6 = -[KTIDSSignInServiceUserInfo init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    -[KTIDSSignInServiceUserInfo setType:](v6, "setType:", a3);
    -[KTIDSSignInServiceUserInfo setStatus:](v7, "setStatus:", a4);
    v8 = v7;
  }

  return v7;
}

- (KTIDSSignInServiceUserInfo)initWithUserInfo:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = objc_msgSend(v4, "status");

  return -[KTIDSSignInServiceUserInfo initWithType:status:](self, "initWithType:status:", v5, v6);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTIDSSignInServiceUserInfo: type %d status: %d"), -[KTIDSSignInServiceUserInfo type](self, "type"), -[KTIDSSignInServiceUserInfo status](self, "status"));
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

@end
