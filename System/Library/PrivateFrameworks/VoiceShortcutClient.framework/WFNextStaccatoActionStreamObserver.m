@implementation WFNextStaccatoActionStreamObserver

- (BOOL)isObserving
{
  void *v2;
  BOOL v3;

  -[WFNextStaccatoActionStreamObserver connectionUUID](self, "connectionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (WFNextStaccatoActionStreamObserver)init
{
  WFNextStaccatoActionStreamObserver *v2;
  uint64_t v3;
  LNMetadataProvider *metadataProvider;
  uint64_t v5;
  NSMutableSet *trackingActivityIDs;
  WFNextStaccatoActionStreamObserver *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFNextStaccatoActionStreamObserver;
  v2 = -[WFNextStaccatoActionStreamObserver init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D44208]), "initWithOptions:", 0);
    metadataProvider = v2->_metadataProvider;
    v2->_metadataProvider = (LNMetadataProvider *)v3;

    v5 = objc_opt_new();
    trackingActivityIDs = v2->_trackingActivityIDs;
    v2->_trackingActivityIDs = (NSMutableSet *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)startObservingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44280]), "initWithObserver:", self);
  -[WFNextStaccatoActionStreamObserver setObservingProvider:](self, "setObservingProvider:", v5);

  getWFStaccatoLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[WFNextStaccatoActionStreamObserver startObservingWithCompletion:]";
    _os_log_impl(&dword_1AF681000, v6, OS_LOG_TYPE_INFO, "%s Starting Next Action Observation", buf, 0xCu);
  }

  -[WFNextStaccatoActionStreamObserver observingProvider](self, "observingProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__WFNextStaccatoActionStreamObserver_startObservingWithCompletion___block_invoke;
  v9[3] = &unk_1E5FC72B0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "startObservingNextActionStreamWithCompletion:", v9);

}

- (void)stopObservingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFNextStaccatoActionStreamObserver observingProvider](self, "observingProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    getWFStaccatoLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFNextStaccatoActionStreamObserver stopObservingWithCompletion:]";
      _os_log_impl(&dword_1AF681000, v6, OS_LOG_TYPE_INFO, "%s Stopping Next Action Observation", buf, 0xCu);
    }

    -[WFNextStaccatoActionStreamObserver observingProvider](self, "observingProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNextStaccatoActionStreamObserver connectionUUID](self, "connectionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__WFNextStaccatoActionStreamObserver_stopObservingWithCompletion___block_invoke;
    v9[3] = &unk_1E5FC8698;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v7, "stopObservingNextActionStreamWithConnectionUUID:completion:", v8, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)removeTrackingActivityID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFNextStaccatoActionStreamObserver trackingActivityIDs](self, "trackingActivityIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)didReceiveNextAction:(id)a3 baseAction:(id)a4 forAppWithBundleIdentifier:(id)a5 associatedLiveActivityIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  WFConfiguredActionButtonIntentAction *v45;
  void *v46;
  void *v47;
  WFConfiguredActionButtonIntentAction *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  const char *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  getWFStaccatoLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v62 = "-[WFNextStaccatoActionStreamObserver didReceiveNextAction:baseAction:forAppWithBundleIdentifier:associatedLive"
          "ActivityIdentifier:]";
    _os_log_impl(&dword_1AF681000, v14, OS_LOG_TYPE_DEBUG, "%s Received Next Action entry", buf, 0xCu);
  }

  -[WFNextStaccatoActionStreamObserver baseAction](self, "baseAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_16;
  -[WFNextStaccatoActionStreamObserver baseAction](self, "baseAction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "associatedBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", v12);

  if (!v18)
    goto LABEL_25;
  if (v13)
  {
    -[WFNextStaccatoActionStreamObserver trackingActivityIDs](self, "trackingActivityIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "containsObject:", v13))
    {

LABEL_16:
      -[WFNextStaccatoActionStreamObserver delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_opt_respondsToSelector();

      if ((v29 & 1) != 0)
      {
        v58 = v11;
        -[WFNextStaccatoActionStreamObserver metadataProvider](self, "metadataProvider");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        objc_msgSend(v30, "actionForBundleIdentifier:andActionIdentifier:error:", v12, v31, &v60);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v60;

        if (v32)
        {
          +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v33;
          objc_msgSend(v34, "serializedParametersForLinkAction:actionMetadata:error:", v10, v32, &v59);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v59;

          if (v35)
          {
            v52 = v36;
            v54 = v34;
            if (v13)
            {
              -[WFNextStaccatoActionStreamObserver trackingActivityIDs](self, "trackingActivityIDs");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "containsObject:", v13);

              if ((v38 & 1) == 0)
              {
                -[WFNextStaccatoActionStreamObserver trackingActivityIDs](self, "trackingActivityIDs");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "addObject:", v13);

              }
            }
            v40 = objc_alloc(MEMORY[0x1E0CBD738]);
            objc_msgSend(v10, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v10;
            v42 = (void *)objc_msgSend(v40, "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", v12, v41, v35);

            objc_msgSend(v32, "title");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "localizedStringForLocaleIdentifier:", 0);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = [WFConfiguredActionButtonIntentAction alloc];
            -[WFNextStaccatoActionStreamObserver baseAction](self, "baseAction");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "previewIcon");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[WFConfiguredStaccatoIntentAction initWithIntent:named:previewIcon:appShortcutIdentifier:templateParameterValues:contextualParameters:shortcutsMetadata:](v45, "initWithIntent:named:previewIcon:appShortcutIdentifier:templateParameterValues:contextualParameters:shortcutsMetadata:", v42, v44, v47, 0, 0, 0, 0);

            -[WFNextStaccatoActionStreamObserver delegate](self, "delegate");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "nextActionStreamObserver:didReceiveNextAction:associatedLiveActivityIdentifier:", self, v48, v13);

            v34 = v54;
            v10 = v56;
            v36 = v52;
          }

          v33 = v36;
        }

        v11 = v58;
      }
      goto LABEL_25;
    }
    v53 = v19;
    v55 = v10;
    v57 = v11;
  }
  else
  {
    v55 = v10;
    v57 = v11;
  }
  -[WFNextStaccatoActionStreamObserver baseAction](self, "baseAction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "intent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appIntentIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isEqualToString:", v23) & 1) != 0)
  {
    v24 = 0;
  }
  else
  {
    -[WFNextStaccatoActionStreamObserver baseAction](self, "baseAction");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "intent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appIntentIdentifier");
    v51 = v20;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v26, "isEqualToString:", v27) ^ 1;

    v20 = v51;
  }

  if (v13)
  v10 = v55;
  v11 = v57;
  if ((v24 & 1) == 0)
    goto LABEL_16;
