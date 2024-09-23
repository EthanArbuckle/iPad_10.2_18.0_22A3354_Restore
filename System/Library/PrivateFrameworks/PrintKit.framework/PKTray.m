@implementation PKTray

+ (id)traysWithMediaSourceSupported:(id)a3 printerInputTrays:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__PKTray_traysWithMediaSourceSupported_printerInputTrays___block_invoke;
  v13[3] = &unk_24E6CEA68;
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);
  v10 = v15;
  v11 = v9;

  return v11;
}

void __58__PKTray_traysWithMediaSourceSupported_printerInputTrays___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    v6 = &stru_24E6CFEB0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);

  }
  +[PKTray trayWithString:andMediaSource:](PKTray, "trayWithString:andMediaSource:", v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

+ (id)filter:(id)a3 withBlock:(id)a4
{
  id v5;
  unsigned int (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (unsigned int (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v6[2](v6, v12))
          objc_msgSend(v7, "addObject:", v12, (_QWORD)v14);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)trayWithString:(id)a3 andMediaSource:(id)a4
{
  id v5;
  id v6;
  PKTray *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[PKTray initWithString:andMediaSource:]([PKTray alloc], "initWithString:andMediaSource:", v5, v6);

  return v7;
}

- (PKTray)initWithString:(id)a3 andMediaSource:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  id v17;
  id v18;
  PKTray *v19;
  id v20;
  id v21;
  void *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v21 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKTray;
  v19 = -[PKTray init](&v23, sel_init);
  if (v19)
  {
    v17 = v20;
    v18 = v21;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(";"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "count") == 2)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "lowercaseString");
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
            v14 = objc_claimAutoreleasedReturnValue();
            if (!v13)
              v13 = CFSTR("unreadable-key");
            if (v14)
              v15 = (__CFString *)v14;
            else
              v15 = CFSTR("unreadable-value");
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, v13);

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    if (v18)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("media-source"));

    -[PKTray setTrayDict:](v19, "setTrayDict:", v22);
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[PKTray setTrayDict:](self, "setTrayDict:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKTray;
  -[PKTray dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  -[PKTray trayDict](self, "trayDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("media-source"));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("Unknown");
  return (NSString *)v4;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;
  void *v4;

  -[PKTray name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.PrintKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, v2, CFSTR("InputSlots"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)mediaName
{
  void *v2;
  void *v3;

  -[PKTray trayDict](self, "trayDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("medianame"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEmpty
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PKTray trayDict](self, "trayDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (objc_msgSend(v3, "intValue") & 7) == 3;
  else
    v4 = 0;

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PKTray trayDict](self, "trayDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PKTray<%p> %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTray)initWithCoder:(id)a3
{
  id v4;
  PKTray *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *trayDict;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKTray;
  v5 = -[PKTray init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("trayDict"));
    v7 = objc_claimAutoreleasedReturnValue();
    trayDict = v5->_trayDict;
    v5->_trayDict = (NSDictionary *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_trayDict, CFSTR("trayDict"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKTray trayDict](self, "trayDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trayDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToDictionary:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKTray)initWithUserCodableDictionary:(id)a3
{
  id v4;
  PKTray *v5;
  uint64_t v6;
  NSDictionary *trayDict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTray;
  v5 = -[PKTray init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    trayDict = v5->_trayDict;
    v5->_trayDict = (NSDictionary *)v6;

  }
  return v5;
}

- (NSDictionary)trayDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTrayDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trayDict, 0);
}

@end
