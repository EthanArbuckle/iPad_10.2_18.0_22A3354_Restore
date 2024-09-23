@implementation TSBonjourBrowser

- (TSBonjourBrowser)init
{
  TSBonjourBrowser *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSArray *v5;
  NSArray *nodes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSBonjourBrowser;
  v2 = -[TSBonjourBrowser init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.timesync.bonjour.browse", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    nodes = v2->_nodes;
    v2->_nodes = v5;

  }
  return v2;
}

- (void)addedServiceWithName:(const char *)a3 regType:(const char *)a4 domain:(const char *)a5 onInterface:(unsigned int)a6 withFlags:(unsigned int)a7
{
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  TSBonjourBrowser *v24;
  uint64_t v25;
  void *v26;
  TSBonjourNode *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  unsigned int v42;
  TSBonjourBrowser *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  unsigned int v58;
  __int16 v59;
  char *v60;
  __int16 v61;
  unsigned int v62;
  char v63[8];
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v63 = 0;
  v64 = 0;
  if_indextoname(a6, v63);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v52 = a3;
    v53 = 2080;
    v54 = a4;
    v55 = 2080;
    v56 = a5;
    v57 = 1024;
    v58 = a7;
    v59 = 2080;
    v60 = v63;
    v61 = 1024;
    v62 = a6;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Added service with name %s type %s domain %s flags 0x%08x on interface %s (%u)\n", buf, 0x36u);
  }
  if (a6)
  {
    v42 = a6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v63);
    v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
    v43 = self;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[TSBonjourBrowser nodes](self, "nodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v47;
LABEL_6:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v18);
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "isEqualToString:", v13))
          goto LABEL_14;
        objc_msgSend(v19, "type");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "isEqualToString:", v45) & 1) == 0)
          break;
        objc_msgSend(v19, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v44);

        if ((v23 & 1) != 0)
        {
          v27 = v19;

          v24 = v43;
          v25 = v42;
          v26 = (void *)v41;
          if (v27)
            goto LABEL_26;
          goto LABEL_19;
        }
LABEL_15:
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
          if (v16)
            goto LABEL_6;
          goto LABEL_17;
        }
      }

LABEL_14:
      goto LABEL_15;
    }
LABEL_17:

    v24 = v43;
    v25 = v42;
    v26 = (void *)v41;
LABEL_19:
    v27 = -[TSBonjourNode initWithServiceName:type:andDomain:]([TSBonjourNode alloc], "initWithServiceName:type:andDomain:", v13, v45, v44);
    -[TSBonjourBrowser nodes](v24, "nodes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[TSBonjourBrowser nodes](v24, "nodes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "arrayByAddingObject:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TSBonjourBrowser setNodes:](v24, "setNodes:", v30);
    -[TSBonjourBrowser delegate](v24, "delegate");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      -[TSBonjourBrowser delegate](v24, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) != 0)
      {
        -[TSBonjourBrowser delegate](v24, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "didAddNode:onBrowser:", v27, v24);

      }
    }

LABEL_26:
    -[TSBonjourNode addedOnInterface:named:](v27, "addedOnInterface:named:", v25, v26);
    -[TSBonjourBrowser delegate](v24, "delegate");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      -[TSBonjourBrowser delegate](v24, "delegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_opt_respondsToSelector();

      if ((v39 & 1) != 0)
      {
        -[TSBonjourBrowser delegate](v24, "delegate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "didAddInterface:toNode:onBrowser:", v26, v27, v24);

      }
    }

  }
}

