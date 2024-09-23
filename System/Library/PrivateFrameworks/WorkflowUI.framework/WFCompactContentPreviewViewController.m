@implementation WFCompactContentPreviewViewController

- (void)loadView
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
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)WFCompactContentPreviewViewController;
  -[WFCompactContentPreviewViewController loadView](&v15, sel_loadView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFCompactContentPreviewViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[WFCompactContentPreviewViewController setIndicatorView:](self, "setIndicatorView:", v3);
  objc_msgSend(v3, "startAnimating");
  v14 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v3, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactContentPreviewViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(v3, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactContentPreviewViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v13);

}

- (void)viewDidLayoutSubviews
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
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFCompactContentPreviewViewController;
  -[WFCompactContentPreviewViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[WFCompactContentPreviewViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[WFCompactContentPreviewViewController thumbnailViewController](self, "thumbnailViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (double)contentHeightForWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[WFCompactContentPreviewViewController thumbnailViewController](self, "thumbnailViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 150.0;
  -[WFCompactContentPreviewViewController thumbnailViewController](self, "thumbnailViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentHeightForWidth:", a3);
  v8 = v7;

  return v8;
}

- (void)invalidateContentSize
{
  id v3;

  -[WFCompactContentPreviewViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewViewControllerDidInvalidateSize:", self);

}

- (void)setContentItem:(id)a3 completionHandler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFCompactThumbnailViewController *thumbnailViewController;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCompactContentPreviewViewController.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItem"));

  }
  -[WFCompactContentPreviewViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[WFCompactThumbnailViewController willMoveToParentViewController:](self->_thumbnailViewController, "willMoveToParentViewController:", 0);
  -[WFCompactThumbnailViewController view](self->_thumbnailViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[WFCompactThumbnailViewController removeFromParentViewController](self->_thumbnailViewController, "removeFromParentViewController");
  thumbnailViewController = self->_thumbnailViewController;
  self->_thumbnailViewController = 0;

  objc_storeStrong((id *)&self->_contentItem, a3);
  -[WFCompactContentPreviewViewController indicatorView](self, "indicatorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startAnimating");

  -[WFCompactContentPreviewViewController invalidateContentSize](self, "invalidateContentSize");
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke;
  v16[3] = &unk_24E603CB8;
  objc_copyWeak(&v19, &location);
  v13 = v8;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  -[WFCompactContentPreviewViewController getThumbnailViewControllerForContentItem:completionHandler:](self, "getThumbnailViewControllerForContentItem:completionHandler:", v13, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (UIView)sourceViewForQuickLook
{
  void *v2;
  void *v3;

  -[WFCompactContentPreviewViewController thumbnailViewController](self, "thumbnailViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)contentAllowsScrolling
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFCompactContentPreviewViewController thumbnailViewController](self, "thumbnailViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFCompactContentPreviewViewController thumbnailViewController](self, "thumbnailViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "preferredContentMode") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)getThumbnailViewControllerForContentItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __100__WFCompactContentPreviewViewController_getThumbnailViewControllerForContentItem_completionHandler___block_invoke;
  v10[3] = &unk_24E603CE0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHandler:](self, "_getTypeSpecificThumbnailViewControllerForContentItem:completionHandler:", v9, v10);

}

- (id)_fileThumbnailViewControllerForContentItem:(id)a3
{
  id v3;
  NSObject *v4;
  WFCompactFileThumbnailViewController *v5;
  void *v6;
  void *v7;
  WFCompactFileThumbnailViewController *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  getWFDialogLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[WFCompactContentPreviewViewController _fileThumbnailViewControllerForContentItem:]";
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_22007E000, v4, OS_LOG_TYPE_DEFAULT, "%s Showing content with a file thumbnail: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v5 = [WFCompactFileThumbnailViewController alloc];
  objc_msgSend(v3, "preferredFileType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFCompactFileThumbnailViewController initWithFileType:filename:](v5, "initWithFileType:filename:", v6, v7);

  return v8;
}

- (void)_getTypeSpecificThumbnailViewControllerForContentItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WFCompactPreviewThumbnailViewController *v8;
  WFCompactPreviewThumbnailViewController *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(MEMORY[0x24BDBCF50], "universalPreviewsEnabled")
    || !objc_msgSend(v6, "conformsToContentItemPreviewProviding"))
  {
    if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
    {
      -[WFCompactContentPreviewViewController _fileThumbnailViewControllerForContentItem:](self, "_fileThumbnailViewControllerForContentItem:", v6);
      v8 = (WFCompactPreviewThumbnailViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v6, "preferredDisplayStyle") == 1)
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke;
      v33[3] = &unk_24E603D08;
      v34 = v6;
      v35 = v7;
      objc_msgSend(v34, "getObjectRepresentation:forClass:", v33, objc_opt_class());

      v10 = v34;
    }
    else
    {
      objc_msgSend(v6, "preferredObjectType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToClass:", getPHAssetClass());

      if (v12)
      {
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_130;
        v30[3] = &unk_24E603DA8;
        v31 = v6;
        v32 = v7;
        objc_msgSend(v31, "getObjectRepresentation:forClass:", v30, getPHAssetClass());

        v10 = v31;
      }
      else
      {
        objc_msgSend(v6, "preferredObjectType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToClass:", objc_opt_class()))
        {

        }
        else
        {
          objc_msgSend(v6, "preferredFileType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE19360], "ownedTypes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "conformsToTypes:", v15);

          if (!v16)
          {
            objc_msgSend(v6, "preferredFileType");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "conformsToUTType:", *MEMORY[0x24BDF8410]);

            if (v18)
            {
              v24[0] = MEMORY[0x24BDAC760];
              v24[1] = 3221225472;
              v24[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_143;
              v24[3] = &unk_24E603E20;
              v25 = v6;
              v26 = v7;
              objc_msgSend(v25, "getFileRepresentation:forType:", v24, 0);

              v10 = v25;
            }
            else
            {
              objc_msgSend(v6, "preferredFileType");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "conformsToUTType:", *MEMORY[0x24BDF8510]);

              if (!v20)
              {
                (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
                goto LABEL_16;
              }
              v21[0] = MEMORY[0x24BDAC760];
              v21[1] = 3221225472;
              v21[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_3_148;
              v21[3] = &unk_24E603E48;
              v22 = v6;
              v23 = v7;
              objc_msgSend(v22, "getObjectRepresentation:forClass:", v21, objc_opt_class());

              v10 = v22;
            }
            goto LABEL_15;
          }
        }
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_141;
        v27[3] = &unk_24E603DD0;
        v28 = v6;
        v29 = v7;
        objc_msgSend(v28, "getObjectRepresentation:forClass:", v27, objc_opt_class());

        v10 = v28;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v8 = -[WFCompactPreviewThumbnailViewController initWithContentItem:]([WFCompactPreviewThumbnailViewController alloc], "initWithContentItem:", v6);
LABEL_6:
  v9 = v8;
  (*((void (**)(id, WFCompactPreviewThumbnailViewController *))v7 + 2))(v7, v8);

LABEL_16:
}

- (BOOL)containsImageOrMediaThumbnail
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[WFCompactContentPreviewViewController thumbnailViewController](self, "thumbnailViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[WFCompactContentPreviewViewController thumbnailViewController](self, "thumbnailViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (WFCompactContentPreviewViewControllerDelegate)delegate
{
  return (WFCompactContentPreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIActivityIndicatorView)indicatorView
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_indicatorView);
}

- (void)setIndicatorView:(id)a3
{
  objc_storeWeak((id *)&self->_indicatorView, a3);
}

- (WFCompactThumbnailViewController)thumbnailViewController
{
  return self->_thumbnailViewController;
}

- (void)setThumbnailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailViewController, 0);
  objc_destroyWeak((id *)&self->_indicatorView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  WFCompactMapThumbnailViewController *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = -[WFCompactMapThumbnailViewController initWithCLPlacemark:]([WFCompactMapThumbnailViewController alloc], "initWithCLPlacemark:", v6);
    (*(void (**)(uint64_t, WFCompactMapThumbnailViewController *))(v8 + 16))(v8, v9);

  }
  else
  {
    getWFDialogLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136315650;
      v13 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      v14 = 2114;
      v15 = v11;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to get a CLPlacemark representation for content: %{public}@, %@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_130(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  void *v22;
  uint64_t v23;
  WFCompactImageThumbnailViewController *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
  {
    getWFDialogLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      v32 = 2114;
      v33 = v14;
      v34 = 2112;
      v35 = v9;
      v15 = "%s Failed to get a PHAsset representation for content: %{public}@, %@";
      v16 = v13;
      v17 = OS_LOG_TYPE_DEFAULT;
      v18 = 32;
LABEL_17:
      _os_log_impl(&dword_22007E000, v16, v17, v15, buf, v18);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v10 = objc_msgSend(v7, "playbackStyle");
  if ((unint64_t)(v10 - 1) < 3)
  {
    v19 = objc_msgSend(v7, "pixelWidth");
    v20 = objc_msgSend(v7, "pixelHeight");
    if (v19 && v20)
    {
      v21 = (double)v19 / (double)v20;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_131;
      aBlock[3] = &unk_24E603D58;
      v29 = *(id *)(a1 + 32);
      v22 = _Block_copy(aBlock);
      v23 = *(_QWORD *)(a1 + 40);
      v24 = -[WFCompactImageThumbnailViewController initWithAspectRatio:imageGenerator:]([WFCompactImageThumbnailViewController alloc], "initWithAspectRatio:imageGenerator:", v22, v21);
      (*(void (**)(uint64_t, WFCompactImageThumbnailViewController *))(v23 + 16))(v23, v24);

      v12 = v29;
      goto LABEL_10;
    }
    getWFDialogLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      v32 = 2112;
      v33 = v7;
      v15 = "%s Photo had a size of zero: %@";
      goto LABEL_16;
    }
LABEL_18:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if ((unint64_t)(v10 - 4) >= 2)
  {
    if (v10)
      goto LABEL_19;
    getWFDialogLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      v32 = 2112;
      v33 = v7;
      v15 = "%s PHAsset has an unsupported playback style: %@";
LABEL_16:
      v16 = v13;
      v17 = OS_LOG_TYPE_FAULT;
      v18 = 22;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v11 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_3;
  v25[3] = &unk_24E603D80;
  v26 = v11;
  v27 = *(id *)(a1 + 40);
  objc_msgSend(v26, "getObjectRepresentation:forClass:", v25, objc_opt_class());

  v12 = v26;
LABEL_10:

LABEL_19:
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_141(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  WFCompactMediaThumbnailViewController *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = -[WFCompactMediaThumbnailViewController initWithAVPlayerItem:]([WFCompactMediaThumbnailViewController alloc], "initWithAVPlayerItem:", v7);
    (*(void (**)(uint64_t, WFCompactMediaThumbnailViewController *))(v8 + 16))(v8, v9);

  }
  else
  {
    getWFDialogLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136315650;
      v13 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      v14 = 2114;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to get an AVAsset representation for content: %{public}@, %@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_143(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  WFCompactImageThumbnailViewController *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  _QWORD aBlock[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    getWFDialogLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v22 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      v23 = 2114;
      v24 = v14;
      v25 = 2112;
      v26 = v6;
      v15 = "%s Failed to get a file representation for image: %{public}@, %@";
      v16 = v13;
      v17 = OS_LOG_TYPE_DEFAULT;
      v18 = 32;
LABEL_9:
      _os_log_impl(&dword_22007E000, v16, v17, v15, buf, v18);
    }
LABEL_10:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_11;
  }
  WFImageSizeFromFile();
  if (v7 == 0.0 || v8 == 0.0)
  {
    getWFDialogLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      v23 = 2112;
      v24 = v5;
      v15 = "%s Image had a size of zero: %@";
      v16 = v13;
      v17 = OS_LOG_TYPE_FAULT;
      v18 = 22;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_144;
  aBlock[3] = &unk_24E603D58;
  v9 = v7 / v8;
  v20 = v5;
  v10 = _Block_copy(aBlock);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = -[WFCompactImageThumbnailViewController initWithAspectRatio:imageGenerator:]([WFCompactImageThumbnailViewController alloc], "initWithAspectRatio:imageGenerator:", v10, v9);
  (*(void (**)(uint64_t, WFCompactImageThumbnailViewController *))(v11 + 16))(v11, v12);

LABEL_11:
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_3_148(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  WFCompactTextThumbnailViewController *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = -[WFCompactTextThumbnailViewController initWithString:]([WFCompactTextThumbnailViewController alloc], "initWithString:", v6);
    (*(void (**)(uint64_t, WFCompactTextThumbnailViewController *))(v8 + 16))(v8, v9);

  }
  else
  {
    getWFDialogLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136315650;
      v13 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke_3";
      v14 = 2114;
      v15 = v11;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to get a NSString representation for content: %{public}@, %@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_144(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "wfType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v5 = v3;
  WFAsyncTransformedImageFromImage();

}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_2_145(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BEC14E0];
  objc_msgSend(a2, "mappedData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithData:scale:", v6, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UIImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_131(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_2;
  v10[3] = &unk_24E603D30;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "getThumbnail:ofSize:", v10, a3, a4);

}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  WFCompactMediaThumbnailViewController *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = -[WFCompactMediaThumbnailViewController initWithAVPlayerItem:]([WFCompactMediaThumbnailViewController alloc], "initWithAVPlayerItem:", v6);
    (*(void (**)(uint64_t, WFCompactMediaThumbnailViewController *))(v8 + 16))(v8, v9);

  }
  else
  {
    getWFDialogLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136315650;
      v13 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke_3";
      v14 = 2114;
      v15 = v11;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to get an AVPlayerItem representation for content: %{public}@, %@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "UIImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __100__WFCompactContentPreviewViewController_getThumbnailViewControllerForContentItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fileThumbnailViewControllerForContentItem:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_2;
  v6[3] = &unk_24E603C90;
  objc_copyWeak(&v10, a1 + 6);
  v7 = a1[4];
  v4 = a1[5];
  v8 = v3;
  v9 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(&v10);
}

void __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "contentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = objc_msgSend(*(id *)(a1 + 40), "contentHeightLikelyToChange");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_3;
    v7[3] = &unk_24E604E80;
    v7[4] = WeakRetained;
    v8 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v5 + 16))(v5, v6, v7);

  }
}

void __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "indicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

  objc_msgSend(*(id *)(a1 + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setThumbnailViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "contentHeightForWidth:", v5);
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetHeightForAnimatingPreviewViewController:toProposedHeight:", *(_QWORD *)(a1 + 32), v7);
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 40), "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", 0.0);
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v13, v10);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v14);

  objc_msgSend(*(id *)(a1 + 40), "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v14, "layoutIfNeeded");
  v16 = (void *)MEMORY[0x24BEBDB00];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_4;
  v18[3] = &unk_24E604D88;
  v19 = v14;
  v17 = v14;
  objc_msgSend(v16, "animateWithDuration:animations:", v18, 0.400000006);
  objc_msgSend(*(id *)(a1 + 32), "invalidateContentSize");

}

uint64_t __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

@end
