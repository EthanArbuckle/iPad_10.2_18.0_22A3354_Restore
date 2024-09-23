@implementation WebBookmarkChange

+ (id)bookmarkAddChangeWithBookmark:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:bookmarkID:parentID:changeType:", v4, objc_msgSend(v4, "identifier"), objc_msgSend(v4, "parentID"), 2);

  return v5;
}

+ (id)bookmarkModifyChangeWithBookmark:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:bookmarkID:parentID:changeType:", v4, objc_msgSend(v4, "identifier"), objc_msgSend(v4, "parentID"), 3);

  return v5;
}

+ (id)deleteChangeWithBookmark:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:bookmarkID:parentID:changeType:", v4, objc_msgSend(v4, "identifier"), objc_msgSend(v4, "parentID"), 0);

  return v5;
}

+ (id)moveChangeWithBookmark:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:", v6, objc_msgSend(v6, "identifier"), objc_msgSend(v6, "parentID"), v4, 4);

  return v7;
}

+ (id)reorderChangeWithBookmark:(id)a3 afterBookmark:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)a1);
  v9 = objc_msgSend(v6, "identifier");
  v10 = objc_msgSend(v6, "parentID");
  if (v7)
    v11 = objc_msgSend(v7, "identifier");
  else
    v11 = 0x7FFFFFFFLL;
  v12 = (void *)objc_msgSend(v8, "initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:", v6, v9, v10, v11, 5);

  return v12;
}

+ (id)replaceChangeWithBookmarks:(id)a3 inFolderWithID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBookmarks:parentID:changeType:", v6, v4, 6);

  return v7;
}

+ (id)replaceChangeWithBookmarks:(id)a3 inFolderWithSpecialID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBookmarks:specialFolderID:changeType:", v6, v4, 6);

  return v7;
}

- (WebBookmarkChange)initWithBookmarks:(id)a3 parentID:(int)a4 changeType:(int64_t)a5
{
  return -[WebBookmarkChange initWithBookmarks:parentID:specialFolderID:changeType:](self, "initWithBookmarks:parentID:specialFolderID:changeType:", a3, *(_QWORD *)&a4, 0, a5);
}

- (WebBookmarkChange)initWithBookmarks:(id)a3 specialFolderID:(int)a4 changeType:(int64_t)a5
{
  return -[WebBookmarkChange initWithBookmarks:parentID:specialFolderID:changeType:](self, "initWithBookmarks:parentID:specialFolderID:changeType:", a3, 0, *(_QWORD *)&a4, a5);
}

- (WebBookmarkChange)initWithBookmarks:(id)a3 parentID:(int)a4 specialFolderID:(int)a5 changeType:(int64_t)a6
{
  id v10;
  WebBookmarkChange *v11;
  uint64_t v12;
  NSArray *bookmarks;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  WebBookmarkChange *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WebBookmarkChange;
  v11 = -[WebBookmarkChange init](&v25, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    bookmarks = v11->_bookmarks;
    v11->_bookmarks = (NSArray *)v12;

    v11->_parentID = a4;
    v11->_specialFolderID = a5;
    v11->_changeType = a6;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v11->_bookmarks;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18++), "_setUsedForInMemoryChangeTracking:", 0, (_QWORD)v21);
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }

    v19 = v11;
  }

  return v11;
}

- (WebBookmarkChange)initWithBookmarkID:(int)a3 parentID:(int)a4 changeType:(int64_t)a5
{
  return -[WebBookmarkChange initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:](self, "initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:", 0, *(_QWORD *)&a3, *(_QWORD *)&a4, 0x7FFFFFFFLL, a5);
}

