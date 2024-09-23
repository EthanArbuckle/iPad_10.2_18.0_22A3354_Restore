@implementation CuratedCollectionMediaIntegrationViewModel

- (CuratedCollectionMediaIntegrationViewModel)initWithAppleMediaServicesResult:(id)a3 thirdPartyLinks:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  CuratedCollectionMediaIntegrationViewModel *v14;
  id v15;
  CuratedCollectionMediaIntegrationViewModel *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  CuratedCollectionMediaIntegrationViewModel *v38;
  id v39;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9 = objc_msgSend(v8, "copy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v11 = objc_msgSend(v10, "copy");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkURL"));
  v14 = 0;
  if (v9 && v11 && v12 && v13)
  {
    v36 = v13;
    v35 = v9;
    v15 = objc_msgSend(v6, "mediaType");
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1003697EC;
    v37[3] = &unk_1011B2CF8;
    v16 = self;
    v38 = v16;
    v39 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_map:", v37));
    v18 = objc_msgSend((id)objc_opt_class(v16), "subtitleForResult:", v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v19 = v17;
    v31 = v17;
    v20 = objc_msgSend((id)objc_opt_class(v16), "actionTextForResult:hasChildLinks:", v6, objc_msgSend(v17, "count") != 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v21 = objc_msgSend((id)objc_opt_class(v16), "systemFirstPartyIconForResult:", v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v22 = objc_msgSend((id)objc_opt_class(v16), "localizedSystemFirstPartyNameForResult:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = objc_msgSend((id)objc_opt_class(v16), "realmIconForResult:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_msgSend((id)objc_opt_class(v16), "bundleIdentifierForResult:", v6);
    v34 = v7;
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend((id)objc_opt_class(v16), "logoToTitlePaddingWithMediaType:", v15);
    v29 = v15;
    v9 = v35;
    self = -[CuratedCollectionMediaIntegrationViewModel initWithAdamID:title:subtitle:actionText:url:artworkURL:systemFirstPartyIcon:localizedSystemFirstPartyName:realmIcon:childViewModels:targetAppIdentifier:mediaType:logoToTitlePadding:](v16, "initWithAdamID:title:subtitle:actionText:url:artworkURL:systemFirstPartyIcon:localizedSystemFirstPartyName:realmIcon:childViewModels:targetAppIdentifier:mediaType:logoToTitlePadding:", v35, v11, v33, v32, v12, v36, v30, v23, v25, v19, v27, v29);

    v7 = v34;
    v13 = v36;
    v14 = self;
  }

  return v14;
}

- (CuratedCollectionMediaIntegrationViewModel)initWithResolvedThirdPartyLink:(id)a3 mediaType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CuratedCollectionMediaIntegrationViewModel *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appIconURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamID"));

  objc_msgSend((id)objc_opt_class(self), "logoToTitlePaddingWithMediaType:", a4);
  v12 = -[CuratedCollectionMediaIntegrationViewModel initWithAdamID:title:subtitle:actionText:url:artworkURL:systemFirstPartyIcon:localizedSystemFirstPartyName:realmIcon:childViewModels:targetAppIdentifier:mediaType:logoToTitlePadding:](self, "initWithAdamID:title:subtitle:actionText:url:artworkURL:systemFirstPartyIcon:localizedSystemFirstPartyName:realmIcon:childViewModels:targetAppIdentifier:mediaType:logoToTitlePadding:", v7, v8, 0, 0, v9, v10, 0, 0, 0, 0, v11, a4);

  return v12;
}

- (CuratedCollectionMediaIntegrationViewModel)initWithAdamID:(id)a3 title:(id)a4 subtitle:(id)a5 actionText:(id)a6 url:(id)a7 artworkURL:(id)a8 systemFirstPartyIcon:(id)a9 localizedSystemFirstPartyName:(id)a10 realmIcon:(id)a11 childViewModels:(id)a12 targetAppIdentifier:(id)a13 mediaType:(int64_t)a14 logoToTitlePadding:(double)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  CuratedCollectionMediaIntegrationViewModel *v31;
  NSString *v32;
  NSString *identifier;
  NSString *v34;
  NSString *title;
  NSString *v36;
  NSString *subtitle;
  NSString *v38;
  NSString *actionText;
  NSString *v40;
  NSString *localizedSystemFirstPartyName;
  NSArray *v42;
  NSArray *childViewModels;
  NSString *v44;
  NSString *targetAppIdentifier;
  id v48;
  id v49;
  id v50;
  id v51;
  objc_super v52;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v51 = a7;
  v25 = a8;
  v50 = a8;
  v49 = a9;
  v26 = a10;
  v27 = v24;
  v48 = a11;
  v28 = a12;
  v29 = v23;
  v30 = a13;
  v52.receiver = self;
  v52.super_class = (Class)CuratedCollectionMediaIntegrationViewModel;
  v31 = -[CuratedCollectionMediaIntegrationViewModel init](&v52, "init");
  if (v31)
  {
    v32 = (NSString *)objc_msgSend(v21, "copy");
    identifier = v31->_identifier;
    v31->_identifier = v32;

    v34 = (NSString *)objc_msgSend(v22, "copy");
    title = v31->_title;
    v31->_title = v34;

    v36 = (NSString *)objc_msgSend(v29, "copy");
    subtitle = v31->_subtitle;
    v31->_subtitle = v36;

    v38 = (NSString *)objc_msgSend(v27, "copy");
    actionText = v31->_actionText;
    v31->_actionText = v38;

    objc_storeStrong((id *)&v31->_url, a7);
    objc_storeStrong((id *)&v31->_artworkURL, v25);
    objc_storeStrong((id *)&v31->_systemFirstPartyIcon, a9);
    v40 = (NSString *)objc_msgSend(v26, "copy");
    localizedSystemFirstPartyName = v31->_localizedSystemFirstPartyName;
    v31->_localizedSystemFirstPartyName = v40;

    objc_storeStrong((id *)&v31->_realmIcon, a11);
    v42 = (NSArray *)objc_msgSend(v28, "copy");
    childViewModels = v31->_childViewModels;
    v31->_childViewModels = v42;

    v44 = (NSString *)objc_msgSend(v30, "copy");
    targetAppIdentifier = v31->_targetAppIdentifier;
    v31->_targetAppIdentifier = v44;

    v31->_mediaType = a14;
    v31->_logoToTitlePadding = a15;
  }

  return v31;
}

- (void)loadImageForSize:(CGSize)a3 completion:(id)a4
{
  id v5;
  void *v6;
  NSURL *artworkURL;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  artworkURL = self->_artworkURL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100369BF4;
  v9[3] = &unk_1011B2D20;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "loadAppImageAtURL:completionHandler:", artworkURL, v9);

}

