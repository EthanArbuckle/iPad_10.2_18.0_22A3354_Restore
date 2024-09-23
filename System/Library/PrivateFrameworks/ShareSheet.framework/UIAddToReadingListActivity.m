@implementation UIAddToReadingListActivity

+ (unint64_t)_xpcAttributes
{
  return 0;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.AddToReadingList");
}

- (id)_systemImageName
{
  return CFSTR("eyeglasses");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AddToReadingList[Activity]"), CFSTR("Add to Reading List"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_heroActionTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Read Later"), CFSTR("Read Later"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return ((unint64_t)_UIActivityItemTypes() >> 2) & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[UIActivity _subjectForActivityItem:](self, "_subjectForActivityItem:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIAddToReadingListActivity _addToReadingList:withTitle:](self, "_addToReadingList:withTitle:", v9, v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (void)_addToReadingList:(id)a3 withTitle:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (v7 && objc_msgSend(v7, "isHTTPOrHTTPSURL"))
  {
    if (!v5)
    {
      objc_msgSend(v7, "absoluteString");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[objc_class defaultReadingList](getSSReadingListClass(), "defaultReadingList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addReadingListItemWithURL:title:previewText:error:", v7, v5, 0, 0);

  }
}

@end