- (WebBookmarkChange)initWithBookmarkID:(int)a3 parentID:(int)a4 associatedBookmarkID:(int)a5 changeType:(int64_t)a6
{
  return -[WebBookmarkChange initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:](self, "initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:", 0, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

- (WebBookmarkChange)initWithBookmark:(id)a3 bookmarkID:(int)a4 parentID:(int)a5 changeType:(int64_t)a6
{
  return -[WebBookmarkChange initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:](self, "initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0x7FFFFFFFLL, a6);
}

- (WebBookmarkChange)initWithBookmark:(id)a3 bookmarkID:(int)a4 parentID:(int)a5 associatedBookmarkID:(int)a6 changeType:(int64_t)a7
{
  id v12;
  WebBookmarkChange *v13;
  WebBookmarkChange *v14;
  uint64_t v15;
  WebBookmark *bookmark;
  WebBookmarkChange *v17;
  objc_super v19;

  v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WebBookmarkChange;
  v13 = -[WebBookmarkChange init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_bookmarkID = a4;
    v13->_parentID = a5;
    v13->_associatedBookmarkID = a6;
    v13->_changeType = a7;
    v15 = objc_msgSend(v12, "copy");
    bookmark = v14->_bookmark;
    v14->_bookmark = (WebBookmark *)v15;

    -[WebBookmark _setUsedForInMemoryChangeTracking:](v14->_bookmark, "_setUsedForInMemoryChangeTracking:", a7 == 3);
    -[WebBookmarkChange _setModifiedAttributesIfSupported](v14, "_setModifiedAttributesIfSupported");
    v17 = v14;
  }

  return v14;
}

- (WebBookmarkChange)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  WebBookmarkChange *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  WebBookmark *v13;
  WebBookmark *bookmark;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *bookmarks;
  WebBookmarkChange *v20;
  char v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WebBookmarkChange;
  v5 = -[WebBookmarkChange init](&v23, sel_init);
  if (!v5)
    goto LABEL_15;
  v22 = 0;
  objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("BookmarkID"), &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_bookmarkID = objc_msgSend(v6, "intValue");

  if (!v22)
    goto LABEL_15;
  objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("ParentID"), &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_parentID = objc_msgSend(v7, "intValue");

  if (!v22)
    goto LABEL_15;
  objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("AssociatedBookmarkID"), &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_associatedBookmarkID = objc_msgSend(v8, "intValue");

  if (!v22)
    goto LABEL_15;
  objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("SpecialFolderID"), &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_specialFolderID = objc_msgSend(v9, "intValue");

  if (!v22)
    goto LABEL_15;
  objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("Type"), &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_changeType = objc_msgSend(v10, "integerValue");

  if (v22)
  {
    objc_msgSend(v4, "wb_dictionaryForKey:isValid:", CFSTR("AssociatedBookmark"), &v22);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (!v22)
      goto LABEL_17;
    if (v11)
    {
      v13 = -[WebBookmark initWithDictionaryRepresentationForInMemoryChangeTracking:]([WebBookmark alloc], "initWithDictionaryRepresentationForInMemoryChangeTracking:", v11);
      bookmark = v5->_bookmark;
      v5->_bookmark = v13;

      if (!v5->_bookmark)
        goto LABEL_17;
    }
    objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("ModifiedAttributes"), &v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_modifiedAttributes = objc_msgSend(v15, "integerValue");

    if (v22)
    {
      objc_msgSend(v4, "wb_arrayForKey:isValid:", CFSTR("Bookmarks"), &v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v22)
      {
        if (v16)
        {
          objc_msgSend(v16, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_6);
          v18 = objc_claimAutoreleasedReturnValue();
          bookmarks = v5->_bookmarks;
          v5->_bookmarks = (NSArray *)v18;

        }
        v20 = v5;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
LABEL_17:
      v20 = 0;
    }

  }
  else
  {
LABEL_15:
    v20 = 0;
  }

  return v20;
}

WebBookmark *__54__WebBookmarkChange_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WebBookmark *v3;

  v2 = a2;
  v3 = -[WebBookmark initWithDictionaryRepresentationForInMemoryChangeTracking:]([WebBookmark alloc], "initWithDictionaryRepresentationForInMemoryChangeTracking:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t bookmarkID;
  void *v5;
  id v6;

  bookmarkID = self->_bookmarkID;
  v6 = a3;
  objc_msgSend(v6, "encodeInt32:forKey:", bookmarkID, CFSTR("BookmarkID"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_parentID, CFSTR("ParentID"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_associatedBookmarkID, CFSTR("AssociatedBookmarkID"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_specialFolderID, CFSTR("SpecialFolderID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_changeType, CFSTR("Type"));
  -[WebBookmark dictionaryRepresentationForInMemoryChangeTracking](self->_bookmark, "dictionaryRepresentationForInMemoryChangeTracking");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AssociatedBookmark"));

  objc_msgSend(v6, "encodeInt64:forKey:", self->_modifiedAttributes, CFSTR("ModifiedAttributes"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bookmarks, CFSTR("Bookmarks"));

}

- (WebBookmarkChange)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  WebBookmark *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WebBookmark *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WebBookmarkChange *v17;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  _QWORD v23[2];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v21 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("BookmarkID"));
  v20 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("ParentID"));
  v19 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("AssociatedBookmarkID"));
  v4 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("SpecialFolderID"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Type"));
  v6 = [WebBookmark alloc];
  v7 = (void *)MEMORY[0x24BDBCF20];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  v24[4] = objc_opt_class();
  v24[5] = objc_opt_class();
  v24[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("AssociatedBookmark"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WebBookmark initWithDictionaryRepresentationForInMemoryChangeTracking:](v6, "initWithDictionaryRepresentationForInMemoryChangeTracking:", v10);

  v12 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("ModifiedAttributes"));
  v13 = (void *)MEMORY[0x24BDBCF20];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("Bookmarks"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[WebBookmarkChange initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:]([WebBookmarkChange alloc], "initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:", v11, v21, v20, v19, v5);
  -[WebBookmarkChange setSpecialFolderID:](v17, "setSpecialFolderID:", v4);
  -[WebBookmarkChange setModifiedAttributes:](v17, "setModifiedAttributes:", v12);
  -[WebBookmarkChange setBookmarks:](v17, "setBookmarks:", v16);

  return v17;
}

- (void)applyModificationsToBookmark:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[WebBookmarkChange attributesMarkedAsModify:](self, "attributesMarkedAsModify:", 8))
  {
    v4 = objc_msgSend(v8, "isReadingListItem");
    -[WebBookmark dateLastViewed](self->_bookmark, "dateLastViewed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v8, "setReadingListDateLastViewed:", v5);
    else
      objc_msgSend(v8, "setTabDateLastViewed:", v5);

  }
  if (-[WebBookmarkChange attributesMarkedAsModify:](self, "attributesMarkedAsModify:", 1))
  {
    -[WebBookmark title](self->_bookmark, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v6);

  }
  if (-[WebBookmarkChange attributesMarkedAsModify:](self, "attributesMarkedAsModify:", 2))
  {
    -[WebBookmark address](self->_bookmark, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAddress:", v7);

  }
  if (-[WebBookmarkChange attributesMarkedAsModify:](self, "attributesMarkedAsModify:", 512))
    objc_msgSend(v8, "setLastSelectedChildID:", -[WebBookmark lastSelectedChildID](self->_bookmark, "lastSelectedChildID"));

}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *bookmarks;
  void *v11;
  WebBookmark *bookmark;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_bookmarkID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("BookmarkID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_parentID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ParentID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_associatedBookmarkID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("AssociatedBookmarkID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_specialFolderID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SpecialFolderID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_changeType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_modifiedAttributes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ModifiedAttributes"));

  bookmarks = self->_bookmarks;
  if (bookmarks)
  {
    -[NSArray valueForKey:](bookmarks, "valueForKey:", CFSTR("dictionaryRepresentationForInMemoryChangeTracking"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("Bookmarks"));

  }
  bookmark = self->_bookmark;
  if (bookmark)
  {
    -[WebBookmark dictionaryRepresentationForInMemoryChangeTracking](bookmark, "dictionaryRepresentationForInMemoryChangeTracking");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("AssociatedBookmark"));

  }
  return (NSDictionary *)v3;
}

- (void)_setModifiedAttributesIfSupported
{
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 8))
    self->_modifiedAttributes |= 8uLL;
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 1))
    self->_modifiedAttributes |= 1uLL;
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 2))
    self->_modifiedAttributes |= 2uLL;
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 512))
    self->_modifiedAttributes |= 0x200uLL;
}

