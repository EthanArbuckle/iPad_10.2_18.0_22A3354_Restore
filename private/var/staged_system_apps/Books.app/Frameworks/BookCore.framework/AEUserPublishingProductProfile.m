@implementation AEUserPublishingProductProfile

- (NSArray)series_genres
{
  AEUserPublishingProductProfile *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  AEUserPublishingProductProfile *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile children](self, "children"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile children](v2, "children"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "series_genres"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v7;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v38;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v9);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v11 = v2;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile children](v2, "children"));
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v34;
LABEL_9:
            v16 = 0;
            while (1)
            {
              if (*(_QWORD *)v34 != v15)
                objc_enumerationMutation(v12);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v16), "series_genres"));
              v18 = objc_msgSend(v17, "containsObject:", v10);

              if (!v18)
                break;
              if (v14 == (id)++v16)
              {
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
                if (v14)
                  goto LABEL_9;
                break;
              }
            }
          }

          objc_msgSend(v8, "addObject:", v10);
          v9 = (char *)v9 + 1;
          v2 = v11;
        }
        while (v9 != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v32);
    }

    if (objc_msgSend(v8, "count"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "array"));
    }
    else
    {
      v27 = IMCommonCoreBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Multiple"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
      v41 = v29;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));

    }
    return (NSArray *)v19;
  }
  else
  {
    v20 = objc_opt_class(NSArray);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](v2, "objectForKey:", CFSTR("genres")));
    v22 = BUDynamicCast(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    v24 = sub_12338(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    return (NSArray *)v25;
  }
}

- (NSString)series_genre
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile series_genres](self, "series_genres"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (NSString *)v3;
}

- (NSString)series_sortAuthor
{
  return 0;
}

- (NSString)series_title
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("nameRaw")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSNumber)series_isExplicit
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[AEUserPublishingProductProfile isExplicit](self, "isExplicit"));
}

- (NSNumber)series_isAudiobook
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[AEUserPublishingProductProfile isAudiobook](self, "isAudiobook")));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile series_genres](self, "series_genres"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "isEqualToString:", CFSTR("Audiobooks"), (_QWORD)v10))
        {

          v3 = &__kCFBooleanTrue;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSNumber *)v3;
}

- (NSNumber)series_isSG
{
  return 0;
}

- (NSString)series_seriesId
{
  void *v3;

  if (-[AEUserPublishingProductProfile series_isContainer](self, "series_isContainer"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile series_adamId](self, "series_adamId"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile seriesID](self, "seriesID"));
  return (NSString *)v3;
}

- (NSString)series_seriesTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (-[AEUserPublishingProductProfile series_isContainer](self, "series_isContainer"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile series_title](self, "series_title"));
  }
  else
  {
    v4 = objc_opt_class(NSString);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile series_seriesInfo](self, "series_seriesInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("seriesName")));
    v7 = BUDynamicCast(v4, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  return (NSString *)v3;
}

- (NSNumber)series_position
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile series_seriesInfo](self, "series_seriesInfo"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sequenceNumber")));
    v5 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
    }
    else
    {
      v8 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v4, v8) & 1) == 0)
      {
        v7 = 0;
        goto LABEL_9;
      }
      v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue")));
    }
    v7 = v6;
LABEL_9:

    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:

  return (NSNumber *)v7;
}

