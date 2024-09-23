@implementation SLDCollaborationFooterService

+ (id)remoteObjectProtocol
{
  return &unk_1EE38B538;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_0);
  return (id)sharedService_sService;
}

void __46__SLDCollaborationFooterService_sharedService__block_invoke()
{
  SLDCollaborationFooterService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDCollaborationFooterService);
  v1 = (void *)sharedService_sService;
  sharedService_sService = (uint64_t)v0;

}

- (UISSlotMachine)footerViewSlotMachine
{
  UISSlotMachine *footerViewSlotMachine;
  id v4;
  SLDCollaborationFooterSlotDrawer *v5;
  UISSlotMachine *v6;
  UISSlotMachine *v7;

  footerViewSlotMachine = self->_footerViewSlotMachine;
  if (!footerViewSlotMachine)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC5C50]);
    v5 = objc_alloc_init(SLDCollaborationFooterSlotDrawer);
    v6 = (UISSlotMachine *)objc_msgSend(v4, "initWithSlotDrawer:options:", v5, 0);
    v7 = self->_footerViewSlotMachine;
    self->_footerViewSlotMachine = v6;

    footerViewSlotMachine = self->_footerViewSlotMachine;
  }
  return footerViewSlotMachine;
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
    -[SLDCollaborationFooterService footerViewSlotMachine](self, "footerViewSlotMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)footerViewForModel:(id)a3 style:(id)a4 maxWidth:(double)a5 layerContextID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  SLDCollaborationFooterService *v27;
  id v28;
  void (**v29)(id, _QWORD);
  unint64_t v30;

  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD))a7;
  if (a5 <= 0.0)
  {
    SLDaemonLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationFooterService footerViewForModel:style:maxWidth:layerContextID:reply:].cold.1((uint64_t)self, v18, v19, v20, v21, v22, v23, v24);

    v14[2](v14, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_class();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __88__SLDCollaborationFooterService_footerViewForModel_style_maxWidth_layerContextID_reply___block_invoke;
    v25[3] = &unk_1E37944C0;
    v26 = v13;
    v27 = self;
    v28 = v15;
    v30 = a6;
    v29 = v14;
    v17 = v15;
    objc_msgSend(v16, "slotForModel:maxWidth:completion:", v12, v25, a5);

  }
}

void __88__SLDCollaborationFooterService_footerViewForModel_style_maxWidth_layerContextID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "resolvedStyleForStyle:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_viewIDForStyle:tag:", v7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_connection:onlyNeedsViewWithIdentifier:", *(_QWORD *)(a1 + 48), v5);
  objc_msgSend(*(id *)(a1 + 40), "_remoteContentForViewIdentifier:layerContextID:connection:", v5, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "_connectionTouchedView:", v5);

}

+ (void)slotForModel:(id)a3 maxWidth:(double)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, SLDCollaborationFooterSlotTag *);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SLDCollaborationFooterSlotTag *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, SLDCollaborationFooterSlotTag *))a5;
  v10 = objc_msgSend(v8, "type");
  if ((unint64_t)(v10 - 1) < 2)
  {
    objc_msgSend(a1, "slotForModelNeedingNameAndEmail:maxWidth:completion:", v8, v9, a4);
  }
  else
  {
    if (v10 == 3)
    {
      objc_msgSend(v8, "optionsSummary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "initiatorNameComponents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)objc_opt_class();
        objc_msgSend(v8, "metadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "initiatorNameComponents");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "nameFromNameComponents:", v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        SLDaemonLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "metadata");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v21;
          _os_log_impl(&dword_199EFF000, v20, OS_LOG_TYPE_DEFAULT, "Metadata has no initiator name components: %@", buf, 0xCu);

        }
        v13 = 0;
      }
      objc_msgSend(v8, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "initiatorHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      if (v13 && v14)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        SLFrameworkBundle();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SHARE_AS"), &stru_1E3797070, CFSTR("SocialLayer"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v25, v13, v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (v10)
    {
      v13 = 0;
      v11 = 0;
      v14 = 0;
      v12 = 0;
    }
    else
    {
      objc_msgSend(v8, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v14 = 0;
    }
    v26 = -[SLDCollaborationFooterSlotTag initWithTitle:subtitle:maxWidth:]([SLDCollaborationFooterSlotTag alloc], "initWithTitle:subtitle:maxWidth:", v11, v12, a4);
    v9[2](v9, v26);

  }
}

+ (id)nameFromNameComponents:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", a3, 0, 0);
}

+ (void)slotForModelNeedingNameAndEmail:(id)a3 maxWidth:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id CloudSharingClass;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  SLDCollaborationFooterSlotTag *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  double v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  SLDaemonLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_DEFAULT, "Beginning fetch of name and email", buf, 2u);
  }

  getCloudSharingClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    CloudSharingClass = getCloudSharingClass();
    objc_msgSend(v7, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerSetupInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__SLDCollaborationFooterService_slotForModelNeedingNameAndEmail_maxWidth_completion___block_invoke;
    v16[3] = &unk_1E37944E8;
    v17 = v7;
    v19 = a4;
    v18 = v8;
    objc_msgSend(CloudSharingClass, "userNameAndEmail:containerSetupInfo:completionHandler:", v11, v12, v16);

    v13 = v17;
  }
  else
  {
    SLDaemonLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SLDCollaborationFooterService slotForModelNeedingNameAndEmail:maxWidth:completion:].cold.1(v14);

    objc_msgSend(v7, "optionsSummary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SLDCollaborationFooterSlotTag initWithTitle:subtitle:maxWidth:]([SLDCollaborationFooterSlotTag alloc], "initWithTitle:subtitle:maxWidth:", v13, &stru_1E3797070, a4);
    (*((void (**)(id, SLDCollaborationFooterSlotTag *))v8 + 2))(v8, v15);

  }
}

void __85__SLDCollaborationFooterService_slotForModelNeedingNameAndEmail_maxWidth_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SLDCollaborationFooterSlotTag *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "optionsSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && v7 && !v9)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    SLFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SHARE_AS"), &stru_1E3797070, CFSTR("SocialLayer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v13, v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SLDaemonLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __85__SLDCollaborationFooterService_slotForModelNeedingNameAndEmail_maxWidth_completion___block_invoke_cold_1((uint64_t)v9, v15, v16, v17, v18, v19, v20, v21);

    v14 = 0;
  }
  v22 = -[SLDCollaborationFooterSlotTag initWithTitle:subtitle:maxWidth:]([SLDCollaborationFooterSlotTag alloc], "initWithTitle:subtitle:maxWidth:", v10, v14, *(double *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setFooterViewSlotMachine:(id)a3
{
  objc_storeStrong((id *)&self->_footerViewSlotMachine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerViewSlotMachine, 0);
}

- (void)footerViewForModel:(uint64_t)a3 style:(uint64_t)a4 maxWidth:(uint64_t)a5 layerContextID:(uint64_t)a6 reply:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a2, a3, "[SLDCollaborationFooterService: %p] 0.0 was provided for the max width of the requested view. This is undefined behavior and should be sanitized before invoking this xpc interface!", a5, a6, a7, a8, 0);
}

+ (void)slotForModelNeedingNameAndEmail:(os_log_t)log maxWidth:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "Missing CloudSharing support", v1, 2u);
}

void __85__SLDCollaborationFooterService_slotForModelNeedingNameAndEmail_maxWidth_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a2, a3, "Failed to fetch name and email: %@", a5, a6, a7, a8, 2u);
}

@end