- (BOOL)attributesMarkedAsModify:(unint64_t)a3
{
  return (a3 & ~self->_modifiedAttributes) == 0;
}

- (BOOL)shouldSync
{
  return -[WebBookmark identifier](self->_bookmark, "identifier") != 0x7FFFFFFF
      && -[WebBookmark isSyncable](self->_bookmark, "isSyncable");
}

- (void)updateChangeAfterUpdatingInMemoryID:(int)a3 withDatabaseID:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (self->_parentID == a3)
  {
    self->_parentID = a4;
    -[WebBookmark _setParentID:](self->_bookmark, "_setParentID:", *(_QWORD *)&a4);
  }
  else if (self->_associatedBookmarkID == a3)
  {
    self->_associatedBookmarkID = a4;
  }
  else if (-[WebBookmark lastSelectedChildID](self->_bookmark, "lastSelectedChildID") == a3)
  {
    -[WebBookmark setLastSelectedChildID:](self->_bookmark, "setLastSelectedChildID:", v4);
  }
}

- (id)_stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4)
    return CFSTR("Delete");
  else
    return off_24CB31D88[a3 - 2];
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t bookmarkID;
  uint64_t v7;
  void *v8;
  uint64_t specialFolderID;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[WebBookmarkChange _stringForType:](self, "_stringForType:", self->_changeType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bookmarkID = self->_bookmarkID;
  -[WebBookmark title](self->_bookmark, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  specialFolderID = self->_specialFolderID;
  if (!(_DWORD)specialFolderID)
    specialFolderID = self->_parentID;
  LODWORD(v10) = self->_associatedBookmarkID;
  if ((_DWORD)v10 == 0x7FFFFFFF)
    v10 = 0;
  else
    v10 = v10;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type = %@; bookmark = %d %@; parent = %d; associated bookmark = %d;>"),
    v4,
    self,
    v5,
    bookmarkID,
    v7,
    specialFolderID,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (int)bookmarkID
{
  return self->_bookmarkID;
}

- (void)setBookmarkID:(int)a3
{
  self->_bookmarkID = a3;
}

- (int)parentID
{
  return self->_parentID;
}

- (void)setParentID:(int)a3
{
  self->_parentID = a3;
}

- (int)associatedBookmarkID
{
  return self->_associatedBookmarkID;
}

- (void)setAssociatedBookmarkID:(int)a3
{
  self->_associatedBookmarkID = a3;
}

- (int)specialFolderID
{
  return self->_specialFolderID;
}

- (void)setSpecialFolderID:(int)a3
{
  self->_specialFolderID = a3;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (unint64_t)modifiedAttributes
{
  return self->_modifiedAttributes;
}

- (void)setModifiedAttributes:(unint64_t)a3
{
  self->_modifiedAttributes = a3;
}

- (NSArray)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

@end
