@implementation SSScreenshotMetadataHarvester

+ (void)_crawlViewController:(id)a3 executingBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v7[2](v7, v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "childViewControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_crawlViewController:executingBlock:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++), v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "presentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_crawlViewController:executingBlock:", v14, v7);

  }
}

+ (void)_crawlView:(id)a3 executingBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v7[2](v7, v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v6, "subviews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_crawlView:executingBlock:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

+ (id)_contentRectsForMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  double x;
  double y;
  double width;
  double height;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  CGRect v24;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __57__SSScreenshotMetadataHarvester__contentRectsForMetadata__block_invoke;
  v21 = &unk_24D06B9E8;
  v7 = v4;
  v22 = v7;
  v8 = v3;
  v23 = v8;
  objc_msgSend(a1, "_crawlViewController:executingBlock:", v6, &v18);

  objc_msgSend(MEMORY[0x24BDF6C50], "visiblePeripheralFrame", v18, v19, v20, v21);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  if (!CGRectIsNull(v24))
  {
    v13 = v7;
    objc_msgSend(v13, "convertRect:fromView:", 0, x, y, width, height);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addObject:", v14);
  }
  v15 = v23;
  v16 = v8;

  return v16;
}

void __57__SSScreenshotMetadataHarvester__contentRectsForMetadata__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(a2, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v18 = v3;
    objc_msgSend(v3, "safeAreaInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v18, "bounds");
    objc_msgSend(*(id *)(a1 + 32), "convertRect:fromCoordinateSpace:", v18, v7 + v12, v5 + v13, v14 - (v7 + v11), v15 - (v5 + v9));
    v16 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    v3 = v18;
  }

}

+ (void)_grabUserActivityTitleWithCallback:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDC1598], "_currentUserActivityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDC1598];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke;
  v7[3] = &unk_24D06BA60;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "_fetchUserActivityWithUUID:completionHandler:", v4, v7);

}

void __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke_2;
    block[3] = &unk_24D06BA10;
    v25 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v9 = v25;
  }
  else
  {
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "webpageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_retainAutorelease(v7);
    v10 = (id)objc_msgSend(v9, "UTF8String");
    objc_msgSend(v8, "absoluteString");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (id)objc_msgSend(v11, "UTF8String");

    if (v10)
    {
      objc_msgSend(v6, "expirationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v14 = 0;
      else
        v14 = v9;
      v10 = v14;

    }
    if (v12)
    {
      objc_msgSend(v6, "expirationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v16 = 0;
      else
        v16 = v8;
      v12 = v16;

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke_3;
    v20[3] = &unk_24D06BA38;
    v17 = *(id *)(a1 + 32);
    v22 = v12;
    v23 = v17;
    v21 = v10;
    v18 = v12;
    v19 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v20);

  }
}

uint64_t __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)screenshotServiceWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
  {
LABEL_9:

    v14 = 0;
LABEL_13:
    objc_msgSend((id)objc_opt_class(), "_applicationScreenshotServiceWithPrivateDelegate:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend((id)objc_opt_class(), "_applicationScreenshotServiceWithPrivateDelegate:", 0);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
  v7 = v6;
  v8 = *(_QWORD *)v19;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v19 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
    objc_msgSend(v10, "_FBSScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v3);

    if ((v13 & 1) != 0)
      break;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        goto LABEL_3;
      goto LABEL_9;
    }
  }
  v14 = v10;

  if (!v14)
    goto LABEL_13;
  objc_msgSend((id)objc_opt_class(), "_screenshotServiceForWindowScene:wantsPrivateDelegate:", v14, 1);
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend((id)objc_opt_class(), "_screenshotServiceForWindowScene:wantsPrivateDelegate:", v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_16;
    goto LABEL_13;
  }
LABEL_15:
  v16 = (void *)v15;
LABEL_16:

  return v16;
}

+ (id)_applicationScreenshotServiceWithPrivateDelegate:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedScenes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__SSScreenshotMetadataHarvester__applicationScreenshotServiceWithPrivateDelegate___block_invoke;
  v9[3] = &unk_24D06BA88;
  v10 = a3;
  v9[4] = &v11;
  v9[5] = a1;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __82__SSScreenshotMetadataHarvester__applicationScreenshotServiceWithPrivateDelegate___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_screenshotServiceForWindowScene:wantsPrivateDelegate:", v6, *(unsigned __int8 *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
      *a3 = 1;
    }

  }
}

