@implementation AEAnnotation

- (void)awakeFromInsert
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation awakeFromInsert](&v5, "awakeFromInsert");
  v3 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 2);
  -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v3, CFSTR("annotationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("annotationCreationDate"));
  -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("annotationModificationDate"));

}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("AEAnnotation"));
}

+ (id)predicateForAnnotationWithUUID:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationDeleted == 0 AND annotationUuid == %@ AND annotationType != %d"), a3, 3);
}

+ (id)predicateForAnnotationIncludingDeletedWithUUID:(id)a3 assetID:(id)a4
{
  NSPredicate *v4;

  if (a4)
    v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID == %@ AND annotationUuid == %@"), a4, a3);
  else
    v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationUuid == %@ AND annotationType != %d "), a3, 3);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

+ (id)predicateForAnnotationsIncludingDeletedWithUUIDInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationUuid IN %@"), a3);
}

+ (id)predicateForAnnotationsIncludingDeletedWithUUIDInList:(id)a3 assetID:(id)a4
{
  NSPredicate *v4;

  if (a4)
    v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationUuid IN %@ AND annotationAssetID == %@"), a3, a4);
  else
    v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationUuid IN %@ AND annotationType != %d"), a3, 3);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

+ (id)predicateForAnnotationsIncludingDeletedWithUUIDNotInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("NOT (annotationUuid IN %@)"), a3);
}

+ (id)predicateForAllAnnotationsIncludingDeleted:(BOOL)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(1 == %d OR annotationDeleted == 0)"), a3);
}

+ (id)predicateForAnnotationsWithAssetID:(id)a3 includingDeleted:(BOOL)a4
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID == %@ AND (1 == %d OR annotationDeleted == 0)"), a3, a4);
}

+ (id)predicateForAnnotationsWithAssetIDInList:(id)a3 includingDeleted:(BOOL)a4
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID IN %@ AND (1 == %d OR annotationDeleted == 0)"), a3, a4);
}

+ (id)predicateForGlobalAnnotations
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationType == %d AND annotationDeleted == 0"), 3);
}

+ (id)predicateForGlobalAnnotationWithAssetID:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID == %@ AND annotationType == %d AND annotationDeleted == 0"), a3, 3);
}

+ (id)predicateForGlobalAnnotationsWithAssetIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID IN %@ AND annotationType == %d AND annotationDeleted == 0"), a3, 3);
}

+ (id)predicateForUserAnnotationsWithAssetID:(id)a3 includingDeleted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userAnnotationTypeValues"));
  v8 = (void *)v7;
  if (v4)
    v9 = CFSTR("annotationAssetID == %@ AND annotationType IN %@");
  else
    v9 = CFSTR("annotationAssetID == %@ AND annotationType IN %@ AND annotationDeleted == 0");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v9, v6, v7));

  return v10;
}

+ (id)predicateForUserAnnotationsWithAssetIDInList:(id)a3 includingDeleted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userAnnotationTypeValues"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID IN (%@) AND annotationType IN (%@) and (1 == %d OR annotationDeleted == 0)"), v6, v7, v4));

  return v8;
}

+ (id)predicateForPageBookmarksWithAssetID:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID ==[n] %@ AND annotationType == %d AND annotationDeleted == 0 AND plLocationRangeStart >= 0"), a3, 1);
}

+ (id)predicateForRangeAnnotationsWithAssetID:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationAssetID ==[n] %@ AND annotationType == %d AND annotationDeleted == 0 AND plLocationRangeStart >= 0"), a3, 2);
}

+ (id)predicateForAnnotationsWithLocation:(id)a3 includingDeleted:(BOOL)a4
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationLocation = %@ AND (1 == %d OR annotationDeleted == 0)"), a3, a4);
}

+ (id)predicateForAnnotationsIncludingDeletedWithUserModificationDate
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("futureProofing6"));
}

+ (id)predicateForGlobalAnnotationsIncludingDeletedMissingReadingProgressHighWaterMark
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NULL AND %K == %d"), CFSTR("futureProofing8"), CFSTR("annotationType"), 3);
}

+ (id)predicateForNonGlobalAnnotationsIncludingDeleted
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("annotationType"), 3);
}

+ (id)annotationsForPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  return objc_msgSend(a4, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("AEAnnotation"), a3, CFSTR("annotationCreationDate"), 1, 0);
}

+ (id)dictionaryResultsForAssetsWithPredicate:(id)a3 properties:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = objc_autoreleasePoolPush();
    v11 = objc_alloc_init((Class)NSFetchRequest);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v9));
    objc_msgSend(v11, "setEntity:", v12);
    objc_msgSend(v11, "setResultType:", 2);
    objc_msgSend(v11, "setPropertiesToFetch:", v8);
    objc_msgSend(v11, "setReturnsDistinctResults:", 1);
    objc_msgSend(v11, "setPredicate:", v7);
    v15 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v11, &v15));

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)annotationIncludingDeletedWithUUID:(id)a3 assetID:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForAnnotationIncludingDeletedWithUUID:assetID:", a3, a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "annotationsForPredicate:inManagedObjectContext:", v9, v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
  return v11;
}

+ (id)annotationsForAssetID:(id)a3 includingDeleted:(BOOL)a4 inManagedObjectContext:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForAnnotationsWithAssetID:includingDeleted:", a3, v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "annotationsForPredicate:inManagedObjectContext:", v9, v8));

  return v10;
}

+ (id)annotationsWithAssetIDInList:(id)a3 includingDeleted:(BOOL)a4 inManagedObjectContext:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForAnnotationsWithAssetIDInList:includingDeleted:", a3, v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "annotationsForPredicate:inManagedObjectContext:", v9, v8));

  return v10;
}

+ (id)annotationsIncludingDeletedWithUUIDInList:(id)a3 assetID:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForAnnotationsIncludingDeletedWithUUIDInList:assetID:", a3, a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "annotationsForPredicate:inManagedObjectContext:", v9, v8));

  return v10;
}

+ (id)globalAnnotationForAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForGlobalAnnotationWithAssetID:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "annotationsForPredicate:inManagedObjectContext:", v7, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  return v9;
}

+ (id)maxModificationDateColumnName
{
  return CFSTR("maxModificationDate");
}

+ (id)maxExpressionDescriptionForProperty:(id)a3 expressionName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForKeyPath:](NSExpression, "expressionForKeyPath:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("max:"), v7));

  v9 = objc_alloc_init((Class)NSExpressionDescription);
  objc_msgSend(v9, "setName:", v5);

  objc_msgSend(v9, "setExpression:", v8);
  return v9;
}

+ (id)maxModificationDateExpressionDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "maxModificationDateColumnName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "maxExpressionDescriptionForProperty:expressionName:", CFSTR("annotationModificationDate"), v3));

  objc_msgSend(v4, "setExpressionResultType:", 900);
  return v4;
}

+ (id)maxUserModificationDateExpressionDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "maxModificationDateColumnName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "maxExpressionDescriptionForProperty:expressionName:", CFSTR("futureProofing6"), v3));

  objc_msgSend(v4, "setExpressionResultType:", 900);
  return v4;
}

+ (id)maxModificationDateForAssetsWithPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  void *v25;
  void *context;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    context = objc_autoreleasePoolPush();
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation maxModificationDateColumnName](AEAnnotation, "maxModificationDateColumnName"));
    v8 = objc_claimAutoreleasedReturnValue(+[AEAnnotation maxModificationDateExpressionDescription](AEAnnotation, "maxModificationDateExpressionDescription"));
    v9 = objc_alloc_init((Class)NSFetchRequest);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v6));
    objc_msgSend(v9, "setEntity:");
    objc_msgSend(v9, "setResultType:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("annotationAssetID"), CFSTR("annotationModificationDate"), 0));
    objc_msgSend(v9, "setPropertiesToGroupBy:", v10);

    v25 = (void *)v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, CFSTR("annotationAssetID"), 0));
    objc_msgSend(v9, "setPropertiesToFetch:", v11);

    objc_msgSend(v9, "setReturnsDistinctResults:", 1);
    v28 = v5;
    objc_msgSend(v9, "setPredicate:", v5);
    v33 = 0;
    v27 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v9, &v33));
    v23 = v33;
    v13 = objc_alloc_init((Class)NSMutableDictionary);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForKey:", v7));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForKey:", CFSTR("annotationAssetID")));
          objc_msgSend(v13, "setValue:forKey:", v20, v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v16);
    }

    objc_autoreleasePoolPop(context);
    v6 = v27;
    v5 = v28;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)maxAnnotationVersionForAssetsWithPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  char *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  _BYTE v43[128];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_autoreleasePoolPush();
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "maxExpressionDescriptionForProperty:expressionName:", CFSTR("futureProofing2"), CFSTR("futureProofing2")));
    objc_msgSend(v31, "setExpressionResultType:", 700);
    v10 = objc_alloc_init((Class)NSFetchRequest);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v7));
    objc_msgSend(v10, "setEntity:");
    objc_msgSend(v10, "setResultType:", 2);
    objc_msgSend(v10, "setReturnsDistinctResults:", 1);
    objc_msgSend(v10, "setPredicate:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("annotationAssetID"), CFSTR("futureProofing2"), 0));
    objc_msgSend(v10, "setPropertiesToGroupBy:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("annotationAssetID"), CFSTR("futureProofing2"), 0));
    objc_msgSend(v10, "setPropertiesToFetch:", v12);

    v36 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v10, &v36));
    v14 = (char *)v36;
    if (v13)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v15 = v13;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      if (v16)
      {
        v17 = v16;
        v26 = v14;
        v27 = v13;
        v28 = v8;
        v29 = v6;
        v18 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKey:", CFSTR("annotationAssetID")));
            if (v21)
              objc_msgSend(v9, "setObject:forKey:", v20, v21);

          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
        }
        while (v17);
        v8 = v28;
        v6 = v29;
        v14 = v26;
        v13 = v27;
      }
    }
    else
    {
      v22 = BCIMLog();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v38 = "+[AEAnnotation maxAnnotationVersionForAssetsWithPredicate:inManagedObjectContext:]";
        v39 = 2080;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotation.m";
        v41 = 1024;
        v42 = 404;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v24 = BCIMLog();
      v15 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v14;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "@\"Failed to fetch annotations {%@}\", buf, 0xCu);
      }
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)maxModificationDateForAllAnnotationsInManagedObjectContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation maxModificationDateExpressionDescription](AEAnnotation, "maxModificationDateExpressionDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation dictionaryResultsForAssetsWithPredicate:properties:inManagedObjectContext:](AEAnnotation, "dictionaryResultsForAssetsWithPredicate:properties:inManagedObjectContext:", v5, v6, v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation maxModificationDateColumnName](AEAnnotation, "maxModificationDateColumnName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

  return v10;
}