- (void)removedServiceWithName:(const char *)a3 regType:(const char *)a4 domain:(const char *)a5 onInterface:(unsigned int)a6 withFlags:(unsigned int)a7
{
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  TSBonjourBrowser *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  unsigned int v55;
  __int16 v56;
  char *v57;
  __int16 v58;
  unsigned int v59;
  char v60[8];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v60 = 0;
  v61 = 0;
  if_indextoname(a6, v60);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v49 = a3;
    v50 = 2080;
    v51 = a4;
    v52 = 2080;
    v53 = a5;
    v54 = 1024;
    v55 = a7;
    v56 = 2080;
    v57 = v60;
    v58 = 1024;
    v59 = a6;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Removed service with name %s type %s domain %s flags 0x%08x on interface %s (%u)\n", buf, 0x36u);
  }
  v40 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v60);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[TSBonjourBrowser nodes](self, "nodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v16)
  {
LABEL_25:

    goto LABEL_27;
  }
  v38 = self;
  v39 = v13;
  v17 = *(_QWORD *)v44;
LABEL_5:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v44 != v17)
      objc_enumerationMutation(v15);
    v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v18);
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "isEqualToString:", v14))
      goto LABEL_13;
    objc_msgSend(v19, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqualToString:", v42) & 1) == 0)
    {

LABEL_13:
      goto LABEL_14;
    }
    objc_msgSend(v19, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", v41);

    if ((v23 & 1) != 0)
      break;
LABEL_14:
    if (v16 == (id)++v18)
    {
      v16 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v16)
        goto LABEL_5;
      v13 = v39;
      goto LABEL_25;
    }
  }
  v16 = v19;

  if (!v16)
  {
    v13 = v39;
    goto LABEL_27;
  }
  -[TSBonjourBrowser delegate](v38, "delegate");
  v24 = objc_claimAutoreleasedReturnValue();
  v13 = v39;
  if (v24)
  {
    v25 = (void *)v24;
    -[TSBonjourBrowser delegate](v38, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) != 0)
    {
      -[TSBonjourBrowser delegate](v38, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "didRemoveInterface:fromNode:onBrowser:", v39, v16, v38);

    }
  }
  objc_msgSend(v16, "removedFromInterface:named:", v40, v39);
  objc_msgSend(v16, "interfaces");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (!v30)
  {
    v31 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[TSBonjourBrowser nodes](v38, "nodes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v31, "initWithArray:", v32);

    objc_msgSend(v15, "removeObject:", v16);
    -[TSBonjourBrowser setNodes:](v38, "setNodes:", v15);
    -[TSBonjourBrowser delegate](v38, "delegate");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)v33;
      -[TSBonjourBrowser delegate](v38, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_opt_respondsToSelector();

      if ((v36 & 1) != 0)
      {
        -[TSBonjourBrowser delegate](v38, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "didRemoveNode:onBrowser:", v16, v38);

      }
    }
    goto LABEL_25;
  }
LABEL_27:

}

- (BOOL)startBrowsingWithError:(id *)a3
{
  _DNSServiceRef_t **p_sdRef;
  _DNSServiceRef_t *sdRef;
  BOOL result;
  DNSServiceErrorType v8;
  id v9;

  sdRef = self->_sdRef;
  p_sdRef = &self->_sdRef;
  if (sdRef)
    return 1;
  v8 = DNSServiceBrowse(p_sdRef, 0x100000u, 0, "_ptp-general._udp.", 0, (DNSServiceBrowseReply)TSBBBrowseServiceReply, self);
  if (a3 && v8)
  {
    TSBonjourErrorFromErrorCode(v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v9;
  }
  else
  {
    if (!v8)
    {
      DNSServiceSetDispatchQueue(self->_sdRef, (dispatch_queue_t)self->_queue);
      return 1;
    }
    return 0;
  }
  return result;
}

- (BOOL)stopBrowsing
{
  _DNSServiceRef_t *sdRef;

  sdRef = self->_sdRef;
  if (sdRef)
  {
    DNSServiceRefDeallocate(self->_sdRef);
    self->_sdRef = 0;
  }
  return sdRef != 0;
}

- (void)dealloc
{
  _DNSServiceRef_t *sdRef;
  objc_super v4;

  sdRef = self->_sdRef;
  if (sdRef)
    DNSServiceRefDeallocate(sdRef);
  v4.receiver = self;
  v4.super_class = (Class)TSBonjourBrowser;
  -[TSBonjourBrowser dealloc](&v4, sel_dealloc);
}

- (TSBonjourBrowserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSBonjourBrowserDelegate *)a3;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
