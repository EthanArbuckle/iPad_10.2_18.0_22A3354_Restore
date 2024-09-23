@implementation B2PDataSessionDiscoveryResponse

- (B2PDataSessionDiscoveryResponse)initWithRoute:(unsigned __int8)a3 status:(int)a4 data:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)B2PDataSessionDiscoveryResponse;
  return -[B2PResponse initWithOpCode:route:status:data:](&v6, sel_initWithOpCode_route_status_data_, 39, a3, *(_QWORD *)&a4, a5);
}

- (BOOL)parseResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned __int8 *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  __CFString *v11;
  uint64_t v12;
  B2PDataSessionDiscoveryEntry *v13;
  NSArray *v14;
  NSArray *entries;
  BOOL v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 >= 2)
  {
    v9 = v8;
    do
    {
      v10 = v7 + 2;
      v9 -= 2;
      if (!v7[1])
        goto LABEL_6;
      if (v9 < v7[1])
      {
        v16 = 0;
        goto LABEL_10;
      }
      v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v7 + 2, v7[1], 4);
      v12 = v7[1];
      v10 += v12;
      v9 -= v12;
      if (!v11)
LABEL_6:
        v11 = &stru_251CEA248;
      v13 = -[B2PDataSessionDiscoveryEntry initWithSessionID:tag:]([B2PDataSessionDiscoveryEntry alloc], "initWithSessionID:tag:", *v7, v11);
      objc_msgSend(v5, "addObject:", v13);

      v7 = v10;
    }
    while (v9 > 1);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  entries = self->_entries;
  self->_entries = v14;

  v16 = 1;
LABEL_10:

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v19.receiver = self;
  v19.super_class = (Class)B2PDataSessionDiscoveryResponse;
  -[B2PResponse description](&v19, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_entries;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v5, "appendString:", CFSTR("\tEntry:\n"));
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tSession ID: %u\n"), objc_msgSend(v11, "sessionID"));
        objc_msgSend(v11, "tag");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tTag: %@\n"), v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)entries
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