+ (id)insertAnnotationWithAssetID:(id)a3 creatorIdentifier:(id)a4 annotationUuid:(id)a5 intoManagedObjectContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v10, "newByClass:", objc_opt_class(AEAnnotation));

  objc_msgSend(v13, "setAnnotationCreatorIdentifier:", v11);
  objc_msgSend(v13, "setAnnotationAssetID:", v12);

  if (v9)
  {
    objc_msgSend(v13, "setAnnotationUuid:", v9);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](NSString, "UUID"));
    objc_msgSend(v13, "setAnnotationUuid:", v14);

  }
  return v13;
}

- (AEAnnotationManagedObjectContext)managedObjectContext
{
  AEAnnotationManagedObjectContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEAnnotation;
  v2 = -[AEAnnotation managedObjectContext](&v4, "managedObjectContext");
  return (AEAnnotationManagedObjectContext *)(id)objc_claimAutoreleasedReturnValue(v2);
}

+ (id)optimizedSelectedTextForSerialization:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x1389)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", 0, 5000));

    v3 = (id)v4;
  }
  return v3;
}

+ (id)optimizedRepresentativeTextForSerialization:(id)a3 selectedText:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "length") > 0x1388 || objc_msgSend(v5, "isEqualToString:", v6))
  {

    v5 = 0;
  }

  return v5;
}

- (void)updateSystemModificationDate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[AEAnnotation setAnnotationModificationDate:](self, "setAnnotationModificationDate:", v3);

}

- (void)updateUserModificationDate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[AEAnnotation setUserModificationDate:](self, "setUserModificationDate:", v3);

}

- (void)updateSystemAndUserModificationDates
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[AEAnnotation setAnnotationModificationDate:](self, "setAnnotationModificationDate:", v3);
  -[AEAnnotation setUserModificationDate:](self, "setUserModificationDate:", v3);

}

- (void)updateSystemAndLocationModificationDates
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[AEAnnotation setAnnotationModificationDate:](self, "setAnnotationModificationDate:", v3);
  -[AEAnnotation setLocationModificationDate:](self, "setLocationModificationDate:", v3);

}

+ (id)globalAnnotationTypeValues
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v2));

  return v3;
}

+ (id)userAnnotationTypeValues
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, 0));

  return v4;
}

- (void)setAnnotationStyle:(int)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  const __CFString *v13;
  AEAnnotation *v14;
  id v15;
  id v16;

  if (a3 == 6)
    v4 = 0;
  else
    v4 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3 == 6));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationIsUnderline")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationStyle")));
  v8 = v7;
  if (v6 == v16)
  {
    if (v7 != v5 && (objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
    {
LABEL_11:
      v13 = CFSTR("annotationStyle");
      -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationStyle"));
      v14 = self;
      v15 = v5;
LABEL_16:
      -[AEAnnotation setPrimitiveValue:forKey:](v14, "setPrimitiveValue:forKey:", v15, v13);
LABEL_17:
      -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", v13);
      -[AEAnnotation updateSystemAndUserModificationDates](self, "updateSystemAndUserModificationDates");
    }
  }
  else
  {
    v9 = objc_msgSend(v6, "isEqual:");
    v10 = v9;
    if (v8 != v5)
    {
      v11 = objc_msgSend(v8, "isEqual:", v5);
      v12 = v11;
      if ((v10 & 1) != 0)
      {
        if ((v11 & 1) != 0)
          goto LABEL_18;
        goto LABEL_11;
      }
      -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationIsUnderline"));
      if ((v12 & 1) == 0)
      {
        v13 = CFSTR("annotationStyle");
        -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationStyle"));
        -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v16, CFSTR("annotationIsUnderline"));
        -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("annotationStyle"));
        -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("annotationIsUnderline"));
        goto LABEL_17;
      }
LABEL_15:
      v13 = CFSTR("annotationIsUnderline");
      v14 = self;
      v15 = v16;
      goto LABEL_16;
    }
    if ((v9 & 1) == 0)
    {
      -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationIsUnderline"));
      goto LABEL_15;
    }
  }
LABEL_18:

}

- (int)annotationStyle
{
  void *v4;
  int v5;

  if (-[AEAnnotation annotationIsUnderline](self, "annotationIsUnderline"))
    return 6;
  -[AEAnnotation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("annotationStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationStyle")));
  v5 = objc_msgSend(v4, "intValue");

  -[AEAnnotation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("annotationStyle"));
  return v5;
}

- (void)setAnnotationType:(int)a3
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationType")));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  if (v6 != v5 && (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationType"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("annotationType"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("annotationType"));
    -[AEAnnotation updateSystemAndUserModificationDates](self, "updateSystemAndUserModificationDates");
  }

}

- (int)annotationType
{
  void *v3;
  int v4;

  -[AEAnnotation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("annotationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationType")));
  v4 = objc_msgSend(v3, "intValue");

  -[AEAnnotation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("annotationType"));
  return v4;
}

- (void)setAnnotationCreationDate:(id)a3
{
  id v4;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationCreationDate"));
  -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("annotationCreationDate"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("annotationCreationDate"));
}

- (BOOL)annotationDeleted
{
  void *v3;
  unsigned __int8 v4;

  -[AEAnnotation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("annotationDeleted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationDeleted")));
  v4 = objc_msgSend(v3, "BOOLValue");

  -[AEAnnotation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("annotationDeleted"));
  return v4;
}

- (void)setAnnotationDeleted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationDeleted")));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  if (v6 != v5 && (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationDeleted"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("annotationDeleted"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("annotationDeleted"));
    -[AEAnnotation updateSystemAndUserModificationDates](self, "updateSystemAndUserModificationDates");
  }

}

- (BOOL)isAnnotationDeleted
{
  return -[AEAnnotation annotationDeleted](self, "annotationDeleted");
}

- (BOOL)annotationIsUnderline
{
  void *v3;
  unsigned __int8 v4;

  -[AEAnnotation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("annotationIsUnderline"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationIsUnderline")));
  v4 = objc_msgSend(v3, "BOOLValue");

  -[AEAnnotation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("annotationIsUnderline"));
  return v4;
}

- (void)setAnnotationIsUnderline:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationIsUnderline")));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  if (v6 != v5 && (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationIsUnderline"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("annotationIsUnderline"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("annotationIsUnderline"));
    -[AEAnnotation updateSystemAndUserModificationDates](self, "updateSystemAndUserModificationDates");
  }

}

- (void)setAnnotationLocation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationLocation")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationLocation"));
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    -[AEAnnotation setPrimitiveValue:forKey:](&v7, "setPrimitiveValue:forKey:", v4, CFSTR("annotationLocation"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("annotationLocation"));
    -[AEAnnotation updateSystemAndLocationModificationDates](self, "updateSystemAndLocationModificationDates");
  }

}

- (NSString)redactedAnnotationLocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationLocation](self, "annotationLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bc_redactedCFIString"));

  return (NSString *)v3;
}

- (BOOL)annotationHasNote
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationNote](self, "annotationNote"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3));
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (BOOL)annotationIsBookmark
{
  if (-[AEAnnotation annotationType](self, "annotationType") == 1)
    return !-[AEAnnotation annotationHasNote](self, "annotationHasNote");
  else
    return 0;
}

- (void)setAnnotationNote:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationNote")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[AEAnnotation updateSystemAndUserModificationDates](self, "updateSystemAndUserModificationDates");
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationNote"));
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    -[AEAnnotation setPrimitiveValue:forKey:](&v7, "setPrimitiveValue:forKey:", v4, CFSTR("annotationNote"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("annotationNote"));
  }

}

- (void)setAnnotationRepresentativeText:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationRepresentativeText")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationRepresentativeText"));
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    -[AEAnnotation setPrimitiveValue:forKey:](&v7, "setPrimitiveValue:forKey:", v4, CFSTR("annotationRepresentativeText"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("annotationRepresentativeText"));
    -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
  }

}

- (void)setAnnotationSelectedText:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("annotationSelectedText")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("annotationSelectedText"));
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    -[AEAnnotation setPrimitiveValue:forKey:](&v7, "setPrimitiveValue:forKey:", v4, CFSTR("annotationSelectedText"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("annotationSelectedText"));
    -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
  }

}

- (void)setPlLocationRangeStart:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("plLocationRangeStart")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("plLocationRangeStart"));
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    -[AEAnnotation setPrimitiveValue:forKey:](&v7, "setPrimitiveValue:forKey:", v4, CFSTR("plLocationRangeStart"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("plLocationRangeStart"));
    -[AEAnnotation updateSystemAndLocationModificationDates](self, "updateSystemAndLocationModificationDates");
  }

}

- (void)setPlLocationRangeEnd:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("plLocationRangeEnd")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("plLocationRangeEnd"));
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    -[AEAnnotation setPrimitiveValue:forKey:](&v7, "setPrimitiveValue:forKey:", v4, CFSTR("plLocationRangeEnd"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("plLocationRangeEnd"));
    -[AEAnnotation updateSystemAndLocationModificationDates](self, "updateSystemAndLocationModificationDates");
  }

}

