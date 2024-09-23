@implementation WFPendingNetworkUpdate

- (WFPendingNetworkUpdate)initWithNetwork:(id)a3
{
  id v4;
  WFPendingNetworkUpdate *v5;
  WFPendingNetworkUpdate *v6;
  uint64_t v7;
  WFNetworkListRecord *network;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPendingNetworkUpdate;
  v5 = -[WFPendingNetworkUpdate init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "copyWithZone:", 0);
      network = v6->_network;
      v6->_network = (WFNetworkListRecord *)v7;
    }
    else
    {
      network = v5->_network;
      v5->_network = 0;
    }

  }
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPendingNetworkUpdate network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p network='%@'>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WFNetworkListRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
}

@end
