@implementation NSAttributedString(UINSItemProvider)

+ (id)_uikit_readableTypeIdentifiersForItemProviderConsideringLinkage:()UINSItemProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  _QWORD v19[2];
  _QWORD v20[9];

  v20[8] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("com.apple.uikit.attributedstring");
  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v3;
  objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v5;
  v6 = (void *)*MEMORY[0x1E0CEC658];
  objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v7;
  v8 = (void *)*MEMORY[0x1E0CEC518];
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v9;
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v10;
  objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectsInArray:", v16);

    v12 = v13;
  }
  return v12;
}

+ (uint64_t)readableTypeIdentifiersForItemProvider
{
  return objc_msgSend(a1, "_uikit_readableTypeIdentifiersForItemProviderConsideringLinkage:", 1);
}

+ (uint64_t)_preferredRepresentationForItemProviderReadableTypeIdentifier:()UINSItemProvider
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)*MEMORY[0x1E0CEC5C8];
  v4 = a3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

+ (id)_objectWithRTFDAtURL:()UINSItemProvider userInfo:error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10 = [a1 alloc];
  v15 = *(_QWORD *)off_1E1678CE0;
  v16[0] = *(_QWORD *)off_1E1679000;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __mergedOptionDictionaries(v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v10, "initWithURL:options:documentAttributes:error:", v9, v12, 0, a5);
  return v13;
}

+ (id)_objectWithItemProviderData:()UINSItemProvider typeIdentifier:userInfo:error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  int v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", CFSTR("com.apple.uikit.attributedstring"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "conformsToType:", v14))
  {
    if (objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC658]))
    {
      v18 = [a1 alloc];
      v19 = *(_QWORD *)off_1E16792B8;
      v20 = *(_QWORD *)off_1E1678DC8;
      v61[0] = *(_QWORD *)off_1E1678CE0;
      v61[1] = v20;
      v62[0] = v19;
      v62[1] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      v17 = (void *)objc_msgSend(v18, "_initWithHTMLData:options:documentAttributes:error:", v10, v15, 0, &v51);
      v21 = v51;
LABEL_8:
      v16 = v21;
      goto LABEL_10;
    }
    if (objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC518]))
    {
      v22 = [a1 alloc];
      v23 = *(_QWORD *)off_1E1678DD0;
      v24 = *(_QWORD *)off_1E1678DC8;
      v59[0] = *(_QWORD *)off_1E1678CE0;
      v59[1] = v24;
      v60[0] = v23;
      v60[1] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      v17 = (void *)objc_msgSend(v22, "_initWithHTMLData:options:documentAttributes:error:", v10, v15, 0, &v50);
      v21 = v50;
      goto LABEL_8;
    }
    if (objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC4E8]))
    {
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithSerializedRepresentation:", v10);
      if (v27)
      {
        v15 = (void *)v27;
        _UITemporaryFolderURL((uint64_t)CFSTR("com.apple.uikit.attributedstring"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "filename");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v28;
        if (v28)
          v30 = (const __CFString *)v28;
        else
          v30 = CFSTR("temp.rtfd");
        objc_msgSend(v45, "URLByAppendingPathComponent:", v30);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = 0;
        v31 = objc_msgSend(v15, "writeToURL:options:originalContentsURL:error:", v44, 1, 0, &v49);
        v32 = v49;
        v16 = v32;
        if (v31)
        {
          v48 = v32;
          -[objc_class _objectWithRTFDAtURL:userInfo:error:](a1, "_objectWithRTFDAtURL:userInfo:error:", v44, v12, &v48);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v48;

          v16 = v33;
        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "removeItemAtURL:error:", v45, 0);

        goto LABEL_10;
      }
    }
    else
    {
      if (objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC5C0]))
      {
        v34 = [a1 alloc];
        v57 = *(_QWORD *)off_1E1678CE0;
        v58 = *(_QWORD *)off_1E1679008;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        __mergedOptionDictionaries(v15, v12);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0;
        v17 = (void *)objc_msgSend(v34, "initWithData:options:documentAttributes:error:", v10, v35, 0, &v47);
        v16 = v47;

        goto LABEL_10;
      }
      if (objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC630]))
      {
        v36 = [a1 alloc];
        v37 = *(_QWORD *)off_1E1678FA0;
        v38 = *(_QWORD *)off_1E1678C80;
        v55[0] = *(_QWORD *)off_1E1678CE0;
        v55[1] = v38;
        v56[0] = v37;
        v56[1] = &unk_1E1A993A8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        __mergedOptionDictionaries(v15, v12);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        v17 = (void *)objc_msgSend(v36, "initWithData:options:documentAttributes:error:", v10, v39, 0, &v46);
        v16 = v46;

        goto LABEL_10;
      }
      if (objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC590]))
      {
        v41 = [a1 alloc];
        v53 = *(_QWORD *)off_1E1678CE0;
        v54 = *(_QWORD *)off_1E1678FA0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        __mergedOptionDictionaries(v42, v12);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v41, "initWithData:options:documentAttributes:error:", v10, v43, 0, 0);

LABEL_31:
        v16 = 0;
        goto LABEL_13;
      }
    }
    v17 = 0;
    goto LABEL_31;
  }
  v52 = 0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v10, &v52);
  v16 = v52;
  if (v15)
  {
    objc_msgSend(v15, "setRequiresSecureCoding:", 1);
    objc_msgSend(v15, "setDecodingFailurePolicy:", 0);
    objc_msgSend(v15, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishDecoding");
  }
  else
  {
    v17 = 0;
  }
LABEL_10:

  if (a6 && v16)
  {
    v16 = objc_retainAutorelease(v16);
    *a6 = v16;
  }
LABEL_13:
  v25 = v17;

  return v25;
}