- (void)setPlAbsolutePhysicalLocation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("plAbsolutePhysicalLocation")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("plAbsolutePhysicalLocation"));
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    -[AEAnnotation setPrimitiveValue:forKey:](&v7, "setPrimitiveValue:forKey:", v4, CFSTR("plAbsolutePhysicalLocation"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("plAbsolutePhysicalLocation"));
    -[AEAnnotation updateSystemAndLocationModificationDates](self, "updateSystemAndLocationModificationDates");
  }

}

- (void)setPlStorageUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("plStorageUUID")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("plStorageUUID"));
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    -[AEAnnotation setPrimitiveValue:forKey:](&v7, "setPrimitiveValue:forKey:", v4, CFSTR("plStorageUUID"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("plStorageUUID"));
    -[AEAnnotation updateSystemAndLocationModificationDates](self, "updateSystemAndLocationModificationDates");
  }

}

- (void)setPlUserData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("plUserData")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("plUserData"));
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    -[AEAnnotation setPrimitiveValue:forKey:](&v7, "setPrimitiveValue:forKey:", v4, CFSTR("plUserData"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("plUserData"));
    -[AEAnnotation updateSystemAndLocationModificationDates](self, "updateSystemAndLocationModificationDates");
  }

}

- (void)setPhysicalPageNumber:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing1")));
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing1"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("futureProofing1"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing1"));
    -[AEAnnotation updateSystemAndLocationModificationDates](self, "updateSystemAndLocationModificationDates");
  }

}

- (NSString)physicalPageNumber
{
  return (NSString *)-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing1"));
}

- (void)setAnnotationVersion:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing2")));
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing2"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("futureProofing2"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing2"));
    -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
  }

}

- (NSString)annotationVersion
{
  return (NSString *)-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing2"));
}

- (void)setAssetVersion:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing3")));
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing3"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("futureProofing3"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing3"));
    -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
  }

}

- (NSString)assetVersion
{
  return (NSString *)-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing3"));
}

- (void)setAttachments:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing4")));
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing4"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("futureProofing4"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing4"));
    -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
  }

}

- (NSString)attachments
{
  return (NSString *)-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing4"));
}

- (void)setChapterTitle:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing5")));
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing5"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("futureProofing5"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing5"));
    -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
  }

}

- (NSString)chapterTitle
{
  return (NSString *)-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing5"));
}

- (void)setUserModificationDate:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v4));
  }
  else
  {
    v5 = 0;
  }
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing6"));
  -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("futureProofing6"));
  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing6"));

}

- (NSDate)userModificationDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing6")));
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(v2, "doubleValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (_NSRange)annotationSelectedTextRange
{
  NSString *v2;
  NSString *v3;
  NSRange v4;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing7")));
  v3 = v2;
  if (v2)
  {
    v4 = NSRangeFromString(v2);
    location = v4.location;
    length = v4.length;
  }
  else
  {
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }

  v7 = location;
  v8 = length;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)setAnnotationSelectedTextRange:(_NSRange)a3
{
  NSString *v4;
  id v5;
  id v6;

  v4 = NSStringFromRange(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing7")));
  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing7"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("futureProofing7"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing7"));
    -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
  }

}

- (float)readingProgressHighWaterMark
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing8")));
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setReadingProgressHighWaterMark:(float)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bc_clampedToUnitIntervalOrNegativeOne"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing8")));
  v7 = v6;
  if (v6 != v5 && (objc_msgSend(v6, "isEqualToString:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing8"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("futureProofing8"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing8"));
  }

}

- (float)readingProgress
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing10")));
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setReadingProgress:(float)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bc_assertClampedToUnitInterval"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing10")));
  v7 = v6;
  if (v6 != v5 && (objc_msgSend(v6, "isEqualToString:", v5) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing10"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("futureProofing10"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing10"));
  }

}

- (BOOL)spineIndexUpdated
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing9")));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSpineIndexUpdated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing9")));
  v6 = v5;
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing9"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing9"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing9"));
  }

}

- (void)setLocationModificationDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v5, v9));
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing11")));
  v8 = v7;
  if (v7 != v6 && (objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
  {
    -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing6"));
    -[AEAnnotation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("futureProofing11"));
    -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing6"));
  }

}

- (NSDate)locationModificationDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing11")));
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(v2, "doubleValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)setAvoidSync
{
  objc_super v3;

  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing12"));
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v3, "setPrimitiveValue:forKey:", CFSTR("avoidSync"), CFSTR("futureProofing12"));
  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing12"));
}

- (void)clearAvoidSync
{
  objc_super v3;

  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing12"));
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v3, "setPrimitiveValue:forKey:", 0, CFSTR("futureProofing12"));
  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing12"));
}

- (BOOL)avoidSync
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing12")));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("avoidSync"));

  return v3;
}

- (void)setFutureProofing1:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing1"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing1"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing1"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing2:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing2"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing2"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing2"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing3:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing3"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing3"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing3"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing4:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing4"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing4"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing4"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing5:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing5"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing5"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing5"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing6:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing6"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing6"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing6"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing7:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing7"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing7"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing7"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing8:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing8"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing8"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing8"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing9:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing9"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing9"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing9"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing10:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing10"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing10"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing10"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing11:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing11"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing11"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing11"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (void)setFutureProofing12:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AEAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("futureProofing12"));
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  -[AEAnnotation setPrimitiveValue:forKey:](&v5, "setPrimitiveValue:forKey:", v4, CFSTR("futureProofing12"));

  -[AEAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("futureProofing12"));
  -[AEAnnotation updateSystemModificationDate](self, "updateSystemModificationDate");
}

- (BOOL)bumpAnnotationVersionToMinimumVersion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationVersion](self, "annotationVersion"));
  v6 = v5;
  if (v5 && (v5 == v4 || objc_msgSend(v5, "compare:options:", v4, 64) != (id)-1))
  {
    v7 = 0;
  }
  else
  {
    -[AEAnnotation setAnnotationVersion:](self, "setAnnotationVersion:", v4);
    v7 = 1;
  }

  return v7;
}

- (BOOL)updateReadingProgressAndBumpHighWaterMarkToProgress:(float)a3
{
  float v4;
  float v5;
  double v6;

  BCFloatAssertUnitIntervalClamp(a3);
  v5 = v4;
  -[AEAnnotation setReadingProgress:](self, "setReadingProgress:");
  if (-[AEAnnotation hasReadingProgressHighWaterMark](self, "hasReadingProgressHighWaterMark"))
  {
    -[AEAnnotation readingProgressHighWaterMark](self, "readingProgressHighWaterMark");
    if (v5 <= *(float *)&v6)
      return 0;
  }
  *(float *)&v6 = v5;
  -[AEAnnotation setReadingProgressHighWaterMark:](self, "setReadingProgressHighWaterMark:", v6);
  return 1;
}

- (BOOL)hasReadingProgressHighWaterMark
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation valueForKey:](self, "valueForKey:", CFSTR("futureProofing8")));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasReadingProgress
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation valueForKey:](self, "valueForKey:", CFSTR("futureProofing10")));
  v3 = v2 != 0;

  return v3;
}

+ (id)annotatedAttributedStringWithString:(id)a3 annotationStyle:(int)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  length = a5.length;
  location = a5.location;
  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v8);

  v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", v7);
  objc_msgSend(v9, "addAttribute:value:range:", CFSTR("kAEAnnotationStyleAttributeName"), v10, location, length);

  return v9;
}

- (id)annotatedAttributedString
{
  return +[AEAnnotation annotatedAttributedStringForAnnotation:withPossibleLength:](AEAnnotation, "annotatedAttributedStringForAnnotation:withPossibleLength:", self, -1);
}

+ (id)annotatedAttributedStringForAnnotation:(id)a3 withPossibleLength:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v29;
  char *v30;
  id v31;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationRepresentativeText", 0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flattenedAnnotationString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationSelectedText"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flattenedAnnotationString"));

  if ((unint64_t)objc_msgSend(v10, "length") >= a4
    || +[AEAnnotation isSelectedTextRepeatedInRepresentativeTextForAnnotation:](AEAnnotation, "isSelectedTextRepeatedInRepresentativeTextForAnnotation:", v6))
  {
    v11 = v10;
    v30 = 0;
    v31 = objc_msgSend(v11, "length");
    goto LABEL_17;
  }
  v12 = v8;
  v13 = (char *)objc_msgSend(v12, "rangeOfString:", v10);
  v30 = v13;
  v31 = v14;
  if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v10;
LABEL_15:
    v11 = v15;
    goto LABEL_16;
  }
  if (&v13[(_QWORD)v14] <= (char *)a4)
  {
    v15 = v12;
    goto LABEL_15;
  }
  if (!v12)
  {
    v16 = 0;
LABEL_24:
    v11 = v10;

    v29 = objc_msgSend(v11, "length");
    v30 = 0;
    v31 = v29;
    goto LABEL_16;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation clauseForSelectedTextForAnnotation:inSentence:possibleLength:highlightedRange:](AEAnnotation, "clauseForSelectedTextForAnnotation:inSentence:possibleLength:highlightedRange:", v6, v12, a4, &v30));
  if (!v16)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "wordsForSelectedTextForAnnotation:inSentence:possibleLength:highlightedRange:", v6, v12, a4, &v30));
    if (!v16)
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lettersForSelectedTextForAnnotation:inSentence:possibleLength:highlightedRange:", v6, v12, a4, &v30));
  }
  if (!v16 || v30 == (char *)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_24;
  v17 = IMCommonCoreBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("\\U2026"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v20 = (char *)objc_msgSend(v19, "length");
  v30 = &v20[(_QWORD)v30];
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", v16));

LABEL_16:
LABEL_17:
  if (!objc_msgSend(v11, "length", v30))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationRepresentativeText"));

    v26 = objc_msgSend(v25, "length");
    v30 = 0;
    v31 = v26;
    v11 = v25;
    if (v25)
      goto LABEL_19;
LABEL_21:
    v21 = 0;
    v24 = 0;
    goto LABEL_22;
  }
  if (!v11)
    goto LABEL_21;
LABEL_19:
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), CFSTR("\n"), v30));

  v22 = (void *)objc_opt_class(a1);
  v23 = objc_msgSend(v6, "annotationStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "annotatedAttributedStringWithString:annotationStyle:range:", v21, v23, v30, v31));
LABEL_22:
  v27 = v24;

  return v27;
}

