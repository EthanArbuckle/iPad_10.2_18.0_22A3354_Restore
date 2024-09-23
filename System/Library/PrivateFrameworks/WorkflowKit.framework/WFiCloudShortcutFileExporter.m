@implementation WFiCloudShortcutFileExporter

- (void)exportWorkflowWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  WFiCloudShortcutFileExporter *v13;
  id v14;

  v4 = a3;
  +[WFGallerySessionManager sharedManager](WFGallerySessionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShortcutExporter workflowRecord](self, "workflowRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShortcutExporter workflowRecord](self, "workflowRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__WFiCloudShortcutFileExporter_exportWorkflowWithCompletion___block_invoke;
  v11[3] = &unk_1E7AF0190;
  v13 = self;
  v14 = v4;
  v12 = v5;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v9, "uploadWorkflow:withName:shortDescription:longDescription:private:completionHandler:", v6, v8, 0, 0, 1, v11);

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

void __61__WFiCloudShortcutFileExporter_exportWorkflowWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(a2, "pathComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "removeObject:", CFSTR("/"));
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__WFiCloudShortcutFileExporter_exportWorkflowWithCompletion___block_invoke_2;
    v10[3] = &unk_1E7AF0168;
    v8 = *(id *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = v8;
    v9 = (id)objc_msgSend(v6, "getWorkflowForIdentifier:completionHandler:", v7, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __61__WFiCloudShortcutFileExporter_exportWorkflowWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v18;
    else
      v3 = 0;
    v4 = v3;
    objc_msgSend(v4, "signedShortcutFile");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;

    }
    else
    {
      v7 = v18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;

      objc_msgSend(v9, "signedShortcutFile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v17 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v6);
        goto LABEL_13;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setSignedShortcutFile:", v6);
    objc_msgSend(MEMORY[0x1E0D140A0], "temporaryDirectoryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "workflowRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathExtension:", CFSTR("shortcut"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "copyItemAtURL:toURL:error:", v16, v14, 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_13:

    goto LABEL_14;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_14:

}

@end
