@implementation AEAnnotation

+ (id)predicateForAnnotationsWithAssetID:(id)a3 ordinal:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation userAnnotationTypeValues](AEAnnotation, "userAnnotationTypeValues"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID ==[n] %@ AND plLocationRangeStart == %d AND (annotationType IN %@) AND annotationDeleted == 0"), v5, v4, v6, 0));

  return v7;
}

+ (id)annotationsPredicate:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID ==[n] %@ AND (annotationType == %d) AND annotationDeleted == 0 AND plLocationRangeStart >= 0 AND annotationNote != ''"), a3, 2);
}

+ (id)pageBookmarksPredicate:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID ==[n] %@ AND annotationType == %d AND annotationDeleted == 0 AND plLocationRangeStart >= 0"), a3, 1, 0);
}

+ (id)highlightsPredicate:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID ==[n] %@ AND annotationType == %d AND annotationDeleted == 0 AND plLocationRangeStart >= 0"), a3, 2);
}

- (void)setLocation:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_opt_class(BKEpubCFILocation);
  if ((objc_opt_isKindOfClass(v8, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cfiString"));
    -[AEAnnotation setAnnotationLocation:](self, "setAnnotationLocation:", v5);

    -[AEAnnotation setPlUserData:](self, "setPlUserData:", 0);
  }
  else
  {
    if (v8)
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serializeLocationToData"));
    else
      v6 = 0;
    -[AEAnnotation setPlUserData:](self, "setPlUserData:", v6);
    -[AEAnnotation setAnnotationLocation:](self, "setAnnotationLocation:", 0);

  }
  v7 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", objc_msgSend(v8, "ordinal"));
  -[AEAnnotation setPlLocationRangeStart:](self, "setPlLocationRangeStart:", v7);

}

- (BKLocation)location
{
  char *v3;
  void *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  __objc2_class *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;

  v3 = (char *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationLocation](self, "annotationLocation"));
  if (objc_msgSend(v3, "length"))
  {
    v17 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKEpubCFILocation locationForCFI:error:](BKEpubCFILocation, "locationForCFI:error:", v3, &v17));
    v5 = (char *)v17;
    v6 = v5;
    if (v4)
      goto LABEL_23;
    v7 = BCIMLog(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[AEAnnotation(BKBookmark) location]";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/AlderModels/AEAnnotation+BKBookmark.m";
      v22 = 1024;
      v23 = 89;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v10 = BCIMLog(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v3;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "@\"Failed to create BKLocation from CFI {%@} error {%@}\", buf, 0x16u);
    }

  }
  v6 = (char *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plUserData](self, "plUserData"));
  if (v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v6, 0, 0, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("class")));
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("BKEpubLocation")))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKEpubLocation deserializeLocationFromDictionary:](BKEpubLocation, "deserializeLocationFromDictionary:", v12));
      v14 = -[AEAnnotation annotationType](self, "annotationType") == 1
         || -[AEAnnotation annotationType](self, "annotationType") == 3;
      objc_msgSend(v4, "setSinglePage:", v14);
      goto LABEL_22;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("BKPageLocation")))
    {
      v15 = BKPageLocation;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("BKLocation")))
    {
      v15 = BKLocation;
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("BKEpubCFILocation")))
      {
        NSLog(CFSTR("Unknown Location Type: %@"), v13);
        v4 = 0;
        goto LABEL_22;
      }
      v15 = BKEpubCFILocation;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class deserializeLocationFromDictionary:](v15, "deserializeLocationFromDictionary:", v12));
LABEL_22:

    goto LABEL_23;
  }
  v4 = 0;
LABEL_23:

  return (BKLocation *)v4;
}

- (BOOL)isLocationSame:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plUserData](self, "plUserData"));

  if (!v5)
  {
    objc_opt_class(BKEpubCFILocation);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cfiString"));
      v8 = objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationLocation](self, "annotationLocation"));
      goto LABEL_6;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v6 = -[AEAnnotation ordinal](self, "ordinal");
  if (v6 != objc_msgSend(v4, "ordinal"))
    goto LABEL_7;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serializeLocationToData"));
  v8 = objc_claimAutoreleasedReturnValue(-[AEAnnotation plUserData](self, "plUserData"));
LABEL_6:
  v10 = (void *)v8;
  v11 = objc_msgSend(v7, "isEqual:", v8);

LABEL_8:
  return v11;
}

- (void)setOrdinal:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[AEAnnotation setPlLocationRangeStart:](self, "setPlLocationRangeStart:", v4);

}

- (int64_t)ordinal
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plLocationRangeStart](self, "plLocationRangeStart"));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

@end
