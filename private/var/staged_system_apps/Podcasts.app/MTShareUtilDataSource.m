@implementation MTShareUtilDataSource

- (MTShareUtilDataSource)initWithPlayerItem:(id)a3 selectedReferenceTime:(double)a4 selectedPlayerTime:(double)a5 currentPlayerTime:(double)a6
{
  id v10;
  MTShareUtilDataSource *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *shareData;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  MTShareUtilDataSource *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  BOOL v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  _QWORD v81[4];
  MTShareUtilDataSource *v82;
  objc_super v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  void *v95;

  v10 = a3;
  v83.receiver = self;
  v83.super_class = (Class)MTShareUtilDataSource;
  v11 = -[MTShareUtilDataSource init](&v83, "init");
  if (!v11)
    goto LABEL_42;
  v11->_shareSupported = objc_msgSend(v10, "isShareable");
  v12 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 3);
  shareData = v11->_shareData;
  v11->_shareData = v12;

  *(int64x2_t *)&v11->_currentShareMode = vdupq_n_s64(1uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "episode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "podcast"));
  if (v14)
    v16 = objc_msgSend(v14, "storeTrackId");
  else
    v16 = objc_msgSend(v10, "episodeStoreId");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "episodeShareUrl"));
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_100078E38;
  v81[3] = &unk_1004A7E58;
  v19 = v11;
  v82 = v19;
  objc_msgSend(v10, "retrieveArtwork:withSize:", v81, kMTSharingArtworkSize, kMTSharingArtworkSize);
  v79 = v17;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v17));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v21, CFSTR("kMTStoreId"), 6);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pubDate"));
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v22, CFSTR("kMTPubDate"), 6);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bestTitle"));
  if (objc_msgSend(v23, "length"))
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bestTitle"));
  else
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  v25 = (void *)v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
  if (objc_msgSend(v26, "length"))
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
  else
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "author"));
  v28 = (void *)v27;

  v78 = v25;
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v25, CFSTR("kMTEpisodeTitle"), 6);
  v77 = v28;
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v28, CFSTR("kMTPodcastTitle"), 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringValue"));
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v30, CFSTR("kMTSelectedReferenceTime"), 4);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringValue"));
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v32, CFSTR("kMTSelectedPlayerTime"), 4);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringValue"));
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v34, CFSTR("kMTCurrentPlayerTime"), 4);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bestAvailableStoreCleanURL"));
  v80 = v18;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));
  v37 = objc_msgSend(v36, "length");

  if ((+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v79) & 1) != 0)
  {
    v38 = v14;
    v39 = 0;
    if (v37)
    {
LABEL_13:
      v40 = v80;
      v41 = 0;
      v42 = v38;
      goto LABEL_14;
    }
  }
  else
  {
    v38 = v14;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "guid"));
    v39 = objc_msgSend(v47, "length") == 0;

    if (v37)
      goto LABEL_13;
  }
  if (v35)
    v48 = v39;
  else
    v48 = 1;
  v42 = v38;
  if ((v48 & 1) != 0)
    goto LABEL_37;
  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v79))
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bestAvailableStoreCleanURL"));
    v94 = CFSTR("i");
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v79));
    v95 = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1));
    v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "pf_URLByAppendingQueryString:", v51));

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "twitterShareURL"));
    v92 = CFSTR("i");
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v79));
    v93 = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "pf_URLByAppendingQueryString:", v54));

    goto LABEL_14;
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "guid"));
  v63 = objc_msgSend(v62, "length");

  if (v63)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bestAvailableStoreCleanURL"));
    v90 = CFSTR("episodeGuid");
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "guid"));
    v91 = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1));
    v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "pf_URLByAppendingHashString:", v66));

    v41 = 0;
