@implementation _LTClientConnection

- (_LTClientConnection)initWithConnection:(id)a3 server:(id)a4 trusted:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  _LTClientConnection *v11;
  _LTClientConnection *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSString *trustedClientIdentifier;
  _LTClientConnection *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_LTClientConnection;
  v11 = -[_LTClientConnection init](&v31, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v12->_server, a4);
    v12->_trusted = v5;
    v13 = _LTOSLogXPC();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v14)
        -[_LTClientConnection initWithConnection:server:trusted:].cold.3();
      _LTTranslationServiceXPCInterface();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v14)
        -[_LTClientConnection initWithConnection:server:trusted:].cold.4();
      _LTTextTranslationServiceXPCInterface();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    objc_msgSend(v9, "setExportedInterface:", v15);

    objc_msgSend(v9, "setExportedObject:", v12);
    _LTTranslationServiceDelegateXPCInterface();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRemoteObjectInterface:", v17);

    objc_initWeak(&location, v12);
    v18 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __57___LTClientConnection_initWithConnection_server_trusted___block_invoke;
    v28[3] = &unk_251A111A0;
    objc_copyWeak(&v29, &location);
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __57___LTClientConnection_initWithConnection_server_trusted___block_invoke_2;
    v26[3] = &unk_251A111C8;
    v19 = (id)MEMORY[0x2495AE9CC](v28);
    v27 = v19;
    objc_msgSend(v9, "setInterruptionHandler:", v26);
    objc_msgSend(v9, "setInvalidationHandler:", v19);
    objc_msgSend(v9, "valueForEntitlement:", CFSTR("application-identifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v21 = _LTOSLogXPC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[_LTClientConnection initWithConnection:server:trusted:].cold.2();
    }
    v22 = _LTOSLogXPC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[_LTClientConnection initWithConnection:server:trusted:].cold.1(v20, v22);
    trustedClientIdentifier = v12->_trustedClientIdentifier;
    v12->_trustedClientIdentifier = (NSString *)v20;

    v24 = v12;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (id)_clientDelegate
{
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (void)cleanupOnDisconnect
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (self->_speechSessionID)
  {
    v3 = _LTOSLogXPC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Client disconnected, ask to cancel speech session", v5, 2u);
    }
    -[_LTTranslationServer cancelSpeechSessionWithID:](self->_server, "cancelSpeechSessionWithID:", self->_speechSessionID);
  }
  -[_LTClientConnection delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientConnectionClosed:", self);

}

- (void)clearCaches
{
  -[_LTTranslationServer clearCaches](self->_server, "clearCaches");
}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_LTClientConnection logRequestOfType:context:](self, "logRequestOfType:context:", CFSTR("sentence"), v9);
  objc_msgSend(v9, "setTrustedClientIdentifier:", self->_trustedClientIdentifier);
  -[_LTTranslationServer translateSentence:withContext:completion:](self->_server, "translateSentence:withContext:completion:", v10, v9, v8);

}

