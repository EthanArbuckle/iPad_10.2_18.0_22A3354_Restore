@implementation TVUNUpNextWidgetDataSource

+ (void)fetchUpNext:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[16];

  v6 = a4;
  if (qword_10010C1E8[0] != -1)
    dispatch_once(qword_10010C1E8, &stru_1000F69D8);
  v7 = sub_100006398();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TVUNUpNextWidgetDataSource - Begin FetchUpNextWidget", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006C4C;
  v18[3] = &unk_1000F6A00;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v20 = v6;
  v9 = v6;
  v10 = v19;
  v11 = objc_retainBlock(v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006D98;
  v14[3] = &unk_1000F6AA0;
  v15 = v11;
  v16 = a1;
  v17 = a3;
  v13 = v11;
  objc_msgSend(v12, "fetchConfigurationWithCompletionHandler:", v14);

}

+ (id)_contentGroupWithContinuations:(id)a3 widgetSize:(unint64_t)a4 expiration:(id)a5
{
  id v8;
  void *v9;
  TVUNContentItemGroup *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_contentItemsWithContinuations:widgetSize:", a3, a4));
  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_alloc_init(TVUNContentItemGroup);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UP_NEXT"), &stru_1000FFDC8, 0));
    -[TVUNContentItemGroup setTitle:](v10, "setTitle:", v12);

    -[TVUNContentItemGroup setItems:](v10, "setItems:", v9);
    -[TVUNContentItemGroup setExpirationDate:](v10, "setExpirationDate:", v8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)_processContinuationsDelta:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = sub_100006398();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TVUNUpNextWidgetDataSource - Begin fetching delta", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[WLKUpNextDeltaStore sharedInstance](WLKUpNextDeltaStore, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007884;
  v14[3] = &unk_1000F6AC8;
  v15 = v9;
  v16 = v5;
  v17 = v6;
  v11 = v6;
  v12 = v5;
  v13 = v9;
  objc_msgSend(v10, "read:", v14);

}

+ (id)_contentItemsWithContinuations:(id)a3 widgetSize:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  unint64_t v17;
  _QWORD v18[3];
  int v19;

  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007EC0;
  v12[3] = &unk_1000F6AF0;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[TVUNRentalUtilities fetchRentals](TVUNRentalUtilities, "fetchRentals"));
  v16 = a1;
  v17 = a4;
  v13 = v8;
  v15 = v18;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  v10 = objc_msgSend(v9, "copy");

  _Block_object_dispose(v18, 8);
  return v10;
}

+ (id)_contentItemWithContinuation:(id)a3 mediaItem:(id)a4 widgetSize:(unint64_t)a5 itemPosition:(int)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSString *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  TVUNContentItem *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  unint64_t v83;
  int v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint8_t buf[4];
  void *v94;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieOrShowContent"));
  v12 = objc_opt_class(WLKContinuationMetadata);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
    v13 = v9;
  else
    v13 = 0;
  v14 = v13;
  v15 = objc_opt_class(WLKDeltaContinuationMetadata);
  if ((objc_opt_isKindOfClass(v9, v15) & 1) != 0)
    v16 = v9;
  else
    v16 = 0;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canonicalID"));

  if (!v18)
  {
    v20 = sub_100006398();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      sub_1000BB154(v9, v21);
    goto LABEL_21;
  }
  if (v14)
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tvun_punchoutURL:", 0));
  }
  else
  {
    if (!v17)
      goto LABEL_19;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tvun_defaultActionURL"));
  }
  v22 = (void *)v19;
  if (!v19)
  {
LABEL_19:
    v31 = sub_100006398();
    v21 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000BB1D4(v9, v21);
LABEL_21:
    v32 = 0;
    goto LABEL_67;
  }
  v86 = v10;
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canonicalID"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedContext"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "genres"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));

  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvun_contextString"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[TVUNUpNextWidgetDataSource cropCodeForContentType:](TVUNUpNextWidgetDataSource, "cropCodeForContentType:", objc_msgSend(v11, "contentType")));
  if (objc_msgSend(v9, "contextEnum") == (id)1)
  {
    if (v14)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playable"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "playEvent"));

      if (v27)
      {
        objc_msgSend(v27, "elapsedTime");
        v29 = v28;
        objc_msgSend(v27, "duration");
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fmax(v29 / v30, 0.025)));
      }
      else
      {
        v87 = 0;
      }

      v82 = 0;
    }
    else
    {
      v82 = 0;
      v87 = 0;
    }
  }
  else if (objc_msgSend(v9, "contextEnum") == (id)12 || objc_msgSend(v9, "contextEnum") == (id)13)
  {
    v87 = 0;
    v82 = 1;
  }
  else
  {
    v87 = 0;
    LODWORD(v82) = 0;
    HIDWORD(v82) = objc_msgSend(v9, "contextEnum") == (id)2;
  }
  v33 = objc_opt_class(WLKBasicEpisodeMetadata);
  v85 = v17;
  v84 = a6;
  v83 = a5;
  if ((objc_opt_isKindOfClass(v11, v33) & 1) != 0)
  {
    v81 = v22;
    v34 = v11;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "showTitle"));
    v80 = v35;
    if (v35)
    {
      v36 = v35;

      v92 = v36;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "seasonNumber"));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "episodeNumber"));
    v79 = (void *)v38;
    if (v37 && v38)
    {
      v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("EPISODE_SEASON_EPISODE_FORMAT"), &stru_1000FFDC8, 0));
      v78 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v41, v37, v39));

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("EPISODE_SEASON_EPISODE_FORMAT_SHORT"), &stru_1000FFDC8, 0));
      v44 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v43, v37, v39);
    }
    else
    {
      if (!v37)
      {
        v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "title"));
        v50 = 0;
        v53 = v25;
        goto LABEL_48;
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("EPISODE_SEASON_FORMAT"), &stru_1000FFDC8, 0));
      v78 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v52, v37));

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("EPISODE_SEASON_FORMAT_SHORT"), &stru_1000FFDC8, 0));
      v44 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v43, v37, v77);
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(v44);

    if (!v50)
    {
      v57 = v78;
LABEL_49:

      v46 = 0;
      v25 = (void *)v57;
      goto LABEL_50;
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("SUBTITLE_WITH_CONTEXT_FORMAT"), &stru_1000FFDC8, 0));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvun_contextString"));
    v56 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v54, v55, v50));

    v91 = (void *)v56;
    v57 = v78;
