@implementation MTEpisodeDescriptionCache

- (MTEpisodeDescriptionCache)init
{
  MTEpisodeDescriptionCache *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTEpisodeDescriptionCache;
  v2 = -[MTEpisodeDescriptionCache init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "invalidate", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeDescriptionCache;
  -[MTEpisodeDescriptionCache dealloc](&v4, "dealloc");
}

- (id)descriptionForEpisode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSAttributedStringKey v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
  v9 = NSFontAttributeName;
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionBodyTextForEpisode:html:withAttributes:](self, "descriptionBodyTextForEpisode:html:withAttributes:", v4, 1, v6));

  return v7;
}

- (id)episodeDescription:(id)a3
{
  return -[MTEpisodeDescriptionCache descriptionForEpisode:](self, "descriptionForEpisode:", a3);
}

- (id)descriptionForEpisode:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    -[MTEpisodeDescriptionCache updateCacheForEpisode:](self, "updateCacheForEpisode:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCacheForEpisodeUuid:](self, "descriptionCacheForEpisodeUuid:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionKeyForOptions:unavailableReason:](self, "descriptionKeyForOptions:unavailableReason:", a4, objc_msgSend(v6, "reasonForNotPlayable")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
    if (!v12)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionTextForEpisode:options:](self, "descriptionTextForEpisode:options:", v6, a4));
      objc_msgSend(v10, "setObject:forKey:", v12, v11);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)metadataHeaderForEpisode:(id)a3
{
  return -[MTEpisodeDescriptionCache descriptionForEpisode:options:](self, "descriptionForEpisode:options:", a3, 3);
}

- (id)metadataFooterForEpisode:(id)a3
{
  return -[MTEpisodeDescriptionCache metadataFooterForEpisode:includingDuration:](self, "metadataFooterForEpisode:includingDuration:", a3, 0);
}

- (id)metadataFooterForEpisode:(id)a3 includingDuration:(BOOL)a4
{
  return -[MTEpisodeDescriptionCache metadataFooterForEpisode:includingSeasonEpisodeType:includingDuration:includingPlayedIfPlayed:](self, "metadataFooterForEpisode:includingSeasonEpisodeType:includingDuration:includingPlayedIfPlayed:", a3, 0, a4, 0);
}

- (id)metadataFooterForEpisode:(id)a3 includingSeasonEpisodeType:(BOOL)a4 includingDuration:(BOOL)a5 includingPlayedIfPlayed:(BOOL)a6
{
  uint64_t v6;
  uint64_t v7;

  v6 = 64;
  if (a4)
    v6 = 320;
  if (a5)
    v6 |= 0x200uLL;
  if (a6)
    v7 = v6 | 0x400;
  else
    v7 = v6;
  return -[MTEpisodeDescriptionCache descriptionForEpisode:options:](self, "descriptionForEpisode:options:", a3, v7);
}

- (void)invalidate
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache episodeCache](self, "episodeCache"));
  objc_msgSend(v4, "removeAllObjects");

}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void (*v10)(uint64_t);
  void ***v11;
  void **v12;
  void **v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", kEpisodeUuid));
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache episodeCache](self, "episodeCache"));

  if (v8 == v6)
  {
    v13 = _NSConcreteStackBlock;
    v10 = sub_10009AC40;
    v11 = &v13;
    goto LABEL_5;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));

  if (v9 == v6)
  {
    v12 = _NSConcreteStackBlock;
    v10 = sub_10009AC80;
    v11 = &v12;
LABEL_5:
    v11[1] = (void **)3221225472;
    v11[2] = (void **)v10;
    v11[3] = (void **)&unk_1004A6640;
    v11[4] = (void **)self;
    v11[5] = (void **)v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

  }
}

