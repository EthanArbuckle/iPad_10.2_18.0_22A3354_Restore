@implementation BKPaginationLayoutOperation

- (id)newHistoryEntityResultsArray
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "historyEntities"));
  if (!objc_msgSend(v4, "count"))
    goto LABEL_15;
  v22 = v4;
  v23 = objc_alloc_init((Class)NSMutableArray);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
      if ((-[BKPaginationLayoutOperation isCancelled](self, "isCancelled") & 1) != 0)
        break;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "location"));
      v12 = objc_msgSend(v11, "ordinal");
      v13 = objc_msgSend(v3, "documentOrdinal");

      if (v12 == (id)(int)v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lookupKey"));
        v15 = objc_msgSend(v10, "pageForLookupKey:", v14);

        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "location"));
          v17 = -[BKPaginationLayoutOperation pageRangeForLocation:](self, "pageRangeForLocation:", v16);

          if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v18 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", v17);
            v19 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v18, CFSTR("pageOffset"), v10, CFSTR("BKHistoryEntity"), 0);
            objc_msgSend(v23, "addObject:", v19);

          }
        }
      }
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }

  v4 = v22;
  v20 = v23;
  if (!v23)
LABEL_15:
    v20 = objc_alloc_init((Class)NSArray);

  return v20;
}

- (id)newBookmarkPageArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *context;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  unint64_t v46;
  void *v47;
  void *v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookmarks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "physicalPageAnchors"));
  v45 = objc_msgSend(v5, "count");

  if (!objc_msgSend(v4, "count"))
    goto LABEL_38;
  v41 = v3;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationProvider sharedInstance](AEAnnotationProvider, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "uiManagedObjectContext"));
  context = objc_autoreleasePoolPush();
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v40 = v4;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v51;
    v43 = v7;
    v44 = v6;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v10)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v11);
      if ((-[BKPaginationLayoutOperation isCancelled](self, "isCancelled") & 1) != 0)
        goto LABEL_35;
      v13 = objc_autoreleasePoolPush();
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "existingObjectWithID:error:", v12, 0));
      v15 = v14;
      if (v14)
      {
        if ((objc_msgSend(v14, "isDeleted") & 1) == 0
          && (objc_msgSend(v15, "isAnnotationDeleted") & 1) == 0)
        {
          break;
        }
      }
LABEL_33:

      objc_autoreleasePoolPop(v13);
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        if (v9)
          goto LABEL_4;
        goto LABEL_35;
      }
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "annotationLocation"));
    if (!objc_msgSend(v48, "length")
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI unknownCFIString](BCCFI, "unknownCFIString")),
          v17 = objc_msgSend(v48, "isEqualToString:", v16),
          v16,
          v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationLayoutOperation cfiForAnnotation:](self, "cfiForAnnotation:", v15));
      if (objc_msgSend(v18, "length"))
        objc_msgSend(v15, "setAnnotationLocation:", v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
    objc_opt_class(BKEpubCFILocation);
    v21 = BUDynamicCast(v20, v19);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v46 = -[BKPaginationLayoutOperation pageOffsetForCFILocation:](self, "pageOffsetForCFILocation:");
    if (v45)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "physicalPageNumber"));

      if (!v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationLayoutOperation pageTitleForLocation:](self, "pageTitleForLocation:", v19));
        objc_msgSend(v15, "setPhysicalPageNumber:", v23);

      }
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "plUserData"));
    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "annotationLocation"));

      if (!v25)
      {
LABEL_23:
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "chapterTitle"));

        if (!v28)
        {
          v42 = v19;
          v29 = objc_claimAutoreleasedReturnValue(-[BKPaginationLayoutOperation chapterTitleForLocation:](self, "chapterTitleForLocation:", v19));
          if (v29)
            v30 = (__CFString *)v29;
          else
            v30 = &stru_1C3088;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "chapterTitle"));
          v32 = -[__CFString isEqualToString:](v30, "isEqualToString:", v31);

          if ((v32 & 1) == 0)
            objc_msgSend(v15, "setChapterTitle:", v30);

          v19 = v42;
          v7 = v43;
        }
        if (v46 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v46, 1));
          v34 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v12, CFSTR("objectID"), v33, CFSTR("range"), 0, context);
          v35 = v19;
          v36 = v34;
          objc_msgSend(v7, "addObject:", v34);

          v19 = v35;
        }

        v6 = v44;
        goto LABEL_33;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "annotationLocation"));
      v26 = v19;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationLayoutOperation locationForCfi:](self, "locationForCfi:", v24));
      objc_msgSend(v15, "setLocation:", v27);
      objc_msgSend(v15, "setAnnotationLocation:", v24);

      v19 = v26;
      v7 = v43;
    }

    goto LABEL_23;
  }