LABEL_14:
    if (v40)
    {
      v11->_supportedShareModes |= 2uLL;
      -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v40, CFSTR("MTShareURL"), 2);
      if (a4 > 0.0 || a5 > 0.0)
      {
        if (a4 > 0.0)
        {
          v88 = CFSTR("r");
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0lf"), *(_QWORD *)&a4));
          v89 = v55;
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1));
          v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pf_URLByAppendingQueryString:", v56));

          v40 = (id)v57;
        }
        v76 = v42;
        if (a5 > 0.0)
        {
          v86 = CFSTR("t");
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0lf"), *(_QWORD *)&a5));
          v87 = v58;
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1));
          v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pf_URLByAppendingQueryString:", v59));

          v40 = (id)v60;
        }

        -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v40, CFSTR("MTShareURL"), 4);
        v41 = 0;
        v61 = v11->_supportedShareModes | 4;
        v11->_currentShareMode = 4;
        v11->_supportedShareModes = v61;
        v42 = v76;
      }
      else if (a6 <= 0.0)
      {
        v11->_currentShareMode = 2;
        if (v41)
          -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v41, CFSTR("MTShortURL"), 2);
      }
      else
      {
        v84 = CFSTR("t");
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0lf"), *(_QWORD *)&a6));
        v85 = v43;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1));
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pf_URLByAppendingQueryString:", v44));

        -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v45, CFSTR("MTShareURL"), 4);
        v46 = v11->_supportedShareModes | 4;
        v11->_currentShareMode = 2;
        v11->_supportedShareModes = v46;

        v41 = 0;
        v40 = (id)v45;
      }
    }
    goto LABEL_36;
  }
  v40 = 0;
  v41 = 0;
LABEL_36:

LABEL_37:
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "shareURL"));
  if (!v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    objc_msgSend(v68, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Sharing/MTShareUtilDataSource.m", 181, CFSTR("Attempting to share a podcast without a share URL even though we have adamIDs, falling back to feedURL"));

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "podcastFeedUrl"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v69));

  }
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v77, CFSTR("kMTPodcastTitle"), 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "author"));
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v70, CFSTR("kMTProvider"), 1);

  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v67, CFSTR("MTShareURL"), 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "twitterShareURL"));

  if (v71)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "twitterShareURL"));
    -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v72, CFSTR("MTShortURL"), 1);

  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "itunesSubtitle"));
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v73, CFSTR("kMTShareDescription"), 6);

  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemDescription"));
  -[MTShareUtilDataSource setValue:forKey:shareModes:](v19, "setValue:forKey:shareModes:", v74, CFSTR("kMTShareDescription"), 1);

LABEL_42:
  return v11;
}

- (MTShareUtilDataSource)initWithPodcast:(id)a3
{
  id v4;
  MTShareUtilDataSource *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *shareData;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MTShareUtilDataSource;
  v5 = -[MTShareUtilDataSource init](&v26, "init");
  if (v5)
  {
    v5->_shareSupported = objc_msgSend(v4, "isShareable");
    v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
    shareData = v5->_shareData;
    v5->_shareData = v6;

    *(int64x2_t *)&v5->_currentShareMode = vdupq_n_s64(1uLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shareURL"));
    -[MTShareUtilDataSource setValue:forKey:shareModes:](v5, "setValue:forKey:shareModes:", v8, CFSTR("MTShareURL"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "twitterShareURL"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "twitterShareURL"));
      -[MTShareUtilDataSource setValue:forKey:shareModes:](v5, "setValue:forKey:shareModes:", v10, CFSTR("MTShortURL"), 1);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](PUIObjCArtworkProvider, "shared"));
    v12 = kMTSharingArtworkSize;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cachedArtworkForMTPodcast:withSize:", v4, kMTSharingArtworkSize, kMTSharingArtworkSize));
    if (v13)
    {
      -[MTShareUtilDataSource setValue:forKey:shareModes:](v5, "setValue:forKey:shareModes:", v13, CFSTR("MTShareImage"), 1);
    }
    else
    {
      objc_initWeak(&location, v5);
      v20 = _NSConcreteStackBlock;
      v21 = 3221225472;
      v22 = sub_10007913C;
      v23 = &unk_1004A7EA8;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v11, "artworkForMTPodcast:withSize:completionHandler:", v4, &v20, v12, v12);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title", v20, v21, v22, v23));
    -[MTShareUtilDataSource setValue:forKey:shareModes:](v5, "setValue:forKey:shareModes:", v14, CFSTR("kMTPodcastTitle"), 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "author"));
    -[MTShareUtilDataSource setValue:forKey:shareModes:](v5, "setValue:forKey:shareModes:", v15, CFSTR("kMTProvider"), 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v4, "storeCollectionId")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringValue"));
    -[MTShareUtilDataSource setValue:forKey:shareModes:](v5, "setValue:forKey:shareModes:", v17, CFSTR("kMTStoreId"), 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemDescription"));
    -[MTShareUtilDataSource setValue:forKey:shareModes:](v5, "setValue:forKey:shareModes:", v18, CFSTR("kMTShareDescription"), 1);

  }
  return v5;
}

