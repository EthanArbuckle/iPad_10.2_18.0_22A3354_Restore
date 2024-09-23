@implementation WBReusableTabEntry

- (WBReusableTabEntry)initWithReusableTab:(id)a3
{
  id v5;
  WBReusableTabEntry *v6;
  WBReusableTabEntry *v7;
  uint64_t v8;
  NSDate *dateCreated;
  WBReusableTabEntry *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBReusableTabEntry;
  v6 = -[WBReusableTabEntry init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reusableTab, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    dateCreated = v7->_dateCreated;
    v7->_dateCreated = (NSDate *)v8;

    v10 = v7;
  }

  return v7;
}

- (WBReusableTab)reusableTab
{
  return self->_reusableTab;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_reusableTab, 0);
}

@end
