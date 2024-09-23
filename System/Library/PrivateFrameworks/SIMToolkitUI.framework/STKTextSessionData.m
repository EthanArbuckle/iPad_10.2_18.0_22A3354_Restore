@implementation STKTextSessionData

- (STKTextSessionData)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKTextSessionData.m"), 20, CFSTR("Unavailable."));

  return 0;
}

- (STKTextSessionData)initWithText:(id)a3 simLabel:(id)a4
{
  id v6;
  id v7;
  STKTextSessionData *v8;
  uint64_t v9;
  NSString *text;
  uint64_t v11;
  NSString *simLabel;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STKTextSessionData;
  v8 = -[STKTextSessionData init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    text = v8->_text;
    v8->_text = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    simLabel = v8->_simLabel;
    v8->_simLabel = (NSString *)v11;

  }
  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;

  v3 = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();

}

- (STKTextSessionData)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STKTextSessionData *v7;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[STKTextSessionData initWithText:simLabel:](self, "initWithText:simLabel:", v5, v6);
  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)simLabel
{
  return self->_simLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simLabel, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