LABEL_48:

    goto LABEL_49;
  }
  v45 = objc_opt_class(WLKBasicMovieMetadata);
  if ((objc_opt_isKindOfClass(v11, v45) & 1) != 0)
  {
    if (objc_msgSend(v9, "isRental"))
    {
      v81 = v22;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "tvun_expirationDate"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "tvun_expirationString"));
      v34 = v47;
      if (v47)
      {
        v48 = v47;

        v49 = v90;
        v50 = 0;
        v91 = v49;
        v25 = v48;
      }
      else
      {
        v50 = 0;
      }
      goto LABEL_50;
    }
LABEL_45:
    v46 = 0;
    v50 = 0;
    goto LABEL_51;
  }
  v58 = objc_opt_class(WLKBasicSportingEventMetadata);
  if ((objc_opt_isKindOfClass(v11, v58) & 1) == 0)
    goto LABEL_45;
  v81 = v22;
  v34 = v11;
  v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "shortTitle"));

  v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leagueName"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leagueShortName"));
  v46 = 0;
  v25 = (void *)v60;
  v92 = (void *)v59;
LABEL_50:

  v22 = v81;
LABEL_51:
  if ((v83 & 0xFFFFFFFFFFFFFFFELL) == 2 && v84 == 0)
    v61 = 27;
  else
    v61 = 26;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "images"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "artworkVariantOfType:", v61));

  if ((v83 & 0xFFFFFFFFFFFFFFFELL) != 2 || v84 != 0)
  {
LABEL_59:
    v64 = v25;
    goto LABEL_60;
  }
  v64 = v25;
  if (!v63)
  {
    v65 = sub_100006398();
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
      *(_DWORD *)buf = 138412290;
      v94 = v67;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "TVUNUpNextWidgetDataSource - Artwork is nil for %@. Fall back to ShelfImage", buf, 0xCu);

    }
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "images"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "artworkVariantOfType:", 26));

    goto LABEL_59;
  }
LABEL_60:
  v69 = objc_alloc_init(TVUNContentItem);
  -[TVUNContentItem setIdentifier:](v69, "setIdentifier:", v89);
  -[TVUNContentItem setTitle:](v69, "setTitle:", v92);
  -[TVUNContentItem setSubtitle:](v69, "setSubtitle:", v64);
  -[TVUNContentItem setSubtitleShort:](v69, "setSubtitleShort:", v50);
  -[TVUNContentItem setSubtitleComposed:](v69, "setSubtitleComposed:", v91);
  -[TVUNContentItem setContext:](v69, "setContext:", v90);
  -[TVUNContentItem setPlaybackPercentage:](v69, "setPlaybackPercentage:", v87);
  -[TVUNContentItem setRentalExpirationDate:](v69, "setRentalExpirationDate:", v46);
  -[TVUNContentItem setLiveEvent:](v69, "setLiveEvent:", v82);
  -[TVUNContentItem setNewEpisode:](v69, "setNewEpisode:", HIDWORD(v82));
  -[TVUNContentItem setCropCode:](v69, "setCropCode:", v88);
  if (v14)
  {
    v70 = v22;
    buf[0] = 0;
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tvun_channelImageURLString:", buf));
    if (v71)
    {
      -[TVUNContentItem setBadgeURLTemplate:](v69, "setBadgeURLTemplate:", v71);
      -[TVUNContentItem setBadgeRequiresTransparency:](v69, "setBadgeRequiresTransparency:", buf[0]);
    }

    v22 = v70;
    v64 = v25;
  }
  -[TVUNContentItem setActionURL:](v69, "setActionURL:", v22);
  if (v63)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "artworkURLString"));
    -[TVUNContentItem setImageURLTemplate:](v69, "setImageURLTemplate:", v72);

    v64 = v25;
    objc_msgSend(v63, "artworkSize");
    v74 = v73;
    objc_msgSend(v63, "artworkSize");
    -[TVUNContentItem setImageAspectRatio:](v69, "setImageAspectRatio:", v74 / v75);
  }
  v21 = v69;

  v32 = v21;
  v17 = v85;
  v10 = v86;
LABEL_67:

  return v32;
}

+ (id)cropCodeForContentType:(unint64_t)a3
{
  if (a3 == 5)
    return CFSTR("sh");
  else
    return 0;
}

@end
