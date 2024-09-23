@implementation WFAppIntentArchiver

- (WFAppIntentArchiver)initWithIdentifier:(id)a3 actionMetadata:(id)a4
{
  id v6;
  id v7;
  WFAppIntentArchiver *v8;
  uint64_t v9;
  LNFullyQualifiedActionIdentifier *actionIdentifier;
  uint64_t v11;
  LNActionMetadata *actionMetadata;
  WFAppIntentArchiver *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFAppIntentArchiver;
  v8 = -[WFAppIntentArchiver init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    actionIdentifier = v8->_actionIdentifier;
    v8->_actionIdentifier = (LNFullyQualifiedActionIdentifier *)v9;

    v11 = objc_msgSend(v7, "copy");
    actionMetadata = v8->_actionMetadata;
    v8->_actionMetadata = (LNActionMetadata *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)archiveAction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  -[WFAppIntentArchiver resolvedActionMetadataWithError:](self, "resolvedActionMetadataWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "archiveAction:withActionMetadata:error:", v6, v7, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFAppIntentArchiver archiveAction:error:]";
      _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Could not retrieve Action Metadata for archived action", buf, 0xCu);
    }

    if (a4)
    {
      WFAppIntentArchiverErrorWithLocalizedErrorDescription(CFSTR("Failed to archive App Intent"), v8);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)unarchiveActionFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  -[WFAppIntentArchiver resolvedActionMetadataWithError:](self, "resolvedActionMetadataWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unarchiveActionFromData:withActionMetadata:error:", v6, v7, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFAppIntentArchiver unarchiveActionFromData:error:]";
      _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Could not retrieve Action Metadata for unarchived action", buf, 0xCu);
    }

    if (a4)
    {
      WFAppIntentArchiverErrorWithLocalizedErrorDescription(CFSTR("Failed to unarchive App Intent"), v8);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)archiveAction:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[WFAppIntentArchiver resolvedActionMetadataWithError:](self, "resolvedActionMetadataWithError:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "archiveAction:withActionMetadata:completion:", v6, v8, v7);
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFAppIntentArchiver archiveAction:completion:]";
      _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Could not retrieve Action Metadata for archived action", buf, 0xCu);
    }

    WFAppIntentArchiverErrorWithLocalizedErrorDescription(CFSTR("Failed to archive App Intent"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
  }

}

- (void)unarchiveActionFromData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[WFAppIntentArchiver resolvedActionMetadataWithError:](self, "resolvedActionMetadataWithError:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unarchiveActionFromData:withActionMetadata:completion:", v6, v8, v7);
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFAppIntentArchiver unarchiveActionFromData:completion:]";
      _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Could not retrieve Action Metadata for unarchived action", buf, 0xCu);
    }

    WFAppIntentArchiverErrorWithLocalizedErrorDescription(CFSTR("Failed to unarchive App Intent"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
  }

}

- (id)resolvedActionMetadataWithError:(id *)a3
{
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[WFAppIntentArchiver actionMetadata](self, "actionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFAppIntentArchiver actionMetadata](self, "actionMetadata");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44208]), "initWithOptions:", 2);
    -[WFAppIntentArchiver actionIdentifier](self, "actionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAppIntentArchiver actionIdentifier](self, "actionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAppIntentArchiver actionIdentifier](self, "actionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionsWithFullyQualifiedIdentifiers:error:", v13, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAppIntentArchiver setActionMetadata:](self, "setActionMetadata:", v16);
    if (a3 && !v16 && !*a3)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D44098];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = CFSTR("Intent not found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 9004, v19);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return v16;
  }
}

- (LNFullyQualifiedActionIdentifier)actionIdentifier
{
  return self->_actionIdentifier;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (void)setActionMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
