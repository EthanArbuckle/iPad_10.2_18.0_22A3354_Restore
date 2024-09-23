@implementation PDXPCApplicationInfo

- (PDXPCApplicationInfo)init
{

  return 0;
}

- (PDXPCApplicationInfo)initWithPID:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PDXPCApplicationInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *displayID;
  PDXPCApplicationInfo *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  objc_super v22;

  objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "currentState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v22.receiver = self;
        v22.super_class = (Class)PDXPCApplicationInfo;
        v8 = -[PDXPCApplicationInfo init](&v22, sel_init);
        if (v8)
        {
          v8->_running = objc_msgSend(v7, "taskState") == 4;
          objc_msgSend(v7, "endowmentNamespaces");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v8->_visible = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D22E58]);

          objc_msgSend(v6, "identity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "embeddedApplicationIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v11;
            displayID = v8->_displayID;
            v8->_displayID = v13;
          }
          else
          {
            objc_msgSend(v10, "xpcServiceIdentifier");
            v16 = (NSString *)objc_claimAutoreleasedReturnValue();
            displayID = v16;
            if (v16)
            {
              v17 = v16;
              v18 = v8->_displayID;
              v8->_displayID = v17;
            }
            else
            {
              objc_msgSend(v6, "bundle");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = v8->_displayID;
              v8->_displayID = (NSString *)v19;

            }
          }

        }
        self = v8;
        v15 = self;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)displayID
{
  return self->_displayID;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayID, 0);
}

@end