- (void)cancelImageDownload
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  objc_msgSend(v3, "cancelLoadAppImageAtURL:", self->_artworkURL);

}

+ (id)formatterForDurationString
{
  if (qword_1014D21F0 != -1)
    dispatch_once(&qword_1014D21F0, &stru_1011B2D40);
  return (id)qword_1014D21E8;
}

+ (id)subtitleForResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  switch((unint64_t)objc_msgSend(v4, "mediaType"))
  {
    case 1uLL:
    case 2uLL:
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitle"));
      goto LABEL_6;
    case 3uLL:
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorialSubtitle"));
      goto LABEL_6;
    case 4uLL:
    case 5uLL:
    case 9uLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xFuLL:
    case 0x10uLL:
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artistName"));
LABEL_6:
      v6 = (void *)v5;
      break;
    case 6uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("[Curated Guides] Media Integration Subtitle Music Artist");
      goto LABEL_17;
    case 7uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("[Curated Guides] Media Integration Subtitle Music Playlist");
      goto LABEL_17;
    case 8uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("[Curated Guides] Media Integration Subtitle Music Radio Station");
      goto LABEL_17;
    case 0xAuLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("[Curated Guides] Media Integration Subtitle Music Spotlight");
      goto LABEL_17;
    case 0xBuLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("[Curated Guides] Media Integration Subtitle Music Artist Interview");
      goto LABEL_17;
    case 0xEuLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("[Curated Guides] Media Integration Subtitle Podcast Channel");
      goto LABEL_17;
    case 0x11uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("[Curated Guides] Media Integration Subtitle Book Author");
      goto LABEL_17;
    case 0x12uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("[Curated Guides] Media Integration Subtitle Fitness+ Trainer");
      goto LABEL_17;
    case 0x13uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Curated Guides] Media Integration Subtitle Fitness+ Class"), CFSTR("localized string not found"), 0));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "classType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "formatterForDurationString"));
      objc_msgSend(v4, "duration");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromTimeInterval:", v13 / 1000.0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "episodeNumber")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v15, 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v11, v14, v16));

      goto LABEL_18;
    case 0x14uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("[Curated Guides] Media Integration Subtitle Fitness+ Class Type");
