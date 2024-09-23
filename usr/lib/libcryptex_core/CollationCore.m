@implementation CollationCore

- (CollationCore)initWithID:(unsigned int)a3
{
  uint64_t v3;
  CollationCore *v4;
  os_log_t v5;
  void *v6;
  dispatch_queue_t v7;
  NSObject *v8;
  xpc_connection_t v9;
  void *v10;
  objc_super v12;

  v3 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)CollationCore;
  v4 = -[CollationCore init](&v12, sel_init);
  if (v4)
  {
    v5 = os_log_create("com.apple.libcryptex", "CollationCore");
    -[CollationCore setLog:](v4, "setLog:", v5);

    -[CollationCore setColl_uid:](v4, "setColl_uid:", v3);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CollationCore setColl_elems:](v4, "setColl_elems:", v6);

    v7 = dispatch_queue_create("CollationCore", 0);
    -[CollationCore setDq:](v4, "setDq:", v7);

    -[CollationCore dq](v4, "dq");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_create(0, v8);
    -[CollationCore setListener:](v4, "setListener:", v9);

    -[CollationCore listener](v4, "listener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[CollationCore setupHandler](v4, "setupHandler");
  }
  return v4;
}

- (CollationCore)initWithXPC:(id)a3
{
  id v4;
  CollationCore *v5;
  void *v6;
  _QWORD applier[4];
  CollationCore *v9;

  v4 = a3;
  v5 = -[CollationCore initWithID:](self, "initWithID:", xpc_dictionary_get_uint64(v4, "uid"));
  if (v5)
  {
    xpc_dictionary_get_array(v4, "collation_cryptexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __29__CollationCore_initWithXPC___block_invoke;
      applier[3] = &unk_24CCE32B0;
      v9 = v5;
      xpc_array_apply(v6, applier);

    }
  }

  return v5;
}

uint64_t __29__CollationCore_initWithXPC___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CollationElement *v5;
  void *v6;

  v4 = a3;
  v5 = -[CollationElement initWithXPC:]([CollationElement alloc], "initWithXPC:", v4);

  objc_msgSend(*(id *)(a1 + 32), "coll_elems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  return 1;
}

- (id)packToXPC
{
  xpc_object_t empty;
  xpc_object_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  empty = xpc_dictionary_create_empty();
  v4 = xpc_array_create_empty();
  xpc_dictionary_set_int64(empty, "uid", -[CollationCore coll_uid](self, "coll_uid"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CollationCore coll_elems](self, "coll_elems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "package");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_array_append_value(v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  xpc_dictionary_set_value(empty, "collation_cryptexes", v4);
  return empty;
}

- (void)parseMessage:(id)a3
{
  id v4;
  xpc_object_t reply;
  const char *string;
  uint64_t v7;
  NSObject *v8;

  v4 = a3;
  reply = xpc_dictionary_create_reply(v4);
  if (reply)
  {
    string = xpc_dictionary_get_string(v4, "command");
    if (string)
    {
      v7 = (uint64_t)string;
      if (!strcmp(string, "package"))
      {
        -[CollationCore packToXPC](self, "packToXPC");
        v8 = objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_value(reply, "package", v8);
      }
      else
      {
        -[CollationCore log](self, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[CollationCore parseMessage:].cold.2(v7, v8);
      }

    }
    xpc_dictionary_send_reply();
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[CollationCore parseMessage:].cold.1();
  }

}

- (void)setupHandler
{
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  _QWORD handler[5];

  -[CollationCore listener](self, "listener");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __29__CollationCore_setupHandler__block_invoke;
  handler[3] = &unk_24CCE3300;
  handler[4] = self;
  xpc_connection_set_event_handler(v3, handler);

  -[CollationCore listener](self, "listener");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_activate(v4);

}

void __29__CollationCore_setupHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  id v12;
  const char *string;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x212BE5998]();
  if (v4 != MEMORY[0x24BDACF88])
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACFB8];
    objc_msgSend(*(id *)(a1 + 32), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5 == v6)
    {
      if (v8)
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v17 = string;
        v9 = "connection error: %s";
        v10 = v7;
        v11 = 12;
        goto LABEL_8;
      }
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      v9 = "unrecognized connection event";
      v10 = v7;
      v11 = 2;
LABEL_8:
      _os_log_impl(&dword_211A95000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }

    goto LABEL_10;
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __29__CollationCore_setupHandler__block_invoke_2;
  v14[3] = &unk_24CCE32D8;
  v14[4] = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v15 = v12;
  xpc_connection_set_event_handler((xpc_connection_t)v12, v14);
  xpc_connection_activate((xpc_connection_t)v12);

LABEL_10:
}

