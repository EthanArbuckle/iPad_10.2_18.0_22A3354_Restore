@implementation SLDPillService

+ (id)remoteObjectProtocol
{
  return &unk_1EE3993A0;
}

+ (id)sharedService
{
  if (sharedService_onceToken_5 != -1)
    dispatch_once(&sharedService_onceToken_5, &__block_literal_global_12);
  return (id)sharedService_sService_5;
}

void __31__SLDPillService_sharedService__block_invoke()
{
  SLDPillService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDPillService);
  v1 = (void *)sharedService_sService_5;
  sharedService_sService_5 = (uint64_t)v0;

}

- (UISSlotMachine)highlightPillSlotMachine
{
  UISSlotMachine *highlightPillSlotMachine;
  id v4;
  SLDHighlightPillSlotDrawer *v5;
  UISSlotMachine *v6;
  UISSlotMachine *v7;

  highlightPillSlotMachine = self->_highlightPillSlotMachine;
  if (!highlightPillSlotMachine)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC5C50]);
    v5 = objc_alloc_init(SLDHighlightPillSlotDrawer);
    v6 = (UISSlotMachine *)objc_msgSend(v4, "initWithSlotDrawer:options:", v5, 0);
    v7 = self->_highlightPillSlotMachine;
    self->_highlightPillSlotMachine = v6;

    highlightPillSlotMachine = self->_highlightPillSlotMachine;
  }
  return highlightPillSlotMachine;
}

- (UISSlotMachine)highlightDisambiguationPillSlotMachine
{
  UISSlotMachine *highlightDisambiguationPillSlotMachine;
  id v4;
  SLDHighlightDisambiguationPillSlotDrawer *v5;
  UISSlotMachine *v6;
  UISSlotMachine *v7;

  highlightDisambiguationPillSlotMachine = self->_highlightDisambiguationPillSlotMachine;
  if (!highlightDisambiguationPillSlotMachine)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC5C50]);
    v5 = objc_alloc_init(SLDHighlightDisambiguationPillSlotDrawer);
    v6 = (UISSlotMachine *)objc_msgSend(v4, "initWithSlotDrawer:options:", v5, 0);
    v7 = self->_highlightDisambiguationPillSlotMachine;
    self->_highlightDisambiguationPillSlotMachine = v6;

    highlightDisambiguationPillSlotMachine = self->_highlightDisambiguationPillSlotMachine;
  }
  return highlightDisambiguationPillSlotMachine;
}

- (void)highlightPillForAttributionIdentifiers:(id)a3 style:(id)a4 maxWidth:(double)a5 variant:(unint64_t)a6 layerContextID:(unint64_t)a7 reply:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  SLHighlightPillMetrics *v30;

  v14 = a3;
  v15 = a4;
  v16 = (void (**)(id, _QWORD))a8;
  if (a5 <= 0.0)
  {
    SLDaemonLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:].cold.4();

    v16[2](v16, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDPillService _applicationIdentifierForConnection:](self, "_applicationIdentifierForConnection:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[SLDPillService _attributionsFromIDs:appID:](self, "_attributionsFromIDs:appID:", v14, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");
      if (v17 && v20)
      {
        v29 = v19;
        +[SLDHighlightPillSlotTag tagForHighlightAttributions:maxWidth:maxSendersToDisplay:variant:](SLDHighlightPillSlotTag, "tagForHighlightAttributions:maxWidth:maxSendersToDisplay:variant:", v19, +[SLHighlightPillMetrics maxSendersToDisplayWithStyle:variant:](SLHighlightPillMetrics, "maxSendersToDisplayWithStyle:variant:", v15, a6), a6, a5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "resolvedStyleForStyle:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[SLHighlightPillMetrics initWithSlotStyle:tag:variant:]([SLHighlightPillMetrics alloc], "initWithSlotStyle:tag:variant:", v15, v21, a6);
        if (-[SLHighlightPillMetrics hasValidMetricsForDrawing](v30, "hasValidMetricsForDrawing"))
        {
          -[SLDRemoteRenderingService _viewIDForStyle:tag:](self, "_viewIDForStyle:tag:", v22, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLDRemoteRenderingService _connection:onlyNeedsViewWithIdentifier:](self, "_connection:onlyNeedsViewWithIdentifier:", v17, v23);
          -[SLDRemoteRenderingService _remoteContentForViewIdentifier:layerContextID:connection:](self, "_remoteContentForViewIdentifier:layerContextID:connection:", v23, a7, v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *))v16)[2](v16, v24);
          -[SLDRemoteRenderingService _connectionTouchedView:](self, "_connectionTouchedView:", v23);
          CTFontRemoveFromCaches();
          CGFontCacheGetLocalCache();
          CGFontCacheReset();

        }
        else
        {
          SLDaemonLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:].cold.2((uint64_t)self, v28, a5);

          v16[2](v16, 0);
        }

        v19 = v29;
      }
      else
      {
        SLDaemonLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:].cold.3();

        v16[2](v16, 0);
      }

    }
    else
    {
      SLDaemonLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:].cold.1();

      v16[2](v16, 0);
    }

  }
}