- (MTShareUtilDataSource)initWithPodcastDetails:(id)a3
{
  id v4;
  MTShareUtilDataSource *v5;
  MTShareUtilDataSource *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *shareData;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  MTShareUtilDataSource *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MTShareUtilDataSource;
  v5 = -[MTShareUtilDataSource init](&v29, "init");
  v6 = v5;
  if (v5)
  {
    v5->_shareSupported = 1;
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
    shareData = v6->_shareData;
    v6->_shareData = v7;

    *(int64x2_t *)&v6->_currentShareMode = vdupq_n_s64(1uLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url")));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));

    }
    else
    {
      v11 = 0;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shortUrl")));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shortUrl")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));

    }
    else
    {
      v14 = 0;
    }

    if (v11)
    {
      -[MTShareUtilDataSource setValue:forKey:shareModes:](v6, "setValue:forKey:shareModes:", v11, CFSTR("MTShareURL"), 1);
      if (v14)
        -[MTShareUtilDataSource setValue:forKey:shareModes:](v6, "setValue:forKey:shareModes:", v14, CFSTR("MTShortURL"), 1);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id")));
    -[MTShareUtilDataSource setValue:forKey:shareModes:](v6, "setValue:forKey:shareModes:", v15, CFSTR("kMTStoreId"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artwork")));
    if (v16)
    {
      v18 = objc_opt_class(UIImage);
      if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
      {
        -[MTShareUtilDataSource _setImageIgnoringSmallerSize:forKey:shareMode:](v6, "_setImageIgnoringSmallerSize:forKey:shareMode:", v16, CFSTR("MTShareImage"), 1);
LABEL_22:
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artistName")));
        -[MTShareUtilDataSource setValue:forKey:shareModes:](v6, "setValue:forKey:shareModes:", v24, CFSTR("kMTPodcastTitle"), 1);
        -[MTShareUtilDataSource setValue:forKey:shareModes:](v6, "setValue:forKey:shareModes:", v25, CFSTR("kMTProvider"), 1);

        goto LABEL_23;
      }
    }
    if (!v17)
      goto LABEL_22;
    v19 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0)
      goto LABEL_22;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("productLockupArtworkURL")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("url")));
    v22 = v21;
    if (v21 && objc_msgSend(v21, "length"))
    {
      v23 = v22;
    }
    else
    {
      v23 = v20;
      if (!v23)
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10007963C;
    v27[3] = &unk_1004A7E58;
    v28 = v6;
    -[MTShareUtilDataSource fetchImageWithTemplateURL:completionHandler:](v28, "fetchImageWithTemplateURL:completionHandler:", v23, v27);

    goto LABEL_21;
  }
LABEL_23:

  return v6;
}

- (void)fetchImageWithTemplateURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](PUIObjCArtworkProvider, "shared"));
  v8 = kMTSharingArtworkSize;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100079720;
  v10[3] = &unk_1004A7050;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "artworkForURL:withSize:completionHandler:", v6, v10, v8, v8);

}

