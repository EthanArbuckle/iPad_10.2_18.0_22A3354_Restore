@implementation SLDCollaborationAttributionViewService

+ (id)remoteObjectProtocol
{
  return &unk_1EE39FA08;
}

+ (id)sharedService
{
  if (sharedService_onceToken_10 != -1)
    dispatch_once(&sharedService_onceToken_10, &__block_literal_global_21);
  return (id)sharedService_sService_10;
}

void __55__SLDCollaborationAttributionViewService_sharedService__block_invoke()
{
  SLDCollaborationAttributionViewService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDCollaborationAttributionViewService);
  v1 = (void *)sharedService_sService_10;
  sharedService_sService_10 = (uint64_t)v0;

}

+ (void)setupInterface:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_collaborationAttributionViewForTitle_attributionIdentifiers_style_placeholderGlyphConfiguration_maxWidth_variant_layerContextID_reply_, 4, 0);

}

- (void)collaborationAttributionViewForTitle:(id)a3 attributionIdentifiers:(id)a4 style:(id)a5 placeholderGlyphConfiguration:(id)a6 maxWidth:(double)a7 variant:(int64_t)a8 layerContextID:(unint64_t)a9 reply:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(id, _QWORD);
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  id v37;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = (void (**)(id, _QWORD))a10;
  if (a7 <= 0.0)
  {
    SLDaemonLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationAttributionViewService collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:].cold.4();

    v21[2](v21, 0);
  }
  else
  {
    v37 = v17;
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDCollaborationAttributionViewService _applicationIdentifierForConnection:](self, "_applicationIdentifierForConnection:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[SLDCollaborationAttributionViewService _attributionsFromIDs:appID:](self, "_attributionsFromIDs:appID:", v18, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");
      if (v22 && v25)
      {
        +[SLDCollaborationAttributionViewSlotTag tagForTitle:attributions:placeholderGlyphConfiguration:maxWidth:variant:](SLDCollaborationAttributionViewSlotTag, "tagForTitle:attributions:placeholderGlyphConfiguration:maxWidth:variant:", v37, v24, v20, a8, a7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[SLDCollaborationAttributionViewSlotDrawer resolvedStyleForStyle:tag:](SLDCollaborationAttributionViewSlotDrawer, "resolvedStyleForStyle:tag:", v19, v26);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDRemoteRenderingService _viewIDForStyle:tag:](self, "_viewIDForStyle:tag:", v35, v26);
        v36 = v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDRemoteRenderingService _connection:onlyNeedsViewWithIdentifier:](self, "_connection:onlyNeedsViewWithIdentifier:", v22, v27);
        -[SLDRemoteRenderingService _remoteContentForViewIdentifier:layerContextID:connection:](self, "_remoteContentForViewIdentifier:layerContextID:connection:", v27, a9, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *))v21)[2](v21, v28);
        -[SLDRemoteRenderingService _connectionTouchedView:](self, "_connectionTouchedView:", v27);

        v29 = v36;
      }
      else
      {
        v29 = v24;
        v32 = objc_msgSend(v18, "count");
        SLDaemonLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
        if (v32)
        {
          if (v34)
            -[SLDCollaborationAttributionViewService collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:].cold.3();
        }
        else if (v34)
        {
          -[SLDCollaborationAttributionViewService collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:].cold.2();
        }

        v21[2](v21, 0);
      }

    }
    else
    {
      SLDaemonLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[SLDCollaborationAttributionViewService collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:].cold.1();

      v21[2](v21, 0);
    }

    v17 = v37;
  }

}

- (void)accessibilityLabelForAttributionIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SLDConnectionIsEntitledForAccessibility(v8) & 1) != 0)
  {
    -[SLDCollaborationAttributionViewService _attributionsFromIDs:appID:](self, "_attributionsFromIDs:appID:", v6, CFSTR("accessibility"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    if (v8)
      v11 = v10 == 0;
    else
      v11 = 1;
    if (v11)
    {
      v12 = objc_msgSend(v6, "count");
      SLDaemonLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v14)
          -[SLDCollaborationAttributionViewService accessibilityLabelForAttributionIdentifiers:reply:].cold.2();
      }
      else if (v14)
      {
        -[SLDCollaborationAttributionViewService accessibilityLabelForAttributionIdentifiers:reply:].cold.1();
      }

      v7[2](v7, 0);
    }
    else
    {
      +[SLDImageSymbolConfiguration configurationWithName:coreUISize:weight:pointSize:](SLDImageSymbolConfiguration, "configurationWithName:coreUISize:weight:pointSize:", CFSTR("person.crop.circle.badge.checkmark"), 0, 0, 12.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[SLDCollaborationAttributionViewSlotTag tagForTitle:attributions:placeholderGlyphConfiguration:maxWidth:variant:](SLDCollaborationAttributionViewSlotTag, "tagForTitle:attributions:placeholderGlyphConfiguration:maxWidth:variant:", &stru_1E3797070, v9, v16, 0, 1000.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[SLDCollaborationAttributionViewRenderer accessibilityLabelForTag:](SLDCollaborationAttributionViewRenderer, "accessibilityLabelForTag:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v7)[2](v7, v18);

    }
  }
  else
  {
    SLDaemonLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationAttributionViewService accessibilityLabelForAttributionIdentifiers:reply:].cold.3();

    v7[2](v7, 0);
    objc_msgSend(v8, "invalidate");
  }

}

- (UISSlotMachine)slotMachine
{
  UISSlotMachine *slotMachine;
  id v4;
  SLDCollaborationAttributionViewSlotDrawer *v5;
  UISSlotMachine *v6;
  UISSlotMachine *v7;

  slotMachine = self->_slotMachine;
  if (!slotMachine)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC5C50]);
    v5 = objc_alloc_init(SLDCollaborationAttributionViewSlotDrawer);
    v6 = (UISSlotMachine *)objc_msgSend(v4, "initWithSlotDrawer:options:", v5, 0);
    v7 = self->_slotMachine;
    self->_slotMachine = v6;

    slotMachine = self->_slotMachine;
  }
  return slotMachine;
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
    -[SLDCollaborationAttributionViewService slotMachine](self, "slotMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_applicationIdentifierForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  _OWORD v14[2];

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CA5898];
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  v13 = 0;
  objc_msgSend(v6, "bundleRecordForAuditToken:error:", v14, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(v7, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLDPillService _applicationIdentifierForConnection:].cold.1((uint64_t)self, (uint64_t)v8, v10);

  }
  objc_msgSend(v7, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_attributionsFromIDs:(id)a3 appID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  SLHighlightCenter *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SLHighlightCenter initWithAppIdentifier:]([SLHighlightCenter alloc], "initWithAppIdentifier:", v6);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[SLHighlightCenter fetchAttributionForAttributionIdentifier:](v8, "fetchAttributionForAttributionIdentifier:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v7, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  return v15;
}

- (void)setSlotMachine:(id)a3
{
  objc_storeStrong((id *)&self->_slotMachine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotMachine, 0);
}

- (void)collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationAttributionViewService: %p] Cannot generate a collaboration attribution view remote content without an application identifier for the client.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationAttributionViewService: %p] No attribution IDs were given. This is a client-side bug and appropriate checks should be in place to prevent this. Not generating collaboration attribution view remote content", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "[SLDCollaborationAttributionViewService: %p] Not generating collaboration attribution view remote content because there were no attributions for the given attribution IDs. This could be because the highlight center failed to fetch the corresponding attributions. attributionIDs: %@");
  OUTLINED_FUNCTION_5();
}

- (void)collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationAttributionViewService: %p] 0.0 was provided for the max width of the requested view. This is undefined behavior and should be sanitized before invoking this xpc interface!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)accessibilityLabelForAttributionIdentifiers:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationAttributionViewService: %p] No attribution IDs were given. This is a client-side bug and appropriate checks should be in place to prevent this. Not generating collaboration attribution accessibility label", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)accessibilityLabelForAttributionIdentifiers:reply:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "[SLDCollaborationAttributionViewService: %p] Not generating collaboration attribution accessibility label because there were no attributions for the given attribution IDs. This could be because the highlight center failed to fetch the corresponding attributions. attributionIDs: %@");
  OUTLINED_FUNCTION_5();
}

- (void)accessibilityLabelForAttributionIdentifiers:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationAttributionViewService: %p] Cannot generate a collaboration attribution accessibility label for a connection without an accessibility entitlement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
