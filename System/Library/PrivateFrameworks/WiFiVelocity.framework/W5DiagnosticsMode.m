@implementation W5DiagnosticsMode

- (W5DiagnosticsMode)initWithConfiguration:(id)a3
{
  return -[W5DiagnosticsMode initWithConfiguration:uuid:](self, "initWithConfiguration:uuid:", a3, 0);
}

- (W5DiagnosticsMode)initWithConfiguration:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  W5DiagnosticsMode *v8;
  void *v9;
  void *v10;
  void *v11;
  NSUUID *v12;
  NSObject *p_super;
  uint64_t v14;
  NSUUID *uuid;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  W5DiagnosticsMode *v19;
  NSObject *v21;
  objc_super v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)W5DiagnosticsMode;
  v8 = -[W5DiagnosticsMode init](&v22, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Peers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_storeStrong((id *)&v8->_peers, v9);
      v11 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("Peers"));
      objc_storeStrong((id *)&v8->_info, v11);
      if (v7)
      {
        v12 = (NSUUID *)v7;
        p_super = &v8->_uuid->super;
        v8->_uuid = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v14 = objc_claimAutoreleasedReturnValue();
        uuid = v8->_uuid;
        v8->_uuid = (NSUUID *)v14;

        W5GetOSLog();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          -[W5DiagnosticsMode uuid](v8, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 136316162;
          v24 = "-[W5DiagnosticsMode initWithConfiguration:uuid:]";
          v25 = 2080;
          v26 = "W5DiagnosticsMode.m";
          v27 = 1024;
          v28 = 44;
          v29 = 2114;
          v30 = v16;
          v31 = 2114;
          v32 = v6;
          _os_log_send_and_compose_impl();

        }
      }

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = &v8->_timestamps->super.super;
      v8->_timestamps = (NSMutableDictionary *)v17;
      goto LABEL_8;
    }
    W5GetOSLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315906;
      v24 = "-[W5DiagnosticsMode initWithConfiguration:uuid:]";
      v25 = 2080;
      v26 = "W5DiagnosticsMode.m";
      v27 = 1024;
      v28 = 34;
      v29 = 2114;
      v30 = v6;
      _os_log_send_and_compose_impl();
    }

  }
  W5GetOSLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315650;
    v24 = "-[W5DiagnosticsMode initWithConfiguration:uuid:]";
    v25 = 2080;
    v26 = "W5DiagnosticsMode.m";
    v27 = 1024;
    v28 = 55;
    _os_log_send_and_compose_impl();
  }
  v10 = 0;
  v11 = 0;
  v8 = 0;
LABEL_8:

  v19 = v8;
  return v19;
}

- (void)updatePeer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[W5DiagnosticsMode peers](self, "peers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    W5GetOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[W5DiagnosticsMode peers](self, "peers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
  }
  else
  {
    -[W5DiagnosticsMode peers](self, "peers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v6, v4);
    -[W5DiagnosticsMode setPeers:](self, "setPeers:", v9);

  }
}