- (NSString)series_displayLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile series_seriesInfo](self, "series_seriesInfo"));
  if (v3)
  {
    v4 = objc_opt_class(NSString);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sequenceDisplayLabel")));
    v6 = BUDynamicCast(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile series_position](self, "series_position"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile series_position](self, "series_position"));
        v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v10, "longValue")));

      }
      else
      {
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

- (NSString)series_formattedPrice
{
  return 0;
}

- (AEUserPublishingProductProfile)initWithProfileDictionary:(id)a3
{
  id v5;
  AEUserPublishingProductProfile *v6;
  AEUserPublishingProductProfile *v7;

  v5 = a3;
  v6 = -[AEUserPublishingProductProfile init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_profileDictionary, a3);

  return v7;
}

- (id)artworkURLTemplateAspect:(double *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  double v20;

  v5 = objc_opt_class(NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile profileDictionary](self, "profileDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("artwork")));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    v10 = objc_opt_class(NSString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("url")));
    v12 = BUDynamicCast(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (a3)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("width")));
      objc_msgSend(v14, "floatValue");
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("height")));
      objc_msgSend(v17, "floatValue");
      v19 = v18;

      v20 = 1.0;
      if (v16 > 0.0)
        v20 = v19 / v16;
      *a3 = v20;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)urlForCoverImageOfSize:(CGSize)a3
{
  return -[AEUserPublishingProductProfile urlForCoverImageOfSize:aspect:](self, "urlForCoverImageOfSize:aspect:", 0, a3.width, a3.height);
}

- (id)urlForCoverImageOfSize:(CGSize)a3 aspect:(double *)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  BOOL IsEmpty;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  float v27;
  double v28;
  id v30;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  float v37;
  float v38;
  double v39;
  void *v40;
  float v41;
  double v42;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  float v57;
  void *v58;
  id v59;
  void *v60;
  float v61;
  float v62;
  void *v63;
  float v64;
  float v65;
  double v66;
  id v67;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  CGRect v75;

  height = a3.height;
  width = a3.width;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile profileDictionary](self, "profileDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("artwork")));

  v75.origin.x = CGPointZero.x;
  v75.origin.y = CGPointZero.y;
  v75.size.width = width;
  v75.size.height = height;
  IsEmpty = CGRectIsEmpty(v75);
  v10 = objc_opt_class(NSArray);
  v11 = BUDynamicCast(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v12)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v69 = v12;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v71;
      v19 = 0.0;
      v20 = 0.0;
LABEL_4:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v71 != v18)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("width")));
        objc_msgSend(v23, "floatValue");
        v25 = v24;

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("height")));
        objc_msgSend(v26, "floatValue");
        v28 = v27;

        if (v19 <= v25 || v20 <= v28)
        {
          v30 = v22;

          v17 = v30;
          v19 = v25;
          v20 = v28;
        }
        if (!IsEmpty && (width <= v25 || height <= v28))
          break;
        if (v16 == (id)++v21)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v17 = 0;
    }

    v45 = objc_opt_class(NSString);
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("url")));
    v47 = BUDynamicCast(v45, v46);
    v44 = (id)objc_claimAutoreleasedReturnValue(v47);

    v13 = v69;
  }
  else
  {
    v32 = objc_opt_class(NSDictionary);
    v33 = BUDynamicCast(v32, v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v17 = v34;
    if (!v34)
      goto LABEL_26;
    v35 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("width")));
    objc_msgSend(v36, "floatValue");
    v38 = v37;
    v39 = v37;

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("height")));
    objc_msgSend(v40, "floatValue");
    v42 = v41;

    if (width < v39 && height < v42)
    {
      v48 = objc_opt_class(NSString);
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("url")));
      v50 = BUDynamicCast(v48, v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      v52 = objc_msgSend(v51, "mutableCopy");

      v44 = 0;
      if (objc_msgSend(v52, "length") && v38 > 0.0)
      {
        v53 = CGSizeScaledToFillInSize(v39, v42, width, height);
        v55 = v54;
        *(float *)&v53 = v53;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), llroundf(*(float *)&v53)));
        objc_msgSend(v52, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{w}"), v56, 2, 0, objc_msgSend(v52, "length"));

        v57 = v55;
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), llroundf(v57)));
        objc_msgSend(v52, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{h}"), v58, 2, 0, objc_msgSend(v52, "length"));

        objc_msgSend(v52, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{f}"), CFSTR("jpeg"), 2, 0, objc_msgSend(v52, "length"));
        v44 = objc_msgSend(v52, "copy");
      }

    }
    else
    {
LABEL_26:
      v44 = 0;
    }

  }
  if (objc_msgSend(v44, "length"))
  {
    v59 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v44);
    if (!a4)
      goto LABEL_41;
  }
  else
  {
    v59 = 0;
    if (!a4)
      goto LABEL_41;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("width")));
  objc_msgSend(v60, "floatValue");
  v62 = v61;

  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("height")));
  objc_msgSend(v63, "floatValue");
  v65 = v64;

  v66 = 1.0;
  if (v62 > 0.0)
    v66 = v65 / v62;
  *a4 = v66;