- (NSCache)descriptionCache
{
  NSCache *descriptionCache;
  NSCache *v4;
  NSCache *v5;

  descriptionCache = self->_descriptionCache;
  if (!descriptionCache)
  {
    v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    v5 = self->_descriptionCache;
    self->_descriptionCache = v4;

    -[NSCache setDelegate:](self->_descriptionCache, "setDelegate:", self);
    descriptionCache = self->_descriptionCache;
  }
  return descriptionCache;
}

- (NSCache)episodeCache
{
  NSCache *episodeCache;
  NSCache *v4;
  NSCache *v5;

  episodeCache = self->_episodeCache;
  if (!episodeCache)
  {
    v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    v5 = self->_episodeCache;
    self->_episodeCache = v4;

    -[NSCache setDelegate:](self->_episodeCache, "setDelegate:", self);
    episodeCache = self->_episodeCache;
  }
  return episodeCache;
}

- (id)dependantPropertyKeys
{
  if (qword_100567378 != -1)
    dispatch_once(&qword_100567378, &stru_1004A8CB0);
  return (id)qword_100567370;
}

- (id)descriptionCacheForEpisodeUuid:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
  {
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v6, "setObject:forKey:", v4, kEpisodeUuid);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));
    objc_msgSend(v7, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (id)descriptionKeyForOptions:(unint64_t)a3 unavailableReason:(int64_t)a4
{
  NSString *v4;
  uint64_t v6;

  if ((a3 & 0x80) != 0)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("opt%lu-f-%lu"), a4, a3, a4);
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("opt%lu-c"), a4, a3, v6);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)updateCacheForEpisode:(id)a3
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
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache episodeCache](self, "episodeCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache dependantPropertyKeys](self, "dependantPropertyKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionaryWithValuesForKeys:", v7));

  if ((objc_msgSend(v6, "isEqualToDictionary:", v8) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache episodeCache](self, "episodeCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));
    objc_msgSend(v9, "setObject:forKey:", v8, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
}

- (id)descriptionTextForEpisode:(id)a3 options:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableAttributedString *v11;
  NSMutableAttributedString *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSAttributedStringKey v18;
  uint64_t v19;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
  v8 = (void *)v7;
  if ((a4 & 0x10) == 0)
  {
    v9 = 0;
    if ((a4 & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v12 = objc_opt_new(NSMutableAttributedString);
    goto LABEL_7;
  }
  v18 = NSFontAttributeName;
  v19 = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionBodyTextForEpisode:html:withAttributes:](self, "descriptionBodyTextForEpisode:html:withAttributes:", v6, (a4 >> 5) & 1, v13));

  if ((a4 & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionPrefixTextForEpisode:options:trailingNewline:](self, "descriptionPrefixTextForEpisode:options:trailingNewline:", v6, a4, objc_msgSend(v9, "length") != 0));
  v11 = objc_opt_new(NSMutableAttributedString);
  v12 = v11;
  if (v10)
  {
    -[NSMutableAttributedString appendAttributedString:](v11, "appendAttributedString:", v10);

  }
LABEL_7:
  if (v9)
    -[NSMutableAttributedString appendAttributedString:](v12, "appendAttributedString:", v9);
  if ((a4 & 0x40) != 0)
  {
    if ((a4 & 0x80) != 0)
      v14 = objc_msgSend(v6, "reasonForNotPlayable");
    else
      v14 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionFooterTextForEpisode:includesSeasonEpisodeType:includesDuration:includesPlayedIfPlayed:hasBodyText:unavailableReason:](self, "descriptionFooterTextForEpisode:includesSeasonEpisodeType:includesDuration:includesPlayedIfPlayed:hasBodyText:unavailableReason:", v6, (a4 >> 8) & 1, (a4 >> 9) & 1, (a4 >> 10) & 1, objc_msgSend(v9, "length") != 0, v14));
    if (v15)
      -[NSMutableAttributedString appendAttributedString:](v12, "appendAttributedString:", v15);

  }
  v16 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithAttributedString:", v12);

  return v16;
}

