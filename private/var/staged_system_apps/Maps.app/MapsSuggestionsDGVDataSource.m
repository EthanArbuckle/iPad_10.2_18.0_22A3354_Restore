@implementation MapsSuggestionsDGVDataSource

- (MapsSuggestionsDGVDataSource)initWithJSONString:(id)a3
{
  id v4;
  MapsSuggestionsDGVDataSource *v5;
  NSMutableArray *v6;
  NSMutableArray *annotations;
  NSMutableArray *v8;
  NSMutableArray *linkOverlays;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  MapsSuggestionsDGVDataSource *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t Log;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MapsSuggestionsDGVDataSource;
  v5 = -[MapsSuggestionsDGVDataSource init](&v19, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    annotations = v5->_annotations;
    v5->_annotations = v6;

    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    linkOverlays = v5->_linkOverlays;
    v5->_linkOverlays = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDGVDataSource _dictFromJSONString:](v5, "_dictFromJSONString:", v4));
    if (!v10)
    {
LABEL_13:
      v13 = 0;
      goto LABEL_14;
    }
    v11 = -[MapsSuggestionsDGVDataSource _buildAnnotationsWithDictFromDeserializedJson:](v5, "_buildAnnotationsWithDictFromDeserializedJson:", v10);
    v12 = -[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:](v5, "_buildLinksWithDictFromDeserializedJson:", v10);
    if ((v11 & 1) != 0)
    {
      if ((v12 & 1) != 0)
      {
        v13 = v5;
LABEL_14:

        goto LABEL_15;
      }
      Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVDataSource");
      v15 = objc_claimAutoreleasedReturnValue(Log);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        goto LABEL_12;
      *(_DWORD *)buf = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      v22 = 1024;
      v23 = 42;
      v24 = 2082;
      v25 = "-[MapsSuggestionsDGVDataSource initWithJSONString:]";
      v26 = 2082;
      v27 = "linkBuildSuccess == NO";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Destination Graph must build links correctly";
    }
    else
    {
      v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVDataSource");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      *(_DWORD *)buf = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      v22 = 1024;
      v23 = 41;
      v24 = 2082;
      v25 = "-[MapsSuggestionsDGVDataSource initWithJSONString:]";
      v26 = 2082;
      v27 = "annotationBuildSuccess == NO";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Destination Graph must build annotations correctly";
    }
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, v16, buf, 0x26u);
    goto LABEL_12;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (id)_dictFromJSONString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v3, 1, &v8));
  v5 = v4;
  v6 = 0;
  if (!v8)
    v6 = v4;

  return v6;
}

- (BOOL)_buildAnnotationsWithDictFromDeserializedJson:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  MapsSuggestionsDGVAnnotation *v11;
  MapsSuggestionsDGVAnnotation *v12;
  MapsSuggestionsDGVAnnotation *v13;
  BOOL v14;
  uint64_t Log;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  if (!a3)
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVDataSource");
    v5 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      v24 = 1024;
      v25 = 68;
      v26 = 2082;
      v27 = "-[MapsSuggestionsDGVDataSource _buildAnnotationsWithDictFromDeserializedJson:]";
      v28 = 2082;
      v29 = "nil == (dict)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Dictionary deserialzied from JSON cannot be nil", buf, 0x26u);
    }
    goto LABEL_17;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("destinations")));
  if (!v4)
  {
    v5 = 0;
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = [MapsSuggestionsDGVAnnotation alloc];
        v12 = -[MapsSuggestionsDGVAnnotation initWithDictFromJSONDeserialization:](v11, "initWithDictFromJSONDeserialization:", v10, (_QWORD)v17);
        v13 = v12;
        if (!v10)
        {

          v14 = 0;
          goto LABEL_15;
        }
        -[NSMutableArray addObject:](self->_annotations, "addObject:", v12);

      }
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_15:

LABEL_18:
  return v14;
}

- (BOOL)_buildLinksWithDictFromDeserializedJson:(id)a3
{
  NSObject *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  MapsSuggestionsDGVLinkOverlay *v17;
  int v18;
  uint64_t v19;
  NSObject *p_super;
  const char *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t Log;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  __int128 v29;
  NSObject *obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;

  if (!a3)
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVDataSource");
    v4 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      v40 = 1024;
      v41 = 88;
      v42 = 2082;
      v43 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
      v44 = 2082;
      v45 = "nil == (dict)";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Dictionary deserialzied from JSON cannot be nil", buf, 0x26u);
    }
    v23 = 0;
    goto LABEL_34;
  }
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("links")));
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v5)
  {
    v23 = 1;
    goto LABEL_33;
  }
  v7 = v5;
  v8 = 0;
  v31 = MapsSuggestionsLoggingSubsystem;
  v32 = *(_QWORD *)v34;
  *(_QWORD *)&v6 = 136446978;
  v29 = v6;
  obj = v4;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v34 != v32)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("from"), v29));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("to")));
      v13 = v12;
      if (!v11)
      {
        v25 = GEOFindOrCreateLog(v31, "DGVDataSource");
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v29;
          v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
          v40 = 1024;
          v41 = 97;
          v42 = 2082;
          v43 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
          v44 = 2082;
          v45 = "nil == (unserializedFromDest)";
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Unserialized dictionary must have \"from\" field", buf, 0x26u);
        }

        goto LABEL_31;
      }
      if (!v12)
      {
        v27 = GEOFindOrCreateLog(v31, "DGVDataSource");
        v13 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v29;
          v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
          v40 = 1024;
          v41 = 98;
          v42 = 2082;
          v43 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
          v44 = 2082;
          v45 = "nil == (unserializedToDest)";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Unserialized dictionary must have \"to\" field", buf, 0x26u);
        }
