@implementation VUILibraryMetrics

+ (void)recordPageEventWithPageType:(id)a3
{
  objc_msgSend(a1, "recordPageEventWithPageId:andPageType:", a3, a3);
}

+ (void)recordPageEventWithPageId:(id)a3 andPageType:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("pageContext");
  v12[0] = CFSTR("library");
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsPageEventData createWithPageId:andPageType:andEventData:](VUIMetricsPageEventData, "createWithPageId:andPageType:andEventData:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordPage:", v9);

}

+ (void)recordPlayOfMediaEntity:(id)a3 isLaunchingExtras:(BOOL)a4
{
  __CFString **v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v5 = VUIMetricsMediaActionTypePlay;
  if (a4)
    v5 = VUIMetricsMediaActionTypeExtras;
  v6 = *v5;
  if (a3)
  {
    +[VUILibraryMetrics getMediaEntityContentType:](VUILibraryMetrics, "getMediaEntityContentType:", a3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("library");
  }
  v10[0] = CFSTR("contentType");
  v10[1] = CFSTR("actionType");
  v11[0] = v7;
  v11[1] = v6;
  v10[2] = CFSTR("targetId");
  v11[2] = CFSTR("libraryItem");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordMedia:", v8);

}

+ (void)recordPlayOfMediaItem:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("play");
  if (a3)
  {
    +[VUILibraryMetrics getMediaItemContentType:](VUILibraryMetrics, "getMediaItemContentType:", a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("library");
  }
  v8[0] = CFSTR("contentType");
  v8[1] = CFSTR("actionType");
  v9[0] = v5;
  v9[1] = v4;
  v8[2] = CFSTR("targetId");
  v9[2] = CFSTR("libraryItem");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordMedia:", v6);

}

+ (void)recordPlayOfTVPMediaItem:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("play");
  if (a3)
  {
    objc_msgSend(a3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB1DC0]))
    {
      +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB1DD0]))
    {
      +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB1DD8]))
    {
      +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB1DB8]))
      {
        v7 = CFSTR("library");
        goto LABEL_12;
      }
      +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;
    objc_msgSend(v6, "stringDescription");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    goto LABEL_13;
  }
  v7 = CFSTR("library");
LABEL_13:
  v11[0] = CFSTR("contentType");
  v11[1] = CFSTR("actionType");
  v12[0] = v7;
  v12[1] = v4;
  v11[2] = CFSTR("targetId");
  v12[2] = CFSTR("libraryItem");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordMedia:", v9);

}

+ (void)recordClickOnMediaEntity:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v7 = objc_alloc_init(v3);
  objc_msgSend(v7, "setValue:forKey:", CFSTR("lockup"), CFSTR("targetType"));
  objc_msgSend(v7, "setValue:forKey:", CFSTR("navigate"), CFSTR("actionType"));
  +[VUILibraryMetrics getMediaEntityContentType:](VUILibraryMetrics, "getMediaEntityContentType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValue:forKey:", v5, CFSTR("contentType"));
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordClick:", v7);

}

+ (id)pageStringForEntityType:(id)a3
{
  return (id)objc_msgSend(a3, "stringDescription");
}

+ (id)getMediaItemContentType:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "vui_mediaEntityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)getMediaEntityContentType:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pageStringForLibraryCellType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return &stru_1E9FF3598;
  else
    return off_1E9FA2598[a3 - 1];
}

+ (id)pageStringForLibraryShelfType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return &stru_1E9FF3598;
  else
    return off_1E9FA25D0[a3];
}

+ (id)pageStringForLibraryCategoryType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA)
    return &stru_1E9FF3598;
  else
    return off_1E9FA25F0[a3];
}

@end