- (id)descriptionPrefixTextForEpisode:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5
{
  char v5;
  id v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  uint64_t v16;
  unsigned __int8 v17;
  void *v18;
  NSMutableAttributedString *v19;
  NSMutableAttributedString *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  NSMutableAttributedString *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  BOOL v51;
  NSAttributedStringKey v52;
  void *v53;
  NSAttributedStringKey v54;
  void *v55;

  v41 = a5;
  v5 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((v5 & 2) != 0 && (objc_msgSend(v7, "pubDate"), v9 > 0.0))
  {
    objc_msgSend(v7, "pubDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v10 = 0;
  }
  if (+[MTEpisodeLockup useLayoutForSkinnyPhones](MTEpisodeLockup, "useLayoutForSkinnyPhones"))
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nanoFriendlyDisplayString"));
  else
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "abbreviatedFriendlyDisplayString"));
  v12 = (void *)v11;
  if (v11)
  {
    v13 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v11);
    objc_msgSend(v8, "addObject:", v13);

  }
  if ((v5 & 4) != 0 && objc_msgSend(v7, "isPartiallyPlayed"))
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode timeRemainingStringForEpisode:abbreviated:](MTEpisode, "timeRemainingStringForEpisode:abbreviated:", v7, +[MTEpisodeLockup useLayoutForSkinnyPhones](MTEpisodeLockup, "useLayoutForSkinnyPhones")));
  else
    v14 = 0;
  if (!objc_msgSend(v14, "length"))
  {
    objc_msgSend(v7, "duration");
    v16 = objc_claimAutoreleasedReturnValue(+[NSString prettyShortStringWithDuration:abbreviated:](NSString, "prettyShortStringWithDuration:abbreviated:", +[MTEpisodeLockup useLayoutForSkinnyPhones](MTEpisodeLockup, "useLayoutForSkinnyPhones"), v15));

    v14 = (void *)v16;
  }
  v17 = objc_msgSend(v7, "isVideo");
  if ((v5 & 8) != 0 && (v17 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache createVideoGlyphAttributedString](self, "createVideoGlyphAttributedString"));
    v19 = objc_opt_new(NSMutableAttributedString);
    v20 = v19;
    if (v18)
    {
      -[NSMutableAttributedString appendAttributedString:](v19, "appendAttributedString:", v18);

    }
  }
  else
  {
    v20 = objc_opt_new(NSMutableAttributedString);
  }
  if (objc_msgSend(v14, "length"))
  {
    v21 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v14);
    -[NSMutableAttributedString appendAttributedString:](v20, "appendAttributedString:", v21);

  }
  v40 = v14;
  v42 = v12;
  v43 = v10;
  v44 = v7;
  if (-[NSMutableAttributedString length](v20, "length"))
  {
    v22 = -[NSMutableAttributedString copy](v20, "copy");
    objc_msgSend(v8, "addObject:", v22);

  }
  v39 = v20;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](MTEpisodeLockup, "metadataHeaderFont"));
  v54 = NSFontAttributeName;
  v55 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
  v26 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR(" "), v25);
  v27 = objc_alloc((Class)NSAttributedString);
  v52 = NSFontAttributeName;
  v53 = v23;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
  v29 = objc_msgSend(v27, "initWithString:attributes:", CFSTR("•"), v28);

  v30 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\n"), v25);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10009B7A0;
  v45[3] = &unk_1004A8CD8;
  v31 = objc_alloc_init((Class)NSMutableAttributedString);
  v46 = v31;
  v32 = v8;
  v47 = v32;
  v33 = v26;
  v48 = v33;
  v34 = v29;
  v49 = v34;
  v51 = v41;
  v35 = v30;
  v50 = v35;
  objc_msgSend(v32, "enumerateObjectsUsingBlock:", v45);
  objc_msgSend(v31, "im_addAttribute:value:", NSFontAttributeName, v24);
  if (v41 && objc_msgSend(v31, "length"))
  {
    v36 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v24, "_leading");
    objc_msgSend(v36, "setParagraphSpacing:");
    objc_msgSend(v31, "im_addAttribute:value:", NSParagraphStyleAttributeName, v36);

  }
  if (objc_msgSend(v31, "length"))
    v37 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithAttributedString:", v31);
  else
    v37 = 0;

  return v37;
}

