@implementation STSImageDetailViewController

- (void)viewDidLoad
{
  -[STSResultDetailViewController updateWithThumbnail:orThumbnailInfo:](self, "updateWithThumbnail:orThumbnailInfo:", self->_image, self->_imageInfo);
}

- (void)setContentURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  STSImageDetailViewController *v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  STSImageDetailViewController *v21;
  _QWORD *v22;
  _QWORD *v23;
  objc_super v24;
  objc_super v25;
  _QWORD v26[4];
  _QWORD v27[5];
  id v28;
  id location;
  objc_super v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)STSImageDetailViewController;
  -[STSResultDetailViewController contentURL](&v31, sel_contentURL);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v30.receiver = self;
    v30.super_class = (Class)STSImageDetailViewController;
    -[STSResultDetailViewController setContentURL:](&v30, sel_setContentURL_, v4);
    objc_initWeak(&location, self);
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__0;
    v27[4] = __Block_byref_object_dispose__0;
    v28 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0;
    v25.receiver = self;
    v25.super_class = (Class)STSImageDetailViewController;
    -[STSResultDetailViewController contentURL](&v25, sel_contentURL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24.receiver = self;
    v24.super_class = (Class)STSImageDetailViewController;
    -[STSResultDetailViewController queryString](&v24, sel_queryString);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __46__STSImageDetailViewController_setContentURL___block_invoke;
    v18[3] = &unk_24E745C18;
    v19 = v6;
    v22 = v27;
    v10 = v7;
    v20 = v10;
    v21 = self;
    v23 = v26;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __46__STSImageDetailViewController_setContentURL___block_invoke_8;
    v12[3] = &unk_24E745C68;
    v15 = v26;
    v11 = v19;
    v13 = v11;
    v16 = v27;
    objc_copyWeak(&v17, &location);
    v14 = self;
    objc_msgSend(v8, "fetchImageWithURL:priority:isSource:begin:progress:completion:", v11, 4, 1, v18, 0, v12);

    objc_destroyWeak(&v17);
    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v27, 8);

    objc_destroyWeak(&location);
  }

}

void __46__STSImageDetailViewController_setContentURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v2;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Begin fetching image at URL: %@", (uint8_t *)&v10, 0xCu);
  }
  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
    v4 = *(const __CFString **)(a1 + 40);
  else
    v4 = &stru_24E7469D8;
  objc_msgSend(v3, "didStartNetworkRequest:query:queryId:", *(_QWORD *)(a1 + 32), v4, objc_msgSend(*(id *)(a1 + 48), "queryId"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemUptime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v9;

}

void __46__STSImageDetailViewController_setContentURL___block_invoke_8(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id WeakRetained;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemUptime");
  v13 = v12;
  v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("STSImageDownloadOperationStatusCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v13 - v14) * 1000.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Detail view source image downloaded status_code %@ %@ (duration %@)", buf, 0x20u);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didEndNetworkRequest:infoDict:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v10);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__STSImageDetailViewController_setContentURL___block_invoke_10;
  v23[3] = &unk_24E745C40;
  v24 = WeakRetained;
  v25 = v8;
  v26 = *(_QWORD *)(a1 + 40);
  v27 = v9;
  v20 = v9;
  v21 = v8;
  v22 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v23);

}

void __46__STSImageDetailViewController_setContentURL___block_invoke_10(uint64_t a1)
{
  double v2;
  double v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "contentSize");
  if (*MEMORY[0x24BDBF148] == v3 && *(double *)(MEMORY[0x24BDBF148] + 8) == v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "size");
    objc_msgSend(v5, "setContentSize:");

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 1056))
  {
    obj = 0;
    v6 = *(void **)(a1 + 56);
    v7 = v6;
  }
  else
  {
    v7 = 0;
    v6 = *(void **)(a1 + 40);
    obj = v6;
  }
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9 && (objc_storeStrong((id *)(v9 + 1048), obj), (v10 = *(_QWORD *)(a1 + 32)) != 0))
  {
    objc_storeStrong((id *)(v10 + 1056), v7);
    v11 = *(void **)(a1 + 32);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v11, "updateWithThumbnail:orThumbnailInfo:", obj, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageInfo, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
