@implementation CTCapability

- (CTCapability)initWithCapabilityName:(id)a3
{
  id v5;
  CTCapability *v6;
  CTCapability *v7;
  uint64_t v8;
  NSMutableDictionary *capabilityFetched;
  uint64_t v10;
  NSMutableDictionary *enabledFetched;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCapability;
  v6 = -[CTCapability init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CTCapability reset](v6, "reset");
    objc_storeStrong((id *)&v7->_capabilityName, a3);
    v8 = objc_opt_new();
    capabilityFetched = v7->_capabilityFetched;
    v7->_capabilityFetched = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    enabledFetched = v7->_enabledFetched;
    v7->_enabledFetched = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (void)acceptCapabilityforSlotID:(int64_t)a3 status:(BOOL)a4 canSet:(BOOL)a5 info:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  -[CTCapability slotNum:](self, "slotNum:", a3);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCapability capability](self, "capability");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v19);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCapability enabledDict](self, "enabledDict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v19);

  -[CTCapability capabilityInfo](self, "capabilityInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v19);

  -[CTCapability capabilityFetched](self, "capabilityFetched");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v19);

  -[CTCapability enabledFetched](self, "enabledFetched");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

}

- (void)setCapable:(BOOL)a3 forSlotID:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CTCapability capability](self, "capability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCapability slotNum:](self, "slotNum:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

- (BOOL)getCapabilityForSlotID:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[CTCapability capability](self, "capability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCapability slotNum:](self, "slotNum:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (void)setCapabilityInfo:(id)a3 forSlotID:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[CTCapability capabilityInfo](self, "capabilityInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CTCapability slotNum:](self, "slotNum:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (BOOL)getCapabilityInfo:(id)a3 forSlotID:(int64_t)a4
{
  void *v4;
  char v5;

  -[CTCapability getCapabilityInfoObject:forSlotID:](self, "getCapabilityInfoObject:forSlotID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)getCapabilityInfoObject:(id)a3 forSlotID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[CTCapability capabilityInfo](self, "capabilityInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCapability slotNum:](self, "slotNum:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setCapabilityInfoObject:(id)a3 forKey:(id)a4 forSlotID:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[CTCapability slotNum:](self, "slotNum:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCapability enabledFetched](self, "enabledFetched");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", MEMORY[0x24BDBD1C8]);

  if ((v13 & 1) != 0)
  {
    -[CTCapability capabilityInfo](self, "capabilityInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, v9);
    -[CTCapability capabilityInfo](self, "capabilityInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v10);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v18 = 136315138;
    v19 = "-[CTCapability setCapabilityInfoObject:forKey:forSlotID:]";
    _os_log_error_impl(&dword_2161C6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: DONOTHING, not fetched", (uint8_t *)&v18, 0xCu);
  }

}

- (void)setEnabled:(BOOL)a3 forSlotID:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CTCapability enabledDict](self, "enabledDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCapability slotNum:](self, "slotNum:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

- (BOOL)getEnabledForSlotID:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[CTCapability enabledDict](self, "enabledDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCapability slotNum:](self, "slotNum:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (id)slotNum:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  -[CTCapability setCapabilityFetched:](self, "setCapabilityFetched:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  -[CTCapability setEnabledFetched:](self, "setEnabledFetched:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  -[CTCapability setCapability:](self, "setCapability:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  -[CTCapability setCapabilityInfo:](self, "setCapabilityInfo:", v6);

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  -[CTCapability setEnabledDict:](self, "setEnabledDict:", v7);

}

- (NSString)capabilityName
{
  return self->_capabilityName;
}

- (void)setCapabilityName:(id)a3
{
  objc_storeStrong((id *)&self->_capabilityName, a3);
}

- (NSMutableDictionary)capabilityFetched
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCapabilityFetched:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)enabledFetched
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnabledFetched:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)capability
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCapability:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)capabilityInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCapabilityInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)enabledDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnabledDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledDict, 0);
  objc_storeStrong((id *)&self->_capabilityInfo, 0);
  objc_storeStrong((id *)&self->_capability, 0);
  objc_storeStrong((id *)&self->_enabledFetched, 0);
  objc_storeStrong((id *)&self->_capabilityFetched, 0);
  objc_storeStrong((id *)&self->_capabilityName, 0);
}

@end
