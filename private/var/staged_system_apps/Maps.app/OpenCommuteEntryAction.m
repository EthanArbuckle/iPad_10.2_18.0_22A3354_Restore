@implementation OpenCommuteEntryAction

- (OpenCommuteEntryAction)initWithEntry:(id)a3
{
  id v4;
  OpenCommuteEntryAction *v5;
  NSString *v6;
  NSString *entryID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OpenCommuteEntryAction;
  v5 = -[OpenCommuteEntryAction init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    entryID = v5->_entryID;
    v5->_entryID = v6;

  }
  return v5;
}

- (NSString)entryID
{
  return self->_entryID;
}

- (void)setEntryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryID, 0);
}

@end
