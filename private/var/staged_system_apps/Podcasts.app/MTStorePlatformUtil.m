@implementation MTStorePlatformUtil

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4
{
  return _objc_msgSend(a1, "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:isNotSubscribeable:", a3, 0, a4);
}

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 isNotSubscribeable:(BOOL)a5
{
  return objc_msgSend(a1, "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:isNotSubscribeable:", a3, 0, a5, a4);
}

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5
{
  return objc_msgSend(a1, "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:isNotSubscribeable:", a3, a5, 0, a4);
}

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5 isNotSubscribeable:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  __CFString *v54;
  void *v55;
  id *v56;
  void *v57;
  id v58;
  void *v59;
  _BOOL4 v61;
  void *v62;
  void *v63;
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
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;

  v6 = a6;
  v10 = a3;
  v11 = objc_msgSend(a1, "isExplicitForStorePlatformDictionary:", v10);
  if (!(_DWORD)v11
    || (+[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed") & 1) != 0)
  {
    v61 = v6;
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("offers")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("download")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("url")));
    if (!objc_msgSend(v16, "length"))
    {
      v43 = 0;
LABEL_71:

      goto LABEL_72;
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("assetURL"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromDictionary:forKey:", v10, CFSTR("feedUrl")));
    if (v17)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, kPodcastFeedUrl);
    v70 = (void *)v17;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromDictionary:forKey:", v10, CFSTR("collectionName")));
    if (v18)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("podcastTitle"));
    v72 = v15;
    v75 = (void *)v18;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromDictionary:forKey:", v10, CFSTR("name")));
    if (v19)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("episodeTitle"));
    v74 = (void *)v19;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("description")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromDictionary:forKey:", v20, CFSTR("standard")));
    if (!objc_msgSend(v21, "length"))
    {
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromDictionary:forKey:", v20, CFSTR("short")));

      v21 = (void *)v22;
    }
    if (objc_msgSend(v21, "length"))
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("episodeDescription"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromDictionary:forKey:", v10, CFSTR("url")));
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v23));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("episodeShareUrl"));

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringValue"));
    if (v25)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("episodeId"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("podcastEpisodeGuid")));
    if (v26)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, CFSTR("episodeGuid"));
    v65 = (void *)v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("collectionId")));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringValue"));
    if (v27)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("podcastId"));
    v66 = v25;
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("artistName")));
    if (v28)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v28, CFSTR("artistName"));
    v63 = (void *)v28;
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("releaseDate")));
    v30 = objc_opt_class(NSString);
    v73 = (void *)v29;
    if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "formatDate:", v29));
      if (v31)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, kEpisodePubDate);

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("artwork")));
    v67 = (void *)v23;
    v62 = v32;
    if (v32)
    {
      v33 = v32;
      if (objc_msgSend(v32, "count"))
      {
        v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "artworkDictionary:closestToSize:", v33, a4));
        v35 = (void *)v34;
        if (v34)
        {
          v78 = v34;
          v36 = v21;
          v37 = v20;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v38, CFSTR("artworkURL"));

          v20 = v37;
          v21 = v36;
        }

      }
    }
    v69 = (void *)v20;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v39, CFSTR("explicit"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isNotSubscribeable")));
    v41 = v40;
    v68 = v21;
    if (v40)
      v42 = (unint64_t)objc_msgSend(v40, "BOOLValue");
    else
      v42 = v61;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v42));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v44, CFSTR("isNotSubscribeable"));

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("offers")));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));

    v71 = v16;
    v64 = v27;
    if (!v46)
    {
      v53 = 0;
      v54 = &stru_1004C6D40;
      v55 = v75;
LABEL_56:
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v54, kEpisodeUti);
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromDictionary:forKey:", v10, CFSTR("artistId")));
      v58 = objc_alloc_init((Class)NSMutableDictionary);
      if (objc_msgSend(a1, "isAValue:", v57))
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v57, CFSTR("artistId"));
      if (objc_msgSend(a1, "isAValue:", v76))
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v76, CFSTR("podcastId"));
      if (objc_msgSend(a1, "isAValue:", v55))
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v55, CFSTR("podcastName"));
      if (objc_msgSend(a1, "isAValue:", CFSTR("1")))
        objc_msgSend(v58, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("podcastType"));
      if (objc_msgSend(a1, "isAValue:", v74))
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v74, CFSTR("episodeName"));
      if (objc_msgSend(a1, "isAValue:", v77))
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v77, CFSTR("episodeId"));
      if (objc_msgSend(a1, "isAValue:", v53))
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v53, CFSTR("episodeKind"));
      objc_msgSend(v58, "setObject:forKeyedSubscript:", CFSTR("3"), CFSTR("v"));
      objc_msgSend(v58, "setObject:forKeyedSubscript:", CFSTR("ntc"), CFSTR("pageLocation"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "encodedQueryStringFromDictionary:", v58));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v59, CFSTR("reportParams"));

      v43 = v12;
      v16 = v71;
      v15 = v72;
      goto LABEL_71;
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("assets")));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "firstObject"));

    if (!v48)
    {
      v53 = 0;
      v54 = &stru_1004C6D40;
LABEL_55:
      v55 = v75;

      goto LABEL_56;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("duration")));
    if (v49)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v49, CFSTR("duration"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("flavor")));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

    if (v50 == v51)
    {
      v53 = 0;
      v54 = &stru_1004C6D40;
LABEL_54:

      goto LABEL_55;
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("flavor")));
    if (objc_msgSend(v52, "rangeOfString:", CFSTR("Video")) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v52, "rangeOfString:", CFSTR("Audio")) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v53 = 0;
        v54 = &stru_1004C6D40;