LABEL_41:
  v67 = v59;

  return v67;
}

+ (BOOL)_isContentRatingExplicitForInfo:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v3 = a3;
  v4 = objc_opt_class(NSDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contentRatingsBySystem")));

  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_opt_class(NSDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ebooksApple")));
  if (v9)
  {
    v10 = BUDynamicCast(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("riaa")));
    v13 = BUDynamicCast(v8, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);

  }
  v14 = objc_opt_class(NSString);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name")));
  v16 = BUDynamicCast(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  LOBYTE(v15) = objc_msgSend(v17, "isEqualToString:", CFSTR("Explicit"));
  return (char)v15;
}

- (BOOL)isExplicit
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile profileDictionary](self, "profileDictionary"));
  LOBYTE(v3) = objc_msgSend((id)v3, "_isContentRatingExplicitForInfo:", v4);

  if ((v3 & 1) != 0)
    return 1;
  if (!-[AEUserPublishingProductProfile isSeries](self, "isSeries"))
    return 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_opt_class(NSDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile profileDictionary](self, "profileDictionary", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("children")));
  v9 = BUDynamicCast(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectEnumerator"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_opt_class(self);
        v18 = objc_opt_class(NSDictionary);
        v19 = BUDynamicCast(v18, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        LODWORD(v17) = objc_msgSend(v17, "_isContentRatingExplicitForInfo:", v20);

        if (!(_DWORD)v17)
        {
          v5 = 0;
          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }
  v5 = 1;
LABEL_15:

  return v5;
}

- (NSDictionary)offer
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_opt_class(NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("offers")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_opt_class(NSDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v9 = BUDynamicCast(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  }
  else
  {
    v10 = 0;
  }

  return (NSDictionary *)v10;
}

- (NSString)buyParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buyParams")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (NSString)priceString
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));
  if (v2)
  {
    v3 = objc_opt_class(NSNumber);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("price")));
    v5 = BUDynamicCast(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if ((objc_msgSend(v6, "isEqualToNumber:", &off_2A9410) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v8 = objc_opt_class(NSString);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("priceFormatted")));
      v10 = BUDynamicCast(v8, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);

    }
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (int64_t)fileSize
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  int64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));
  if (v2)
  {
    v3 = objc_opt_class(NSArray);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("assets")));
    v5 = BUDynamicCast(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(obj);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("size")));
          v13 = objc_opt_class(NSNumber);
          v14 = BUDynamicCast(v13, v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v16 = v15;
          if (v15)
          {
            v17 = v15;
          }
          else
          {
            v18 = objc_opt_class(NSString);
            v19 = BUDynamicCast(v18, v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v20, "integerValue")));

          }
          v9 += (int64_t)objc_msgSend(v17, "integerValue");

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)actionTextWithType:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  if (-[AEUserPublishingProductProfile isPreorder](self, "isPreorder"))
  {
    switch(a3)
    {
      case 2:
        v14 = IMCommonCoreBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v7 = v6;
        v8 = CFSTR("PRE-ORDER BOOK");
        goto LABEL_23;
      case 1:
        v15 = IMCommonCoreBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v7 = v6;
        v8 = CFSTR("Pre-Order");
        goto LABEL_23;
      case 0:
        v5 = IMCommonCoreBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
        v7 = v6;
        v8 = CFSTR("PRE-ORDER");
LABEL_23:
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_296430, CFSTR("BCCommonCoreLocalizable")));

        return v12;
    }
    goto LABEL_16;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile priceString](self, "priceString"));
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    switch(a3)
    {
      case 2:
        v16 = IMCommonCoreBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v7 = v6;
        v8 = CFSTR("BUY BOOK");
        goto LABEL_23;
      case 1:
        v17 = IMCommonCoreBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v7 = v6;
        v8 = CFSTR("Buy");
        goto LABEL_23;
      case 0:
        v11 = IMCommonCoreBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v7 = v6;
        v8 = CFSTR("BUY");
        goto LABEL_23;
    }
    goto LABEL_16;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));

  if (v12)
  {
    switch(a3)
    {
      case 2:
        v18 = IMCommonCoreBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v7 = v6;
        v8 = CFSTR("GET BOOK");
        goto LABEL_23;
      case 1:
        v19 = IMCommonCoreBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v7 = v6;
        v8 = CFSTR("Get");
        goto LABEL_23;
      case 0:
        v13 = IMCommonCoreBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v7 = v6;
        v8 = CFSTR("GET");
        goto LABEL_23;
    }
LABEL_16:
    v12 = 0;
  }
  return v12;
}