- (id)descriptionFooterTextForEpisode:(id)a3 includesSeasonEpisodeType:(BOOL)a4 includesDuration:(BOOL)a5 includesPlayedIfPlayed:(BOOL)a6 hasBodyText:(BOOL)a7 unavailableReason:(int64_t)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v11;
  NSMutableAttributedString *v12;
  void *v13;
  NSMutableParagraphStyle *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _UNKNOWN **v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  NSString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSMutableAttributedString *v58;
  NSMutableParagraphStyle *v59;
  id v60;
  void *v61;
  id v62;
  void *v64;
  const __CFString *v65;
  uint64_t v66;
  void *v67;
  _BOOL4 v68;
  _BOOL4 v69;
  id v70;
  NSMutableAttributedString *v71;
  void *v72;
  NSMutableParagraphStyle *v73;
  NSMutableArray *v74;
  _QWORD v75[4];
  id v76;
  NSMutableParagraphStyle *v77;
  NSMutableAttributedString *v78;
  BOOL v79;
  BOOL v80;
  NSAttributedStringKey v81;
  NSMutableParagraphStyle *v82;

  v9 = a7;
  v68 = a5;
  v69 = a6;
  v10 = a4;
  v11 = a3;
  v12 = objc_opt_new(NSMutableAttributedString);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataFooterFont](MTEpisodeLockup, "metadataFooterFont"));
  v14 = objc_opt_new(NSMutableParagraphStyle);
  v72 = v13;
  objc_msgSend(v13, "lineHeight");
  v73 = v14;
  -[NSMutableParagraphStyle setParagraphSpacingBefore:](v14, "setParagraphSpacingBefore:", v15 * 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "podcast"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeUnavailableUtil longStringForUnavailableReason:podcastTitle:](MTEpisodeUnavailableUtil, "longStringForUnavailableReason:podcastTitle:", a8, v17));

  v70 = objc_msgSend(v18, "length");
  if (v70)
  {
    if (v9)
    {
      v81 = NSParagraphStyleAttributeName;
      v82 = v73;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n"), "stringByAppendingString:", v18));

      v18 = (void *)v20;
    }
    else
    {
      v19 = 0;
    }
    v21 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v18, v19);
    -[NSMutableAttributedString appendAttributedString:](v12, "appendAttributedString:", v21);

  }
  v74 = objc_opt_new(NSMutableArray);
  v22 = CPInterfaceController_ptr;
  if (v10)
  {
    v23 = v9;
    v24 = (uint64_t)objc_msgSend(v11, "seasonNumber");
    v25 = (uint64_t)objc_msgSend(v11, "episodeNumber");
    v26 = objc_msgSend(v11, "episodeTypeResolvedValue");
    if (v26 == (id)2)
    {
      if (v24 >= 1 && v25 >= 1)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v28 = v27;
        v29 = CFSTR("EPISODE_AND_SEASON_NUMBER_BONUS");
        goto LABEL_19;
      }
      if (v24 >= 1)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v28 = v31;
        v32 = CFSTR("SEASON_NUMBER_BONUS");
        goto LABEL_26;
      }
      if (v25 >= 1)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v28 = v35;
        v36 = CFSTR("EPISODE_NUMBER_BONUS");
        goto LABEL_70;
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = v64;
      v65 = CFSTR("BONUS_EPISODE");
    }
    else
    {
      if (v26 != (id)1)
      {
        if (v26)
          goto LABEL_32;
        if (v24 >= 1 && v25 >= 1)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v28 = v27;
          v29 = CFSTR("EPISODE_AND_SEASON_NUMBER_FORMAT");
LABEL_19:
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", v29, &stru_1004C6D40, 0));
          v66 = v25;
LABEL_27:
          v33 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, v24, v66);
LABEL_28:
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

          v22 = CPInterfaceController_ptr;
LABEL_29:
          LOBYTE(v9) = v23;

LABEL_33:
          if (objc_msgSend(v34, "length"))
            -[NSMutableArray addObject:](v74, "addObject:", v34);

          goto LABEL_36;
        }
        if (v24 >= 1)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v28 = v31;
          v32 = CFSTR("SEASON_NUMBER_FORMAT");