LABEL_31:
        v4 = obj;

        v23 = 0;
        goto LABEL_33;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDGVDataSource _findAnnotationEquivalentToUnserializedJSON:](self, "_findAnnotationEquivalentToUnserializedJSON:", v11));
      v15 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDGVDataSource _findAnnotationEquivalentToUnserializedJSON:](self, "_findAnnotationEquivalentToUnserializedJSON:", v13));
      v16 = (void *)v15;
      if (v14)
      {
        if (v15)
        {
          v17 = -[MapsSuggestionsDGVLinkOverlay initWithFromAnnotation:toAnnotation:index:]([MapsSuggestionsDGVLinkOverlay alloc], "initWithFromAnnotation:toAnnotation:index:", v14, v15, v8);
          -[NSMutableArray addObject:](self->_linkOverlays, "addObject:", v17);
          ++v8;
          v18 = 1;
          goto LABEL_18;
        }
        v22 = GEOFindOrCreateLog(v31, "DGVDataSource");
        v17 = (MapsSuggestionsDGVLinkOverlay *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(&v17->super.super.super.super, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v29;
          v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
          v40 = 1024;
          v41 = 104;
          v42 = 2082;
          v43 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
          v44 = 2082;
          v45 = "nil == (toDest)";
          p_super = &v17->super.super.super.super;
          v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. The \"to\" annotation object must be created";
          goto LABEL_16;
        }
      }
      else
      {
        v19 = GEOFindOrCreateLog(v31, "DGVDataSource");
        v17 = (MapsSuggestionsDGVLinkOverlay *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(&v17->super.super.super.super, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v29;
          v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
          v40 = 1024;
          v41 = 103;
          v42 = 2082;
          v43 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
          v44 = 2082;
          v45 = "nil == (fromDest)";
          p_super = &v17->super.super.super.super;
          v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. The \"from\" annotation object must be created";
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_FAULT, v21, buf, 0x26u);
        }
      }
      v18 = 0;
LABEL_18:

      if (!v18)
      {
        v23 = 0;
        v4 = obj;
        goto LABEL_33;
      }
    }
    v4 = obj;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v23 = 1;
    if (v7)
      continue;
    break;
  }
LABEL_33:

LABEL_34:
  return v23;
}

- (id)_findAnnotationEquivalentToUnserializedJSON:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t Log;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("likelyLocation")));
  v5 = v4;
  if (!v4)
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVDataSource");
    v14 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      v20 = 1024;
      v21 = 120;
      v22 = 2082;
      v23 = "-[MapsSuggestionsDGVDataSource _findAnnotationEquivalentToUnserializedJSON:]";
      v24 = 2082;
      v25 = "nil == (likelyLocationCoords)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Destination JSON must have likelyLocation coordinates";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v18, 0x26u);
    }
LABEL_9:

    v12 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "count") != (id)2)
  {
    v16 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVDataSource");
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      v20 = 1024;
      v21 = 121;
      v22 = 2082;
      v23 = "-[MapsSuggestionsDGVDataSource _findAnnotationEquivalentToUnserializedJSON:]";
      v24 = 2082;
      v25 = "[likelyLocationCoords count] != 2u";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Coordinate array must have exactly two items";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 1));
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDGVDataSource _annotationWithLatitude:longitude:](self, "_annotationWithLatitude:longitude:", v8, v11));
LABEL_10:

  return v12;
}

- (id)_annotationWithLatitude:(double)a3 longitude:(double)a4
{
  NSMutableArray *annotations;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  annotations = self->_annotations;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C33A4;
  v9[3] = &unk_1011B4378;
  *(double *)&v9[4] = a3;
  *(double *)&v9[5] = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v9));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](annotations, "filteredArrayUsingPredicate:", v5));

  if (objc_msgSend(v6, "count") == (id)1)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  else
    v7 = 0;

  return v7;
}

- (id)annotations
{
  return self->_annotations;
}

- (id)linkOverlays
{
  return self->_linkOverlays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkOverlays, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
}

@end
