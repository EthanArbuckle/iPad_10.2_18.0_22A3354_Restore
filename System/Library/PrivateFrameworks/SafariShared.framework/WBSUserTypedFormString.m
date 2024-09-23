@implementation WBSUserTypedFormString

- (WBSUserTypedFormString)initWithUserTypedString:(id)a3
{
  id v4;
  WBSUserTypedFormString *v5;
  uint64_t v6;
  NSString *userTypedString;
  WBSUserTypedFormString *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSUserTypedFormString;
  v5 = -[WBSUserTypedFormString init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    userTypedString = v5->_userTypedString;
    v5->_userTypedString = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)completion
{
  return self->_userTypedString;
}

- (NSString)userTypedString
{
  return self->_userTypedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTypedString, 0);
}

@end
