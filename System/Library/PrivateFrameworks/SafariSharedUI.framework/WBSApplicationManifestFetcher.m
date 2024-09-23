@implementation WBSApplicationManifestFetcher

- (WBSApplicationManifestFetcher)initWithWebView:(id)a3
{
  id v4;
  WBSApplicationManifestFetcher *v5;
  WBSApplicationManifestFetcher *v6;
  WBSApplicationManifestFetcher *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSApplicationManifestFetcher;
  v5 = -[WBSApplicationManifestFetcher init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)getApplicationManifestWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int64_t state;
  void *v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id completionHandler;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];

  v4 = a3;
  v5 = v4;
  state = self->_state;
  switch(state)
  {
    case 2:
      (*((void (**)(id, _WKApplicationManifest *))v4 + 2))(v4, self->_manifest);
      break;
    case 1:
      v10 = (void *)MEMORY[0x1A85D45E4](self->_completionHandler);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __77__WBSApplicationManifestFetcher_getApplicationManifestWithCompletionHandler___block_invoke_2;
      v13[3] = &unk_1E54414B0;
      v14 = v10;
      v15 = v5;
      WeakRetained = v10;
      v11 = (void *)MEMORY[0x1A85D45E4](v13);
      completionHandler = self->_completionHandler;
      self->_completionHandler = v11;

      goto LABEL_7;
    case 0:
      v7 = (void *)MEMORY[0x1A85D45E4](v4);
      v8 = self->_completionHandler;
      self->_completionHandler = v7;

      self->_state = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __77__WBSApplicationManifestFetcher_getApplicationManifestWithCompletionHandler___block_invoke;
      v16[3] = &unk_1E5441488;
      v16[4] = self;
      objc_msgSend(WeakRetained, "_getApplicationManifestWithCompletionHandler:", v16);
LABEL_7:

      break;
  }

}

void __77__WBSApplicationManifestFetcher_getApplicationManifestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void (**v7)(id, id);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  v4 = a2;
  v7 = (void (**)(id, id))MEMORY[0x1A85D45E4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = 0;

  v7[2](v7, v4);
}

void __77__WBSApplicationManifestFetcher_getApplicationManifestWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)downloadImagesForManifest:(id)a3 linkIconParameters:(id)a4 usingWebView:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  dispatch_group_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  dispatch_group_t group;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id obj;
  _QWORD block[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  dispatch_group_t v84;
  id v85;
  id v86;
  _QWORD v87[5];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v12)
  {
    v15 = dispatch_group_create();
    objc_msgSend(v10, "icons");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(a1, "_preferredPurposeForIcons:", v16);
    v18 = MEMORY[0x1E0C809B0];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke;
    v87[3] = &__block_descriptor_40_e36_B16__0___WKApplicationManifestIcon_8l;
    v87[4] = v17;
    objc_msgSend(v16, "safari_filterObjectsUsingBlock:", v87);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = v11;
    if (!objc_msgSend(v19, "count"))
    {
      objc_msgSend(v10, "icons");
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v20;
    }
    v58 = v14;
    v83[0] = v18;
    v83[1] = 3221225472;
    v83[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_2;
    v83[3] = &unk_1E5441598;
    group = v15;
    v84 = group;
    v59 = v12;
    v85 = v12;
    v60 = v10;
    v61 = v10;
    v86 = v61;
    v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A85D45E4](v83);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    obj = v19;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v80 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          objc_msgSend(v27, "purposes");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "containsObject:", &unk_1E5479C30);

          objc_msgSend(v27, "src");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, uint64_t, uint64_t))v21)[2](v21, v30, v22, v29);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
      }
      while (v24);
    }
    v55 = (void *)v22;

    objc_msgSend(v61, "startURL");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("/favicon.ico"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "absoluteURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("/apple-touch-icon.png"), v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "absoluteURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = (void *)v31;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("/apple-touch-icon-precomposed.png"), v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "absoluteURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v66 = v62;
    v38 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v76;
      do
      {
        v41 = 0;
        do
        {
          v42 = v33;
          if (*(_QWORD *)v76 != v40)
            objc_enumerationMutation(v66);
          v43 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v41);
          objc_msgSend(v43, "attributes");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("mask"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            v33 = v42;
          }
          else
          {
            objc_msgSend(v43, "url");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "absoluteURL");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v48 = objc_msgSend(v43, "iconType");
            if (v48 == 2)
            {
              ((void (**)(_QWORD, void *, void *, _QWORD))v21)[2](v21, v47, v63, 0);
              v33 = v42;
              if (objc_msgSend(v47, "isEqual:", v37))
              {

                v37 = 0;
              }
            }
            else
            {
              v33 = v42;
              if (v48 == 1)
              {
                if (objc_msgSend(v47, "isEqual:", v35))
                {

                  v35 = 0;
                }
                ((void (**)(_QWORD, void *, void *, _QWORD))v21)[2](v21, v47, v64, 0);
              }
              else if (!v48)
              {
                if (objc_msgSend(v47, "isEqual:", v42))
                {

                  v33 = 0;
                }
                ((void (**)(_QWORD, void *, void *, _QWORD))v21)[2](v21, v47, v65, 0);
              }
            }

          }
          ++v41;
        }
        while (v39 != v41);
        v49 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
        v39 = v49;
      }
      while (v49);
    }
    v54 = v35;

    ((void (**)(_QWORD, void *, void *, _QWORD))v21)[2](v21, v33, v65, 0);
    ((void (**)(_QWORD, void *, void *, _QWORD))v21)[2](v21, v35, v64, 0);
    ((void (**)(_QWORD, void *, void *, _QWORD))v21)[2](v21, v37, v63, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_95;
    block[3] = &unk_1E54415C0;
    v69 = v55;
    v70 = v61;
    v71 = v65;
    v72 = v64;
    v73 = v63;
    v14 = v58;
    v74 = v58;
    v50 = v63;
    v51 = v64;
    v52 = v65;
    v53 = v55;
    dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

    v12 = v59;
    v10 = v60;
    v11 = v62;
  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v10);
  }

}

