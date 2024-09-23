@implementation ICDocumentAction

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICDocumentAction;
  -[ICAction localizedNameWithContext:](&v12, sel_localizedNameWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    WFLocalizedStringResourceWithKey(CFSTR("Open in %@ (Action Name - Open In)"), CFSTR("Open in %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    -[ICAction app](self, "app");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v7, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)identifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICDocumentAction;
  -[ICAction identifier](&v10, sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[ICAction app](self, "app");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.openin"), v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSArray)fileTypes
{
  NSArray *fileTypes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  fileTypes = self->_fileTypes;
  if (!fileTypes)
  {
    v4 = (void *)MEMORY[0x1E0DC7B30];
    -[ICAction definition](self, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("FileTypes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typesFromStrings:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSArray *)objc_msgSend(v7, "copy");
    v9 = self->_fileTypes;
    self->_fileTypes = v8;

    fileTypes = self->_fileTypes;
  }
  return fileTypes;
}

- (id)inputContentClasses
{
  NSArray *inputContentClasses;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  inputContentClasses = self->_inputContentClasses;
  if (!inputContentClasses)
  {
    objc_msgSend(MEMORY[0x1E0D13ED0], "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[ICDocumentAction fileTypes](self, "fileTypes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(v4, "contentItemClassForType:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
          if (v11)
            objc_msgSend(v5, "addObject:", v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSArray *)objc_msgSend(v12, "copy");
    v14 = self->_inputContentClasses;
    self->_inputContentClasses = v13;

    inputContentClasses = self->_inputContentClasses;
  }
  return inputContentClasses;
}

- (id)fileTypeForOpeningItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  id v20;
  uint64_t v21;
  void *m;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t n;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "preferredFileType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[ICDocumentAction fileTypes](self, "fileTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v52 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(v5, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i)))
        {
          v20 = v5;
          goto LABEL_44;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v8)
        continue;
      break;
    }
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[ICDocumentAction fileTypes](self, "fileTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v32)
  {
    v11 = *(_QWORD *)v48;
    v34 = v4;
    v31 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v48 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v4, "supportedTypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v44;
          while (2)
          {
            for (k = 0; k != v16; ++k)
            {
              if (*(_QWORD *)v44 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
              if ((objc_msgSend(v19, "conformsToType:", v13) & 1) != 0)
              {
                v20 = v19;

LABEL_43:
                v4 = v34;
                goto LABEL_44;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
            if (v16)
              continue;
            break;
          }
        }

        v4 = v34;
        v11 = v31;
      }
      v32 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    }
    while (v32);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[ICDocumentAction fileTypes](self, "fileTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v40;
    v33 = *(_QWORD *)v40;
    v34 = v4;
    do
    {
      for (m = 0; m != v20; m = (char *)m + 1)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v6);
        v23 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)m);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v4, "allSupportedTypes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v55, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v36;
          while (2)
          {
            for (n = 0; n != v26; ++n)
            {
              if (*(_QWORD *)v36 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * n);
              if ((objc_msgSend(v29, "conformsToType:", v23) & 1) != 0)
              {
                v20 = v29;

                goto LABEL_43;
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v55, 16);
            if (v26)
              continue;
            break;
          }
        }

        v21 = v33;
        v4 = v34;
      }
      v20 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
    }
    while (v20);
  }
LABEL_44:

  return v20;
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v10 = a3;
  v11 = a6;
  v12 = a7;
  objc_msgSend(v10, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ICDocumentAction fileTypeForOpeningItem:](self, "fileTypeForOpeningItem:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __96__ICDocumentAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
    v16[3] = &unk_1E7AF3BE0;
    v16[4] = self;
    v17 = v12;
    v18 = v11;
    objc_msgSend(v10, "getFileRepresentation:forType:", v16, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTypes, 0);
  objc_storeStrong((id *)&self->_inputContentClasses, 0);
}

void __96__ICDocumentAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(a1[4], "app");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __96__ICDocumentAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2;
    v6[3] = &unk_1E7AF4258;
    v7 = a1[6];
    v8 = a1[5];
    objc_msgSend(v4, "openFile:completionHandler:", v5, v6);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

uint64_t __96__ICDocumentAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