- (void)translate:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _LTTranslationServer *server;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[6];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_trusted)
  {
    objc_msgSend(v9, "sanitizedCopyForUntrustedTextTranslation");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  -[_LTClientConnection logRequestOfType:context:](self, "logRequestOfType:context:", CFSTR("singleParagraph"), v9);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__0;
  v22[4] = __Block_byref_object_dispose__0;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__0;
  v20[4] = __Block_byref_object_dispose__0;
  v21 = 0;
  objc_msgSend(v9, "setTrustedClientIdentifier:", self->_trustedClientIdentifier);
  server = self->_server;
  v24[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56___LTClientConnection_translate_withContext_completion___block_invoke;
  v19[3] = &unk_251A111F0;
  v19[4] = v22;
  v19[5] = v20;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56___LTClientConnection_translate_withContext_completion___block_invoke_2;
  v15[3] = &unk_251A11218;
  v17 = v20;
  v18 = v22;
  v14 = v10;
  v16 = v14;
  -[_LTTranslationServer translateParagraphs:withContext:paragraphResult:completion:](server, "translateParagraphs:withContext:paragraphResult:completion:", v13, v9, v19, v15);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

}

- (void)translateParagraphs:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _LTTranslationServer *server;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_trusted)
  {
    objc_msgSend(v9, "sanitizedCopyForUntrustedTextTranslation");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  -[_LTClientConnection logRequestOfType:context:](self, "logRequestOfType:context:", CFSTR("paragraphs"), v9);
  objc_msgSend(v9, "setTrustedClientIdentifier:", self->_trustedClientIdentifier);
  -[_LTClientConnection _clientDelegate](self, "_clientDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  server = self->_server;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66___LTClientConnection_translateParagraphs_withContext_completion___block_invoke;
  v15[3] = &unk_251A11240;
  v16 = v12;
  v14 = v12;
  -[_LTTranslationServer translateParagraphs:withContext:paragraphResult:completion:](server, "translateParagraphs:withContext:paragraphResult:completion:", v8, v9, v15, v10);

}

- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_LTClientConnection logRequestOfType:context:](self, "logRequestOfType:context:", CFSTR("tts"), v9);
  objc_msgSend(v9, "setTrustedClientIdentifier:", self->_trustedClientIdentifier);
  -[_LTClientConnection _clientDelegate](self, "_clientDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationServer speak:withContext:delegate:completion:](self->_server, "speak:withContext:delegate:completion:", v10, v9, v11, v8);

}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4
{
  NSString *trustedClientIdentifier;
  id v7;
  void *v8;
  NSUUID *v9;
  NSUUID *speechSessionID;
  id v11;

  v11 = a3;
  trustedClientIdentifier = self->_trustedClientIdentifier;
  v7 = a4;
  if (-[NSString isEqual:](trustedClientIdentifier, "isEqual:", CFSTR("com.apple.TranslationUIServices.TranslationUIService")))objc_msgSend(v11, "setTaskHint:", 5);
  -[_LTClientConnection logRequestOfType:context:](self, "logRequestOfType:context:", CFSTR("text-to-speech"), v11);
  objc_msgSend(v11, "setTrustedClientIdentifier:", self->_trustedClientIdentifier);
  -[_LTClientConnection _clientDelegate](self, "_clientDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationServer startTextToSpeechTranslationWithContext:text:delegate:](self->_server, "startTextToSpeechTranslationWithContext:text:delegate:", v11, v7, v8);
  v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  speechSessionID = self->_speechSessionID;
  self->_speechSessionID = v9;

}

- (void)startSpeechTranslationWithContext:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *speechSessionID;
  id v7;

  v4 = a3;
  -[_LTClientConnection logRequestOfType:context:](self, "logRequestOfType:context:", CFSTR("speech"), v4);
  objc_msgSend(v4, "setTrustedClientIdentifier:", self->_trustedClientIdentifier);
  -[_LTClientConnection _clientDelegate](self, "_clientDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationServer startSpeechTranslationWithContext:delegate:](self->_server, "startSpeechTranslationWithContext:delegate:", v4, v7);
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  speechSessionID = self->_speechSessionID;
  self->_speechSessionID = v5;

}

- (void)addSpeechAudioData:(id)a3
{
  -[_LTTranslationServer addSpeechAudioData:](self->_server, "addSpeechAudioData:", a3);
}

- (void)endAudio
{
  -[_LTTranslationServer endAudio](self->_server, "endAudio");
}

- (void)autoDetectSpeechUnsupportedPairsWithCompletion:(id)a3
{
  -[_LTTranslationServer autoDetectSpeechUnsupportedPairsWithCompletion:](self->_server, "autoDetectSpeechUnsupportedPairsWithCompletion:", a3);
}

- (void)modalitiesPerLocaleWithCompletion:(id)a3
{
  -[_LTTranslationServer modalitiesPerLocaleWithCompletion:](self->_server, "modalitiesPerLocaleWithCompletion:", a3);
}

- (void)textStreamingConfigurationWithCompletion:(id)a3
{
  -[_LTTranslationServer textStreamingConfigurationWithCompletion:](self->_server, "textStreamingConfigurationWithCompletion:", a3);
}

- (void)preheatWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[_LTClientConnection logRequestOfType:context:](self, "logRequestOfType:context:", CFSTR("preheat"), v7);
  objc_msgSend(v7, "setTrustedClientIdentifier:", self->_trustedClientIdentifier);
  -[_LTTranslationServer preheatWithContext:completion:](self->_server, "preheatWithContext:completion:", v7, v6);

}