BOOL __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "purposes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "purposes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      v6 = 0;
    else
      v6 = *(_QWORD *)(a1 + 32) == 1;

  }
  return v6;
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a3;
  if (a2)
  {
    v8 = *(NSObject **)(a1 + 32);
    v9 = a2;
    dispatch_group_enter(v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", v9);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E5441570;
    v11 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    v16 = a4;
    v14 = *(id *)(a1 + 48);
    v15 = v7;
    objc_msgSend(v11, "_dataTaskWithRequest:completionHandler:", v10, v12);

  }
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  char v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__0;
  v16[4] = __Block_byref_object_dispose__0;
  v5 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_76;
  v15[3] = &unk_1E54414F8;
  v15[4] = v16;
  objc_msgSend(v4, "setDidReceiveData:", v15);
  v6 = v5;
  v7 = 3221225472;
  v8 = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_2_78;
  v9 = &unk_1E5441548;
  v13 = v16;
  v10 = *(id *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v4, "setDidCompleteWithError:", &v6);
  objc_msgSend(v3, "setDelegate:", v4, v6, v7, v8, v9);

  _Block_object_dispose(v16, 8);
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_76(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    objc_msgSend(v4, "appendData:");
  }
  else
  {
    v5 = objc_msgSend(a3, "mutableCopy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_2_78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;

  if (a3 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_3_80;
      block[3] = &unk_1E5441520;
      v10 = *(_BYTE *)(a1 + 64);
      v6 = *(id *)(a1 + 40);
      v7 = v4;
      v8 = *(id *)(a1 + 48);
      v9 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }

  }
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_3_80(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "themeColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "safari_setThemeColor:", v2);

  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_95(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  __CFString *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __CFString *v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  double v28;
  id v29;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_setIconKind:", CFSTR("Manifest"));
    objc_msgSend(*(id *)(a1 + 40), "safari_setImages:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "safari_largestSizedBitmapImageOrSVGFromImages:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "safari_largestSizedBitmapImageOrSVGFromImages:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CEA638], "safari_largestSizedBitmapImageOrSVGFromImages:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  if (objc_msgSend(v5, "safari_isSVGImage") && !objc_msgSend(v3, "safari_isSVGImage"))
  {
    v9 = v6;
    goto LABEL_10;
  }
  objc_msgSend(v6, "safari_longestEdgeInPixels");
  v8 = v7;
  objc_msgSend(v3, "safari_longestEdgeInPixels");
  v9 = v6;
  if (v8 <= v10)
  {
LABEL_7:
    v4 = (id *)(a1 + 56);
    v9 = v3;
    if (!v3)
    {
      v11 = 0;
      v12 = 0;
      v29 = 0;
      goto LABEL_11;
    }
  }
LABEL_10:
  v12 = CFSTR("Touch");
  v29 = *v4;
  v11 = v9;
LABEL_11:
  if ((objc_msgSend(v11, "safari_isSVGImage") & 1) == 0)
  {
    objc_msgSend(v11, "safari_longestEdgeInPixels");
    v14 = v13;
    objc_msgSend(v2, "safari_longestEdgeInPixels");
    v16 = v15;
    v17 = 64.0;
    if (v16 <= 64.0)
      objc_msgSend(v2, "safari_longestEdgeInPixels");
    if (v14 < v17)
    {
      v18 = CFSTR("Favicon");

      v19 = *(id *)(a1 + 48);
      v20 = v2;

      v11 = v20;
      v12 = v18;
      v29 = v19;
    }
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "safari_largestSizedBitmapImageOrSVGFromImages:", *(_QWORD *)(a1 + 32));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safari_longestEdgeInPixels");
  v23 = v22;
  objc_msgSend(v11, "safari_longestEdgeInPixels");
  v25 = v24;
  v26 = objc_msgSend(v11, "safari_transparencyAnalysisResult");
  objc_msgSend(v21, "safari_themeColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {

    goto LABEL_18;
  }
  if (objc_msgSend(v21, "safari_transparencyAnalysisResult") != 2 || v26 == 2)
  {
LABEL_18:
    v28 = v23 * 0.7;
    if (!v11)
      goto LABEL_24;
    goto LABEL_19;
  }
  v28 = 128.0;
  if (!v11)
    goto LABEL_24;
LABEL_19:
  if (!v21 || fabs(v25 + -512.0) <= 2.22044605e-16 || (objc_msgSend(v21, "safari_isSVGImage") & 1) == 0 && v25 >= v28)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_setIconKind:", v12);
    objc_msgSend(*(id *)(a1 + 40), "safari_setImages:", v29);
  }
LABEL_24:
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

+ (double)_longestEdgeForIcon:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  float v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "sizes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "floatValue");
        v10 = v9;
        if (v7 < v10)
          v7 = v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (int64_t)_preferredPurposeForIcons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  int64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = 0.0;
    v9 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(a1, "_longestEdgeForIcon:", v11);
        if (v12 >= v8)
        {
          v13 = v12;
          objc_msgSend(v11, "purposes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "_primaryPurposeForPurposes:", v14);

          if (v13 != v8 || v15 >= v9)
          {
            v8 = v13;
            v9 = v15;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (int64_t)_primaryPurposeForPurposes:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", &unk_1E5479C48) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "containsObject:", &unk_1E5479C30))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
