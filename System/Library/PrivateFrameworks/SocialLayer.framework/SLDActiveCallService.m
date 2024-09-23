@implementation SLDActiveCallService

+ (id)remoteObjectProtocol
{
  return &unk_1EE39CA60;
}

+ (id)sharedService
{
  if (sharedService_onceToken_8 != -1)
    dispatch_once(&sharedService_onceToken_8, &__block_literal_global_19);
  return (id)sharedService_sService_8;
}

void __37__SLDActiveCallService_sharedService__block_invoke()
{
  SLDActiveCallService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDActiveCallService);
  v1 = (void *)sharedService_sService_8;
  sharedService_sService_8 = (uint64_t)v0;

}

- (UISSlotMachine)activeCallViewSlotMachine
{
  UISSlotMachine *activeCallViewSlotMachine;
  id v4;
  SLDActiveCallViewSlotDrawer *v5;
  UISSlotMachine *v6;
  UISSlotMachine *v7;

  activeCallViewSlotMachine = self->_activeCallViewSlotMachine;
  if (!activeCallViewSlotMachine)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC5C50]);
    v5 = objc_alloc_init(SLDActiveCallViewSlotDrawer);
    v6 = (UISSlotMachine *)objc_msgSend(v4, "initWithSlotDrawer:options:", v5, 0);
    v7 = self->_activeCallViewSlotMachine;
    self->_activeCallViewSlotMachine = v6;

    activeCallViewSlotMachine = self->_activeCallViewSlotMachine;
  }
  return activeCallViewSlotMachine;
}

- (void)activeCallViewForStyle:(id)a3 maxWidth:(double)a4 layerContextID:(unint64_t)a5 reply:(id)a6
{
  id v10;
  void *v11;
  void (**v12)(id, void *);
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v10 = a3;
  if (a4 <= 0.0)
  {
    v13 = (void (**)(id, _QWORD))a6;
    SLDaemonLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SLDActiveCallService activeCallViewForStyle:maxWidth:layerContextID:reply:].cold.1((uint64_t)self, v18);

    v13[2](v13, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3B38];
    v12 = (void (**)(id, void *))a6;
    objc_msgSend(v11, "currentConnection");
    v13 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    -[SLDActiveCallService _lookupActiveTUConversation](self, "_lookupActiveTUConversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "messagesGroupPhotoData");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "displayName");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
      v17 = &stru_1E3797070;
    }
    v24 = (void *)v16;
    +[SLDActiveCallViewSlotTag tagForMaxWidth:callActive:activeCallGroupPhotoData:activeCallDisplayName:](SLDActiveCallViewSlotTag, "tagForMaxWidth:callActive:activeCallGroupPhotoData:activeCallDisplayName:", v15 != 0, v16, v17, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resolvedStyleForStyle:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDRemoteRenderingService _viewIDForStyle:tag:](self, "_viewIDForStyle:tag:", v20, v19);
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDRemoteRenderingService _connection:onlyNeedsViewWithIdentifier:](self, "_connection:onlyNeedsViewWithIdentifier:", v13, v22);
    -[SLDRemoteRenderingService _remoteContentForViewIdentifier:layerContextID:connection:](self, "_remoteContentForViewIdentifier:layerContextID:connection:", v22, a5, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v23);

    -[SLDRemoteRenderingService _connectionTouchedView:](self, "_connectionTouchedView:", v22);
    v10 = v21;

  }
}

- (id)slotMachineForViewIdentifier:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;

  objc_msgSend(a3, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SLDActiveCallService activeCallViewSlotMachine](self, "activeCallViewSlotMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_lookupActiveTUConversation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v3, "activeConversations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "state") == 3)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)setActiveCallViewSlotMachine:(id)a3
{
  objc_storeStrong((id *)&self->_activeCallViewSlotMachine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCallViewSlotMachine, 0);
}

- (void)activeCallViewForStyle:(uint64_t)a1 maxWidth:(NSObject *)a2 layerContextID:reply:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "[SLDActiveCallService: %p] 0.0 was provided for the max width of the requested view. This is undefined behavior and should be sanitized before invoking this xpc interface!", (uint8_t *)&v2, 0xCu);
}

@end
