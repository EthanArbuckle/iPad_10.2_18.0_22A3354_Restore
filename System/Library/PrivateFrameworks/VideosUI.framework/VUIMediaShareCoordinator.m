@implementation VUIMediaShareCoordinator

+ (BOOL)shouldShowShareForMediaItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "mediaItemMetadataForProperty:", CFSTR("mediaShareMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v6 = objc_msgSend(v5, "length") != 0;
  else
    v6 = 0;

  return v6;
}

+ (void)shareMediaItem:(id)a3 metadata:(id)a4
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  objc_msgSend(v5, "vui_stringForKey:", CFSTR("imageUrl"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v6, "length"))
  {
    objc_msgSend(v15, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19E8]);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v7;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("previewUrl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("subtitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("groupActivityMetadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = &stru_1E9FF3598;
  objc_msgSend(v5, "objectForKey:", CFSTR("metrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordClick:", v13);

  +[VUIShareActivityViewController_iOS shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:completionHandler:](VUIShareActivityViewController_iOS, "shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:completionHandler:", v8, v9, v10, v11, v6, v12, 0, &__block_literal_global_71);
}

@end