- (int64_t)offerType
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  unsigned int v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("get"));

  if ((v6 & 1) != 0)
    return 2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type")));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("buy"));

  if ((v10 & 1) != 0)
    return 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("type")));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("preorder"));

  if (v13)
    return 3;
  else
    return 0;
}

- (BOOL)isPreorder
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", CFSTR("preorder"));
  return (char)v4;
}

- (NSDate)expectedDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSISO8601DateFormatter *v8;
  void *v9;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expectedReleaseDate")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_opt_new(NSISO8601DateFormatter);
    -[NSISO8601DateFormatter setFormatOptions:](v8, "setFormatOptions:", 275);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v8, "dateFromString:", v7));

  }
  else
  {
    v9 = 0;
  }

  return (NSDate *)v9;
}

- (NSDate)releaseDate
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSISO8601DateFormatter *v7;
  void *v8;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("releaseDate")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_opt_new(NSISO8601DateFormatter);
    -[NSISO8601DateFormatter setFormatOptions:](v7, "setFormatOptions:", 275);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v7, "dateFromString:", v6));

  }
  else
  {
    v8 = 0;
  }

  return (NSDate *)v8;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile profileDictionary](self, "profileDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (NSString)adamId
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("id")));
  if ((objc_opt_respondsToSelector(v2, "stringValue") & 1) != 0)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringValue"));

    v2 = (void *)v3;
  }
  v4 = objc_opt_class(NSString);
  v5 = BUDynamicCast(v4, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)author
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("artistName")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)title
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("name")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)genre
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("genreNames")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  return (NSString *)v7;
}

- (NSString)standardDescription
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("description")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_opt_class(NSString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("standard")));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (NSString *)v10;
}

- (void)calculateTrimmedStandardDescription
{
  id v2;

  v2 = -[AEUserPublishingProductProfile trimmedStandardDescription](self, "trimmedStandardDescription");
}

- (NSString)trimmedStandardDescription
{
  NSString *trimmedStandardDescription;
  void *v4;
  NSString *v5;
  NSString *v6;

  trimmedStandardDescription = self->_trimmedStandardDescription;
  if (!trimmedStandardDescription)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile standardDescription](self, "standardDescription"));
    if (v4 && -[AEUserPublishingProductProfile stringNeedsHTMLParsing:](self, "stringNeedsHTMLParsing:", v4))
      v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_stringByStrippingHTML"));
    else
      v5 = v4;
    v6 = self->_trimmedStandardDescription;
    self->_trimmedStandardDescription = v5;

    trimmedStandardDescription = self->_trimmedStandardDescription;
  }
  return trimmedStandardDescription;
}

- (void)calculateTrimmedStandardNotes
{
  id v2;

  v2 = -[AEUserPublishingProductProfile trimmedStandardNotes](self, "trimmedStandardNotes");
}