LABEL_26:
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", v32, &stru_1004C6D40, 0));
          goto LABEL_27;
        }
        if (v25 < 1)
        {
LABEL_32:
          v34 = 0;
          LOBYTE(v9) = v23;
          goto LABEL_33;
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v28 = v35;
        v36 = CFSTR("EPISODE_NUMBER_FORMAT");
LABEL_70:
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", v36, &stru_1004C6D40, 0));
        v33 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, v25, v66);
        goto LABEL_28;
      }
      if (v24 >= 1 && v25 >= 1)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v28 = v27;
        v29 = CFSTR("EPISODE_AND_SEASON_NUMBER_TRAILER");
        goto LABEL_19;
      }
      if (v24 >= 1)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v28 = v31;
        v32 = CFSTR("SEASON_NUMBER_TRAILER");
        goto LABEL_26;
      }
      if (v25 >= 1)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v28 = v35;
        v36 = CFSTR("EPISODE_NUMBER_TRAILER");
        goto LABEL_70;
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = v64;
      v65 = CFSTR("TRAILER_EPISODE");
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "localizedStringForKey:value:table:", v65, &stru_1004C6D40, 0));
    goto LABEL_29;
  }
LABEL_36:
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", kEpisodePubDate));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "verboseDisplayString"));

  if (v38)
    -[NSMutableArray addObject:](v74, "addObject:", v38);
  v71 = v12;
  if ((uint64_t)objc_msgSend(v11, "byteSize") < 1)
    v39 = 0;
  else
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithBytesize:](NSString, "stringWithBytesize:", objc_msgSend(v11, "byteSize")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[192], "mainBundle"));
  if ((objc_msgSend(v11, "isAudio") & 1) != 0)
  {
    v41 = CFSTR("Audio");
  }
  else if (objc_msgSend(v11, "isVideo"))
  {
    v41 = CFSTR("Video");
  }
  else
  {
    v41 = CFSTR("Document");
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", v41, &stru_1004C6D40, 0));

  v67 = v39;
  if (objc_msgSend(v39, "length"))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[192], "mainBundle"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("EPISODE_SIZE_ALT_FORMAT"), &stru_1004C6D40, 0));
    v45 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, v39, v42, v39));

  }
  else
  {
    v45 = v42;
  }
  if (v68 && (objc_msgSend(v11, "duration"), v46 >= 1.0))
  {
    objc_msgSend(v11, "duration");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithDuration:unitsStyle:includeTimeRemainingPhrase:](NSString, "stringWithDuration:unitsStyle:includeTimeRemainingPhrase:", 3, 0));
    if (objc_msgSend(v47, "length"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("EPISODE_DURATION_SIZE_FORMAT"), &stru_1004C6D40, 0));
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v49, v47, v45));

      -[NSMutableArray addObject:](v74, "addObject:", v50);
    }
    else
    {
      -[NSMutableArray addObject:](v74, "addObject:", v45);
    }

  }
  else
  {
    -[NSMutableArray addObject:](v74, "addObject:", v45);
  }
  if (v69)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playedText"));
    if (objc_msgSend(v51, "length"))
      -[NSMutableArray addObject:](v74, "addObject:", v51);

  }
  if (objc_msgSend(v11, "isDownloaded"))
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "podcast"));
    v53 = objc_msgSend(v52, "deletePlayedEpisodesResolvedValue");

    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "podcastUuid"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:](MTEpisode, "predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:", v54, 1));

      if (objc_msgSend(v55, "evaluateWithObject:", v11))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("EPISODE_DETAIL_DOWNLOAD_WILL_BE_DELETED"), &stru_1004C6D40, 0));
        -[NSMutableArray addObject:](v74, "addObject:", v57);

      }
    }
  }
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_10009C0F4;
  v75[3] = &unk_1004A8D00;
  v79 = v9;
  v76 = v18;
  v77 = v73;
  v80 = v70 != 0;
  v78 = v71;
  v58 = v71;
  v59 = v73;
  v60 = v18;
  -[NSMutableArray enumerateObjectsUsingBlock:](v74, "enumerateObjectsUsingBlock:", v75);
  -[NSMutableAttributedString addAttribute:value:range:](v58, "addAttribute:value:range:", NSFontAttributeName, v72, 0, -[NSMutableAttributedString length](v58, "length"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[NSMutableAttributedString addAttribute:value:range:](v58, "addAttribute:value:range:", NSForegroundColorAttributeName, v61, 0, -[NSMutableAttributedString length](v58, "length"));

  v62 = -[NSMutableAttributedString copy](v58, "copy");
  return v62;
}

- (id)createVideoGlyphAttributedString
{
  void *v2;
  NSMutableAttributedString *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeStateView videoIcon](MTEpisodeStateView, "videoIcon"));
  v3 = objc_opt_new(NSMutableAttributedString);
  -[NSMutableAttributedString im_appendImage:](v3, "im_appendImage:", v2);
  -[NSMutableAttributedString im_appendString:](v3, "im_appendString:", CFSTR(" "));
  v4 = -[NSMutableAttributedString copy](v3, "copy");

  return v4;
}

