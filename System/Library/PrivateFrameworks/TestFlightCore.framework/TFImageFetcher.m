@implementation TFImageFetcher

- (TFImageFetcher)init
{
  TFImageFetcher *v2;
  void *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TFImageFetcher;
  v2 = -[TFImageFetcher init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v2->_displayedScreenScale = v4;

  }
  return v2;
}

- (void)fetchIconArtwork:(id)a3 ofSize:(CGSize)a4 intoView:(id)a5 animated:(BOOL)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v22;
  TFImageFetcher *v23;
  id v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  height = a4.height;
  width = a4.width;
  v31 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  -[TFImageFetcher _urlStringForIconArtwork:ofSize:fileFormat:](self, "_urlStringForIconArtwork:ofSize:fileFormat:", a3, CFSTR("jpeg"), width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __60__TFImageFetcher_fetchIconArtwork_ofSize_intoView_animated___block_invoke;
    v22 = &unk_24D794AA8;
    v23 = self;
    v24 = v13;
    v25 = v11;
    v26 = a6;
    objc_msgSend(v14, "dataTaskWithURL:completionHandler:", v24, &v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "resume", v19, v20, v21, v22, v23);
  }
  else
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "generatedLogger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v28 = (id)objc_opt_class();
      v29 = 2112;
      v30 = v12;
      v18 = v28;
      _os_log_impl(&dword_2174E1000, v17, OS_LOG_TYPE_ERROR, "%@: Invalid URL %@", buf, 0x16u);

    }
  }

}

void __60__TFImageFetcher_fetchIconArtwork_ofSize_intoView_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  char v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "generatedLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(void **)(a1 + 40);
      v9 = v7;
      objc_msgSend(v8, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to fetch url %@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__TFImageFetcher_fetchIconArtwork_ofSize_intoView_animated___block_invoke_5;
    block[3] = &unk_24D794A80;
    v13 = *(id *)(a1 + 48);
    v14 = v11;
    v15 = *(_BYTE *)(a1 + 56);
    v5 = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v6 = v13;
  }

}

uint64_t __60__TFImageFetcher_fetchIconArtwork_ofSize_intoView_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (id)_urlStringForIconArtwork:(id)a3 ofSize:(CGSize)a4 fileFormat:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];
  _QWORD v36[5];

  height = a4.height;
  width = a4.width;
  v36[3] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDD17C8];
  -[TFImageFetcher displayedScreenScale](self, "displayedScreenScale");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%d"), (int)(width * v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD17C8];
  -[TFImageFetcher displayedScreenScale](self, "displayedScreenScale");
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%d"), (int)(height * v15));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("{w}");
  v35[1] = CFSTR("{h}");
  v36[0] = v13;
  v36[1] = v16;
  v35[2] = CFSTR("{f}");
  v28 = v10;
  v36[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  objc_msgSend(v9, "urlTemplate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v17, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      v23 = 0;
      v24 = v18;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v23);
        objc_msgSend(v17, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", v25, v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        ++v23;
        v24 = v18;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v21);
  }

  return v18;
}

- (double)displayedScreenScale
{
  return self->_displayedScreenScale;
}

@end
