@implementation RTWalletManagerNotificationPassUsed

- (RTWalletManagerNotificationPassUsed)initWithPassTypeIdentifier:(id)a3 source:(int64_t)a4 info:(id)a5
{
  id v8;
  id v9;
  RTWalletManagerNotificationPassUsed *v10;
  uint64_t v11;
  NSString *passTypeIdentifier;
  void *v13;
  uint64_t v14;
  NSArray *storeIDs;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RTWalletManagerNotificationPassUsed;
  v10 = -[RTNotification init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    passTypeIdentifier = v10->_passTypeIdentifier;
    v10->_passTypeIdentifier = (NSString *)v11;

    v10->_source = a4;
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D6BB80]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    storeIDs = v10->_storeIDs;
    v10->_storeIDs = (NSArray *)v14;

  }
  return v10;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (int64_t)source
{
  return self->_source;
}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIDs, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end