- (id)descriptionBodyTextForEpisode:(id)a3 html:(BOOL)a4 withAttributes:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v18;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (v6 && objc_msgSend(v7, "itemDescriptionHasHTML"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lazyAttributedDescription"));
    v10 = objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "addAttributes:range:", v8, 0, objc_msgSend(v10, "length"));
    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_msgSend(v10, "copy");
      goto LABEL_9;
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemDescriptionWithoutHTML"));
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = objc_alloc((Class)NSAttributedString);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemDescriptionWithoutHTML"));
  }
  else
  {
    if ((objc_msgSend(v7, "itemDescriptionHasHTML") & 1) != 0)
    {
      v16 = 0;
      goto LABEL_10;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemDescription"));
    v16 = objc_msgSend(v18, "length");

    if (!v16)
      goto LABEL_10;
    v14 = objc_alloc((Class)NSAttributedString);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemDescription"));
  }
  v10 = (id)v15;
  v11 = objc_msgSend(v14, "initWithString:attributes:", v15, v8);
LABEL_9:
  v16 = v11;

LABEL_10:
  return v16;
}

- (id)metadataHeaderForPlayerItem:(id)a3
{
  return -[MTEpisodeDescriptionCache descriptionPrefixTextForPlayerItem:options:trailingNewline:](self, "descriptionPrefixTextForPlayerItem:options:trailingNewline:", a3, 3, 0);
}