- (void)highlightDisambiguationPillForAttributionIdentifier:(id)a3 style:(id)a4 maxWidth:(double)a5 variant:(unint64_t)a6 layerContextID:(unint64_t)a7 reply:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  void *v17;
  void *v18;
  SLHighlightCenter *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  SLHighlightCenter *v29;

  v14 = a3;
  v15 = a4;
  v16 = (void (**)(id, _QWORD))a8;
  if (a5 <= 0.0)
  {
    SLDaemonLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:].cold.4();

    v16[2](v16, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDPillService _applicationIdentifierForConnection:](self, "_applicationIdentifierForConnection:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = -[SLHighlightCenter initWithAppIdentifier:]([SLHighlightCenter alloc], "initWithAppIdentifier:", v18);
      -[SLHighlightCenter fetchAttributionForAttributionIdentifier:](v19, "fetchAttributionForAttributionIdentifier:", v14);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v17 && v20)
      {
        +[SLDHighlightDisambiguationPillSlotTag tagForHighlightAttribution:maxWidth:variant:](SLDHighlightDisambiguationPillSlotTag, "tagForHighlightAttribution:maxWidth:variant:", v20, a6, a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "resolvedStyleForStyle:", v15);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDRemoteRenderingService _viewIDForStyle:tag:](self, "_viewIDForStyle:tag:", v28, v22);
        v29 = v19;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDRemoteRenderingService _connection:onlyNeedsViewWithIdentifier:](self, "_connection:onlyNeedsViewWithIdentifier:", v17, v23);
        -[SLDRemoteRenderingService _remoteContentForViewIdentifier:layerContextID:connection:](self, "_remoteContentForViewIdentifier:layerContextID:connection:", v23, a7, v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *))v16)[2](v16, v24);
        -[SLDRemoteRenderingService _connectionTouchedView:](self, "_connectionTouchedView:", v23);
        CTFontRemoveFromCaches();
        CGFontCacheGetLocalCache();
        CGFontCacheReset();

        v19 = v29;
      }
      else
      {
        SLDaemonLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:].cold.3();

        v16[2](v16, 0);
      }

    }
    else
    {
      SLDaemonLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:].cold.1();

      v16[2](v16, 0);
    }

  }
}

- (void)accessibilityLabelForAttributionIdentifiers:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SLDConnectionIsEntitledForAccessibility(v7) & 1) != 0)
  {
    -[SLDPillService _attributionsFromIDs:appID:](self, "_attributionsFromIDs:appID:", v13, CFSTR("accessibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v7)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (v10)
    {
      v6[2](v6, 0);
    }
    else
    {
      +[SLDHighlightPillSlotTag tagForHighlightAttributions:maxWidth:maxSendersToDisplay:variant:](SLDHighlightPillSlotTag, "tagForHighlightAttributions:maxWidth:maxSendersToDisplay:variant:", v8, 3, 0, 1000.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SLHighlightPillMetrics accessibilityLabelFor:](SLHighlightPillMetrics, "accessibilityLabelFor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v6)[2](v6, v12);

    }
  }
  else
  {
    v6[2](v6, 0);
    objc_msgSend(v7, "invalidate");
  }

}

- (void)accessibilityLabelForAttributionIdentifier:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  SLHighlightCenter *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SLDConnectionIsEntitledForAccessibility(v6) & 1) != 0)
  {
    v7 = -[SLHighlightCenter initWithAppIdentifier:]([SLHighlightCenter alloc], "initWithAppIdentifier:", CFSTR("accessibility"));
    -[SLHighlightCenter fetchAttributionForAttributionIdentifier:](v7, "fetchAttributionForAttributionIdentifier:", v12);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6 && v8)
    {
      +[SLDHighlightDisambiguationPillSlotTag tagForHighlightAttribution:maxWidth:variant:](SLDHighlightDisambiguationPillSlotTag, "tagForHighlightAttribution:maxWidth:variant:", v8, 0, 1000.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SLHighlightDisambiguationPillMetrics accessibilityLabelFor:](SLHighlightDisambiguationPillMetrics, "accessibilityLabelFor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v11);

    }
    else
    {
      v5[2](v5, 0);
    }

  }
  else
  {
    v5[2](v5, 0);
    objc_msgSend(v6, "invalidate");
  }

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

- (id)slotMachineForViewIdentifier:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SLDPillService highlightPillSlotMachine](self, "highlightPillSlotMachine");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "tag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[SLDPillService highlightDisambiguationPillSlotMachine](self, "highlightDisambiguationPillSlotMachine");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;
LABEL_7:

  return v10;
}

- (void)setHighlightPillSlotMachine:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPillSlotMachine, a3);
}

- (void)setHighlightDisambiguationPillSlotMachine:(id)a3
{
  objc_storeStrong((id *)&self->_highlightDisambiguationPillSlotMachine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightDisambiguationPillSlotMachine, 0);
  objc_storeStrong((id *)&self->_highlightPillSlotMachine, 0);
}

- (void)highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDPillService: %p] Cannot generate a pill without an application identifier for the client.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)highlightPillForAttributionIdentifiers:(double)a3 style:maxWidth:variant:layerContextID:reply:.cold.2(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "[SLDPillService: %p] metrics for the given request are invalid. This may mean the maxWidth provided was invalid (maxWidth: %f). No pill will be drawn.", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDPillService: %p] Cannot generate a pill without attributions.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDPillService: %p] 0.0 was provided for the max width of the requested pill. This is undefined behavior and should be sanitized before invoking this xpc interface!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_applicationIdentifierForConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  v9 = 2048;
  v10 = a1;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_199EFF000, a3, OS_LOG_TYPE_ERROR, "[%@: %p] Failed to generate a bundle record, or the record's app ID is nil. This is required to look up attribution data. Error: %@", v8, 0x20u);

}

@end