+ (id)_screenshotServiceForWindowScene:(id)a3 wantsPrivateDelegate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "_screenshotServiceIfPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "privateDelegate");
  else
    objc_msgSend(v6, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "activationState"))
  {
    if (!v8)
    {
      v9 = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v9 = 0;
  if (objc_msgSend(v5, "activationState") == 1 && v8)
  {
LABEL_9:
    objc_msgSend(v5, "_screenshotServiceIfPresent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:

  return v9;
}

+ (id)_screenshotServicesDelegateWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "screenshotServiceWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "privateDelegate");
  else
    objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)_grabPDFRepresentationForIdentifier:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[7];
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  objc_msgSend(a1, "_screenshotServicesDelegateWithIdentifier:", v6);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  objc_msgSend(a1, "screenshotServiceWithIdentifier:", v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16[5])
    goto LABEL_7;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v16[5] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_3;
      v11[3] = &unk_24D06BB00;
      v11[5] = &v15;
      v11[6] = v13;
      v8 = (id *)v11;
      goto LABEL_8;
    }
LABEL_7:
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_5;
    v10[3] = &unk_24D06BA10;
    v8 = (id *)v10;
    goto LABEL_8;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke;
  v12[3] = &unk_24D06BAD8;
  v12[5] = &v15;
  v8 = (id *)v12;
LABEL_8:
  v9 = v7;
  v8[4] = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

}

void __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_2;
  v3[3] = &unk_24D06BAB0;
  v4 = v1;
  objc_msgSend(v2, "fetchPDFRepresentationWithCompletion:", v3);

}

uint64_t __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_3(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = (void *)a1[4];
  v2 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_4;
  v4[3] = &unk_24D06BAB0;
  v5 = v1;
  objc_msgSend(v2, "screenshotService:generatePDFRepresentationWithCompletion:", v3, v4);

}

uint64_t __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

+ (BOOL)canGenerateDocumentForIdentifier:(id)a3
{
  void *v3;

  objc_msgSend(a1, "_screenshotServicesDelegateWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

+ (void)sendResponseForAction:(id)a3 withObject:(id)a4 forKey:(unint64_t)a5
{
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "canSendResponse");
  v10 = os_log_create("com.apple.screenshotservices", "MetadataHarvester");
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      v13 = 134217984;
      v14 = a5;
      _os_log_impl(&dword_213892000, v10, OS_LOG_TYPE_DEFAULT, "Send response for action with key: %lu", (uint8_t *)&v13, 0xCu);
    }

    v10 = objc_alloc_init(MEMORY[0x24BE0BE40]);
    -[NSObject setObject:forSetting:](v10, "setObject:forSetting:", v8, a5);
    objc_msgSend(MEMORY[0x24BE0BD90], "responseWithInfo:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendResponse:", v12);

  }
  else if (v11)
  {
    v13 = 134217984;
    v14 = a5;
    _os_log_impl(&dword_213892000, v10, OS_LOG_TYPE_DEFAULT, "Unable to send response for action with key: %lu", (uint8_t *)&v13, 0xCu);
  }

}

