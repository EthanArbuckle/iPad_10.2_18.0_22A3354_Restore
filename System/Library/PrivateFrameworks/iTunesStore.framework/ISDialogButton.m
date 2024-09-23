@implementation ISDialogButton

- (ISDialogButton)init
{
  objc_super v4;

  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISDialogButton;
  return -[ISDialogButton init](&v4, sel_init);
}

+ (id)buttonWithTitle:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTitle:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3 superficial:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int64_t v13;
  void *v14;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISDialogButton title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      if (a4)
      {
        LOBYTE(v10) = 1;
        v11 = v7;
        goto LABEL_16;
      }
    }
    else
    {
      v9 = objc_msgSend(v7, "isEqual:", v8);
      v10 = v9;
      if (a4)
      {
        v11 = v8;
        goto LABEL_16;
      }
      if (!v9)
      {
LABEL_12:
        -[ISDialogButton parameter](self, "parameter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "parameter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (v14 == v11)
          {
            LOBYTE(v10) = 1;
            v7 = v14;
            v11 = v14;
            goto LABEL_16;
          }
          LOBYTE(v10) = objc_msgSend(v14, "isEqual:", v11);
        }
        v7 = v14;
LABEL_16:

        goto LABEL_17;
      }
    }
    v12 = -[ISDialogButton actionType](self, "actionType");
    if (v12 == objc_msgSend(v6, "actionType"))
    {
      v13 = -[ISDialogButton urlType](self, "urlType");
      v10 = v13 == objc_msgSend(v6, "urlType");
    }
    else
    {
      v10 = 0;
    }
    goto LABEL_12;
  }
  LOBYTE(v10) = 0;
LABEL_17:

  return v10;
}

