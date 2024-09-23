@implementation SCROBrailleKey

- (void)addSpacebarKeyMask
{
  -[SCROBrailleKey addKeyMask:](self, "addKeyMask:", 67586);
}

- (void)addModifierMask:(unsigned int)a3
{
  if (*MEMORY[0x24BE0FC98] != a3)
  {
    if ((*MEMORY[0x24BE0FCB0] & a3) != 0)
      -[SCROBrailleKey addKeyMask:](self, "addKeyMask:", 67842);
    if ((*MEMORY[0x24BE0FC90] & a3) != 0)
      -[SCROBrailleKey addKeyMask:](self, "addKeyMask:", 68354);
    if ((*MEMORY[0x24BE0FCA0] & a3) != 0)
      -[SCROBrailleKey addKeyMask:](self, "addKeyMask:", 68610);
    if ((*MEMORY[0x24BE0FC88] & a3) != 0)
      -[SCROBrailleKey addKeyMask:](self, "addKeyMask:", 68098);
    if ((*MEMORY[0x24BE0FCA8] & a3) != 0)
      -[SCROBrailleKey addKeyMask:](self, "addKeyMask:", 68866);
  }
}

- (SCROBrailleKey)init
{
  SCROBrailleKey *v2;
  NSMutableArray *v3;
  NSMutableArray *maskArray;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCROBrailleKey;
  v2 = -[SCROBrailleKey init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    maskArray = v2->_maskArray;
    v2->_maskArray = v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCROBrailleKey)initWithCoder:(id)a3
{
  id v4;
  SCROBrailleKey *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *maskArray;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSecureCoding *appToken;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SCROBrailleKey;
  v5 = -[SCROBrailleKey init](&v20, sel_init);
  v5->_hasRouterInfo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasRouterInfo"));
  v5->_routerIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_routerIndex"));
  v5->_routerToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_routerToken"));
  v5->_routerLocation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_routerLocation"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = (void *)MEMORY[0x24BDBCF20];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_maskArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "mutableCopy");
  maskArray = v5->_maskArray;
  v5->_maskArray = (NSMutableArray *)v12;

  v14 = (void *)MEMORY[0x24BDBCF20];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_appToken"));
  v17 = objc_claimAutoreleasedReturnValue();
  appToken = v5->_appToken;
  v5->_appToken = (NSSecureCoding *)v17;

  v5->_displayToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_displayToken"));
  v5->_displayMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_displayModeToken"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  NSMutableArray *maskArray;
  NSSecureCoding *appToken;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", self->_hasRouterInfo, CFSTR("_hasRouterInfo"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_routerIndex, CFSTR("_routerIndex"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_routerToken, CFSTR("_routerToken"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_routerLocation, CFSTR("_routerLocation"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_displayToken, CFSTR("_displayToken"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_displayMode, CFSTR("_displayModeToken"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v8, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  maskArray = self->_maskArray;
  if (maskArray)
    objc_msgSend(v8, "encodeObject:forKey:", maskArray, CFSTR("_maskArray"));
  appToken = self->_appToken;
  v7 = v8;
  if (appToken)
  {
    objc_msgSend(v8, "encodeObject:forKey:", appToken, CFSTR("_appToken"));
    v7 = v8;
  }

}

- (void)setDisplayToken:(int)a3
{
  self->_displayToken = a3;
}

- (int)displayToken
{
  return self->_displayToken;
}

- (void)setDisplayMode:(int)a3
{
  self->_displayMode = a3;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (id)description
{
  _BOOL4 hasRouterInfo;
  void *v4;
  uint64_t displayMode;
  uint64_t displayToken;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  hasRouterInfo = self->_hasRouterInfo;
  v4 = (void *)MEMORY[0x24BDD17C8];
  displayMode = self->_displayMode;
  displayToken = self->_displayToken;
  -[SCROBrailleKey identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (hasRouterInfo)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("display = %ld, displayMode = %ld, identifier = %@, routerIndex = %ld, routerToken = %ld, routerLocation = %ld"), displayToken, displayMode, v7, self->_routerIndex, self->_routerToken, self->_routerLocation);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("display = %ld, displayMode = %ld, identifier = %@"), displayToken, displayMode, v7, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addKeyMask:(unsigned int)a3
{
  NSMutableArray *maskArray;
  void *v5;
  NSString *identifier;

  maskArray = self->_maskArray;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](maskArray, "addObject:", v5);

  identifier = self->_identifier;
  self->_identifier = 0;

}

- (id)keyMasks
{
  return self->_maskArray;
}

- (id)identifier
{
  NSString *identifier;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *v16;
  SCROBrailleKey *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  identifier = self->_identifier;
  if (!identifier)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v18 = self;
    -[NSMutableArray sortedArrayUsingSelector:](self->_maskArray, "sortedArrayUsingSelector:", sel_compare_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        v19 = v10;
        v13 = v10 + 1;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v14);

          if (v13 + v12 < v6)
            objc_msgSend(v4, "appendString:", CFSTR("."));
          ++v12;
        }
        while (v9 != v12);
        v10 = v19 + v9;
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    v15 = objc_msgSend(v4, "copy");
    v16 = v18->_identifier;
    v18->_identifier = (NSString *)v15;

    identifier = v18->_identifier;
  }
  return identifier;
}

- (void)setRouterIndex:(int64_t)a3 token:(int64_t)a4 location:(int64_t)a5 appToken:(id)a6
{
  self->_hasRouterInfo = 1;
  self->_routerIndex = a3;
  self->_routerToken = a4;
  self->_routerLocation = a5;
  objc_storeStrong((id *)&self->_appToken, a6);
}

- (BOOL)getRouterIndex:(int64_t *)a3 token:(int64_t *)a4 location:(int64_t *)a5 appToken:(id *)a6
{
  if (a3)
    *a3 = self->_routerIndex;
  if (a4)
    *a4 = self->_routerToken;
  if (a5)
    *a5 = self->_routerLocation;
  if (a6)
    *a6 = objc_retainAutorelease(self->_appToken);
  return self->_hasRouterInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_maskArray, 0);
}

@end