+ (id)annotatedAttributedStringForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationSelectedText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flattenedAnnotationString"));

  v7 = objc_msgSend(v6, "length");
  if (!objc_msgSend(v6, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationRepresentativeText"));

    v7 = objc_msgSend(v11, "length");
    v6 = v11;
    if (v11)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), CFSTR("\n")));

  v9 = objc_msgSend((id)objc_opt_class(a1), "annotatedAttributedStringWithString:annotationStyle:range:", v8, objc_msgSend(v4, "annotationStyle"), 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_6:

  return v10;
}

+ (BOOL)isSelectedTextRepeatedInRepresentativeTextForAnnotation:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  CFArrayRef Results;
  char v11;
  CFRange v13;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationRepresentativeText"));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationSelectedText")),
        v6,
        v5,
        v6))
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationRepresentativeText"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationSelectedText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationRepresentativeText"));
    v13.length = (CFIndex)objc_msgSend(v9, "length");
    v13.location = 0;
    Results = CFStringCreateArrayWithFindResults(0, v7, v8, v13, 0);

    v11 = (unint64_t)-[__CFArray count](Results, "count") > 1;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (id)clauseForSelectedTextForAnnotation:(id)a3 inSentence:(id)a4 possibleLength:(unint64_t)a5 highlightedRange:(_NSRange *)a6
{
  id v9;
  id v10;
  NSUInteger location;
  NSUInteger length;
  void *v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSUInteger v23;

  v9 = a3;
  v10 = a4;
  location = a6->location;
  length = a6->length;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](NSCharacterSet, "punctuationCharacterSet"));
  v14 = 0;
  v15 = length + location;
  v16 = v15;
  while ((unint64_t)v14 < v15)
  {
    v17 = (char *)objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v13, 0, v14, v16);
    v14 = &v17[v18];
    v16 = v15 - (_QWORD)&v17[v18];
    if (v16 <= a5)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v14, (_BYTE *)objc_msgSend(v10, "length") - v14));
      goto LABEL_6;
    }
  }
  v19 = 0;
LABEL_6:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "annotationSelectedText"));
    a6->location = (NSUInteger)objc_msgSend(v21, "rangeOfString:", v22);
    a6->length = v23;

  }
  return v21;
}

+ (id)wordsForSelectedTextForAnnotation:(id)a3 inSentence:(id)a4 possibleLength:(unint64_t)a5 highlightedRange:(_NSRange *)a6
{
  id v9;
  id v10;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSUInteger v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  NSUInteger v24;
  NSUInteger v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v9 = a3;
  v10 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_C0C38;
  v31 = sub_C0C48;
  v32 = 0;
  location = a6->location;
  length = a6->length;
  v13 = length + a6->location;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_C0C50;
  v21[3] = &unk_290830;
  v25 = length;
  v26 = a5;
  v23 = &v27;
  v24 = location;
  v14 = v10;
  v22 = v14;
  objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 3, v21);
  v15 = (void *)v28[5];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "annotationSelectedText"));
    a6->location = (NSUInteger)objc_msgSend(v17, "rangeOfString:", v18);
    a6->length = v19;

  }
  _Block_object_dispose(&v27, 8);

  return v17;
}

+ (id)lettersForSelectedTextForAnnotation:(id)a3 inSentence:(id)a4 possibleLength:(unint64_t)a5 highlightedRange:(_NSRange *)a6
{
  id v9;
  id v10;
  NSUInteger v11;
  NSUInteger v12;
  char *v13;
  BOOL v14;
  NSUInteger v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSUInteger v21;

  v9 = a3;
  v10 = a4;
  v11 = a6->length + a6->location;
  v12 = v11 - a5;
  v13 = (char *)objc_msgSend(v10, "length");
  v14 = v11 >= a5;
  v15 = v11 - a5;
  if (v15 != 0 && v14 && (v16 = v13, v13 <= objc_msgSend(v10, "length")))
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v15, &v16[-v12]));
  else
    v17 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "annotationSelectedText"));
    a6->location = (NSUInteger)objc_msgSend(v19, "rangeOfString:", v20);
    a6->length = v21;

  }
  return v19;
}

+ (id)contextAwareSelectedTextFromAnnotation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationRepresentativeText"));
  if ((objc_opt_respondsToSelector(v3, "annotationSelectedTextRange") & 1) != 0)
  {
    v5 = (uint64_t)objc_msgSend(v3, "annotationSelectedTextRange");
    v7 = v6;
  }
  else
  {
    v7 = 0;
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(v4, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationSelectedText"));
    if (objc_msgSend(v4, "length")
      && (objc_msgSend(v9, "isEqualToString:", v4) & 1) == 0
      && objc_msgSend(v4, "ae_occurrenceCountOfString:", v9) == (char *)&dword_0 + 1)
    {
      v5 = (uint64_t)objc_msgSend(v4, "rangeOfString:", v9);
      v7 = v10;
      v8 = 0;
    }
    else
    {
      v8 = v9;
    }

  }
  else
  {
    v8 = 0;
  }
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && !v8)
  {
    v11 = IMCommonCoreBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("\\U2026"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = sub_C0C38;
    v28 = sub_C0C48;
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", v5, v7));
    v29 = v14;
    v15 = objc_msgSend(v14, "length");
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_C1044;
    v18[3] = &unk_290880;
    v22 = v5;
    v23 = v7;
    v19 = v4;
    v16 = v13;
    v20 = v16;
    v21 = &v24;
    objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 4, v18);
    v8 = (id)v25[5];

    _Block_object_dispose(&v24, 8);
  }

  return v8;
}

- (BOOL)validateForInsert:(id *)a3
{
  unsigned __int8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AEAnnotation;
  v5 = -[AEAnnotation validateForInsert:](&v7, "validateForInsert:");
  return v5 & -[AEAnnotation validateConsistency:](self, "validateConsistency:", a3);
}

- (BOOL)validateForUpdate:(id *)a3
{
  unsigned __int8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AEAnnotation;
  v5 = -[AEAnnotation validateForUpdate:](&v7, "validateForUpdate:");
  return v5 & -[AEAnnotation validateConsistency:](self, "validateConsistency:", a3);
}

- (BOOL)validateConsistency:(id *)a3
{
  void *v5;
  void *v6;
  BOOL result;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationLocation](self, "annotationLocation"));
  if (objc_msgSend(v5, "length"))
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plUserData](self, "plUserData"));
  if (objc_msgSend(v6, "length"))
  {

LABEL_4:
    return 1;
  }
  v8 = -[AEAnnotation isAnnotationDeleted](self, "isAnnotationDeleted");

  if ((v8 & 1) != 0)
    return 1;
  v9 = BCIMLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1B6CB4(self, v10);

  if (!a3)
    return 0;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AEAnnotationErrorDomain"), 1000, 0));
  result = 0;
  *a3 = v11;
  return result;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationAssetID](self, "annotationAssetID"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationCreationDate](self, "annotationCreationDate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationCreatorIdentifier](self, "annotationCreatorIdentifier"));
  v26 = -[AEAnnotation isAnnotationDeleted](self, "isAnnotationDeleted");
  v25 = -[AEAnnotation annotationIsUnderline](self, "annotationIsUnderline");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationLocation](self, "annotationLocation"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationNote](self, "annotationNote"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationRepresentativeText](self, "annotationRepresentativeText"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationSelectedText](self, "annotationSelectedText"));
  v22 = -[AEAnnotation annotationStyle](self, "annotationStyle");
  v21 = -[AEAnnotation annotationType](self, "annotationType");
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationUuid](self, "annotationUuid"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation physicalPageNumber](self, "physicalPageNumber"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationVersion](self, "annotationVersion"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation assetVersion](self, "assetVersion"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation attachments](self, "attachments"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation chapterTitle](self, "chapterTitle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation userModificationDate](self, "userModificationDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("futureProofing7")));
  -[AEAnnotation readingProgressHighWaterMark](self, "readingProgressHighWaterMark");
  v7 = v6;
  v15 = -[AEAnnotation spineIndexUpdated](self, "spineIndexUpdated");
  -[AEAnnotation readingProgress](self, "readingProgress");
  v9 = v8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation locationModificationDate](self, "locationModificationDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plAbsolutePhysicalLocation](self, "plAbsolutePhysicalLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plLocationRangeEnd](self, "plLocationRangeEnd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plLocationRangeStart](self, "plLocationRangeStart"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plStorageUUID](self, "plStorageUUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plUserData](self, "plUserData"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p\n    assetID = %@;\n    creationDate = %@;\n    creatorIdentifier = %@;\n    deleted = %d;\n    isUnderline = %d;\n    cfiLocation = %@;\n    modificationDate = %@;\n    note = %@;\n    representativeText = %@;\n    selectedText = %@;\n    style = %d;\n    type = %d;\n    uuid = %@;\n    physicalPageNumber = %@;\n    annotationVersion = %@;\n    assetVersion = %@;\n    attachments = %@;\n    chapterTitle = %@;\n    userModificationDate = %@;\n    annotationModificationDate = %@;\n    selectedTextRange = %@;\n    readingProgressHighWaterMark = %f;\n    spineIndexUpdated = %d;\n    readingProgress = %f;\n    locationModificationDate = %@;\n    plAbsolutePhysicalLocation = %@;\n    plLocationRangeEnd = %@;\n    plLocationRangeStart = %@;\n    plStorageUUID = %@;\n    plUserData = %@;\n>"),
                    v28,
                    self,
                    v37,
                    v39,
                    v27,
                    v26,
                    v25,
                    v38,
                    v36,
                    v24,
                    v35,
                    v23,
                    v22,
                    v21,
                    v34,
                    v33,
                    v20,
                    v32,
                    v31,
                    v30,
                    v19,
                    v18,
                    v5,
                    *(_QWORD *)&v7,
                    v15,
                    *(_QWORD *)&v9,
                    v17,
                    v16,
                    v10,
                    v11,
                    v12,
                    v13));

  return (NSString *)v29;
}

