@implementation Endpoint

- (Endpoint)initWithIdentifier:(id)a3 supportedCommands:(id)a4
{
  id v7;
  id v8;
  Endpoint *v9;
  Endpoint *v10;
  NSMutableSet *v11;
  NSMutableSet *pipes;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)Endpoint;
  v9 = -[Endpoint init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    *(int64x2_t *)&v10->_type = vdupq_n_s64(2uLL);
    v11 = objc_opt_new(NSMutableSet);
    pipes = v10->_pipes;
    v10->_pipes = v11;

    objc_storeStrong((id *)&v10->_supportedCommands, a4);
  }

  return v10;
}

- (void)addPipe:(id)a3
{
  id v4;
  Pipe *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v5 = -[Pipe initWithDelegate:pipe:]([Pipe alloc], "initWithDelegate:pipe:", self, v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)removePipe:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pipe"));

        if (v11 == v4)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
          objc_msgSend(v13, "removeObject:", v10);

          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006D838((uint64_t)v4, v12);
LABEL_12:

}

- (BOOL)isConnected
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)pipe:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  NSString *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[Endpoint supportedCommands](self, "supportedCommands"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));
        if (v14)
        {
          v15 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("handle%@Command:message:"), v13));
          v16 = NSSelectorFromString(v15);

          objc_msgSend(self, v16, v6, v14);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSSet)supportedCommands
{
  return self->_supportedCommands;
}

- (NSMutableSet)pipes
{
  return self->_pipes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipes, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