void __29__CollationCore_setupHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (MEMORY[0x212BE5998]() == MEMORY[0x24BDACFA0])
    objc_msgSend(*(id *)(a1 + 32), "parseMessage:", v3);
  else
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));

}

- (id)description
{
  void *v2;
  uint64_t coll_uid;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  coll_uid = self->_coll_uid;
  -[NSMutableSet description](self->_coll_elems, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[Collation %d]\n%@"), coll_uid, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mountPointOfBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CollationCore coll_elems](self, "coll_elems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "cle_bundle_id");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v13 = v10;

          v7 = v13;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);

    if (!v7)
    {
      v6 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v7, "cle_mnt_path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
  }

LABEL_14:
  return v6;
}

- (id)getValidPaths:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  v7 = 0;
  if (v25)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v26 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v8);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        -[CollationCore coll_elems](self, "coll_elems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v30;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v30 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
              if (!v6
                || (objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v14), "cle_bundle_id"),
                    v16 = (void *)objc_claimAutoreleasedReturnValue(),
                    v17 = objc_msgSend(v6, "isEqualToString:", v16),
                    v16,
                    v17))
              {
                v18 = objc_msgSend(v15, "copyAbsolutePath:", v9);

                if (objc_msgSend(v28, "fileExistsAtPath:", v18))
                  objc_msgSend(v27, "addObject:", v18);
                v7 = (void *)v18;
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v12);
        }

        v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v25);
  }
  objc_msgSend(v27, "componentsJoinedByString:", CFSTR(":"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)appendCollationElement:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CollationCore coll_elems](self, "coll_elems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return 1;
}

- (BOOL)removeCollationElementWithPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CollationCore coll_elems](self, "coll_elems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v7 = v6 != 0;
  if (v6)
  {
    v8 = v6;
    v18 = v6 != 0;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "cle_mnt_path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
        {
          v15 = v12;

          v9 = v15;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);

    if (!v9)
    {
      v7 = 0;
      goto LABEL_15;
    }
    -[CollationCore coll_elems](self, "coll_elems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v9);

    v7 = v18;
  }
  else
  {
    v9 = v5;
  }

LABEL_15:
  return v7;
}

- (void)enumerateCollationElements:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  -[CollationCore coll_elems](self, "coll_elems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CollationCore coll_elems](self, "coll_elems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__CollationCore_enumerateCollationElements___block_invoke;
    v8[3] = &unk_24CCE3328;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

uint64_t __44__CollationCore_enumerateCollationElements___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a3 = result ^ 1;
  return result;
}

- (void)enumerateElements:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  -[CollationCore coll_elems](self, "coll_elems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CollationCore coll_elems](self, "coll_elems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __35__CollationCore_enumerateElements___block_invoke;
    v8[3] = &unk_24CCE3328;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

void __35__CollationCore_enumerateElements___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v6 = objc_msgSend(v5, "cle_scope");
  objc_msgSend(v5, "cle_bundle_id");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v12, "UTF8String");
  objc_msgSend(v5, "cle_bundle_version");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "UTF8String");
  objc_msgSend(v5, "cle_mnt_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  *a3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v6, v7, v9, objc_msgSend(v11, "UTF8String")) ^ 1;

}

- (id)createEndpoint
{
  _xpc_connection_s *v2;
  xpc_endpoint_t v3;

  -[CollationCore listener](self, "listener");
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v3 = xpc_endpoint_create(v2);

  return v3;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[CollationCore coll_elems](self, "coll_elems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (unsigned)coll_uid
{
  return self->_coll_uid;
}

- (void)setColl_uid:(unsigned int)a3
{
  self->_coll_uid = a3;
}

- (NSMutableSet)coll_elems
{
  return self->_coll_elems;
}

- (void)setColl_elems:(id)a3
{
  objc_storeStrong((id *)&self->_coll_elems, a3);
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
  objc_storeStrong((id *)&self->_dq, a3);
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_coll_elems, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)parseMessage:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_211A95000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "no reply context", v0, 2u);
}

- (void)parseMessage:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_211A95000, a2, OS_LOG_TYPE_ERROR, "Unknown subcommand %s", (uint8_t *)&v2, 0xCu);
}

@end