- (NSNumber)annotationStyleNumber
{
  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[AEAnnotation annotationStyle](self, "annotationStyle"));
}

- (NSNumber)annotationTypeNumber
{
  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[AEAnnotation annotationType](self, "annotationType"));
}

+ (BOOL)mergeAnnotation:(id)a3 withServerAnnotation:(id)a4 moc:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  unint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  int v40;
  void *v41;
  __int16 v42;
  _BYTE v43[10];
  void *v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend((id)objc_opt_class(a1), "lastModificationFromDictionaryRepresentation:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "unsignedLongLongValue");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotationModificationDate"));
  objc_msgSend(v14, "timeIntervalSince1970");
  v16 = (unint64_t)v15;

  v17 = objc_msgSend((id)objc_opt_class(a1), "annotationAssetIDFromDictionaryRepresentation:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if ((unint64_t)v13 < v16)
  {
    v19 = BKMobileCloudSyncAnnotationsLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v40 = 138413058;
      v41 = v18;
      v42 = 1024;
      *(_DWORD *)v43 = v16;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = (_DWORD)v13;
      LOWORD(v44) = 1024;
      *(_DWORD *)((char *)&v44 + 2) = v16 - (_DWORD)v13;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Client: %d; Server: %d; (%d) client > server, not merging",
        (uint8_t *)&v40,
        0x1Eu);
    }

    goto LABEL_23;
  }
  v21 = BKMobileCloudSyncAnnotationsLog();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (v13 == (id)v16)
  {
    if (v23)
    {
      v40 = 138413058;
      v41 = v18;
      v42 = 1024;
      *(_DWORD *)v43 = (_DWORD)v13;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = (_DWORD)v13;
      LOWORD(v44) = 1024;
      *(_DWORD *)((char *)&v44 + 2) = 0;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Client: %d; Server: %d; (%d) client == server, not merging",
        (uint8_t *)&v40,
        0x1Eu);
    }

    goto LABEL_23;
  }
  if (v23)
  {
    v40 = 138413058;
    v41 = v18;
    v42 = 1024;
    *(_DWORD *)v43 = v16;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = (_DWORD)v13;
    LOWORD(v44) = 1024;
    *(_DWORD *)((char *)&v44 + 2) = v16 - (_DWORD)v13;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Client: %d; Server: %d; (%d) ... MERGING ANNOTATION",
      (uint8_t *)&v40,
      0x1Eu);
  }

  if (!v8)
  {
    v27 = objc_msgSend((id)objc_opt_class(a1), "annotationCreatorIdentifierFromDictionaryRepresentation:", v9);
    v25 = objc_claimAutoreleasedReturnValue(v27);
    v28 = objc_msgSend((id)objc_opt_class(a1), "annotationAssetIDFromDictionaryRepresentation:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v8 = (id)objc_claimAutoreleasedReturnValue(+[AEAnnotation insertAnnotationWithAssetID:creatorIdentifier:annotationUuid:intoManagedObjectContext:](AEAnnotation, "insertAnnotationWithAssetID:creatorIdentifier:annotationUuid:intoManagedObjectContext:", v26, v25, 0, v10));
    v29 = BKMobileCloudSyncAnnotationsLog();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotationUuid"));
      v40 = 138412546;
      v41 = v26;
      v42 = 2112;
      *(_QWORD *)v43 = v31;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Creating new Annotation: %@", (uint8_t *)&v40, 0x16u);

    }
    goto LABEL_17;
  }
  v24 = BKMobileCloudSyncAnnotationsLog();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotationUuid"));
    v40 = 138412546;
    v41 = v18;
    v42 = 2112;
    *(_QWORD *)v43 = v26;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Updating existing Annotation: %@", (uint8_t *)&v40, 0x16u);
LABEL_17:

  }
  v32 = BKMobileCloudSyncAnnotationsLog();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "redactedAnnotationLocation"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "plUserData"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "description"));
    v40 = 138412802;
    v41 = v18;
    v42 = 2114;
    *(_QWORD *)v43 = v34;
    *(_WORD *)&v43[8] = 2114;
    v44 = v36;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ annotation.annotationLocation=%{public}@ annotation.plUserData=%{public}@", (uint8_t *)&v40, 0x20u);

  }
  v37 = BKMobileCloudSyncAnnotationsLog();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v40 = 138412546;
    v41 = v18;
    v42 = 2114;
    *(_QWORD *)v43 = v9;
    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ dictionary=%{public}@", (uint8_t *)&v40, 0x16u);
  }

  objc_msgSend(v8, "deserializeFromDictionary:trustedSource:", v9, 0);
LABEL_23:

  return (unint64_t)v13 < v16;
}

+ (BOOL)mergeServerAnnotations:(id)a3 forAssetID:(id)a4 intoMoc:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  id v21;
  int v22;
  uint64_t v23;
  id v24;
  void *j;
  void *v26;
  unsigned int v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v37;
  id v39;
  id v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v7 = a3;
  v8 = a4;
  v42 = a5;
  v9 = BKMobileCloudSyncAnnotationsLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v39 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count")));
    *(_DWORD *)buf = 138412546;
    v52 = v39;
    v53 = 2112;
    v54 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Merging {%@} serverAnnotations", buf, 0x16u);

    v8 = v39;
  }

  v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[AEAnnotation annotationsForAssetID:includingDeleted:inManagedObjectContext:](AEAnnotation, "annotationsForAssetID:includingDeleted:inManagedObjectContext:", v8, 1, v42));
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "annotationUuid"));
        objc_msgSend(v12, "setObject:forKey:", v17, v18);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    }
    while (v14);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v40 = v7;
  v19 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v19)
  {
    v21 = v19;
    v22 = 0;
    v23 = *(_QWORD *)v44;
    *(_QWORD *)&v20 = 138412802;
    v37 = v20;
    v24 = a1;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v40);
        v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
        if (+[AEAnnotation isValidForDeserialization:](AEAnnotation, "isValidForDeserialization:", v26, v37))
        {
          v27 = objc_msgSend((id)objc_opt_class(v24), "annotationTypeFromDictionaryRepresentation:", v26);
          v28 = (void *)objc_opt_class(v24);
          if (v27 == 3)
          {
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "globalAnnotationForAssetID:inManagedObjectContext:", v8, v42));
            v30 = BKMobileCloudSyncAnnotationsLog();
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v32 = objc_msgSend((id)objc_opt_class(v24), "annotationUuidFromDictionaryRepresentation:", v26);
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject annotationUuid](v29, "annotationUuid"));
              *(_DWORD *)buf = v37;
              v52 = v39;
              v53 = 2112;
              v54 = v33;
              v55 = 2112;
              v56 = v34;
              _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Found Global Annotation -- Server: %@\nLocal: %@", buf, 0x20u);

              v8 = v39;
              v24 = a1;
            }
          }
          else
          {
            v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "annotationUuidFromDictionaryRepresentation:", v26));
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v31));
          }

          v22 |= +[AEAnnotation mergeAnnotation:withServerAnnotation:moc:](AEAnnotation, "mergeAnnotation:withServerAnnotation:moc:", v29, v26, v42);
        }
        else
        {
          v35 = BKMobileCloudSyncAnnotationsLog();
          v29 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v52 = v8;
            v53 = 2112;
            v54 = v26;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Annotation not valid for deserialization: %@", buf, 0x16u);
          }
        }

      }
      v21 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    }
    while (v21);
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22 & 1;
}

- (BOOL)usesLegacySerializationMethod
{
  void *v3;
  unsigned __int8 v4;

  if ((objc_opt_respondsToSelector(self, "doesSerializeAs_iBooks") & 1) == 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation performSelector:](self, "performSelector:", "doesSerializeAs_iBooks"));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)aeAnnotationDictionaryRepresentation
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *k;
  uint64_t v25;
  void *v26;
  void *v27;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[AEAnnotation requiredKeysForDictionaryRepresentation](AEAnnotation, "requiredKeysForDictionaryRepresentation"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation valueForKey:](self, "valueForKey:", v8));
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

          if (v9 != v10)
            objc_msgSend(v3, "setObject:forKey:", v9, v8);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v5);
  }
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[AEAnnotation dateKeysForDictionaryRepresentation](AEAnnotation, "dateKeysForDictionaryRepresentation"));
  v11 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v29);
        v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation valueForKey:](self, "valueForKey:", v15));
        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

          if (v16 != v17)
          {
            objc_msgSend(v16, "timeIntervalSince1970");
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)v18));
            objc_msgSend(v3, "setObject:forKey:", v19, v15);

          }
        }

      }
      v12 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v12);
  }
  if (!-[AEAnnotation isAnnotationDeleted](self, "isAnnotationDeleted"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation optionalKeysForDictionaryRepresentation](AEAnnotation, "optionalKeysForDictionaryRepresentation"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)k);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation valueForKey:](self, "valueForKey:", v25));
          if (v26)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

            if (v26 != v27)
              objc_msgSend(v3, "setObject:forKey:", v26, v25);
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v22);
    }

  }
  return v3;
}