- (void)setState:(int64_t)a3
{
  NSMutableDictionary *timestamps;
  void *v5;
  id v6;

  if (self->_state != a3)
  {
    self->_state = a3;
    timestamps = self->_timestamps;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](timestamps, "setObject:forKey:", v6, v5);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5DiagnosticsMode *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[W5DiagnosticsMode init](+[W5DiagnosticsMode allocWithZone:](W5DiagnosticsMode, "allocWithZone:", a3), "init");
  -[W5DiagnosticsMode setState:](v4, "setState:", -[W5DiagnosticsMode state](self, "state"));
  -[W5DiagnosticsMode peers](self, "peers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[W5DiagnosticsMode setPeers:](v4, "setPeers:", v5);

  -[W5DiagnosticsMode uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[W5DiagnosticsMode setUuid:](v4, "setUuid:", v6);

  -[W5DiagnosticsMode info](self, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[W5DiagnosticsMode setInfo:](v4, "setInfo:", v7);

  -[W5DiagnosticsMode timestamps](self, "timestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[W5DiagnosticsMode setTimestamps:](v4, "setTimestamps:", v8);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", state, CFSTR("_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peers, CFSTR("_peers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("_uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_info, CFSTR("_info"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamps, CFSTR("_timestamps"));

}

- (W5DiagnosticsMode)initWithCoder:(id)a3
{
  id v4;
  W5DiagnosticsMode *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *peers;
  void *v11;
  uint64_t v12;
  NSUUID *uuid;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSDictionary *info;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSMutableDictionary *timestamps;
  void *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)W5DiagnosticsMode;
  v5 = -[W5DiagnosticsMode init](&v33, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_state"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_peers"));
    v9 = objc_claimAutoreleasedReturnValue();
    peers = v5->_peers;
    v5->_peers = (NSArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_uuid"));
    v12 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v12;

    v32 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("_info"));
    v23 = objc_claimAutoreleasedReturnValue();
    info = v5->_info;
    v5->_info = (NSDictionary *)v23;

    v25 = (void *)MEMORY[0x24BDBCF20];
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("_timestamps"));
    v29 = objc_claimAutoreleasedReturnValue();
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSMutableDictionary *)v29;

  }
  return v5;
}

- (id)description
{
  W5DiagnosticsMode *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSUUID *uuid;
  void *v30;
  void *v31;
  void *v32;
  NSMutableDictionary *timestamps;
  id v34;
  void *v35;
  W5DiagnosticsMode *v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v2 = self;
  v50 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSDictionary mutableCopy](self->_info, "mutableCopy");
  objc_msgSend(v3, "objectForKey:", CFSTR("Faults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Faults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v45 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x24BDD17C8];
          W5DescriptionForDiagnosticsFaultType(objc_msgSend(v11, "integerValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%@)"), v13, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v14);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("Faults"));

    v2 = v37;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("DetectedFaults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DetectedFaults"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          v24 = (void *)MEMORY[0x24BDD17C8];
          W5DescriptionForDiagnosticsFaultType(objc_msgSend(v23, "integerValue"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ (%@)"), v25, v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "addObject:", v26);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v20);
    }

    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("DetectedFaults"));

    v2 = v37;
  }
  v28 = (void *)MEMORY[0x24BDD16A8];
  uuid = v2->_uuid;
  W5DescriptionForDiagnosticsState(v2->_state);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("Diagnostics Mode UUID='%@' State='%@ (%ld)' with peers='%@' info='%@'"), uuid, v30, v2->_state, v2->_peers, v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableDictionary count](v2->_timestamps, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    timestamps = v2->_timestamps;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __32__W5DiagnosticsMode_description__block_invoke;
    v38[3] = &unk_24C23C3F0;
    v39 = v32;
    v34 = v32;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](timestamps, "enumerateKeysAndObjectsUsingBlock:", v38);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" timestamps='%@'"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "appendString:", v35);

  }
  return v31;
}

void __32__W5DiagnosticsMode_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  v5 = a2;
  W5NSDateToISO8601Description(a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(v5, "integerValue");

  W5DescriptionForDiagnosticsState(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v8);

}

- (BOOL)isEqual:(id)a3
{
  W5DiagnosticsMode *v4;
  W5DiagnosticsMode *v5;
  BOOL v6;

  v4 = (W5DiagnosticsMode *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[W5DiagnosticsMode isEqualToDiagnosticsMode:](self, "isEqualToDiagnosticsMode:", v5);

  return v6;
}

- (BOOL)isEqualToDiagnosticsMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[W5DiagnosticsMode uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[W5DiagnosticsMode uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)compareCollectionTimeLatestFirst:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[W5DiagnosticsMode timestamps](self, "timestamps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", &unk_24C24DFF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timestamps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", &unk_24C24DFF8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v6 && v8)
    v9 = objc_msgSend(v8, "compare:", v6);

  return v9;
}

- (id)timestampFor:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[W5DiagnosticsMode timestamps](self, "timestamps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[W5DiagnosticsMode timestamps](self, "timestamps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (NSArray)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
  objc_storeStrong((id *)&self->_peers, a3);
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (NSMutableDictionary)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_timestamps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