- (void)loadFromDictionary:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_dictionary, a3);
  objc_msgSend(v13, "objectForKey:", CFSTR("kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("action"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ISDialogButton setActionType:](self, "setActionType:", -[ISDialogButton _actionTypeForString:](self, "_actionTypeForString:", v5));
  objc_msgSend(v13, "objectForKey:", CFSTR("buyParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("buy-params"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ISDialogButton setParameter:](self, "setParameter:", v6);
  objc_msgSend(v13, "objectForKey:", CFSTR("code"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ISDialogButton setParameter:](self, "setParameter:", v8);
  objc_msgSend(v13, "objectForKey:", CFSTR("subtarget"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISDialogButton setSubtarget:](self, "setSubtarget:", v9);
    -[ISDialogButton setUrlType:](self, "setUrlType:", -[ISDialogButton _urlTypeForString:](self, "_urlTypeForString:", v9));
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDialogButton setParameter:](self, "setParameter:", v11);

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("tidContinue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_tidContinue = objc_msgSend(v12, "BOOLValue");
    if (objc_msgSend(v12, "BOOLValue"))
      -[ISDialogButton setUrlType:](self, "setUrlType:", 1);
  }

}

- (void)performDefaultActionForDialog:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  ISStoreURLOperation *v12;
  void *v13;
  void *v14;
  ISQRCodeDialog *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  ISOpenURLRequest *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  switch(-[ISDialogButton actionType](self, "actionType"))
  {
    case 1:
    case 2:
      -[ISDialogButton parameter](self, "parameter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
      }
      objc_msgSend(v4, "authenticationContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      if (-[ISDialogButton shouldContinueTouchIDSession](self, "shouldContinueTouchIDSession"))
      {
        objc_msgSend(v4, "touchIDContinueToken");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTouchIDContinueToken:", v9);

      }
      v10 = -[ISDialogButton urlType](self, "urlType");
      if (v10 == 2)
      {
        objc_msgSend(v5, "schemeSwizzledURL");
        v22 = objc_claimAutoreleasedReturnValue();

        if (SSIsDaemon())
        {
          v12 = objc_alloc_init(ISStoreURLOperation);
          +[ISDataProvider provider](ISProtocolDataProvider, "provider");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISURLOperation setDataProvider:](v12, "setDataProvider:", v23);

          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", v22);
          -[ISURLOperation setRequestProperties:](v12, "setRequestProperties:", v24);
          +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addOperation:", v12);

        }
        else
        {
          v32 = objc_alloc(MEMORY[0x24BEB1F30]);
          objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v22);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (ISStoreURLOperation *)objc_msgSend(v32, "initWithURLRequest:", v33);

          -[ISStoreURLOperation setITunesStoreRequest:](v12, "setITunesStoreRequest:", 1);
          -[ISStoreURLOperation setShouldProcessProtocol:](v12, "setShouldProcessProtocol:", 1);
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2000]), "initWithRequestProperties:", v12);
          objc_msgSend(v24, "start");
        }

        v5 = (void *)v22;
      }
      else
      {
        if (v10 == 1)
        {
          ISAccountURLWithURL(v5, v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[ISOpenURLRequest openURLRequestWithURL:](ISOpenURLRequest, "openURLRequestWithURL:", v11);
          v12 = (ISStoreURLOperation *)objc_claimAutoreleasedReturnValue();

          if (!v12)
            goto LABEL_34;
        }
        else
        {
          +[ISOpenURLRequest openURLRequestWithURL:](ISOpenURLRequest, "openURLRequestWithURL:", v5);
          v12 = (ISStoreURLOperation *)objc_claimAutoreleasedReturnValue();
          if (!v12)
            goto LABEL_34;
        }
        objc_msgSend(v8, "preferredITunesStoreClient");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISStoreURLOperation setTargetIdentifier:](v12, "setTargetIdentifier:", v26);

        if (-[ISDialogButton actionType](self, "actionType") == 2)
        {
          -[ISStoreURLOperation URL](v12, "URL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "urlByReplacingSchemeWithScheme:", CFSTR("itms-ui"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          -[ISStoreURLOperation setURL:](v12, "setURL:", v28);
        }
        -[ISDialogButton _openURLWithRequest:](self, "_openURLWithRequest:", v12);
      }

LABEL_34:
LABEL_39:

      return;
    case 3:
      v13 = (void *)MEMORY[0x24BEB1F78];
      -[ISDialogButton parameter](self, "parameter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "purchaseWithBuyParameters:", v14);
      v15 = (ISQRCodeDialog *)objc_claimAutoreleasedReturnValue();

      if ((SSIsDaemon() & 1) != 0)
      {
        -[objc_class sharedController](NSClassFromString(CFSTR("PurchaseController")), "sharedController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v15;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addPurchases:", v17);
        goto LABEL_23;
      }
      v29 = objc_alloc(MEMORY[0x24BEB1F88]);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v15);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v29, "initWithPurchases:", v30);

      v31 = v16;
      goto LABEL_36;
    case 4:
      -[ISDialogButton parameter](self, "parameter");
      v15 = (ISQRCodeDialog *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
        v18 = objc_claimAutoreleasedReturnValue();

        v15 = (ISQRCodeDialog *)v18;
      }
      v19 = -[ISOpenURLRequest initWithURL:]([ISOpenURLRequest alloc], "initWithURL:", v15);
      -[ISOpenURLRequest setITunesStoreURL:](v19, "setITunesStoreURL:", 0);
      -[ISDialogButton _openURLWithRequest:](self, "_openURLWithRequest:", v19);

      goto LABEL_38;
    case 6:
      v15 = -[ISDialog initWithDialogDictionary:]([ISQRCodeDialog alloc], "initWithDialogDictionary:", self->_dictionary);
      +[ISDialogOperation operationWithDialog:](ISDialogOperation, "operationWithDialog:", v15);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 9:
      objc_msgSend(MEMORY[0x24BEB1E18], "retryAllRestoreDownloads");
      goto LABEL_39;
    case 0xB:
      -[ISDialogButton parameter](self, "parameter");
      v15 = (ISQRCodeDialog *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
        v21 = objc_claimAutoreleasedReturnValue();

        v15 = (ISQRCodeDialog *)v21;
      }
      if (!v15)
        goto LABEL_38;
      if ((SSIsDaemon() & 1) != 0)
      {
        v20 = objc_msgSend(objc_alloc(NSClassFromString(CFSTR("AskPermissionActionOperation"))), "initWithURL:", v15);
LABEL_22:
        v16 = (void *)v20;
        +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addOperation:", v16);
LABEL_23:

      }
      else
      {
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DB0]), "initWithURL:", v15);
        v16 = v31;
LABEL_36:
        objc_msgSend(v31, "start");
      }