LABEL_25:

}

- (void)observingProviderObservationDidInterrupted:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  getWFStaccatoLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315138;
    v10 = "-[WFNextStaccatoActionStreamObserver observingProviderObservationDidInterrupted:]";
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_ERROR, "%s Next Action Observation Stream interrupted", (uint8_t *)&v9, 0xCu);
  }

  -[WFNextStaccatoActionStreamObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D440D8], 1001, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNextStaccatoActionStreamObserver delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextActionStreamObserver:didStopObservingWithError:", self, v7);

  }
}

- (WFNextStaccatoActionStreamObserverDelegate)delegate
{
  return (WFNextStaccatoActionStreamObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFConfiguredSystemIntentAction)baseAction
{
  return self->_baseAction;
}

- (void)setBaseAction:(id)a3
{
  objc_storeStrong((id *)&self->_baseAction, a3);
}

- (LNTranscriptObservingProvider)observingProvider
{
  return self->_observingProvider;
}

- (void)setObservingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_observingProvider, a3);
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (LNMetadataProvider)metadataProvider
{
  return self->_metadataProvider;
}

- (NSMutableSet)trackingActivityIDs
{
  return self->_trackingActivityIDs;
}

- (void)setTrackingActivityIDs:(id)a3
{
  objc_storeStrong((id *)&self->_trackingActivityIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingActivityIDs, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_observingProvider, 0);
  objc_storeStrong((id *)&self->_baseAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __66__WFNextStaccatoActionStreamObserver_stopObservingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFStaccatoLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[WFNextStaccatoActionStreamObserver stopObservingWithCompletion:]_block_invoke";
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_ERROR, "%s Failed to stop Next Action Observation: %@", (uint8_t *)&v10, 0x16u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[WFNextStaccatoActionStreamObserver stopObservingWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_INFO, "%s Next Action Observation stopped successfully", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setObservingProvider:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setConnectionUUID:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nextActionStreamObserver:didStopObservingWithError:", *(_QWORD *)(a1 + 32), 0);

    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

void __67__WFNextStaccatoActionStreamObserver_startObservingWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setConnectionUUID:", a2);
  objc_msgSend(*(id *)(a1 + 32), "connectionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getWFStaccatoLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "-[WFNextStaccatoActionStreamObserver startObservingWithCompletion:]_block_invoke";
      v9 = "%s Next Action Observation started successfully";
      v10 = v8;
      v11 = OS_LOG_TYPE_INFO;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1AF681000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315394;
    v16 = "-[WFNextStaccatoActionStreamObserver startObservingWithCompletion:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v9 = "%s Failed to start Next Action Observation: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v13, v14);
}

@end