+ (id)dictionaryRepresentationsForAnnotations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "isValidForSerialization", (_QWORD)v13))
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dictionaryRepresentation"));
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  return v4;
}

+ (id)_dictionaryRepresentationForAnnotationsMatchingPredicate:(id)a3 map:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  void *v27;
  id v28;

  v28 = a5;
  v8 = a4;
  v26 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dateKeysForDictionaryRepresentation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "requiredKeysForDictionaryRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "optionalKeysForDictionaryRepresentation"));
  v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v9, "count")+ (_QWORD)objc_msgSend(v10, "count")+ (unint64_t)objc_msgSend(v11, "count"));
  objc_msgSend(v12, "addObjectsFromArray:", v9);
  objc_msgSend(v12, "addObjectsFromArray:", v10);
  v27 = v11;
  objc_msgSend(v12, "addObjectsFromArray:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForAllAnnotationsIncludingDeleted:](AEAnnotation, "predicateForAllAnnotationsIncludingDeleted:", 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v13, v26, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dictionaryResultsForAnnotationsWithPredicate:properties:propertyNamesMap:inManagedObjectContext:", v15, v12, v8, v28));
  v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v9, "count") + (_QWORD)objc_msgSend(v10, "count"));
  objc_msgSend(v17, "addObjectsFromArray:", v9);
  objc_msgSend(v17, "addObjectsFromArray:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -(double)+[IMUserDataCull maxDeletedAge](IMUserDataCull, "maxDeletedAge")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == YES && %K > %@"), CFSTR("annotationDeleted"), CFSTR("annotationModificationDate"), v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, v26, 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dictionaryResultsForAnnotationsWithPredicate:properties:propertyNamesMap:inManagedObjectContext:", v21, v17, v8, v28));
  v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v16, "count") + (_QWORD)objc_msgSend(v22, "count"));
  v24 = v23;
  if (v16)
    objc_msgSend(v23, "addObjectsFromArray:", v16);
  if (v22)
    objc_msgSend(v24, "addObjectsFromArray:", v22);

  return v24;
}

+ (id)modernDictionaryRepresentationForAnnotationsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  return objc_msgSend(a1, "_dictionaryRepresentationForAnnotationsMatchingPredicate:map:inManagedObjectContext:", a3, 0, a4);
}

+ (id)compatibleDictionaryRepresentationForAnnotationsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;

  v38 = a4;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setObject:forKey:", CFSTR("bookDatabaseKey"), CFSTR("annotationAssetID"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("date"), CFSTR("annotationCreationDate"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("lastModification"), CFSTR("annotationModificationDate"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("deletedFlag"), CFSTR("annotationDeleted"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("highlightColor"), CFSTR("annotationStyle"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("ordinal"), CFSTR("plLocationRangeStart"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("serverSyncUniqueId"), CFSTR("annotationUuid"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("text"), CFSTR("annotationSelectedText"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("textualContext"), CFSTR("annotationRepresentativeText"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("annotation"), CFSTR("annotationNote"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("locationBPlist"), CFSTR("plUserData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("annotationCreatorIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("plAbsolutePhysicalLocation"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("plLocationRangeEnd"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("futureProofing1"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("futureProofing2"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("futureProofing3"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("futureProofing4"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("futureProofing5"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("futureProofing6"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("futureProofing7"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("futureProofing8"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("futureProofing9"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("futureProofing10"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("futureProofing11"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("futureProofing12"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForKeyPath:](NSExpression, "expressionForKeyPath:", CFSTR("annotationType")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v24, 0));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("add:to:"), v25));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, v24, 0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("modulus:by:"), v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v28, v22, 0));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("add:to:"), v29));

  v31 = objc_alloc_init((Class)NSExpressionDescription);
  objc_msgSend(v31, "setName:", CFSTR("type"));
  objc_msgSend(v31, "setExpression:", v30);
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("annotationType"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == nil || %K == %@ || %K == %@) && (%K <= %@ || %K == nil)"), CFSTR("annotationCreatorIdentifier"), CFSTR("annotationCreatorIdentifier"), CFSTR("com~apple~iBooks"), CFSTR("annotationCreatorIdentifier"), CFSTR("com.apple.iBooks"), CFSTR("futureProofing2"), CFSTR("2"), CFSTR("futureProofing2")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K != nil && %K != %@ && %K != %@) || %K > %@"), CFSTR("annotationCreatorIdentifier"), CFSTR("annotationCreatorIdentifier"), CFSTR("com~apple~iBooks"), CFSTR("annotationCreatorIdentifier"), CFSTR("com.apple.iBook"), CFSTR("futureProofing2"), CFSTR("2")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dictionaryRepresentationForAnnotationsMatchingPredicate:map:inManagedObjectContext:", v32, v4, v38));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dictionaryRepresentationForAnnotationsMatchingPredicate:map:inManagedObjectContext:", v33, 0, v38));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)objc_msgSend(v34, "count") + (_QWORD)objc_msgSend(v35, "count")));
  objc_msgSend(v36, "addObjectsFromArray:", v34);
  objc_msgSend(v36, "addObjectsFromArray:", v35);

  return v36;
}

+ (id)aeAnnotationDictionaryRepresentationsForAnnotations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "isValidForSerialization", (_QWORD)v13))
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aeAnnotationDictionaryRepresentation"));
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  return v4;
}

+ (id)dictionaryResultsForAnnotationsWithPredicate:(id)a3 properties:(id)a4 propertyNamesMap:(id)a5 inManagedObjectContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char isKindOfClass;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id obj;
  id obja;
  void *v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    v60 = v13;
    v61 = v10;
    v59 = v11;
    v15 = objc_msgSend(v11, "mutableCopy");
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dateKeysForDictionaryRepresentation"));
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    v66 = v15;
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v75;
      do
      {
        v19 = 0;
        v62 = v17;
        do
        {
          if (*(_QWORD *)v75 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)v19);
          v21 = objc_msgSend(v15, "indexOfObject:", v20);
          if (v21 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v22 = v21;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForKeyPath:](NSExpression, "expressionForKeyPath:", v20));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 978307200.0));
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", v24));

            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, v25, 0));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("add:to:"), v26));

            v28 = v20;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v28));
            v30 = objc_opt_class(NSString);
            v31 = v12;
            isKindOfClass = objc_opt_isKindOfClass(v29, v30);

            if ((isKindOfClass & 1) != 0)
            {
              v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", v28));

              v28 = (id)v33;
            }
            v12 = v31;
            v34 = objc_alloc_init((Class)NSExpressionDescription);
            objc_msgSend(v34, "setName:", v28);
            objc_msgSend(v34, "setExpression:", v27);
            objc_msgSend(v34, "setExpressionResultType:", 300);
            v15 = v66;
            objc_msgSend(v66, "replaceObjectAtIndex:withObject:", v22, v34);

            v17 = v62;
          }
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      }
      while (v17);
    }

    v10 = v61;
    if (objc_msgSend(v12, "count"))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v60));
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_14E504;
      v72[3] = &unk_2926B0;
      v58 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "propertiesByName"));
      v73 = v58;
      v35 = objc_retainBlock(v72);
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      obja = v12;
      v36 = v12;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v38; i = (char *)i + 1)
          {
            if (*(_QWORD *)v69 != v39)
              objc_enumerationMutation(v36);
            v41 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
            v42 = objc_msgSend(v15, "indexOfObject:", v41);
            if (v42 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v43 = v42;
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", v41));
              v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
              v46 = objc_msgSend(v44, "isEqual:", v45);

              if (v46)
              {
                objc_msgSend(v66, "removeObjectAtIndex:", v43);
              }
              else
              {
                v47 = objc_opt_class(NSString);
                if ((objc_opt_isKindOfClass(v44, v47) & 1) != 0)
                {
                  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForKeyPath:](NSExpression, "expressionForKeyPath:", v41));
                  v49 = objc_alloc_init((Class)NSExpressionDescription);
                  objc_msgSend(v49, "setName:", v44);
                  objc_msgSend(v49, "setExpression:", v48);
                  objc_msgSend(v49, "setExpressionResultType:", ((uint64_t (*)(_QWORD *, uint64_t))v35[2])(v35, v41));
                  objc_msgSend(v66, "replaceObjectAtIndex:withObject:", v43, v49);

                }
                else
                {
                  v50 = objc_opt_class(NSExpressionDescription);
                  if ((objc_opt_isKindOfClass(v44, v50) & 1) != 0)
                  {
                    v51 = v44;
                    if (!objc_msgSend(v51, "expressionResultType"))
                      objc_msgSend(v51, "setExpressionResultType:", ((uint64_t (*)(_QWORD *, uint64_t))v35[2])(v35, v41));
                    objc_msgSend(v66, "replaceObjectAtIndex:withObject:", v43, v51);

                  }
                  else
                  {
                    objc_msgSend(v66, "replaceObjectAtIndex:withObject:", v43, v44);
                  }
                }
              }

              v15 = v66;
            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        }
        while (v38);
      }

      v12 = obja;
      v10 = v61;
    }
    v52 = objc_autoreleasePoolPush();
    v53 = objc_alloc_init((Class)NSFetchRequest);
    v54 = v15;
    v14 = v60;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v60));
    objc_msgSend(v53, "setEntity:", v55);
    objc_msgSend(v53, "setResultType:", 2);
    objc_msgSend(v53, "setPropertiesToFetch:", v54);
    objc_msgSend(v53, "setPredicate:", v10);
    v67 = 0;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "executeFetchRequest:error:", v53, &v67));

    objc_autoreleasePoolPop(v52);
    v11 = v59;
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (BOOL)isValidForSerialization
{
  void *v3;
  double v4;
  unint64_t v5;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  unint64_t v18;

  if (!-[AEAnnotation isAnnotationDeleted](self, "isAnnotationDeleted"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = (unint64_t)v4;

  if (+[IMUserDataCull isTimestampNewerThanMaxDeletedAge:](IMUserDataCull, "isTimestampNewerThanMaxDeletedAge:", v5))
  {
    return 1;
  }
  v7 = BCIMLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationAssetID](self, "annotationAssetID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationUuid](self, "annotationUuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v11, "timeIntervalSince1970");
    v13 = 138412802;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2048;
    v18 = (unint64_t)((v12 - (double)v5) / 86400.0);
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "MZBookKeeper isValidForSerialization assetID=%@ [%@] [Deleted %llu days ago]", (uint8_t *)&v13, 0x20u);

  }
  return 0;
}