- (void)shouldPresentSystemFirstUseConsent:(id)a3
{
  -[_LTTranslationServer shouldPresentSystemFirstUseConsent:](self->_server, "shouldPresentSystemFirstUseConsent:", a3);
}

- (void)languageForText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[_LTClientConnection logRequestOfType:context:](self, "logRequestOfType:context:", CFSTR("text-LID"), 0);
  -[_LTTranslationServer languageForText:completion:](self->_server, "languageForText:completion:", v7, v6);

}

- (void)languagesForText:(id)a3 completion:(id)a4
{
  -[_LTClientConnection languagesForText:usingModel:strategy:completion:](self, "languagesForText:usingModel:strategy:completion:", a3, 0, 0, a4);
}

- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 completion:(id)a5
{
  -[_LTClientConnection languagesForText:usingModel:strategy:completion:](self, "languagesForText:usingModel:strategy:completion:", a3, a4, 0, a5);
}

- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 strategy:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v10 = a6;
  v11 = a3;
  -[_LTClientConnection logRequestOfType:context:](self, "logRequestOfType:context:", CFSTR("text-LID"), 0);
  v12 = _LTOSLogXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2491B9000, v12, OS_LOG_TYPE_INFO, "XPC languages for text call", v13, 2u);
  }
  -[_LTTranslationServer languagesForText:usingModel:strategy:completion:](self->_server, "languagesForText:usingModel:strategy:completion:", v11, a4, a5, v10);

}

- (void)cleanup
{
  -[_LTTranslationServer cleanup](self->_server, "cleanup");
}

- (void)attemptToCancelRequestsWithSessionID:(id)a3
{
  -[_LTTranslationServer attemptToCancelRequestsWithSessionID:](self->_server, "attemptToCancelRequestsWithSessionID:", a3);
}

