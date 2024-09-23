@implementation WBBrowserState

- (NSArray)windowStates
{
  return self->_windowStates;
}

- (NSArray)privatePinnedTabs
{
  return self->_privatePinnedTabs;
}

- (NSArray)pinnedTabs
{
  return self->_pinnedTabs;
}

- (WBBrowserState)initWithPinnedTabs:(id)a3 privatePinnedTabs:(id)a4 windowStates:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBBrowserState *v11;
  uint64_t v12;
  NSArray *pinnedTabs;
  uint64_t v14;
  NSArray *privatePinnedTabs;
  NSDictionary *pinnedTabsByProfileIdentifier;
  uint64_t v17;
  NSArray *windowStates;
  WBBrowserState *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WBBrowserState;
  v11 = -[WBBrowserState init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    pinnedTabs = v11->_pinnedTabs;
    v11->_pinnedTabs = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    privatePinnedTabs = v11->_privatePinnedTabs;
    v11->_privatePinnedTabs = (NSArray *)v14;

    pinnedTabsByProfileIdentifier = v11->_pinnedTabsByProfileIdentifier;
    v11->_pinnedTabsByProfileIdentifier = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v17 = objc_msgSend(v10, "copy");
    windowStates = v11->_windowStates;
    v11->_windowStates = (NSArray *)v17;

    v19 = v11;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowStates, 0);
  objc_storeStrong((id *)&self->_pinnedTabsByProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_privatePinnedTabs, 0);
  objc_storeStrong((id *)&self->_pinnedTabs, 0);
}

- (WBBrowserState)init
{
  return -[WBBrowserState initWithPinnedTabs:privatePinnedTabs:windowStates:](self, "initWithPinnedTabs:privatePinnedTabs:windowStates:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBBrowserState)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WBBrowserState *v21;
  NSDictionary *pinnedTabsByProfileIdentifier;
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("PinnedTabs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("PrivatePinnedTabs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDBCF20];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("PinnedTabsByProfileUUID"));
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDBCF20];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, CFSTR("WindowStatesKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[WBBrowserState initWithPinnedTabs:privatePinnedTabs:windowStates:](self, "initWithPinnedTabs:privatePinnedTabs:windowStates:", v8, v12, v20);
  pinnedTabsByProfileIdentifier = v21->_pinnedTabsByProfileIdentifier;
  v21->_pinnedTabsByProfileIdentifier = (NSDictionary *)v16;

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *pinnedTabs;
  id v5;

  pinnedTabs = self->_pinnedTabs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pinnedTabs, CFSTR("PinnedTabs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privatePinnedTabs, CFSTR("PrivatePinnedTabs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pinnedTabsByProfileIdentifier, CFSTR("PinnedTabsByProfileUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_windowStates, CFSTR("WindowStatesKey"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBBrowserState pinnedTabs](self, "pinnedTabs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[WBBrowserState privatePinnedTabs](self, "privatePinnedTabs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[WBBrowserState windowStates](self, "windowStates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; pinnedTabs = %zu; privatePinnedTabs = %zu; windows = %zu>"),
    v5,
    self,
    v7,
    v9,
    objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setPinnedTabs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setPrivatePinnedTabs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)pinnedTabsByProfileIdentifier
{
  return self->_pinnedTabsByProfileIdentifier;
}

- (void)setPinnedTabsByProfileIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setWindowStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
