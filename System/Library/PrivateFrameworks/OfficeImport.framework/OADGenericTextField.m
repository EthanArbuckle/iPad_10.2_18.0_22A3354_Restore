@implementation OADGenericTextField

- (OADGenericTextField)initWithGuid:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  OADGenericTextField *v8;
  uint64_t v9;
  NSString *guid;
  uint64_t v11;
  NSString *type;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OADGenericTextField;
  v8 = -[OADTextField init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    guid = v8->_guid;
    v8->_guid = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    type = v8->_type;
    v8->_type = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isSimilarToTextRun:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADGenericTextField;
  if (-[OADTextRun isSimilarToTextRun:](&v11, sel_isSimilarToTextRun_, v4))
  {
    -[OADGenericTextField guid](self, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[OADGenericTextField type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