- (void)logRequestOfType:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _LTAnalyticsEvent *v8;
  NSString *trustedClientIdentifier;
  const __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[_LTAnalyticsEvent initWithName:]([_LTAnalyticsEvent alloc], "initWithName:", CFSTR("TranslateRequest"));
  trustedClientIdentifier = self->_trustedClientIdentifier;
  if (trustedClientIdentifier)
  {
    v10 = trustedClientIdentifier;
  }
  else
  {
    objc_msgSend(v7, "clientIdentifier");
    v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (__CFString *)v10;
  v12 = CFSTR("unknown");
  if (v10)
    v12 = v10;
  v16[0] = CFSTR("processName");
  v16[1] = CFSTR("type");
  v17[0] = v12;
  v17[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTAnalyticsEvent addFieldsFromDictionary:](v8, "addFieldsFromDictionary:", v13);

  -[_LTAnalyticsEvent sendLazy](v8, "sendLazy");
  if (v7)
    v14 = objc_msgSend(v7, "route");
  else
    v14 = -1;
  +[_LTPowerLogger sharedInstance](_LTPowerLogger, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logTranslateRequestEvent:requestType:routeType:", self->_trustedClientIdentifier, v6, v14);

}

- (void)languageAssetsWithOptions:(unint64_t)a3 completion:(id)a4
{
  -[_LTTranslationServer languageAssetsWithOptions:completion:](self->_server, "languageAssetsWithOptions:completion:", a3, a4);
}

- (void)assetRequestHandler:(id)a3
{
  id v4;
  void *v5;
  _LTTranslationServer *server;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[_LTClientConnection _clientDelegate](self, "_clientDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  server = self->_server;
  objc_msgSend(v4, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "options");

  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43___LTClientConnection_assetRequestHandler___block_invoke;
  v13[3] = &unk_251A11268;
  v14 = v5;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __43___LTClientConnection_assetRequestHandler___block_invoke_2;
  v11[3] = &unk_251A11290;
  v12 = v14;
  v10 = v14;
  -[_LTTranslationServer setLanguageAssets:options:progress:completion:](server, "setLanguageAssets:options:progress:completion:", v7, v8, v13, v11);

}

- (void)addLanguages:(id)a3 useCellular:(BOOL)a4
{
  +[_LTDLanguageAssetService addLanguages:useCellular:](_LTDLanguageAssetService, "addLanguages:useCellular:", a3, a4);
}

- (void)removeLanguages:(id)a3
{
  +[_LTDLanguageAssetService removeLanguages:](_LTDLanguageAssetService, "removeLanguages:", a3);
}

- (void)startLanguageStatusChangeObservation:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL8 trusted;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  unint64_t v18;
  BOOL v19;

  v8 = a5;
  v9 = a3;
  -[_LTClientConnection _clientDelegate](self, "_clientDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  trusted = self->_trusted;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __76___LTClientConnection_startLanguageStatusChangeObservation_type_completion___block_invoke;
  v16[3] = &unk_251A112B8;
  v17 = v10;
  v18 = a4;
  v19 = trusted;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __76___LTClientConnection_startLanguageStatusChangeObservation_type_completion___block_invoke_2;
  v14[3] = &unk_251A112E0;
  v15 = v8;
  v12 = v8;
  v13 = v10;
  +[_LTDLanguageAssetService startLanguageStatusSession:observationType:progress:observations:completion:](_LTDLanguageAssetService, "startLanguageStatusSession:observationType:progress:observations:completion:", v9, a4, trusted, v16, v14);

}

- (void)cancelLanguageStatusChangeObservation:(id)a3
{
  +[_LTDLanguageAssetService cancelLanguageStatusSession:](_LTDLanguageAssetService, "cancelLanguageStatusSession:", a3);
}

- (void)_offlineLanguageStatus:(id)a3
{
  -[_LTTranslationServer _offlineLanguageStatus:](self->_server, "_offlineLanguageStatus:", a3);
}

- (void)_downloadAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  -[_LTTranslationServer _downloadAssetForLanguagePair:userInitiated:completion:](self->_server, "_downloadAssetForLanguagePair:userInitiated:completion:", a3, a4, a5);
}

- (void)_purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  -[_LTTranslationServer _purgeAssetForLanguagePair:userInitiated:completion:](self->_server, "_purgeAssetForLanguagePair:userInitiated:completion:", a3, a4, a5);
}

- (void)_purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4
{
  -[_LTTranslationServer _purgeAllAssetsExcludingConfig:completion:](self->_server, "_purgeAllAssetsExcludingConfig:completion:", a3, a4);
}

- (void)_updateAllAssets:(id)a3
{
  -[_LTTranslationServer _updateAllAssets:](self->_server, "_updateAllAssets:", a3);
}

- (void)installedLocales:(id)a3
{
  -[_LTTranslationServer installedLocales:](self->_server, "installedLocales:", a3);
}

- (void)installedLocalesForTask:(int64_t)a3 completion:(id)a4
{
  -[_LTTranslationServer installedLocalesForTask:completion:](self->_server, "installedLocalesForTask:completion:", a3, a4);
}

- (void)startInstallRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_LTClientConnection _clientDelegate](self, "_clientDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationServer startInstallRequest:delegate:](self->_server, "startInstallRequest:delegate:", v4, v5);

}

- (void)_getAssetSize:(id)a3
{
  -[_LTTranslationServer _getAssetSize:](self->_server, "_getAssetSize:", a3);
}

- (void)availableLocalePairsForTask:(int64_t)a3 completion:(id)a4
{
  -[_LTTranslationServer availableLocalePairsForTask:completion:](self->_server, "availableLocalePairsForTask:completion:", a3, a4);
}

