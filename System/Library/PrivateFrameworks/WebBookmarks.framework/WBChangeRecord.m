@implementation WBChangeRecord

- (WBChangeRecord)initWithBookmarkCollection:(id)a3 bookmark:(id)a4 changeType:(int)a5 localRecordGeneration:(int64_t)a6
{
  id v11;
  id v12;
  WBChangeRecord *v13;
  WBChangeRecord *v14;
  WBChangeRecord *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBChangeRecord;
  v13 = -[WBChangeRecord init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_collection, a3);
    objc_storeStrong((id *)&v14->_bookmark, a4);
    v14->_changeType = a5;
    v14->_localRecordGeneration = a6;
    v15 = v14;
  }

  return v14;
}

- (id)_changeTypeDescription
{
  int changeType;
  const __CFString *v3;

  changeType = self->_changeType;
  if (changeType == 2)
    return CFSTR("Delete");
  if (changeType == 1)
  {
    v3 = CFSTR("Modify (isMove: YES)");
    if (!-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 64)
      && !-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 4))
    {
      return CFSTR("Modify (isMove: NO)");
    }
  }
  else if (changeType)
  {
    return 0;
  }
  else
  {
    return CFSTR("Add");
  }
  return (id)v3;
}

- (id)_changedAttributeDescription
{
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 1))
    objc_msgSend(v3, "addObject:", CFSTR("Title"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 32))
    objc_msgSend(v3, "addObject:", CFSTR("IsSelectedFavoritesFolder"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 16))
    objc_msgSend(v3, "addObject:", CFSTR("DateAdded"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 8))
    objc_msgSend(v3, "addObject:", CFSTR("DateLastViewed"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 128))
    objc_msgSend(v3, "addObject:", CFSTR("ImageURL"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 256))
    objc_msgSend(v3, "addObject:", CFSTR("PreviewText"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 2))
    objc_msgSend(v3, "addObject:", CFSTR("URL"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 512))
    objc_msgSend(v3, "addObject:", CFSTR("LastSelectedTab"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 4096))
    objc_msgSend(v3, "addObject:", CFSTR("SymbolImageName"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 0x40000))
    objc_msgSend(v3, "addObject:", CFSTR("CustomFavoritesFolderServerID"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 0x2000))
    objc_msgSend(v3, "addObject:", CFSTR("BackgroundImage"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 0x10000))
    objc_msgSend(v3, "addObject:", CFSTR("IsPinned"));
  if (-[WebBookmark attributesMarkedAsModified:](self->_bookmark, "attributesMarkedAsModified:", 0x200000))
    objc_msgSend(v3, "addObject:", CFSTR("ShowIconOnly"));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24CB35168;
  }

  return v4;
}

- (id)description
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[WebBookmark isFolder](self->_bookmark, "isFolder");
  v4 = CFSTR("Leaf");
  if (v3)
    v4 = CFSTR("Folder");
  v5 = v4;
  -[WBChangeRecord _changedAttributeDescription](self, "_changedAttributeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", Changed Attributes: %@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[WBChangeRecord _changeTypeDescription](self, "_changeTypeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WebBookmark identifier](self->_bookmark, "identifier");
  -[WebBookmark serverID](self->_bookmark, "serverID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wb_stringByRedactingBookmarkDAVServerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<BAChangeRecord: %p, Type: %@, Bookmark Type: %@, Bookmark ID: %d, Bookmark Sync Server ID: %@%@>"), self, v9, v5, v10, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (int)changeType
{
  return self->_changeType;
}

- (int64_t)localRecordGeneration
{
  return self->_localRecordGeneration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
