@implementation BKPictureBookPaginationOperation

- (id)copyDocumentArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation batchJob](self, "batchJob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookDatabaseKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfo linearDocumentPredicateForDatabaseKey:](AEBookInfo, "linearDocumentPredicateForDatabaseKey:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("href"), CFSTR("documentOrdinal"), 0));
  v9 = objc_msgSend(v4, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:", v8, CFSTR("BKDocument"), v7, CFSTR("documentOrdinal"), 1);

  return v9;
}

- (unint64_t)countPaginatedDocuments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation batchJob](self, "batchJob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lookupKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lookupKey ==[n] %@"), v6));

  v8 = objc_msgSend(v4, "countEntity:withPredicate:", CFSTR("BKDocumentPageCount"), v7);
  return (unint64_t)v8;
}

- (void)recordDocumentPageCountForDocumentInfos:(id)a3 context:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id obj;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a3;
  v26 = a4;
  v7 = -[BKPictureBookPaginationOperation countPaginatedDocuments:](self, "countPaginatedDocuments:");
  if (v7 < (unint64_t)objc_msgSend(v6, "count"))
  {
    v25 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation paginationOperationController](self, "paginationOperationController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "paginationRevision"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation batchJob](self, "batchJob"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookDatabaseKey"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation batchJob](self, "batchJob"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lookupKey"));

    v22 = v6;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", v7, (char *)objc_msgSend(v6, "count") - v7));
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v16);
        if ((-[BKPictureBookPaginationOperation isCancelled](self, "isCancelled") & 1) != 0)
          break;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("documentOrdinal")));
        v19 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v18, "intValue") + 1);
        v20 = +[BKDocumentPageCount newEmptyDocumentPageCount:](BKDocumentPageCount, "newEmptyDocumentPageCount:", v26);
        objc_msgSend(v20, "setDocumentOrdinal:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("href")));
        objc_msgSend(v20, "setHref:", v21);

        objc_msgSend(v20, "setLookupKey:", v12);
        objc_msgSend(v20, "setPageCount:", v25);
        objc_msgSend(v20, "setPageNumber:", v19);
        objc_msgSend(v20, "setBookDatabaseKey:", v10);
        objc_msgSend(v20, "setPaginationRevision:", v24);

        if (v14 == (id)++v16)
        {
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v14)
            goto LABEL_4;
          break;
        }
      }
    }

    v6 = v22;
  }

}

- (id)unpaginatedAnnotations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_834E0;
  v31 = sub_834F0;
  v32 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation batchJob](self, "batchJob"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookDatabaseKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForUserAnnotationsWithAssetID:includingDeleted:](AEAnnotation, "predicateForUserAnnotationsWithAssetID:includingDeleted:", v4, 0));

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_834F8;
  v20[3] = &unk_1C0B78;
  v22 = &v23;
  v6 = v5;
  v21 = v6;
  -[BKPaginationOperation performBackgroundAnnotationsBlockAndWait:](self, "performBackgroundAnnotationsBlockAndWait:", v20);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_834E0;
  v18 = sub_834F0;
  v19 = 0;
  if (v24[3])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_83534;
    v13[3] = &unk_1C0BA0;
    v13[4] = self;
    v13[5] = &v23;
    v13[6] = &v14;
    -[BKPaginationOperation performBlockAndWait:](self, "performBlockAndWait:", v13);
    if (v15[5])
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_83680;
      v9[3] = &unk_1C0BC8;
      v11 = &v14;
      v10 = v6;
      v12 = &v27;
      -[BKPaginationOperation performBackgroundAnnotationsBlockAndWait:](self, "performBackgroundAnnotationsBlockAndWait:", v9);

    }
  }
  v7 = (id)v28[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v7;
}

- (void)recordAnnotationPageNumbers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  if ((-[BKPictureBookPaginationOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation unpaginatedAnnotations](self, "unpaginatedAnnotations"));
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation paginationOperationController](self, "paginationOperationController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "paginationRevision"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation batchJob](self, "batchJob"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lookupKey"));

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = v5;
      obj = v5;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
          if ((-[BKPictureBookPaginationOperation isCancelled](self, "isCancelled", v20) & 1) != 0)
            break;
          *(_QWORD *)&v15 = objc_opt_class(BKBookmarkPageCount).n128_u64[0];
          v17 = objc_msgSend(v4, "newByClass:", v16, v15);
          objc_msgSend(v17, "setLookupKey:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v14, "ordinal") + 1));
          objc_msgSend(v17, "setPageNumber:", v18);

          objc_msgSend(v17, "setPaginationRevision:", v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "annotationUuid"));
          objc_msgSend(v17, "setAnnotationUuid:", v19);

          if (v11 == (id)++v13)
          {
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v11)
              goto LABEL_5;
            break;
          }
        }
      }

      v5 = v20;
    }

  }
}