- (NSString)trimmedStandardNotes
{
  NSString *trimmedStandardNotes;
  void *v4;
  NSString *v5;
  NSString *v6;

  trimmedStandardNotes = self->_trimmedStandardNotes;
  if (!trimmedStandardNotes)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile standardNotes](self, "standardNotes"));
    if (v4 && -[AEUserPublishingProductProfile stringNeedsHTMLParsing:](self, "stringNeedsHTMLParsing:", v4))
      v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_stringByStrippingHTML"));
    else
      v5 = v4;
    v6 = self->_trimmedStandardNotes;
    self->_trimmedStandardNotes = v5;

    trimmedStandardNotes = self->_trimmedStandardNotes;
  }
  return trimmedStandardNotes;
}

- (NSString)standardNotes
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("itunesNotes")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_opt_class(NSString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("standard")));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (NSString *)v10;
}

- (NSDictionary)ebookInfo
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("ebookInfo")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSDictionary *)v6;
}

- (double)averageRating
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  float v11;
  double v12;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("userRating")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_opt_class(NSNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("value")));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "floatValue");
  v12 = v11 / 5.0;

  return v12;
}

- (unint64_t)ratingCount
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("userRating")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_opt_class(NSNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("ratingCount")));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  return (unint64_t)v11;
}

- (NSURL)productURL
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("url")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  else
    v7 = 0;

  return (NSURL *)v7;
}

- (NSURL)productShortURL
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("shortUrl")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  else
    v7 = 0;

  return (NSURL *)v7;
}

- (NSURL)bookSampleDownloadURL
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("bookSampleDownloadUrl")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  else
    v7 = 0;

  return (NSURL *)v7;
}

- (NSURL)audiobookSampleURL
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = objc_opt_class(NSDictionary);
  v4 = objc_opt_class(NSArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](self, "offer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assets")));
  v7 = BUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v10 = BUDynamicCast(v3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = objc_opt_class(NSDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("preview")));
  v14 = BUDynamicCast(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = objc_opt_class(NSString);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("url")));
  v18 = BUDynamicCast(v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (objc_msgSend(v19, "length"))
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v19));
  else
    v20 = 0;

  return (NSURL *)v20;
}

- (NSString)kind
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("kind")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (BOOL)isSeries
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile kind](self, "kind"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("epubEbookSeries"));

  return v3;
}

- (BOOL)isAudiobook
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("isAudiobook")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("audioLocale")));
    if (v8)
    {
      v7 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("audiobookTrackIds")));
      v7 = v9 != 0;

    }
  }

  return v7;
}

- (BOOL)isStoreAudiobook
{
  BOOL v3;
  void *v4;

  if (-[AEUserPublishingProductProfile isAudiobook](self, "isAudiobook"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile ebookInfo](self, "ebookInfo"));
  v3 = v4 == 0;

  return v3;
}

- (BOOL)hasSupplementalContent
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("hasSupplementalContent")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)stringNeedsHTMLParsing:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = qword_30D5B8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_30D5B8, &stru_28D218);
  v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", qword_30D5B0);

  return v5 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p %@ \ndictionary: %@"), self, objc_opt_class(self), self->_profileDictionary);
}

- (NSDictionary)profileDictionary
{
  return self->_profileDictionary;
}

- (void)setTrimmedStandardDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setTrimmedStandardNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trimmedStandardNotes, 0);
  objc_storeStrong((id *)&self->_trimmedStandardDescription, 0);
  objc_storeStrong((id *)&self->_profileDictionary, 0);
}

- (NSArray)children
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("children")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
  return (NSArray *)v7;
}

- (NSArray)childrenIDs
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile objectForKey:](self, "objectForKey:", CFSTR("childrenIds")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("stringValue")));
  return (NSArray *)v7;
}

- (NSDictionary)seriesInfo
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile ebookInfo](self, "ebookInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seriesInfo")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSDictionary *)v7;
}

- (NSString)seriesID
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile seriesInfo](self, "seriesInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("seriesId")));

  if ((objc_opt_respondsToSelector(v3, "stringValue") & 1) != 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));

    v3 = (void *)v4;
  }
  v5 = objc_opt_class(NSString);
  v6 = BUDynamicCast(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

@end