LABEL_35:

  objc_autoreleasePoolPop(context);
  if (objc_msgSend(v6, "hasChanges"))
    objc_msgSend(v39, "saveManagedObjectContext:", v6);

  v4 = v40;
  v3 = v41;
  if (!v7)
LABEL_38:
    v7 = objc_alloc_init((Class)NSArray);

  return v7;
}

- (id)newPageLocationArrayWithAnchorInfos:(id)a3
{
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  const __CFString *v14;
  id v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  id v19;
  id v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_16;
  v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v4;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("href");
    v8 = *(_QWORD *)v25;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
      if ((-[BKPaginationLayoutOperation isCancelled](self, "isCancelled") & 1) != 0)
        break;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v7));
      v12 = -[BKPaginationLayoutOperation pageOffsetForHref:](self, "pageOffsetForHref:", v11);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", v12);
        v14 = v7;
        v15 = objc_alloc((Class)NSDictionary);
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("name")));
        v17 = (void *)v16;
        if (v16)
          v18 = (const __CFString *)v16;
        else
          v18 = &stru_1C3088;
        v19 = objc_msgSend(v15, "initWithObjectsAndKeys:", v11, CFSTR("fullHref"), v18, CFSTR("name"), v13, CFSTR("documentOffset"), 0);

        objc_msgSend(v23, "addObject:", v19);
        v7 = v14;

      }
      if (v6 == (id)++v9)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v6)
          goto LABEL_4;
        break;
      }
    }
  }

  v4 = v21;
  if (!v23)
LABEL_16:
    v23 = objc_alloc_init((Class)NSArray);

  return v23;
}

- (id)newNavigationInfoAnchorArray
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationInfoAnchors"));
  v5 = -[BKPaginationLayoutOperation newPageLocationArrayWithAnchorInfos:](self, "newPageLocationArrayWithAnchorInfos:", v4);

  return v5;
}

- (id)newLandmarkInfoAnchorArray
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "landmarkAnchors"));
  v5 = -[BKPaginationLayoutOperation newPageLocationArrayWithAnchorInfos:](self, "newPageLocationArrayWithAnchorInfos:", v4);

  return v5;
}

- (id)newPhysicalPageAnchorArray
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "physicalPageAnchors"));
  v5 = -[BKPaginationLayoutOperation newPageLocationArrayWithAnchorInfos:](self, "newPageLocationArrayWithAnchorInfos:", v4);

  return v5;
}

- (void)_populateTOCEntriesFromNavigationInfoAnchors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation paginationOperationController](self, "paginationOperationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
  v8 = (int)objc_msgSend(v7, "documentOrdinal");
  if (objc_msgSend(v6, "needTOCEntriesForOrdinal:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bu_arrayByInvokingBlock:", &stru_1C0988));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_7EABC;
    v12[3] = &unk_1C09B0;
    v13 = (id)objc_claimAutoreleasedReturnValue(-[BKPaginationLayoutOperation startCFIsForNavigationInfoHrefs:](self, "startCFIsForNavigationInfoHrefs:", v9));
    v10 = v13;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bu_arrayByInvokingBlock:", v12));
    objc_msgSend(v6, "addTOCEntries:ordinal:completion:", v11, v8, 0);

  }
}

