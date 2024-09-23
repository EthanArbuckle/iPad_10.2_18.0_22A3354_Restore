@implementation PCNativeRepresentation

- (id)initWithAdData:(id)a3 placementType:(int64_t)a4 maxSize:(id)a5 nativeLayout:(id)a6 error:(id *)a7
{
  double var1;
  double var0;
  id v13;
  PCNativeRepresentation *v14;
  PCNativeRepresentation *v15;
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
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  objc_super v50;

  var1 = a5.var1;
  var0 = a5.var0;
  v13 = a6;
  v50.receiver = self;
  v50.super_class = (Class)PCNativeRepresentation;
  v14 = -[PCNativeRepresentation initWithAdData:placementType:maxSize:mediaAsset:error:](&v50, "initWithAdData:placementType:maxSize:mediaAsset:error:", a3, a4, 0, a7, var0, var1);
  v15 = v14;
  if (a3 && v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localeIdentifier"));
    -[PCNativeRepresentation setLocaleIdentifier:](v15, "setLocaleIdentifier:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "adLayoutDetails"));
    -[PCNativeRepresentation setAdType:](v15, "setAdType:", (int)objc_msgSend(v17, "type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "headline"));
    -[PCNativeRepresentation setHeadline:](v15, "setHeadline:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "accessHeadline"));
    -[PCNativeRepresentation setAccessibleHeadline:](v15, "setAccessibleHeadline:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "adCopy"));
    -[PCNativeRepresentation setAdCopy:](v15, "setAdCopy:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "accessAdCopy"));
    -[PCNativeRepresentation setAccessibleAdCopy:](v15, "setAccessibleAdCopy:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sponsoredBy"));
    -[PCNativeRepresentation setSponsor:](v15, "setSponsor:", v22);

    -[PCNativeRepresentation setAdFormatType:](v15, "setAdFormatType:", (int)objc_msgSend(v17, "adFormatType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sponsoredByAssetURL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v23));
    -[PCNativeRepresentation setSponsoredByAssetURL:](v15, "setSponsoredByAssetURL:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sponsoredByAssetURLForDarkMode"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v25));
    -[PCNativeRepresentation setSponsoredByAssetURLForDarkMode:](v15, "setSponsoredByAssetURLForDarkMode:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (objc_msgSend(v17, "localizedHeadlinesCount"))
    {
      v28 = 0;
      do
      {
        v29 = objc_alloc((Class)PCNativeLocalizedHeadline);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedHeadlines"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v28));
        v32 = objc_msgSend(v29, "initWithLocalizedStringEntry:", v31);

        if (v32)
          objc_msgSend(v27, "addObject:", v32);

        ++v28;
      }
      while (v28 < (unint64_t)objc_msgSend(v17, "localizedHeadlinesCount"));
    }
    v33 = objc_msgSend(v27, "copy");
    -[PCNativeRepresentation setLocalizedHeadlines:](v15, "setLocalizedHeadlines:", v33);

    v34 = objc_alloc((Class)PCNativeButton);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ctaButton"));
    v36 = objc_msgSend(v34, "initWithButton:", v35);
    -[PCNativeRepresentation setButton:](v15, "setButton:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionURL"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v37));
    -[PCNativeRepresentation setActionURL:](v15, "setActionURL:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (objc_msgSend(v17, "elementsCount"))
    {
      v40 = 0;
      do
      {
        v41 = objc_alloc((Class)PCNativeElement);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "elements"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", v40));
        v44 = objc_msgSend(v41, "initWithElement:elementIndex:error:", v43, v40, a7);

        if (v44)
          objc_msgSend(v39, "addObject:", v44);

        ++v40;
      }
      while (v40 < (unint64_t)objc_msgSend(v17, "elementsCount"));
    }
    v45 = objc_msgSend(v39, "copy");
    -[PCNativeRepresentation setElements:](v15, "setElements:", v45);

    v46 = objc_alloc((Class)PCNativeStyle);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "style"));
    v48 = objc_msgSend(v46, "initWithStyle:", v47);
    -[PCNativeRepresentation setDefaultStyle:](v15, "setDefaultStyle:", v48);

    -[PCNativeRepresentation setSize:](v15, "setSize:", var0, var1);
  }

  return v15;
}

@end