LABEL_53:

        goto LABEL_54;
      }
      v53 = CFSTR("episode");
      v56 = (id *)&kUTTypeAudio;
    }
    else
    {
      v53 = CFSTR("movie");
      v56 = (id *)&kUTTypeVideo;
    }
    v54 = (__CFString *)*v56;
    goto LABEL_53;
  }
  v43 = 0;
  if (a5)
    *a5 = 1;
LABEL_72:

  return v43;
}

+ (BOOL)isExplicitForStorePlatformDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contentRating")));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contentRatingsBySystem")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("riaa")));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rank")));
  v7 = (uint64_t)objc_msgSend(v6, "integerValue") > 1;

  return v7;
}

+ (id)latestEpisodeDictionaryFromPodcastDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("childrenIds"), 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "stringValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("children")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

      if (v11)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

+ (id)artworkDictionary:(id)a3 closestToSize:(double)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  void *i;
  void *v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  id v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    v10 = 1.79769313e308;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("height"), (_QWORD)v20));
        objc_msgSend(v13, "floatValue");
        v15 = v14;
        if (v15 == a4)
        {
          v18 = v12;

          goto LABEL_15;
        }
        v16 = vabdd_f64(v15, a4);
        if (v16 < v10)
        {
          v17 = v12;

          v10 = v16;
          v8 = v17;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }

  v8 = v8;
  v18 = v8;
LABEL_15:

  return v18;
}

+ (BOOL)isAValue:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  char v7;

  if (a3)
  {
    v3 = a3;
    v5 = objc_opt_class(NSNull, v4);
    isKindOfClass = objc_opt_isKindOfClass(v3, v5);

    v7 = isKindOfClass ^ 1;
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

+ (id)stringFromDictionary:(id)a3 forKey:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", a4));
  if (!objc_msgSend(a1, "isAValue:", v5))
    goto LABEL_7;
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    if ((objc_opt_respondsToSelector(v5, "stringValue") & 1) != 0)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
      goto LABEL_6;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = v5;
LABEL_6:
  v8 = v7;
LABEL_8:

  return v8;
}

