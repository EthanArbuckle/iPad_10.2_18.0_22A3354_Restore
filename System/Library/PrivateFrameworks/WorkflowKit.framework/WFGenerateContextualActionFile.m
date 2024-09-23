@implementation WFGenerateContextualActionFile

void __WFGenerateContextualActionFile_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "wfType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "utType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
    {
      if (v9 != 1)
      {
LABEL_27:

        goto LABEL_28;
      }
      v10 = (void *)MEMORY[0x1E0D140A0];
      objc_msgSend(v5, "filename");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "proposedSharedTemporaryFileURLForFilename:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = v6;
      LOBYTE(v11) = objc_msgSend(v5, "writeToFileURL:overwriting:error:", v12, 0, &v37);
      v13 = v37;

      if ((v11 & 1) == 0)
      {
        getWFGeneralLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v39 = "WFGenerateContextualActionFile_block_invoke";
          v40 = 2112;
          v41 = v13;
          _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s Error writing contextual action output file: %@", buf, 0x16u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_26;
      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7A60]), "initWithFileURL:type:", v12, v8);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "fileSize");
      v16 = objc_msgSend(v5, "fileSize");
      if (v15 >= 1 && v16 <= 0)
      {
        getWFContextualActionsLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v39 = "WFGenerateContextualActionFile_block_invoke";
          _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_FAULT, "%s [Circuit Breaker] Trying to overwrite the input file with empty data. Aborting.", buf, 0xCu);
        }

        v18 = *(_QWORD *)(a1 + 48);
        WFBackgroundShortcutRunnerError(9, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v12);
        v13 = v6;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      v36 = v6;
      objc_msgSend(v12, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v20, 1, &v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v36;

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0D140A0], "proposedFileURLForFilename:inDirectory:", v14, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 40);
        v34 = v13;
        v35 = v22;
        v24 = objc_msgSend(v12, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v22, v23, 0, 1, &v35, &v34);
        v25 = v35;

        v26 = v34;
        if ((v24 & 1) != 0)
        {
          objc_msgSend(v5, "fileURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v26;
          v33 = v25;
          v28 = objc_msgSend(v12, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v25, v27, 0, 0, &v33, &v32);
          v31 = v33;

          v29 = v32;
          if ((v28 & 1) != 0)
          {
            v26 = v29;
            v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7A60]), "initWithFileURL:type:", v31, v8);
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          }
          else
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            v26 = v29;
          }
          v25 = v31;
        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }

        v13 = v26;
      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
LABEL_26:

    v6 = v13;
    goto LABEL_27;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_28:

}

@end
