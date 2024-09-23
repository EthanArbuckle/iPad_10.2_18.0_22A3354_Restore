@implementation MCDBrowseItemsContentManager

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int64_t v17;
  objc_super v19;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));
    v9 = objc_msgSend(v8, "numberOfItemsInSection:", a4);

    v10 = -[MCDBrowseContentManager maximumNumberOfItemsForDisplay](self, "maximumNumberOfItemsForDisplay");
    if ((uint64_t)v9 >= v10)
      v11 = v10;
    else
      v11 = (int64_t)v9;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "loadAdditionalContentURL"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "results"));
      v16 = objc_msgSend(v15, "numberOfItemsInSection:", a4);

      v17 = -[MCDBrowseContentManager maximumNumberOfItemsForDisplay](self, "maximumNumberOfItemsForDisplay");
      if ((uint64_t)v16 >= v17)
        v11 = v17;
      else
        v11 = (int64_t)v16;
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)MCDBrowseItemsContentManager;
      v11 = -[MCDFuseContentManager allowedNumberOfItemsForDisplayWithResponse:inSection:](&v19, "allowedNumberOfItemsForDisplayWithResponse:inSection:", v6, a4);
    }

  }
  return v11;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  objc_super v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));

  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "request"));

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadAdditionalContentURL"));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "results"));
      v17 = objc_msgSend(v16, "numberOfSections");

      if ((uint64_t)v17 >= 1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "results"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "itemsInSectionAtIndex:", 0));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

        goto LABEL_7;
      }
    }
    v23.receiver = self;
    v23.super_class = (Class)MCDBrowseItemsContentManager;
    v21 = -[MCDBrowseContentManager itemAtIndexPath:](&v23, "itemAtIndexPath:", v4);
    v20 = (id)objc_claimAutoreleasedReturnValue(v21);
LABEL_10:
    v11 = v20;
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsInSectionAtIndex:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  v9 = objc_opt_class(MPSectionedCollection);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    v20 = v8;
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemsInSectionAtIndex:", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
LABEL_7:

LABEL_11:
  return v11;
}

@end