- (void)deserializeFromDictionary:(id)a3 trustedSource:(BOOL)a4
{
  id v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  const char *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  BOOL v17;
  id v18;

  v18 = a3;
  v17 = a4;
  v7 = objc_msgSend((id)objc_opt_class(self), "annotationCreatorIdentifierFromDictionaryRepresentation:", v18);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("bookDatabaseKey")));
  if (!objc_msgSend((id)objc_opt_class(self), "isBKBookmarkCreatorIdentifier:", v8)
    || !objc_msgSend(v9, "length"))
  {
    v10 = v8;
LABEL_8:
    v11 = "aeAnnotationDeserializeFromDictionary:trustedSource:";
    goto LABEL_9;
  }
  v10 = CFSTR("com~apple~iBooks");

  v11 = "iBooks_deserializeFromDictionary:trustedSource:";
  if (!"iBooks_deserializeFromDictionary:trustedSource:")
    goto LABEL_8;
  v12 = objc_opt_respondsToSelector(self, "iBooks_deserializeFromDictionary:trustedSource:");
  if ("iBooks_deserializeFromDictionary:trustedSource:" == a2 || (v12 & 1) == 0)
    goto LABEL_8;
LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation methodSignatureForSelector:](self, "methodSignatureForSelector:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v13));
  objc_msgSend(v14, "setSelector:", v11);
  objc_msgSend(v14, "setArgument:atIndex:", &v18, 2);
  objc_msgSend(v14, "setArgument:atIndex:", &v17, 3);
  objc_msgSend(v14, "invokeWithTarget:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationCreatorIdentifier](self, "annotationCreatorIdentifier"));
  v16 = objc_msgSend(v15, "isEqualToString:", v10);

  if ((v16 & 1) == 0)
    -[AEAnnotation setAnnotationCreatorIdentifier:](self, "setAnnotationCreatorIdentifier:", v10);

}

- (void)aeAnnotationDeserializeFromDictionary:(id)a3 trustedSource:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  AEAnnotation *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *k;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];

  v5 = a3;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation valueForKey:](self, "valueForKey:"));

  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[AEAnnotation requiredKeysForDictionaryRepresentation](AEAnnotation, "requiredKeysForDictionaryRepresentation"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", v10));
        if (!v11
          || (v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
              v12,
              v11 == v12))
        {
          v13 = self;
          v14 = 0;
        }
        else
        {
          v13 = self;
          v14 = v11;
        }
        -[AEAnnotation setValue:forKey:](v13, "setValue:forKey:", v14, v10);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v7);
  }
  if (!-[AEAnnotation isAnnotationDeleted](self, "isAnnotationDeleted"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation optionalKeysForDictionaryRepresentation](AEAnnotation, "optionalKeysForDictionaryRepresentation"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", v20));
          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

            if (v21 != v22)
              -[AEAnnotation setValue:forKey:](self, "setValue:forKey:", v21, v20);
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v17);
    }

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation dateKeysForDictionaryRepresentation](AEAnnotation, "dateKeysForDictionaryRepresentation"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)k);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", v28));
        if (v29)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

          if (v29 != v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v29, "unsignedLongLongValue")));
            -[AEAnnotation setValue:forKey:](self, "setValue:forKey:", v31, v28);

          }
        }

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v25);
  }
  if (!v38)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));
    -[AEAnnotation setUserModificationDate:](self, "setUserModificationDate:", v33);
    goto LABEL_44;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("futureProofing6")));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("futureProofing6")));
    if (objc_msgSend(v33, "length"))
    {
      objc_msgSend(v33, "doubleValue");
      v34 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
LABEL_41:
      v36 = (void *)v34;
      if (v34)
        -[AEAnnotation setUserModificationDate:](self, "setUserModificationDate:", v34);

    }
LABEL_44:

    goto LABEL_45;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("annotationModificationDate")));

  if (v35)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("annotationModificationDate")));
    v34 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v33, "unsignedLongLongValue")));
    goto LABEL_41;
  }
LABEL_45:
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));
  -[AEAnnotation setLocationModificationDate:](self, "setLocationModificationDate:", v37);

}

+ (BOOL)isValidForDeserialization:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v30;
  id v31;
  unsigned __int8 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  unint64_t v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deletedFlagFromDictionaryRepresentation:", v4));
  if (!objc_msgSend(v5, "BOOLValue"))
  {
    v17 = objc_opt_class(NSData);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationBPlist")));
    v19 = BUDynamicCast(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (!objc_msgSend(v20, "length"))
    {
      v21 = objc_opt_class(NSData);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plUserData")));
      v23 = BUDynamicCast(v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (!objc_msgSend(v24, "length"))
      {
        v25 = objc_opt_class(NSString);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotationLocation")));
        v27 = BUDynamicCast(v25, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        if (!objc_msgSend(v28, "length"))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deletedFlagFromDictionaryRepresentation:", v4));
          v32 = objc_msgSend(v30, "BOOLValue");

          if ((v32 & 1) == 0)
          {
            v31 = BCIMLog();
            v9 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              sub_1B972C((uint64_t)a1, (uint64_t)v4, v9);
            goto LABEL_5;
          }
LABEL_12:
          v16 = 1;
          goto LABEL_13;
        }

      }
    }

    goto LABEL_12;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lastModificationFromDictionaryRepresentation:", v4));
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  if (+[IMUserDataCull isTimestampNewerThanMaxDeletedAge:](IMUserDataCull, "isTimestampNewerThanMaxDeletedAge:", v7))
  {
    goto LABEL_12;
  }
  v8 = BKMobileCloudSyncAnnotationsLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend((id)objc_opt_class(a1), "annotationAssetIDFromDictionaryRepresentation:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend((id)objc_opt_class(a1), "annotationUuidFromDictionaryRepresentation:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v14, "timeIntervalSince1970");
    *(_DWORD *)buf = 138412802;
    v34 = v11;
    v35 = 2112;
    v36 = v13;
    v37 = 2048;
    v38 = (unint64_t)((v15 - (double)(unint64_t)v7) / 86400.0);
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ [%@] [Deleted %llu days ago]", buf, 0x20u);

  }
LABEL_5:

  v16 = 0;
LABEL_13:

  return v16;
}

- (id)iBooks_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationAssetID](self, "annotationAssetID"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationAssetID](self, "annotationAssetID"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bookDatabaseKey"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationCreationDate](self, "annotationCreationDate"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationCreationDate](self, "annotationCreationDate"));
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)v8));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("date"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plLocationRangeStart](self, "plLocationRangeStart"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    -[AEAnnotation setPlLocationRangeStart:](self, "setPlLocationRangeStart:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plLocationRangeStart](self, "plLocationRangeStart"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plLocationRangeStart](self, "plLocationRangeStart"));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ordinal"));

  }
  v14 = objc_msgSend((id)objc_opt_class(self), "bookmarkTypeFromAnnotationType:", -[AEAnnotation annotationType](self, "annotationType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15)
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));

  if (!v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationCreationDate](self, "annotationCreationDate"));
    -[AEAnnotation setAnnotationModificationDate:](self, "setAnnotationModificationDate:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));
    objc_msgSend(v19, "timeIntervalSince1970");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)v20));
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("lastModification"));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation userModificationDate](self, "userModificationDate"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation userModificationDate](self, "userModificationDate"));
    objc_msgSend(v23, "timeIntervalSince1970");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)v24));
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("lastUserModification"));

  }
  if (!-[AEAnnotation isAnnotationDeleted](self, "isAnnotationDeleted"))
  {
    v26 = objc_msgSend((id)objc_opt_class(self), "bookmarkColorFromAnnotationStyle:", -[AEAnnotation annotationStyle](self, "annotationStyle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (v27)
      objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("highlightColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[AEAnnotation annotationIsUnderline](self, "annotationIsUnderline")));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("annotationIsUnderline"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plUserData](self, "plUserData"));
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plUserData](self, "plUserData"));
      objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("locationBPlist"));

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationSelectedText](self, "annotationSelectedText"));
    v32 = objc_msgSend((id)objc_opt_class(self), "optimizedSelectedTextForSerialization:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationRepresentativeText](self, "annotationRepresentativeText"));
    v35 = objc_msgSend((id)objc_opt_class(self), "optimizedRepresentativeTextForSerialization:selectedText:", v34, v33);
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue(v35);

    if (v36)
    {
      if (!v33)
      {
LABEL_25:
        if (v36)
          objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("textualContext"));

        goto LABEL_28;
      }
    }
    else
    {
      if (-[AEAnnotation annotationType](self, "annotationType") == 2)
        v36 = &stru_296430;
      else
        v36 = 0;
      if (!v33)
        goto LABEL_25;
    }
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("text"));
    goto LABEL_25;
  }
LABEL_28:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[AEAnnotation isAnnotationDeleted](self, "isAnnotationDeleted")));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("deletedFlag"));

  -[AEAnnotation validateAnnotationUuid](self, "validateAnnotationUuid");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationUuid](self, "annotationUuid"));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("serverSyncUniqueId"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationNote](self, "annotationNote"));
  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationNote](self, "annotationNote"));
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("annotation"));

  }
  return v3;
}

