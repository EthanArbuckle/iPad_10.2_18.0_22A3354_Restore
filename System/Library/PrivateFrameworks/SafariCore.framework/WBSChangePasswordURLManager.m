@implementation WBSChangePasswordURLManager

- (WBSChangePasswordURLManager)init
{

  return 0;
}

- (WBSChangePasswordURLManager)initWithChangePasswordURLStrings:(id)a3
{
  id v4;
  WBSChangePasswordURLManager *v5;
  uint64_t v6;
  NSDictionary *changePasswordURLStrings;
  WBSChangePasswordURLManager *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSChangePasswordURLManager;
  v5 = -[WBSChangePasswordURLManager init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    changePasswordURLStrings = v5->_changePasswordURLStrings;
    v5->_changePasswordURLStrings = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)changePasswordURLForHighLevelDomain:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_changePasswordURLStrings, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSDictionary)changePasswordURLStrings
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChangePasswordURLStrings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changePasswordURLStrings, 0);
}

@end