- (void)task:(int64_t)a3 isSupportedInCountry:(id)a4 completion:(id)a5
{
  -[_LTTranslationServer task:isSupportedInCountry:completion:](self->_server, "task:isSupportedInCountry:completion:", a3, a4, a5);
}

- (void)additionalLikelyPreferredLocalesForLocale:(id)a3 completion:(id)a4
{
  -[_LTTranslationServer additionalLikelyPreferredLocalesForLocale:completion:](self->_server, "additionalLikelyPreferredLocalesForLocale:completion:", a3, a4);
}

- (void)configInfoForLocale:(id)a3 otherLocale:(id)a4 completion:(id)a5
{
  -[_LTTranslationServer configInfoForLocale:otherLocale:completion:](self->_server, "configInfoForLocale:otherLocale:completion:", a3, a4, a5);
}

- (void)logWithRequestData:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = a3;
  _LTLoggingRequestClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v7, v6, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (v9)
  {
    v10 = _LTOSLogXPC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_LTClientConnection logWithRequestData:].cold.1((uint64_t)v9, v10);
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LTSendErrorEvent(v9, v11);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "setProcessName:", self->_trustedClientIdentifier);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "setClientBundleID:", self->_trustedClientIdentifier);
    }
    -[_LTTranslationServer startLoggingRequest:](self->_server, "startLoggingRequest:", v8);
  }

}

- (void)_updateHotfix:(id)a3
{
  -[_LTTranslationServer _updateHotfix:](self->_server, "_updateHotfix:", a3);
}

- (void)_deleteHotfix:(id)a3
{
  -[_LTTranslationServer _deleteHotfix:](self->_server, "_deleteHotfix:", a3);
}

- (void)onDeviceModeEnabled:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  v5 = _LTOSLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "XPC on-device mode call", v6, 2u);
  }
  -[_LTTranslationServer onDeviceModeEnabled:](self->_server, "onDeviceModeEnabled:", v4);

}

- (void)onDeviceModeSupported:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  v5 = _LTOSLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "XPC on-device support call", v6, 2u);
  }
  -[_LTTranslationServer onDeviceModeSupported:](self->_server, "onDeviceModeSupported:", v4);

}

- (void)selfLoggingEventWithData:(id)a3
{
  -[_LTTranslationServer selfLoggingEventWithData:](self->_server, "selfLoggingEventWithData:", a3);
}

- (void)selfLoggingInvocationStartedWithData:(id)a3 invocationStartedTier1Data:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a4;
  v7 = a3;
  v8 = _LTOSLogXPC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_LTClientConnection selfLoggingInvocationStartedWithData:invocationStartedTier1Data:].cold.1();
  -[_LTTranslationServer selfLoggingEventWithData:](self->_server, "selfLoggingEventWithData:", v7);

  objc_msgSend(v6, "setTrustedClientIdentifier:", self->_trustedClientIdentifier);
  -[_LTTranslationServer selfLoggingEventWithData:](self->_server, "selfLoggingEventWithData:", v6);

}

- (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3
{
  -[_LTTranslationServer selfLoggingLanguageIdentificationCompletedWithLIDData:](self->_server, "selfLoggingLanguageIdentificationCompletedWithLIDData:", a3);
}

- (_LTClientConnectionDelegate)delegate
{
  return (_LTClientConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_speechSessionID, 0);
  objc_storeStrong((id *)&self->_trustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnection:(uint64_t)a1 server:(NSObject *)a2 trusted:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2491B9000, a2, OS_LOG_TYPE_DEBUG, "Client connection for: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithConnection:server:trusted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Client didn't set application-identifier entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithConnection:server:trusted:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Trusted client connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithConnection:server:trusted:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Untrusted client connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)logWithRequestData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2491B9000, a2, OS_LOG_TYPE_ERROR, "Failed to deserialize logging request: %@", (uint8_t *)&v2, 0xCu);
}

- (void)selfLoggingInvocationStartedWithData:invocationStartedTier1Data:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "XPC selfLoggingInvocationStartedWithData:invocationStartedTier1Data call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