- (void)populateRecordJob:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = -[BKPaginationLayoutOperation newNavigationInfoAnchorArray](self, "newNavigationInfoAnchorArray");
  objc_msgSend(v4, "setNavigationInfoAnchors:", v5);

  v6 = -[BKPaginationLayoutOperation newLandmarkInfoAnchorArray](self, "newLandmarkInfoAnchorArray");
  objc_msgSend(v4, "setLandmarkAnchors:", v6);

  v7 = -[BKPaginationLayoutOperation newPhysicalPageAnchorArray](self, "newPhysicalPageAnchorArray");
  objc_msgSend(v4, "setPhysicalPageAnchors:", v7);

  v8 = -[BKPaginationLayoutOperation newBookmarkPageArray](self, "newBookmarkPageArray");
  objc_msgSend(v4, "setBookmarks:", v8);

  v9 = -[BKPaginationLayoutOperation newHistoryEntityResultsArray](self, "newHistoryEntityResultsArray");
  objc_msgSend(v4, "setHistoryEntities:", v9);

}

- (id)layoutComplete:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
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

  if (-[BKPaginationOperation isJobGenerationValid](self, "isJobGenerationValid"))
  {
    if (a3 <= 1)
      v5 = 1;
    else
      v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
    v7 = -[BKPaginationJob init:]([BKPaginationRecordJob alloc], "init:", objc_msgSend(v6, "jobGeneration"));
    objc_msgSend(v7, "copyState:", v6);
    objc_msgSend(v7, "setPageCount:", v5);
    -[BKPaginationLayoutOperation populateRecordJob:](self, "populateRecordJob:", v7);
    v8 = (int)objc_msgSend(v6, "documentOrdinal");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "baseURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKTextIndex bookIndexWithName:](BKTextIndex, "bookIndexWithName:", v12));

    if (v13 && (objc_msgSend(v13, "containsTextUnitWithOrdinal:", v8) & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationLayoutOperation text](self, "text"));
      if (objc_msgSend(v14, "length"))
        objc_msgSend(v13, "indexTextUnit:withOrdinal:", v14, v8);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationInfoAnchors"));
    -[BKPaginationLayoutOperation _populateTOCEntriesFromNavigationInfoAnchors:](self, "_populateTOCEntriesFromNavigationInfoAnchors:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation paginationOperationController](self, "paginationOperationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));

    if (objc_msgSend(v17, "needTextNodeCharacterCountsForOrdinal:", v8))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationLayoutOperation textNodeCharacterCounts](self, "textNodeCharacterCounts"));
      if (v18)
        objc_msgSend(v17, "addTextNodeCharacterCounts:ordinal:completion:", v18, v8, 0);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation paginationOperationController](self, "paginationOperationController"));
    objc_msgSend(v19, "addResultJob:", v7);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)pageOffsetForHref:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (_NSRange)pageRangeForLocation:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  result.length = v4;
  result.location = v3;
  return result;
}

- (unint64_t)pageOffsetForCFILocation:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)pageTitleForLocation:(id)a3
{
  return 0;
}

- (id)chapterTitleForLocation:(id)a3
{
  return 0;
}

- (id)cfiForLocation:(id)a3
{
  return 0;
}

- (id)cfiForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___BKBookmark))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationLayoutOperation cfiForLocation:](self, "cfiForLocation:", v5));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)locationForCfi:(id)a3
{
  return 0;
}

- (void)execute
{
  id v2;

  v2 = -[BKPaginationLayoutOperation layoutComplete:](self, "layoutComplete:", 1);
}

- (id)text
{
  return 0;
}

- (id)textNodeCharacterCounts
{
  return 0;
}

- (id)startCFIsForNavigationInfoHrefs:(id)a3
{
  return 0;
}

@end