+ (void)harvestScreenshotMetadataAndRespondToAction:(id)a3
{
  id v4;
  void *v5;
  char IsYes;
  void *v7;
  void *v8;
  SSHarvestedApplicationDocument *v9;
  CFTimeInterval v10;
  NSObject *v11;
  uint64_t v12;
  SSHarvestedApplicationDocument *v13;
  id v14;
  dispatch_time_t v15;
  id v16;
  SSHarvestedApplicationDocument *v17;
  SSHarvestedApplicationMetadata *v18;
  void *v19;
  id v20;
  SSHarvestedApplicationMetadata *v21;
  _QWORD block[4];
  SSHarvestedApplicationDocument *v23;
  id v24;
  _QWORD *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  SSHarvestedApplicationDocument *v29;
  id v30;
  _QWORD *v31;
  CFTimeInterval v32;
  id v33;
  _QWORD v34[3];
  char v35;
  _QWORD v36[4];
  SSHarvestedApplicationMetadata *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flagForSetting:", 7);
  IsYes = BSSettingFlagIsYes();

  objc_msgSend(v4, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForSetting:", 10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((IsYes & 1) != 0)
  {
    v9 = objc_alloc_init(SSHarvestedApplicationDocument);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v35 = 0;
    v10 = CACurrentMediaTime();
    v11 = os_log_create("com.apple.screenshotservices", "MetadataHarvester");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v41 = v8;
      _os_log_impl(&dword_213892000, v11, OS_LOG_TYPE_DEFAULT, "Grab PDF representation for identifier: %{private}@", buf, 0xCu);
    }

    v12 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke_25;
    v27[3] = &unk_24D06BB50;
    v32 = v10;
    v28 = v8;
    v31 = v34;
    v13 = v9;
    v29 = v13;
    v33 = a1;
    v14 = v4;
    v30 = v14;
    objc_msgSend(a1, "_grabPDFRepresentationForIdentifier:withCallback:", v28, v27);
    v15 = dispatch_time(0, 10000000000);
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke_26;
    block[3] = &unk_24D06BB78;
    v25 = v34;
    v26 = a1;
    v23 = v13;
    v24 = v14;
    v16 = v14;
    v17 = v13;
    dispatch_after(v15, MEMORY[0x24BDAC9B8], block);

    _Block_object_dispose(v34, 8);
  }
  else
  {
    v18 = objc_alloc_init(SSHarvestedApplicationMetadata);
    objc_msgSend(a1, "_contentRectsForMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSHarvestedApplicationMetadata setContentRects:](v18, "setContentRects:", v19);

    -[SSHarvestedApplicationMetadata setCanGenerateDocument:](v18, "setCanGenerateDocument:", objc_msgSend(a1, "canGenerateDocumentForIdentifier:", v8));
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke;
    v36[3] = &unk_24D06BB28;
    v38 = v4;
    v39 = a1;
    v37 = v18;
    v20 = v4;
    v21 = v18;
    objc_msgSend(a1, "_grabUserActivityTitleWithCallback:", v36);

  }
}

uint64_t __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setUserActivityTitle:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setUserActivityURL:", v6);

  return objc_msgSend(*(id *)(a1 + 48), "sendResponseForAction:withObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 3);
}

void __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke_25(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  id v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  int v33;
  uint64_t v34;
  CGRect v35;

  v34 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v14 = CACurrentMediaTime();
  v15 = *(double *)(a1 + 64);
  v16 = os_log_create("com.apple.screenshotservices", "MetadataHarvester");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18 = objc_msgSend(v13, "length");
    v35.origin.x = a4;
    v35.origin.y = a5;
    v35.size.width = a6;
    v35.size.height = a7;
    NSStringFromCGRect(v35);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v22 = 138479107;
    v23 = v17;
    v24 = 2048;
    v25 = v18;
    v26 = 2048;
    v27 = a3;
    v28 = 2113;
    v29 = v19;
    v30 = 2048;
    v31 = v14 - v15;
    v32 = 1024;
    v33 = v20;
    _os_log_impl(&dword_213892000, v16, OS_LOG_TYPE_DEFAULT, "did grab PDF representation for identifier: %{private}@, data length: %lu, page: %ld, rect: %{private}@, elapsed time: %f, didSendResponse: %{BOOL}d", (uint8_t *)&v22, 0x3Au);

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if ((unint64_t)objc_msgSend(v13, "length") >> 20 >= 0x4B)
      v21 = 0;
    else
      v21 = v13;
    objc_msgSend(*(id *)(a1 + 40), "setPDFData:", v21);
    objc_msgSend(*(id *)(a1 + 40), "setPDFPage:", a3);
    objc_msgSend(*(id *)(a1 + 40), "setPDFVisibleRect:", a4, a5, a6, a7);
    objc_msgSend(*(id *)(a1 + 72), "sendResponseForAction:withObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.screenshotservices", "MetadataHarvester");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_213892000, v2, OS_LOG_TYPE_DEFAULT, "pdf harvesting timed out! didSendResponse: %{BOOL}d", (uint8_t *)v4, 8u);
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPDFData:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setPDFPage:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setPDFVisibleRect:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
    objc_msgSend(*(id *)(a1 + 56), "sendResponseForAction:withObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

@end