- (id)descriptionPrefixTextForPlayerItem:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5
{
  char v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  uint64_t v22;
  unsigned __int8 v23;
  void *v24;
  NSMutableAttributedString *v25;
  NSMutableAttributedString *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  NSMutableAttributedString *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  BOOL v57;
  NSAttributedStringKey v58;
  void *v59;
  NSAttributedStringKey v60;
  void *v61;

  v47 = a5;
  v5 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((v5 & 2) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pubDate"));
  else
    v9 = 0;
  if (+[MTEpisodeLockup useLayoutForSkinnyPhones](MTEpisodeLockup, "useLayoutForSkinnyPhones"))
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nanoFriendlyDisplayString"));
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "abbreviatedFriendlyDisplayString"));
  v11 = (void *)v10;
  if (v10)
  {
    v12 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v10);
    objc_msgSend(v8, "addObject:", v12);

  }
  if ((v5 & 4) != 0
    && (objc_msgSend(v7, "playhead"),
        v14 = v13,
        objc_msgSend(v7, "duration"),
        +[MTEpisode isPlayhead:resumableForDuration:](MTEpisode, "isPlayhead:resumableForDuration:", v14, v15))&& (objc_msgSend(v7, "duration"), v17 = v16, objc_msgSend(v7, "duration"), v19 = v17 - v18, v19 > 0.0))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:](NSString, "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:", 1, +[MTEpisodeLockup useLayoutForSkinnyPhones](MTEpisodeLockup, "useLayoutForSkinnyPhones"), v19));
  }
  else
  {
    v20 = 0;
  }
  if (!objc_msgSend(v20, "length"))
  {
    objc_msgSend(v7, "duration");
    v22 = objc_claimAutoreleasedReturnValue(+[NSString prettyShortStringWithDuration:abbreviated:](NSString, "prettyShortStringWithDuration:abbreviated:", +[MTEpisodeLockup useLayoutForSkinnyPhones](MTEpisodeLockup, "useLayoutForSkinnyPhones"), v21));

    v20 = (void *)v22;
  }
  v23 = objc_msgSend(v7, "isVideo");
  if ((v5 & 8) != 0 && (v23 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache createVideoGlyphAttributedString](self, "createVideoGlyphAttributedString"));
    v25 = objc_opt_new(NSMutableAttributedString);
    v26 = v25;
    if (v24)
    {
      -[NSMutableAttributedString appendAttributedString:](v25, "appendAttributedString:", v24);

    }
  }
  else
  {
    v26 = objc_opt_new(NSMutableAttributedString);
  }
  if (objc_msgSend(v20, "length"))
  {
    v27 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v20);
    -[NSMutableAttributedString appendAttributedString:](v26, "appendAttributedString:", v27);

  }
  v46 = v20;
  v48 = v11;
  v49 = v9;
  v50 = v7;
  if (-[NSMutableAttributedString length](v26, "length"))
  {
    v28 = -[NSMutableAttributedString copy](v26, "copy");
    objc_msgSend(v8, "addObject:", v28);

  }
  v45 = v26;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](MTEpisodeLockup, "metadataHeaderFont"));
  v60 = NSFontAttributeName;
  v61 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
  v32 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR(" "), v31);
  v33 = objc_alloc((Class)NSAttributedString);
  v58 = NSFontAttributeName;
  v59 = v29;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
  v35 = objc_msgSend(v33, "initWithString:attributes:", CFSTR("•"), v34);

  v36 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\n"), v31);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10009C8F4;
  v51[3] = &unk_1004A8CD8;
  v37 = objc_alloc_init((Class)NSMutableAttributedString);
  v52 = v37;
  v38 = v8;
  v53 = v38;
  v39 = v32;
  v54 = v39;
  v40 = v35;
  v55 = v40;
  v57 = v47;
  v41 = v36;
  v56 = v41;
  objc_msgSend(v38, "enumerateObjectsUsingBlock:", v51);
  objc_msgSend(v37, "im_addAttribute:value:", NSFontAttributeName, v30);
  if (v47 && objc_msgSend(v37, "length"))
  {
    v42 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v30, "_leading");
    objc_msgSend(v42, "setParagraphSpacing:");
    objc_msgSend(v37, "im_addAttribute:value:", NSParagraphStyleAttributeName, v42);

  }
  if (objc_msgSend(v37, "length"))
    v43 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithAttributedString:", v37);
  else
    v43 = 0;

  return v43;
}

- (void)setDescriptionCache:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionCache, a3);
}

- (void)setEpisodeCache:(id)a3
{
  objc_storeStrong((id *)&self->_episodeCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeCache, 0);
  objc_storeStrong((id *)&self->_descriptionCache, 0);
}

@end
