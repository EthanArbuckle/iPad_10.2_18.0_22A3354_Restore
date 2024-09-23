@implementation TVAppDocumentRequestController

void __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGAffineTransform *v13;
  __int128 v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "templateViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "swipeUpMessageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "mediaController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intent");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "templateViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v21.a = *MEMORY[0x24BDBD8B8];
    v18 = *(_OWORD *)&v21.a;
    *(_OWORD *)&v21.c = v19;
    *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v17 = *(_OWORD *)&v21.tx;
    objc_msgSend(v10, "setTransform:", &v21);

    objc_msgSend(*(id *)(a1 + 32), "swipeUpMessageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    *(_OWORD *)&v21.a = v18;
    *(_OWORD *)&v21.c = v19;
    *(_OWORD *)&v21.tx = v17;
    v13 = &v21;
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    if (*(_BYTE *)(a1 + 40))
    {
      v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v21.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v21.c = v14;
      *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    }
    else
    {
      CGAffineTransformMakeScale(&v21, 1.1, 1.1);
    }
    objc_msgSend(*(id *)(a1 + 32), "templateViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    objc_msgSend(v16, "setTransform:", &v20);

    objc_msgSend(*(id *)(a1 + 32), "swipeUpMessageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v20 = v21;
    v13 = &v20;
  }
  objc_msgSend(v11, "setTransform:", v13);

}

uint64_t __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGAffineTransform *v13;
  __int128 v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  uint64_t result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  if (*(_BYTE *)(a1 + 48))
    v2 = 0.0;
  else
    v2 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "templateViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "swipeUpMessageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "mediaController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intent");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "templateViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x24BDBD8B8];
    v21 = *(_OWORD *)&v24.a;
    *(_OWORD *)&v24.c = v22;
    *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v20 = *(_OWORD *)&v24.tx;
    objc_msgSend(v10, "setTransform:", &v24);

    objc_msgSend(*(id *)(a1 + 32), "swipeUpMessageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    *(_OWORD *)&v24.a = v21;
    *(_OWORD *)&v24.c = v22;
    *(_OWORD *)&v24.tx = v20;
    v13 = &v24;
  }
  else
  {
    memset(&v24, 0, sizeof(v24));
    if (*(_BYTE *)(a1 + 48))
    {
      CGAffineTransformMakeScale(&v24, 1.1, 1.1);
    }
    else
    {
      v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v24.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v24.c = v14;
      *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    }
    objc_msgSend(*(id *)(a1 + 32), "templateViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v24;
    objc_msgSend(v16, "setTransform:", &v23);

    objc_msgSend(*(id *)(a1 + 32), "swipeUpMessageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v23 = v24;
    v13 = &v23;
  }
  objc_msgSend(v11, "setTransform:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_updateShowcaseFactor");
  v17 = *(_BYTE **)(a1 + 32);
  if (v17[1083])
  {
    objc_msgSend(v17, "appDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appDocumentController:didHideUI:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_hostingFocusEnvironment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsFocusUpdate");

}

@end
