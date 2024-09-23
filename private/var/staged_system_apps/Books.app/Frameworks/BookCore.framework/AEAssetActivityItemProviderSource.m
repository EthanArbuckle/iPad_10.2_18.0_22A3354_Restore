@implementation AEAssetActivityItemProviderSource

+ (id)activityItemProviderWithPropertySource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithPropertySource:", v4);

  return v5;
}

- (AEAssetActivityItemProviderSource)initWithPropertySource:(id)a3
{
  id v4;
  AEAssetActivityItemProviderSource *v5;
  AEAssetActivityPropertyProvider *v6;
  AEAssetActivityPropertyProvider *propertyProvider;

  v4 = a3;
  v5 = -[AEAssetActivityItemProviderSource init](self, "init");
  if (v5)
  {
    v6 = -[AEAssetActivityPropertyProvider initWithPropertySource:]([AEAssetActivityPropertyProvider alloc], "initWithPropertySource:", v4);
    propertyProvider = v5->_propertyProvider;
    v5->_propertyProvider = v6;

  }
  return v5;
}

- (id)supportedActivityTypes
{
  return 0;
}

- (BOOL)supportsActivityType:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource supportedActivityTypes](self, "supportedActivityTypes"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)populateHTMLGenerator:(id)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "setDataSource:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  if ((objc_msgSend(v4, "isStoreAsset") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
    objc_msgSend(v24, "setStoreId:", v6);

  }
  else
  {
    objc_msgSend(v24, "setStoreId:", 0);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "epubID"));
  objc_msgSend(v24, "setEpubId:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
  objc_msgSend(v24, "setTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "author"));
  objc_msgSend(v24, "setAuthor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publisherLocation"));
  objc_msgSend(v24, "setPublisherLocation:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publisherName"));
  objc_msgSend(v24, "setPublisherName:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "publisherYear"));
  objc_msgSend(v24, "setPublisherYear:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  objc_msgSend(v24, "setContentProtected:", objc_msgSend(v19, "contentProtected"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "genre"));
  objc_msgSend(v24, "setGenre:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "readingDirection"));
  objc_msgSend(v24, "setReadingDirection:", v23);

}

+ (id)citationWithPropertyProvider:(id)a3 storeURL:(id)a4 pageRange:(_NSRange)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSUInteger v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  NSUInteger length;
  void *v58;
  NSUInteger location;
  void *v60;
  void *v61;
  void *v62;
  _QWORD *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;

  length = a5.length;
  location = a5.location;
  v6 = a3;
  v7 = a4;
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_768C4;
  v67[3] = &unk_28EE60;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v68 = v8;
  v63 = objc_retainBlock(v67);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "author"));
  v64 = v6;
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](NSCharacterSet, "punctuationCharacterSet"));
    v11 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", (char *)objc_msgSend(v9, "length") - 1));

    if ((v11 & 1) != 0)
    {
      v12 = (void (**)(_QWORD, _QWORD))v63;
    }
    else
    {
      v13 = objc_alloc_init((Class)NSMutableArray);
      v14 = objc_msgSend(v9, "length");
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_7698C;
      v65[3] = &unk_28EE88;
      v15 = v13;
      v66 = v15;
      objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v14, 3, v65);
      if (objc_msgSend(v15, "count") == (char *)&dword_0 + 2)
      {
        v16 = IMCommonCoreBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("%@, %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
        v19 = v9;
        v20 = v8;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 1));
        v22 = v7;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));
        v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v21, v23));

        v7 = v22;
        v8 = v20;

        v9 = (void *)v24;
        v6 = v64;
      }
      v12 = (void (**)(_QWORD, _QWORD))v63;

    }
    ((void (**)(_QWORD, void *))v12)[2](v12, v9);
  }
  else
  {
    v12 = (void (**)(_QWORD, _QWORD))v63;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  if (objc_msgSend(v25, "length"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByTrimmingCharactersInSet:", v26));

    if ((objc_msgSend(v27, "hasSuffix:", CFSTR(".")) & 1) == 0)
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", CFSTR(".")));

      v27 = (void *)v28;
    }
    if (v7)
    {
      v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<a href=\"%@\">%@</a>"), v7, v27));

      v27 = (void *)v29;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByEnclosingInQuotes"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingString:", CFSTR(" ")));
    objc_msgSend(v8, "addObject:", v31);

  }
  v58 = v25;
  v61 = v9;
  v62 = v7;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "version"));
  if (objc_msgSend(v32, "length"))
  {
    v33 = IMCommonCoreBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("v%@. "), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, v32));

    v37 = v8;
    objc_msgSend(v8, "addObject:", v36);
    v32 = (void *)v36;
  }
  else
  {
    v37 = v8;
  }
  v38 = location;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisherLocation"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisherName"));
  v60 = v39;
  if (objc_msgSend(v39, "length"))
    v41 = v39;
  else
    v41 = 0;
  if (objc_msgSend(v40, "length"))
  {
    if (objc_msgSend(v41, "length"))
      v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingFormat:", CFSTR(", %@"), v40));
    else
      v42 = v40;
    v43 = v42;

    v41 = v43;
    v6 = v64;
  }
  if (objc_msgSend(v41, "length"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisherYear"));
    if (objc_msgSend(v44, "length"))
    {
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingFormat:", CFSTR(", %@"), v44));

      v41 = (id)v45;
    }
    ((void (**)(_QWORD, id))v12)[2](v12, v41);

  }
  if (v38 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v46 = 0;
  }
  else
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lull"), v38));
    v48 = v47;
    if (length)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lull"), v38 + length));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "commonPrefixWithString:options:", v49, 1));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "substringFromIndex:", objc_msgSend(v50, "length")));
      v46 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v48, v51));

      v12 = (void (**)(_QWORD, _QWORD))v63;
    }
    else
    {
      v46 = v47;
    }

  }
  if (objc_msgSend(v46, "length"))
    ((void (**)(_QWORD, id))v12)[2](v12, v46);
  v52 = IMCommonCoreBundle();
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Apple Books"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  ((void (**)(_QWORD, void *))v12)[2](v12, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "componentsJoinedByString:", &stru_296430));

  return v55;
}

- (id)citation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "citationWithPropertyProvider:storeURL:pageRange:", v4, 0, 0x7FFFFFFFFFFFFFFFLL, 0));

  return v5;
}

- (id)assetCoverForHTMLGenerator:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetCover"));

  return v4;
}

- (id)storeURLForHTMLGenerator:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeURL"));

  return v4;
}

- (id)tellAFriendBaseURLForHTMLGenerator:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine storeMgr](AEAssetEngine, "storeMgr", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientApplicationController"));
  v5 = objc_opt_class(NSURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tellAFriendEmailBodyURLBase"));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)HTMLGenerator:(id)a3 citationForStoreURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = (void *)objc_opt_class(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "citationWithPropertyProvider:storeURL:pageRange:", v7, v5, 0x7FFFFFFFFFFFFFFFLL, 0));

  v9 = IMCommonCoreBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("This material may be protected by copyright."), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("\n%@"), v11));

  return v12;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (AEAssetActivityPropertyProvider)propertyProvider
{
  return self->_propertyProvider;
}

- (void)setPropertyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_propertyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyProvider, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