LABEL_17:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));
LABEL_18:

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

+ (id)actionTextForResult:(id)a3 hasChildLinks:(BOOL)a4
{
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  switch((unint64_t)objc_msgSend(a3, "mediaType"))
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v7;
      v6 = CFSTR("[Curated Guides] View on App Store");
      goto LABEL_17;
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 0xAuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
        goto LABEL_15;
      v6 = CFSTR("[Curated Guides] Listen on Apple Music");
      goto LABEL_16;
    case 9uLL:
    case 0xBuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
        v6 = CFSTR("[Curated Guides] Watch Now");
      else
        v6 = CFSTR("[Curated Guides] Watch on Apple Music");
      goto LABEL_16;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
        goto LABEL_15;
      v6 = CFSTR("[Curated Guides] Listen on Apple Podcasts");
      goto LABEL_16;
    case 0xFuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
        v6 = CFSTR("[Curated Guides] Read Now");
      else
        v6 = CFSTR("[Curated Guides] Read on Apple Books");
      goto LABEL_16;
    case 0x10uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
LABEL_15:
        v6 = CFSTR("[Curated Guides] Listen Now");
      else
        v6 = CFSTR("[Curated Guides] Listen on Apple Books");
      goto LABEL_16;
    case 0x11uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
        v6 = CFSTR("[Curated Guides] View Now");
      else
        v6 = CFSTR("[Curated Guides] View on Apple Books");
LABEL_16:
      v7 = v5;
      goto LABEL_17;
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v7;
      v6 = CFSTR("[Curated Guides] Try on Apple Fitness+");
LABEL_17:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

+ (id)realmIconForResult:(id)a3
{
  char *v3;
  void *v4;

  v3 = (char *)objc_msgSend(a3, "mediaType");
  if ((unint64_t)(v3 - 1) > 0x13)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", off_1011B2D60[(_QWORD)(v3 - 1)]));
  return v4;
}

+ (id)systemFirstPartyIconForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifierForResult:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "scale");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 1));

  return v5;
}

+ (id)localizedSystemFirstPartyNameForResult:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  switch((unint64_t)objc_msgSend(a3, "mediaType"))
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Curated Guides] App Store Name");
      goto LABEL_7;
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Curated Guides] Apple Music Name");
      goto LABEL_7;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Curated Guides] Apple Podcasts Name");
      goto LABEL_7;
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Curated Guides] Apple Books Name");
      goto LABEL_7;
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Curated Guides] Apple Fitness+ Name");
LABEL_7:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6));

      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

+ (id)bundleIdentifierForResult:(id)a3
{
  char *v3;

  v3 = (char *)objc_msgSend(a3, "mediaType");
  if ((unint64_t)(v3 - 1) > 0x13)
    return 0;
  else
    return off_1011B2E00[(_QWORD)(v3 - 1)];
}

+ (double)logoToTitlePaddingWithMediaType:(int64_t)a3
{
  double result;

  result = 6.0;
  if ((unint64_t)(a3 - 1) < 3)
    return 4.0;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionText
{
  return self->_actionText;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (UIImage)systemFirstPartyIcon
{
  return self->_systemFirstPartyIcon;
}

- (NSString)localizedSystemFirstPartyName
{
  return self->_localizedSystemFirstPartyName;
}

- (UIImage)realmIcon
{
  return self->_realmIcon;
}

- (NSArray)childViewModels
{
  return self->_childViewModels;
}

- (NSString)targetAppIdentifier
{
  return self->_targetAppIdentifier;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (double)logoToTitlePadding
{
  return self->_logoToTitlePadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAppIdentifier, 0);
  objc_storeStrong((id *)&self->_childViewModels, 0);
  objc_storeStrong((id *)&self->_realmIcon, 0);
  objc_storeStrong((id *)&self->_localizedSystemFirstPartyName, 0);
  objc_storeStrong((id *)&self->_systemFirstPartyIcon, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
