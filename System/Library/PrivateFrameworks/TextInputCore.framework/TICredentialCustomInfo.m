@implementation TICredentialCustomInfo

- (TICredentialCustomInfo)initWithCustomInfo:(id)a3 documentIdentifier:(id)a4
{
  id v7;
  id v8;
  TICredentialCustomInfo *v9;
  TICredentialCustomInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TICredentialCustomInfo;
  v9 = -[TICredentialCustomInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_customInfo, a3);
    objc_storeStrong((id *)&v10->_documentIdentifier, a4);
  }

  return v10;
}

- (NSDictionary)customInfo
{
  return self->_customInfo;
}

- (NSUUID)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_customInfo, 0);
}

@end
