@implementation STUFetchSafariBookmarksOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchSafariBookmarksOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchSafariBookmarksRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D36A0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)runWithRequest:(id)a3
{
  -[STUFetchSafariBookmarksOperation fetchBookmarks_iOS](self, "fetchBookmarks_iOS", a3);
}

- (void)fetchBookmarks_iOS
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new(CRKFetchSafariBookmarksResultObject);
  v3 = objc_msgSend((id)objc_opt_class(self), "safariBookmarks");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v5, "setBookmarks:", v4);

  -[STUFetchSafariBookmarksOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);
}

+ (id)safariBookmarks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WebBookmarkCollection safariBookmarkCollection](WebBookmarkCollection, "safariBookmarkCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "convertWebBookmarkListToCRKBookmarkArray:collection:", v4, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "CRKFavoritesFolderWithCollection:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "CRKReadingListFolderWithCollection:", v3));
  v8 = objc_opt_new(NSMutableArray);
  v9 = v8;
  if (v6)
    -[NSMutableArray addObject:](v8, "addObject:", v6);
  if (v7)
    -[NSMutableArray addObject:](v9, "addObject:", v7);
  -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v5);

  return v9;
}

+ (id)CRKFavoritesFolderWithCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "favoritesFolder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listWithID:", objc_msgSend(v5, "identifier")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "convertWebBookmarkListToCRKBookmarkArray:collection:", v6, v4));
  if (objc_msgSend(v7, "count"))
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRKBookmark favoritesFolderWithChildren:](CRKBookmark, "favoritesFolderWithChildren:", v7));
  else
    v8 = 0;

  return v8;
}

+ (id)CRKReadingListFolderWithCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readingListFolder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listWithID:", objc_msgSend(v5, "identifier")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "convertWebBookmarkListToCRKBookmarkArray:collection:", v6, v4));
  if (objc_msgSend(v7, "count"))
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRKBookmark readingListFolderWithChildren:](CRKBookmark, "readingListFolderWithChildren:", v7));
  else
    v8 = 0;

  return v8;
}

+ (id)convertWebBookmarkListToCRKBookmarkArray:(id)a3 collection:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bookmarkArray"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003B030;
  v13[3] = &unk_1000CAA60;
  v14 = v6;
  v15 = a1;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crk_mapUsingBlock:", v13));
  v10 = v9;
  if (!v9)
    v9 = &__NSArray0__struct;
  v11 = v9;

  return v11;
}

@end