- (id)shortURL
{
  return -[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("MTShortURL"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode"));
}

- (id)shareURL
{
  return -[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("MTShareURL"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode"));
}

- (id)shareImage
{
  return -[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("MTShareImage"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode"));
}

- (id)shareEpisodeTitle
{
  return -[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("kMTEpisodeTitle"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode"));
}

- (id)shareImageProvider
{
  return -[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("MTShareImageProvider"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode"));
}

- (id)sharePodcastTitle
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("kMTPodcastTitle"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode")));
  v3 = v2;
  if (!v2)
    v2 = &stru_1004C6D40;
  v4 = v2;

  return v4;
}

- (id)shareProvider
{
  return -[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("kMTProvider"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode"));
}

- (id)shareDescription
{
  return -[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("kMTShareDescription"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode"));
}

- (id)storeIdentifier
{
  return -[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("kMTStoreId"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode"));
}

- (id)pubDate
{
  return -[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("kMTPubDate"), -[MTShareUtilDataSource currentShareMode](self, "currentShareMode"));
}

- (double)selectedReferenceTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("kMTSelectedReferenceTime"), 4));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)selectedPlayerTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("kMTSelectedPlayerTime"), 4));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)currentPlayerTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", CFSTR("kMTCurrentPlayerTime"), 4));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setValue:(id)a3 forKey:(id)a4 shareModes:(int64_t)a5
{
  id v8;
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v8 = a3;
  v24 = a4;
  v9 = (_UNKNOWN **)qword_100567348;
  if (!qword_100567348)
  {
    qword_100567348 = (uint64_t)&off_1004D74A0;

    v9 = &off_1004D74A0;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v16 = (int)objc_msgSend(v15, "intValue") & (unint64_t)a5;
        if (v16 == (int)objc_msgSend(v15, "intValue"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilDataSource shareData](self, "shareData"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v15));

          if (!v18)
          {
            v19 = objc_alloc_init((Class)NSMutableDictionary);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilDataSource shareData](self, "shareData"));
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v15);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilDataSource shareData](self, "shareData"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v15));
          v23 = v22;
          if (v8)
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, v24);
          else
            objc_msgSend(v22, "removeObjectForKey:", v24);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

}

- (id)valueForKey:(id)a3 shareMode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilDataSource shareData](self, "shareData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));

  return v10;
}

- (void)_setImageIgnoringSmallerSize:(id)a3 forKey:(id)a4 shareMode:(int64_t)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilDataSource valueForKey:shareMode:](self, "valueForKey:shareMode:", v8, a5));
  objc_msgSend(v22, "size");
  v10 = kMTSharingArtworkSize;
  if (v11 > kMTSharingArtworkSize)
    v12 = objc_msgSend(v22, "imageWithSize:", kMTSharingArtworkSize, kMTSharingArtworkSize);
  objc_msgSend(v9, "size");
  v14 = v13;
  objc_msgSend(v22, "size");
  if (!v9)
  {
    if (v14 == v10)
      goto LABEL_12;
    goto LABEL_11;
  }
  v16 = v15;
  objc_msgSend(v9, "size");
  v18 = v17;
  objc_msgSend(v22, "size");
  if ((v16 == v10 || v18 < v19) && v14 != v10)
LABEL_11:
    -[MTShareUtilDataSource setValue:forKey:shareModes:](self, "setValue:forKey:shareModes:", v22, v8, a5);
LABEL_12:

}

- (BOOL)shareSupported
{
  return self->_shareSupported;
}

- (void)setShareSupported:(BOOL)a3
{
  self->_shareSupported = a3;
}

- (int64_t)currentShareMode
{
  return self->_currentShareMode;
}

- (void)setCurrentShareMode:(int64_t)a3
{
  self->_currentShareMode = a3;
}

- (int64_t)supportedShareModes
{
  return self->_supportedShareModes;
}

- (void)setSupportedShareModes:(int64_t)a3
{
  self->_supportedShareModes = a3;
}

- (NSMutableDictionary)shareData
{
  return self->_shareData;
}

- (void)setShareData:(id)a3
{
  objc_storeStrong((id *)&self->_shareData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareData, 0);
}

@end