+ (id)encodedQueryStringFromDictionary:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  void *i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableString);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAddingPercentEscapesUsingEncoding:", 1));
        v14 = (void *)v13;
        if ((v9 & 1) != 0)
          v15 = CFSTR("%@=%@");
        else
          v15 = CFSTR("&%@=%@");
        objc_msgSend(v4, "appendFormat:", v15, v11, v13, (_QWORD)v17);

        v9 = 0;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v9 = 0;
    }
    while (v7);
  }

  return v4;
}

+ (id)formatDate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)qword_100567520;
  if (!qword_100567520)
  {
    v5 = objc_alloc_init((Class)NSDateFormatter);
    v6 = (void *)qword_100567520;
    qword_100567520 = (uint64_t)v5;

    objc_msgSend((id)qword_100567520, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    v7 = objc_alloc_init((Class)NSDateFormatter);
    v8 = (void *)qword_100567528;
    qword_100567528 = (uint64_t)v7;

    objc_msgSend((id)qword_100567528, "setDateStyle:", 2);
    v4 = (void *)qword_100567520;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromString:", v3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100567528, "stringFromDate:", v9));

  return v10;
}

+ (id)dateFromFormattedString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)qword_100567530;
  if (!qword_100567530)
  {
    v5 = objc_alloc_init((Class)NSDateFormatter);
    v6 = (void *)qword_100567530;
    qword_100567530 = (uint64_t)v5;

    objc_msgSend((id)qword_100567530, "setDateStyle:", 2);
    v4 = (void *)qword_100567530;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromString:", v3));

  return v7;
}

+ (id)pubDateFromStoreMediaDictionary:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", kEpisodePubDate));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dateFromFormattedString:", v4));

  return v5;
}

+ (id)storeDownloadDictionaryFromStorePlatformDictionary:(id)a3
{
  id v4;
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
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("episode"), CFSTR("episode-kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collectionId")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("collection-id"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("podcast-episode"), CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artistName")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("artist-name"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_genreNameForStoreItemDictionary:", v4));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("genre-name"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collectionName")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("collection-name"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_unmodifiedTitleForStoreItemDictionary:", v4));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("unmodified-title"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("item-id"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("itemId"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("url"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("releaseDate")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("release-date"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("podcastEpisodeGuid")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("episode-guid"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("description")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("standard")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("longDescription"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feedUrl")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("podcast-feed-url"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("podcast-type-dzc"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_storeDownloadOffersForStoreItemDictionary:", v4));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("store-offers"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_storeDownloadArtworkArrayForStoreItemDictionary:", v4));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("artwork-urls"));

  v21 = objc_msgSend(v5, "copy");
  return v21;
}

+ (id)_storeDownloadArtworkArrayForStoreItemDictionary:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("artwork")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_compactMap:", &stru_1004AADB0));

  return v4;
}

+ (id)_genreNameForStoreItemDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("genres")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));

  return v5;
}

+ (id)_unmodifiedTitleForStoreItemDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rawName")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name")));

  if (objc_msgSend(v4, "length"))
    v6 = v4;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

+ (id)_storeDownloadOffersForStoreItemDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offers")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_storeOfferDownloadDictionaryForStoreOfferItemDictionary:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10)));
        if (v11)
          objc_msgSend(v5, "addEntriesFromDictionary:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  v12 = objc_msgSend(v5, "copy");

  return v12;
}

+ (id)_storeOfferDownloadDictionaryForStoreOfferItemDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("anonymousDownload")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("download")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url")));

    if (v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("duration")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("asset-url"));
      if (v9)
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));
      v11 = objc_msgSend(v10, "copy");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flavor")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_offerNameForOfferFlavor:", v12));
      v17 = v13;
      v18 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_offerNameForOfferFlavor:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", CFSTR("video")) & 1) != 0)
  {
    v4 = CFSTR("standard-video");
  }
  else
  {
    v4 = CFSTR("standard-audio");
    if ((objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", CFSTR("audio")) & 1) == 0)
    {
      v4 = CFSTR("document");
      if ((objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", CFSTR("booklet")) & 1) == 0
        && !objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", CFSTR("document")))
      {
        v4 = CFSTR("standard-audio");
      }
    }
  }

  return (id)v4;
}

@end