- (id)copyNavigationInfos:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation bookObjectID](self, "bookObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookInfo == %@"), v5));

  v7 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("baseHref"), CFSTR("href"), CFSTR("name"), 0);
  v8 = objc_msgSend(v4, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:", v7, CFSTR("BKNavigationInfo"), v6, 0, 0);

  return v8;
}

- (unint64_t)countPaginatedChapters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation batchJob](self, "batchJob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lookupKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lookupKey ==[n] %@"), v6));

  v8 = objc_msgSend(v4, "countEntity:withPredicate:", CFSTR("BKChapterPageCount"), v7);
  return (unint64_t)v8;
}

- (void)_clearAllChapterPageCountEntities:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  objc_msgSend(v3, "batchDeleteEntity:matching:prefetchRelationships:", CFSTR("BKChapterPageCount"), v4, 0);

}

- (BOOL)_needsFullReparseForRecordedChapterPageCountForDocumentInfos:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  BOOL v31;
  id v32;
  id obj;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v6 = a3;
  v7 = a4;
  if ((-[BKPictureBookPaginationOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = -[BKPictureBookPaginationOperation copyNavigationInfos:](self, "copyNavigationInfos:", v7);
    v10 = -[BKPictureBookPaginationOperation countPaginatedChapters:](self, "countPaginatedChapters:", v7);
    v11 = objc_msgSend(v9, "count");
    v8 = v10 > (unint64_t)v11;
    if (v10 > (unint64_t)v11)
    {
      -[BKPictureBookPaginationOperation _clearAllChapterPageCountEntities:](self, "_clearAllChapterPageCountEntities:", v7);
      v10 = 0;
    }
    if (v10 < (unint64_t)objc_msgSend(v9, "count"))
    {
      v31 = v8;
      v38 = v7;
      v37 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation paginationOperationController](self, "paginationOperationController"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "paginationRevision"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation batchJob](self, "batchJob"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bookDatabaseKey"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPaginationOperation batchJob](self, "batchJob"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lookupKey"));

      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("href")));
      v32 = v6;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("documentOrdinal")));
      v29 = (void *)v15;
      v39 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjects:forKeys:", v28, v15);
      v30 = v9;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subarrayWithRange:", v10, (char *)objc_msgSend(v9, "count") - v10));
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v41;
LABEL_8:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v19);
          if ((-[BKPictureBookPaginationOperation isCancelled](self, "isCancelled") & 1) != 0)
            break;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("baseHref")));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "valueForKey:", v21));
          if (v22)
          {
            v23 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v22, "intValue") + 1);
            v24 = +[BKChapterPageCount newEmptyChapterPageNumber:](BKChapterPageCount, "newEmptyChapterPageNumber:", v38);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("href")));
            objc_msgSend(v24, "setHref:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("name")));
            objc_msgSend(v24, "setName:", v26);

            objc_msgSend(v24, "setDocumentPageOffset:", v37);
            objc_msgSend(v24, "setPageNumber:", v23);
            objc_msgSend(v24, "setLookupKey:", v34);
            objc_msgSend(v24, "setBookDatabaseKey:", v35);
            objc_msgSend(v24, "setPaginationRevision:", v36);

          }
          if (v17 == (id)++v19)
          {
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            if (v17)
              goto LABEL_8;
            break;
          }
        }
      }

      v6 = v32;
      v7 = v38;
      v8 = v31;
      v9 = v30;
    }

  }
  return v8;
}

- (void)execute
{
  void *v3;
  _QWORD v4[5];

  if (-[BKPaginationOperation isJobGenerationValid](self, "isJobGenerationValid"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_84004;
    v4[3] = &unk_1C0BF0;
    v4[4] = self;
    -[BKPaginationOperation performBlockAndWait:](self, "performBlockAndWait:", v4);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation paginationOperationController](self, "paginationOperationController"));
  objc_msgSend(v3, "batchEnded:", -[BKPaginationOperation isJobGenerationValid](self, "isJobGenerationValid"));

}

@end
