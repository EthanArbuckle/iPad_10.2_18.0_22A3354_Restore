@implementation WFP2PSignedShortcutFileExporter

- (void)exportWorkflowWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  WFShortcutPackageFile *v11;
  void *v12;
  void *v13;
  WFShortcutPackageFile *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  WFShortcutPackageFile *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[7];
  _QWORD v41[7];
  _QWORD v42[2];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[WFShortcutExporter workflowRecord](self, "workflowRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFShortcutExporter workflowRecord](self, "workflowRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v8);

  v39 = 0;
  objc_msgSend(v6, "fileDataWithError:", &v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v39;
  if (v9)
  {
    v11 = [WFShortcutPackageFile alloc];
    -[WFShortcutExporter workflowRecord](self, "workflowRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFShortcutPackageFile initWithShortcutData:shortcutName:](v11, "initWithShortcutData:shortcutName:", v9, v13);

    v15 = objc_alloc_init(MEMORY[0x1E0D973D0]);
    v38 = v10;
    objc_msgSend(v15, "myAccountWithError:", &v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v38;

    v36 = v14;
    if (v16)
    {
      v37 = v17;
      -[WFShortcutPackageFile generateSignedShortcutFileRepresentationWithAccount:error:](v14, "generateSignedShortcutFileRepresentationWithAccount:error:", v16, &v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v37;

      if (v18)
      {
        -[WFP2PSignedShortcutFileExporter setSignedShortcutFile:](self, "setSignedShortcutFile:", v18);
        objc_msgSend(v18, "fileURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v20, 0);

      }
      else
      {
        getWFGeneralLogObject();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[WFP2PSignedShortcutFileExporter exportWorkflowWithCompletion:]";
          v45 = 2112;
          v46 = v19;
          _os_log_impl(&dword_1C15B3000, v34, OS_LOG_TYPE_ERROR, "%s Failed to generate a signed shortcut with user's Apple ID account: %@", buf, 0x16u);
        }

        ((void (**)(id, void *, id))v4)[2](v4, 0, v19);
        v18 = 0;
      }
      v17 = v19;
    }
    else
    {
      v35 = v15;
      getWFGeneralLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[WFP2PSignedShortcutFileExporter exportWorkflowWithCompletion:]";
        v45 = 2112;
        v46 = v17;
        _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_ERROR, "%s Failed to retrieve the user's Apple ID account for signing a shortcut: %@", buf, 0x16u);
      }

      WFLocalizedString(CFSTR("OK"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v22;
      WFLocalizedString(CFSTR("Sign In"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13E20]), "initWithHandlerBlock:", &__block_literal_global_49936);
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v40[0] = *MEMORY[0x1E0CB2D68];
      WFLocalizedString(CFSTR("Sign In to iCloud to Share Shortcuts"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v26;
      v40[1] = *MEMORY[0x1E0CB2D50];
      WFLocalizedString(CFSTR("Shortcuts are shared using iCloud. To share this shortcut, sign in to iCloud first."));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x1E0CB2D78];
      v41[1] = v27;
      v41[2] = v18;
      v29 = *MEMORY[0x1E0CB3148];
      v40[2] = v28;
      v40[3] = v29;
      v30 = *MEMORY[0x1E0D142B8];
      v41[3] = v24;
      v41[4] = v24;
      v31 = *MEMORY[0x1E0D14298];
      v40[4] = v30;
      v40[5] = v31;
      v40[6] = *MEMORY[0x1E0CB3388];
      v41[5] = &unk_1E7B8BD10;
      v41[6] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 7);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 4, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, void *, void *))v4)[2](v4, 0, v33);
      v16 = 0;
      v15 = v35;
    }

    v10 = v17;
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v10);
  }

}

- (WFFileRepresentation)signedShortcutFile
{
  return self->_signedShortcutFile;
}

- (void)setSignedShortcutFile:(id)a3
{
  objc_storeStrong((id *)&self->_signedShortcutFile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedShortcutFile, 0);
}

void __64__WFP2PSignedShortcutFileExporter_exportWorkflowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a5;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ROOT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__WFP2PSignedShortcutFileExporter_exportWorkflowWithCompletion___block_invoke_2;
    v9[3] = &unk_1E7AF8860;
    v10 = v6;
    objc_msgSend(v8, "openURL:completionHandler:", v7, v9);

  }
}

uint64_t __64__WFP2PSignedShortcutFileExporter_exportWorkflowWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
