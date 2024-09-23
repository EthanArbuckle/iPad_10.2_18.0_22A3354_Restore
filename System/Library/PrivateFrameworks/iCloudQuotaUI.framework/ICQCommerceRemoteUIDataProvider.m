@implementation ICQCommerceRemoteUIDataProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;
  uint64_t v13;

  v6 = a3;
  self->_plist = 0;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, &v13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    self->_plist = 1;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("failureType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQCommerceRemoteUIDataProvider _setFailureType:](self, "_setFailureType:", v9);

    v12.receiver = self;
    v12.super_class = (Class)ICQCommerceRemoteUIDataProvider;
    v10 = -[ISProtocolDataProvider parseData:returningError:](&v12, sel_parseData_returningError_, v6, a4);
  }
  else
  {
    -[ISDataProvider setOutput:](self, "setOutput:", v6);
    v10 = 1;
  }

  return v10;
}

- (void)_setFailureType:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v8, "integerValue");
    -[ICQCommerceRemoteUIDataProvider parent](self, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = v4;
  }
  else
  {
    -[ICQCommerceRemoteUIDataProvider parent](self, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(v5, "setFailureType:", v7);

}

- (BOOL)isPlist
{
  return self->_plist;
}

- (void)setPlist:(BOOL)a3
{
  self->_plist = a3;
}

- (ICQCommerceRemoteUIDelegate)parent
{
  return (ICQCommerceRemoteUIDelegate *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
}

@end
