@implementation ICPostToInstagramAction

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getUIApplicationWillEnterForegroundNotification[0]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)ICPostToInstagramAction;
  -[ICPostToInstagramAction dealloc](&v5, sel_dealloc);
}

- (void)appDidResume:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getUIApplicationWillEnterForegroundNotification[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, 0);

  -[ICPostToInstagramAction setInstagramRepresentation:](self, "setInstagramRepresentation:", 0);
}

- (id)inputContentClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  ICPostToInstagramAction *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __103__ICPostToInstagramAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
  v23[3] = &unk_1E7AFA620;
  v24 = v12;
  v25 = v13;
  v26 = self;
  v27 = v14;
  v28 = v16;
  v29 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v16;
  v22 = v12;
  objc_msgSend(v22, "generateCollectionByCoercingToItemClasses:completionHandler:", v17, v23);

}

- (void)shareAsALAssetWithItem:(id)a3 caption:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ALAssetURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "removeCharactersInString:", CFSTR("?&="));
  v17 = (void *)MEMORY[0x1E0C99E98];
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("instagram://library?AssetPath=%@&InstagramCaption=%@"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLWithString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class generalPasteboard](getUIPasteboardClass_42804(), "generalPasteboard");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setString:", v12);

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __100__ICPostToInstagramAction_shareAsALAssetWithItem_caption_userInterface_successHandler_errorHandler___block_invoke;
  v27[3] = &unk_1E7AF8860;
  v28 = v10;
  v26 = v10;
  objc_msgSend(v25, "openURL:withBundleIdentifier:userInterface:completionHandler:", v23, CFSTR("com.burbn.instagram"), v11, v27);

}

- (void)shareAsImageFileWithItem:(id)a3 caption:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__ICPostToInstagramAction_shareAsImageFileWithItem_caption_userInterface_successHandler_errorHandler___block_invoke;
  v17[3] = &unk_1E7AF4280;
  v17[4] = self;
  v18 = v11;
  v19 = v13;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v13;
  objc_msgSend(a3, "getFileRepresentation:forType:", v17, 0);

}

- (WFFileRepresentation)instagramRepresentation
{
  return self->_instagramRepresentation;
}

- (void)setInstagramRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_instagramRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instagramRepresentation, 0);
}

void __102__ICPostToInstagramAction_shareAsImageFileWithItem_caption_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "wfName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("ig"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D140A0], "proposedTemporaryFileURLForFilename:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v4, "writeToFileURL:overwriting:error:", v7, 0, &v23);
    v8 = v23;
    v9 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.instagram.photo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileWithURL:options:ofType:", v7, 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    getUIApplicationWillEnterForegroundNotification[0]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v13, sel_appDidResume_, v14, 0);

    objc_msgSend(*(id *)(a1 + 32), "setInstagramRepresentation:", v11);
    v15 = *(_QWORD *)(a1 + 40);
    v24 = CFSTR("InstagramCaption");
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class generalPasteboard](getUIPasteboardClass_42804(), "generalPasteboard");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setString:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "app");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __102__ICPostToInstagramAction_shareAsImageFileWithItem_caption_userInterface_successHandler_errorHandler___block_invoke_2;
    v20[3] = &unk_1E7AF4258;
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v18, "openFile:withAnnotation:completionHandler:", v19, v16, v20);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __102__ICPostToInstagramAction_shareAsImageFileWithItem_caption_userInterface_successHandler_errorHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __100__ICPostToInstagramAction_shareAsALAssetWithItem_caption_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __103__ICPostToInstagramAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a2, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("InstagramCaption"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E7AFA810;
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v8, "preferredFileType"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "conformsToUTType:", *MEMORY[0x1E0CEC520]),
          v13,
          (v14 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 48), "shareAsALAssetWithItem:caption:userInterface:successHandler:errorHandler:", v8, v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "shareAsImageFileWithItem:caption:userInterface:successHandler:errorHandler:", v8, v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "numberOfItems");

    v17 = *(_QWORD *)(a1 + 64);
    if (!v16)
    {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v6);
      goto LABEL_11;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2FE0];
    v23[0] = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("Could Not Post Video"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v23[1] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("Shortcuts can only post video on Instagram if the video is in a photo album.\n\nTry putting a “Save to Photo Album” action before “Post on Instagram.”"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 79, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v22);

  }
LABEL_11:

}

@end
