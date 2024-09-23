@implementation WFAssociationContext

- (WFAssociationContext)initWithNetwork:(id)a3
{
  id v5;
  WFAssociationContext *v6;
  WFAssociationContext *v7;
  uint64_t v8;
  NSDate *associationStart;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFAssociationContext;
  v6 = -[WFAssociationContext init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_secondaryScanCompleted = 0;
    v6->_state = 0;
    v6->_originator = 0;
    objc_storeStrong((id *)&v6->_network, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    associationStart = v7->_associationStart;
    v7->_associationStart = (NSDate *)v8;

  }
  return v7;
}

- (void)setState:(unint64_t)a3
{
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  unint64_t state;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_state != a3)
  {
    WFLogForCategory(5uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        state = self->_state;
        if (state > 2)
          v9 = 0;
        else
          v9 = off_24DC35AD0[state];
        if (a3 > 2)
          v10 = 0;
        else
          v10 = off_24DC35AD0[a3];
        -[WFAssociationContext networkName](self, "networkName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_219FC8000, v7, v6, "association state changed: <%@> to <%@> for %@", (uint8_t *)&v12, 0x20u);

      }
    }

    self->_state = a3;
  }
}

- (NSString)originatorDescription
{
  unint64_t originator;

  originator = self->_originator;
  if (originator > 2)
    return 0;
  else
    return &off_24DC35AB8[originator]->isa;
}

- (NSString)stateDescription
{
  unint64_t state;

  state = self->_state;
  if (state > 2)
    return 0;
  else
    return &off_24DC35AD0[state]->isa;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAssociationContext stateDescription](self, "stateDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAssociationContext originatorDescription](self, "originatorDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAssociationContext sectionNameJoined](self, "sectionNameJoined");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAssociationContext formattedStartDate](self, "formattedStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAssociationContext networkName](self, "networkName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p State:'%@' Originator='%@' Section='%@' Started='%@' Network='%@'>"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)networkName
{
  void *v2;
  void *v3;

  -[WFAssociationContext network](self, "network");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)formattedStartDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1500];
  -[WFAssociationContext associationStart](self, "associationStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringFromDate:dateStyle:timeStyle:", v3, 1, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)originator
{
  return self->_originator;
}

- (void)setOriginator:(unint64_t)a3
{
  self->_originator = a3;
}

- (BOOL)secondaryScanCompleted
{
  return self->_secondaryScanCompleted;
}

- (void)setSecondaryScanCompleted:(BOOL)a3
{
  self->_secondaryScanCompleted = a3;
}

- (NSString)sectionNameJoined
{
  return self->_sectionNameJoined;
}

- (void)setSectionNameJoined:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)sectionCounts
{
  return self->_sectionCounts;
}

- (void)setSectionCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (WFNetworkListRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (NSDate)associationStart
{
  return self->_associationStart;
}

- (void)setAssociationStart:(id)a3
{
  objc_storeStrong((id *)&self->_associationStart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationStart, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_sectionCounts, 0);
  objc_storeStrong((id *)&self->_sectionNameJoined, 0);
}

@end