+ (uint64_t)objectWithItemProviderData:()UINSItemProvider typeIdentifier:error:
{
  return objc_msgSend(a1, "_objectWithItemProviderData:typeIdentifier:userInfo:error:", a3, a4, MEMORY[0x1E0C9AA70], a5);
}

+ (id)_objectWithItemProviderFileURL:()UINSItemProvider typeIdentifier:isInPlace:error:
{
  id v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id obj;
  _QWORD aBlock[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a3;
  v11 = a4;
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__145;
  v37 = __Block_byref_object_dispose__145;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__145;
  v31 = __Block_byref_object_dispose__145;
  v32 = 0;
  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__NSAttributedString_UINSItemProvider___objectWithItemProviderFileURL_typeIdentifier_isInPlace_error___block_invoke;
    aBlock[3] = &unk_1E16D9B18;
    aBlock[4] = &v27;
    aBlock[5] = &v33;
    aBlock[6] = a1;
    v15 = _Block_copy(aBlock);
    v16 = v15;
    if (a5)
    {
      v17 = objc_msgSend(v10, "startAccessingSecurityScopedResource");
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
      v19 = v34;
      obj = v34[5];
      v23[0] = v14;
      v23[1] = 3221225472;
      v23[2] = __102__NSAttributedString_UINSItemProvider___objectWithItemProviderFileURL_typeIdentifier_isInPlace_error___block_invoke_2;
      v23[3] = &unk_1E16D9B40;
      v24 = v16;
      objc_msgSend(v18, "coordinateReadingItemAtURL:options:error:byAccessor:", v10, 1, &obj, v23);
      objc_storeStrong(v19 + 5, obj);
      if (v17)
        objc_msgSend(v10, "stopAccessingSecurityScopedResource");

    }
    else
    {
      (*((void (**)(void *, id))v15 + 2))(v15, v10);
    }

  }
  if (a6)
  {
    v20 = v34[5];
    if (v20)
      *a6 = objc_retainAutorelease(v20);
  }
  v21 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v21;
}

- (id)initWithItemProviderData:()UINSItemProvider typeIdentifier:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a1, "init");
  objc_msgSend((id)objc_opt_class(), "objectWithItemProviderData:typeIdentifier:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  return v12;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("com.apple.uikit.attributedstring");
  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v0;
  objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v1;
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()UINSItemProvider
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)*MEMORY[0x1E0CEC5C8];
  v4 = a3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (uint64_t)writableTypeIdentifiersForItemProvider
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "writableTypeIdentifiersForItemProvider");
}

- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()UINSItemProvider
{
  id v3;
  uint64_t v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "_preferredRepresentationForItemProviderWritableTypeIdentifier:", v3);

  return v4;
}

- (uint64_t)loadDataWithTypeIdentifier:()UINSItemProvider forItemProviderCompletionHandler:
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.uikit.attributedstring")))
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v24;
    v7[2](v7, v8, v9);

  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToString:", v10);

    if (v11)
    {
      v12 = objc_msgSend(a1, "length");
      v27 = *(_QWORD *)off_1E1678CE0;
      v28[0] = *(_QWORD *)off_1E1679000;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = v28;
      v15 = &v27;
      v16 = 1;
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "isEqualToString:", v17);

      if (!v18)
      {
        v7[2](v7, 0, 0);
        goto LABEL_9;
      }
      v12 = objc_msgSend(a1, "length");
      v19 = *(_QWORD *)off_1E1678FA0;
      v20 = *(_QWORD *)off_1E1678C80;
      v25[0] = *(_QWORD *)off_1E1678CE0;
      v25[1] = v20;
      v26[0] = v19;
      v26[1] = &unk_1E1A993A8;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = v26;
      v15 = v25;
      v16 = 2;
    }
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dataFromRange:documentAttributes:error:", 0, v12, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v22, 0);
  }
LABEL_9:

  return 0;
}

- (uint64_t)_loadFileRepresentationOfTypeIdentifier:()UINSItemProvider forItemProviderCompletionHandler:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)*MEMORY[0x1E0CEC5C8];
  v8 = a3;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11 = objc_msgSend(a1, "length");
    v24 = *(_QWORD *)off_1E1678CE0;
    v25[0] = *(_QWORD *)off_1E1679000;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(a1, "fileWrapperFromRange:documentAttributes:error:", 0, v11, v12, &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;

    if (v13)
    {
      _UITemporaryFolderURL((uint64_t)CFSTR("com.apple.uikit.attributedstring"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathExtensionForType:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLByAppendingPathComponent:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v14;
      objc_msgSend(v13, "writeToURL:options:originalContentsURL:error:", v18, 1, 0, &v22);
      v19 = v22;

      if (v18 && !v19)
      {
        (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, v18, 0, 0);
        if (!v15)
          goto LABEL_12;
        goto LABEL_11;
      }
      v14 = v19;
    }
    else
    {
      v18 = 0;
      v15 = 0;
    }
    (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v14);

    if (!v15)
    {
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeItemAtURL:error:", v15, 0);

    goto LABEL_12;
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
LABEL_13:

  return 0;
}

@end
