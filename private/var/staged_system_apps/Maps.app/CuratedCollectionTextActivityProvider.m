@implementation CuratedCollectionTextActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  CuratedCollectionLinkMetadataProvider *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  CuratedCollectionLinkMetadataProvider *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v41;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", UIActivityTypeMail))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photos"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v10 = HTMLStringForPhoto();
      v41 = objc_claimAutoreleasedReturnValue(v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Maps Guide: Guide Name [Curated Guide Sharing]"), CFSTR("localized string not found"), 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider title](self, "title"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_navigation_sanitizedStringForDisplayInHTML"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "publisher"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "publisherAttribution"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayName"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_navigation_sanitizedStringForDisplayInHTML"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("count_of_places"), CFSTR("localized string not found"), 0));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, objc_msgSend(v23, "numberOfItems")));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_navigation_sanitizedStringForDisplayInHTML"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<b>%@</b><br>%@<br>%@"), v15, v20, v25));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider url](self, "url"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Open in Apple Maps [Curated Guide Sharing]"), CFSTR("localized string not found"), 0));
      v30 = HTMLStringForURLWithLabel(v27, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

      v32 = (CuratedCollectionLinkMetadataProvider *)v41;
      v33 = HTMLBodyWrapperStringWithFormat(CFSTR("%@<br><br>%@<br><br>%@"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

LABEL_9:
      goto LABEL_11;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher"));

    if (v35)
    {
      v36 = [CuratedCollectionLinkMetadataProvider alloc];
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher"));
      v32 = -[CuratedCollectionActivityProvider initWithPublisher:](v36, "initWithPublisher:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionTextActivityProvider delegate](self, "delegate"));
      -[CuratedCollectionLinkMetadataProvider setDelegate:](v32, "setDelegate:", v38);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionLinkMetadataProvider activityViewControllerLinkPresentationMetadata:](v32, "activityViewControllerLinkPresentationMetadata:", 0));
      v39 = HTMLStringForMetadata();
      v34 = (void *)objc_claimAutoreleasedReturnValue(v39);
      goto LABEL_9;
    }
LABEL_10:
    v34 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v5, "isEqualToString:", UIActivityTypeMessage) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", UIActivityTypeCopyToPasteboard) & 1) != 0)
  {
    goto LABEL_10;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider title](self, "title"));
LABEL_11:

  return v34;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1011EB268;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher", a3, a4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Maps Guides: %@ [Sharing]"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider title](self, "title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider title](self, "title"));
  }
  return v9;
}

@end
