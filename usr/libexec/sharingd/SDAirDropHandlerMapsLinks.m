@implementation SDAirDropHandlerMapsLinks

- (SDAirDropHandlerMapsLinks)initWithTransfer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerMapsLinks;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v4, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.Maps"));
}

- (id)candidateIdentifiers
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    -[NSMutableArray addObject:](v3, "addObject:", v6);

  }
  return v3;
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!-[SDAirDropHandler isJustLinks](self, "isJustLinks"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerMapsLinks candidateIdentifiers](self, "candidateIdentifiers"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completedURLs"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxyFromCandidateIdentifiers:handlesURL:](self, "bundleProxyFromCandidateIdentifiers:handlesURL:", v3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i)));

        if (!v10)
        {
          v11 = 0;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_13:

  return v11;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerMapsLinks;
  return (unint64_t)-[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x80000000;
}

- (id)suitableContentsDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSString *v33;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metaData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsDescriptionAdvanced"));

  if (v4 == 1
    && v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SFAirDropActivitySubjectMapsLinkType"))),
        v8,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SFAirDropActivitySubjectMapsLinkType")));
    v10 = objc_msgSend(v9, "integerValue");

    switch((unint64_t)v10)
    {
      case 0uLL:
        v48 = CFSTR("MAPS_LINK_CURRENT_LOCATION");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
        v49 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
        v50 = v12;
        v13 = &v50;
        goto LABEL_13;
      case 1uLL:
        v45 = CFSTR("MAPS_LINK_DIRECTIONS");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
        v46 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
        v47 = v12;
        v13 = &v47;
        goto LABEL_13;
      case 2uLL:
        v42 = CFSTR("MAPS_LINK_DROPPED_PIN");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
        v43 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
        v44 = v12;
        v13 = &v44;
        goto LABEL_13;
      case 3uLL:
        v39 = CFSTR("MAPS_LINK_POI");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
        v40 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
        v41 = v12;
        v13 = &v41;
LABEL_13:
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v23));

        break;
      default:
        v17 = 0;
        break;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "metaData"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "itemsDescription"));
    if (objc_msgSend(v26, "length"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "metaData"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "itemsDescription"));

    }
    else
    {
      v20 = 0;
    }

    v29 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    v31 = SFLocalizedStringForKey(v17, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if (v29)
      v33 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v32, v20, v35);
    else
      v33 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v32, v3, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v33);

  }
  else
  {
    v36 = CFSTR("MAPS_LINK");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v37 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v38 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v16));

    LODWORD(v15) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    v19 = SFLocalizedStringForKey(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((_DWORD)v15)
      v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v4, v35);
    else
      v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v3, v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }

  return v22;
}

@end