- (id)doesSerializeAs_iBooks
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationCreatorIdentifier](self, "annotationCreatorIdentifier"));
  v4 = objc_msgSend((id)objc_opt_class(self), "isBKBookmarkCreatorIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationVersion](self, "annotationVersion"));

  if (v5)
    v6 = 0;
  else
    v6 = v4;
  if (v5 && v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationVersion](self, "annotationVersion"));
    v6 = objc_msgSend(v7, "compare:options:", CFSTR("3"), 64) == (id)-1;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));

  return v8;
}

- (void)iBooks_deserializeFromDictionary:(id)a3 trustedSource:(BOOL)a4
{
  _BOOL8 v4;
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
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v4 = a4;
  v34 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation valueForKey:](self, "valueForKey:", CFSTR("futureProofing6")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("bookDatabaseKey")));
  -[AEAnnotation setAnnotationAssetID:](self, "setAnnotationAssetID:", v7);

  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("highlightColor")));
  -[AEAnnotation setAnnotationStyle:](self, "setAnnotationStyle:", objc_msgSend(v8, "annotationStyleFromBookmarkColor:", v9));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "valueForKey:", CFSTR("annotationIsUnderline")));
  -[AEAnnotation setAnnotationIsUnderline:](self, "setAnnotationIsUnderline:", objc_msgSend(v10, "BOOLValue"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("date")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v11, "unsignedLongLongValue")));
  -[AEAnnotation setAnnotationCreationDate:](self, "setAnnotationCreationDate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation bkBookmarkDeserializeLocationDataFromDictionary:trustedSource:](self, "bkBookmarkDeserializeLocationDataFromDictionary:trustedSource:", v34, v4));
  -[AEAnnotation setPlUserData:](self, "setPlUserData:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("ordinal")));
  -[AEAnnotation setPlLocationRangeStart:](self, "setPlLocationRangeStart:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("text")));
  -[AEAnnotation setAnnotationSelectedText:](self, "setAnnotationSelectedText:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("textualContext")));
  if (objc_msgSend(v16, "length"))
    v17 = v16;
  else
    v17 = 0;
  -[AEAnnotation setAnnotationRepresentativeText:](self, "setAnnotationRepresentativeText:", v17);
  v18 = (void *)objc_opt_class(self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("type")));
  -[AEAnnotation setAnnotationType:](self, "setAnnotationType:", objc_msgSend(v18, "annotationTypeFromBookmarkType:", v19));

  if (!-[AEAnnotation annotationStyle](self, "annotationStyle")
    && !-[AEAnnotation annotationIsUnderline](self, "annotationIsUnderline")
    && -[AEAnnotation annotationType](self, "annotationType") == 2)
  {
    -[AEAnnotation setAnnotationIsUnderline:](self, "setAnnotationIsUnderline:", 1);
  }
  if (!-[AEAnnotation annotationType](self, "annotationType"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationSelectedText](self, "annotationSelectedText"));
    if (v20)
    {

      v21 = 2;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationRepresentativeText](self, "annotationRepresentativeText"));

      if (v22)
        v21 = 2;
      else
        v21 = 3;
    }
    -[AEAnnotation setAnnotationType:](self, "setAnnotationType:", v21);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("deletedFlag")));
  v24 = objc_msgSend(v23, "BOOLValue");

  -[AEAnnotation setAnnotationDeleted:](self, "setAnnotationDeleted:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("annotation")));
  -[AEAnnotation setAnnotationNote:](self, "setAnnotationNote:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("serverSyncUniqueId")));
  -[AEAnnotation setAnnotationUuid:](self, "setAnnotationUuid:", v26);

  -[AEAnnotation validateAnnotationUuid](self, "validateAnnotationUuid");
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("lastModification")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v27, "unsignedLongLongValue")));
  -[AEAnnotation setAnnotationModificationDate:](self, "setAnnotationModificationDate:", v28);

  if (!v6)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));
    -[AEAnnotation setUserModificationDate:](self, "setUserModificationDate:", v30);
    goto LABEL_21;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "valueForKey:", CFSTR("lastUserModification")));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("lastUserModification")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v30, "unsignedLongLongValue")));
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "valueForKey:", CFSTR("lastModification")));

    if (!v33)
      goto LABEL_22;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "valueForKey:", CFSTR("lastModification")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v30, "unsignedLongLongValue")));
    if (!v31)
      goto LABEL_19;
  }
  -[AEAnnotation setUserModificationDate:](self, "setUserModificationDate:", v31);
LABEL_19:

LABEL_21:
LABEL_22:
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationModificationDate](self, "annotationModificationDate"));
  -[AEAnnotation setLocationModificationDate:](self, "setLocationModificationDate:", v32);

}

- (id)bkBookmarkDeserializeLocationDataFromDictionary:(id)a3 trustedSource:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if ((objc_opt_respondsToSelector(self, "preferredDeserializedLocationDataFromDictionary:trustedSource:") & 1) != 0)
    v7 = objc_claimAutoreleasedReturnValue(-[AEAnnotation preferredDeserializedLocationDataFromDictionary:trustedSource:](self, "preferredDeserializedLocationDataFromDictionary:trustedSource:", v6, v4));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("locationBPlist")));
  v8 = (void *)v7;

  return v8;
}

+ (int)annotationStyleFromBookmarkColor:(id)a3
{
  int result;

  result = objc_msgSend(a3, "intValue");
  if ((result - 1) >= 5)
    return 0;
  return result;
}

+ (id)bookmarkColorFromAnnotationStyle:(int)a3
{
  uint64_t v3;

  if ((a3 - 1) >= 5)
    *(_QWORD *)&a3 = 0;
  else
    v3 = a3;
  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3);
}

+ (int)annotationTypeFromBookmarkType:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "intValue") - 1;
  if (v3 > 2)
    return 0;
  else
    return dword_26AD70[v3];
}

+ (id)bookmarkTypeFromAnnotationType:(int)a3
{
  uint64_t v3;

  if ((a3 - 1) > 2)
    v3 = 0;
  else
    v3 = dword_26AD7C[a3 - 1];
  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3);
}

+ (id)annotationUuidFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("serverSyncUniqueId")));
  if (!objc_msgSend(v4, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("annotationUuid")));

    v4 = (void *)v5;
  }

  return v4;
}

+ (id)annotationAssetIDFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("bookDatabaseKey")));
  if (!objc_msgSend(v4, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("annotationAssetID")));

    v4 = (void *)v5;
  }

  return v4;
}

+ (id)lastModificationFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("lastModification")));
  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("annotationModificationDate")));

  return v4;
}

+ (id)deletedFlagFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("deletedFlag")));
  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("annotationDeleted")));

  return v4;
}

+ (id)annotationCreatorIdentifierFromDictionaryRepresentation:(id)a3
{
  __CFString *v3;
  __CFString *v4;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("annotationCreatorIdentifier")));
  if (!-[__CFString length](v3, "length"))
  {
    v4 = CFSTR("com~apple~iBooks");

    v3 = v4;
  }
  return v3;
}

+ (int)annotationTypeFromDictionaryRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  int v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("type")));
  if (v5)
  {
    v6 = (void *)v5;
    if ((objc_opt_respondsToSelector(a1, "annotationTypeFromBookmarkType:") & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = objc_msgSend(a1, "annotationTypeFromBookmarkType:", v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("annotationType")));
    v7 = objc_msgSend(v6, "intValue");
  }
  v8 = v7;
LABEL_7:

  return v8;
}

+ (id)requiredKeysForDictionaryRepresentation
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("annotationUuid"), CFSTR("annotationAssetID"), CFSTR("annotationCreatorIdentifier"), CFSTR("annotationDeleted"), CFSTR("annotationType"), CFSTR("annotationNote"), CFSTR("plLocationRangeStart"), 0);
}

+ (id)dateKeysForDictionaryRepresentation
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("annotationCreationDate"), CFSTR("annotationModificationDate"), 0);
}

+ (id)optionalKeysForDictionaryRepresentation
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("annotationLocation"), CFSTR("annotationRepresentativeText"), CFSTR("annotationSelectedText"), CFSTR("annotationStyle"), CFSTR("annotationIsUnderline"), CFSTR("plLocationRangeEnd"), CFSTR("plAbsolutePhysicalLocation"), CFSTR("plStorageUUID"), CFSTR("plUserData"), CFSTR("futureProofing1"), CFSTR("futureProofing2"), CFSTR("futureProofing3"), CFSTR("futureProofing4"), CFSTR("futureProofing5"), CFSTR("futureProofing6"), CFSTR("futureProofing7"), CFSTR("futureProofing8"),
           CFSTR("futureProofing9"),
           CFSTR("futureProofing10"),
           CFSTR("futureProofing11"),
           CFSTR("futureProofing12"),
           0);
}

- (id)validateAnnotationUuid
{
  __CFString *v3;
  const __CFString *v4;
  id v5;
  const Bytef *v6;
  void *v7;
  uLong v8;
  __CFString *v9;
  double v10;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationUuid](self, "annotationUuid"));
  if (!-[__CFString length](v3, "length"))
  {
    if (-[AEAnnotation annotationType](self, "annotationType") == 3)
    {
      v4 = CFSTR("Reading Location");
    }
    else
    {
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[AEAnnotation plUserData](self, "plUserData")));
      v6 = (const Bytef *)objc_msgSend(v5, "bytes");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotation plUserData](self, "plUserData"));
      v8 = crc32(0, v6, (uInt)objc_msgSend(v7, "length"));

      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[AEAnnotation annotationCreationDate](self, "annotationCreationDate"));
      -[__CFString timeIntervalSince1970](v9, "timeIntervalSince1970");
      v4 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d-crc32(%08x)"), (int)v10, v8));

      v3 = v9;
    }

    -[AEAnnotation setAnnotationUuid:](self, "setAnnotationUuid:", v4);
    v3 = (__CFString *)v4;
  }
  return v3;
}

+ (BOOL)isBKBookmarkCreatorIdentifier:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("com~apple~iBooks")) & 1) == 0)
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.iBooks"));
  else
    v5 = 1;

  return v5;
}

@end