LABEL_38:
      goto LABEL_39;
    default:
      goto LABEL_39;
  }
}

- (void)setActionTypeWithString:(id)a3
{
  -[ISDialogButton setActionType:](self, "setActionType:", -[ISDialogButton _actionTypeForString:](self, "_actionTypeForString:", a3));
}

- (int)_actionTypeForString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Buy")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OpenURL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("goback")))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QRCode")) & 1) != 0)
    {
      v4 = 6;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("redeem-code")) & 1) != 0)
    {
      v4 = 7;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RetryRestoreAll")) & 1) != 0)
    {
      v4 = 9;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Review")) & 1) != 0)
    {
      v4 = 8;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Goto")) & 1) != 0)
    {
      v4 = 1;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GotoFinance")) & 1) != 0)
    {
      v4 = 2;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ServiceAction")) & 1) != 0)
    {
      v4 = 10;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FamilyPermissionAction")))
    {
      v4 = 11;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

- (void)_openURLWithRequest:(id)a3
{
  id v3;
  void *v4;
  ISOpenURLOperation *v5;

  v3 = a3;
  v5 = -[ISOpenURLOperation initWithOpenURLRequest:]([ISOpenURLOperation alloc], "initWithOpenURLRequest:", v3);

  +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v5);

}

- (int64_t)_urlTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", *MEMORY[0x24BEB21F0]) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "hasPrefix:", *MEMORY[0x24BEB21F8]))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (ISDialogButton)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  ISDialogButton *v6;
  uint64_t v8;
  NSDictionary *dictionary;
  uint64_t v10;
  NSString *subtarget;
  uint64_t v12;
  NSString *title;
  unsigned int actionType;
  int v15;
  uint64_t v16;
  id parameter;
  uint64_t v18;

  v4 = a3;
  v5 = v4;
  if (!v4 || MEMORY[0x20BD37E20](v4) != MEMORY[0x24BDACFA0])
  {
    v6 = 0;
LABEL_4:

    goto LABEL_5;
  }
  v6 = -[ISDialogButton init](self, "init");
  if (v6)
  {
    v6->_actionType = xpc_dictionary_get_int64(v5, "0");
    objc_opt_class();
    v8 = SSXPCDictionaryCopyCFObjectWithClass();
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v8;

    objc_opt_class();
    v10 = SSXPCDictionaryCopyCFObjectWithClass();
    subtarget = v6->_subtarget;
    v6->_subtarget = (NSString *)v10;

    v6->_tidContinue = xpc_dictionary_get_BOOL(v5, "6");
    objc_opt_class();
    v12 = SSXPCDictionaryCopyCFObjectWithClass();
    title = v6->_title;
    v6->_title = (NSString *)v12;

    v6->_urlType = xpc_dictionary_get_int64(v5, "5");
    actionType = v6->_actionType;
    if (actionType <= 0xB)
    {
      v15 = 1 << actionType;
      if ((v15 & 0xC12) != 0)
      {
        objc_opt_class();
        self = (ISDialogButton *)SSXPCDictionaryCopyCFObjectWithClass();
        if (self)
        {
          v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", self);
          parameter = v6->_parameter;
          v6->_parameter = (id)v16;

        }
      }
      else
      {
        if ((v15 & 0x88) == 0)
          goto LABEL_5;
        objc_opt_class();
        v18 = SSXPCDictionaryCopyCFObjectWithClass();
        self = (ISDialogButton *)v6->_parameter;
        v6->_parameter = (id)v18;
      }
      goto LABEL_4;
    }
  }
LABEL_5:

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  void *v4;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_actionType);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "6", self->_tidContinue);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_int64(v3, "5", self->_urlType);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(self->_parameter, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SSXPCDictionarySetCFObject();

  }
  else
  {
    SSXPCDictionarySetCFObject();
  }
  return v3;
}

- (int)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int)a3
{
  self->_actionType = a3;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)parameter
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setParameter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)shouldContinueTouchIDSession
{
  return self->_tidContinue;
}

- (NSString)subtarget
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubtarget:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)urlType
{
  return self->_urlType;
}

- (void)setUrlType:(int64_t)a3
{
  self->_urlType = a3;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_subtarget, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_parameter, 0);
}

@end
