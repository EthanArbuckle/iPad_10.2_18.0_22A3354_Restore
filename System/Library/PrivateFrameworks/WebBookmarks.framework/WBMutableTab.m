@implementation WBMutableTab

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBMutableTab;
  v4 = -[WBTab copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->super._tabGroupUUID, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  *((_BYTE *)v4 + 24) = self->super._added;
  *((_BYTE *)v4 + 26) = self->super._moved;
  *((_BYTE *)v4 + 25) = self->super._modified;
  *((_BYTE *)v4 + 27) = self->super._inUnnamedTabGroup;
  *((_BYTE *)v4 + 28) = self->super._privateBrowsing;
  *((_BYTE *)v4 + 29) = self->super._shared;
  return v4;
}

- (void)_setPropertiesFromTabGroup:(id)a3
{
  NSString *v4;
  NSString *tabGroupUUID;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "uuid");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  tabGroupUUID = self->super._tabGroupUUID;
  self->super._tabGroupUUID = v4;

  self->super._privateBrowsing = objc_msgSend(v7, "isPrivateBrowsing");
  if ((objc_msgSend(v7, "isLocal") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v7, "isUnnamed");
  self->super._inUnnamedTabGroup = v6;
  self->super._shared = objc_msgSend(v7, "isShared");

}

- (void)setTabGroupUUID:(id)a3
{
  NSString *v4;
  NSString *tabGroupUUID;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    tabGroupUUID = self->super._tabGroupUUID;
    self->super._tabGroupUUID = v4;

  }
}

- (void)setShared:(BOOL)a3
{
  self->super._shared = a3;
}

- (void)setPrivateBrowsing:(BOOL)a3
{
  self->super._privateBrowsing = a3;
}

- (void)setPinned:(BOOL)a3 title:(id)a4 url:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  WebBookmark *bookmark;
  void *v14;
  id v15;

  v6 = a3;
  v15 = a4;
  v8 = a5;
  if (-[WebBookmark isPinned](self->super._bookmark, "isPinned") == v6)
  {
    -[WebBookmark pinnedTitle](self->super._bookmark, "pinnedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((WBSIsEqual() & 1) != 0)
    {
      objc_msgSend(v8, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmark pinnedAddress](self->super._bookmark, "pinnedAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = WBSIsEqual();

      if ((v12 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
  }
  bookmark = self->super._bookmark;
  objc_msgSend(v8, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark setPinned:title:address:](bookmark, "setPinned:title:address:", v6, v15, v14);

  self->super._modified = 1;
LABEL_7:

}

- (void)setMoved:(BOOL)a3
{
  self->super._moved = a3;
}

- (void)setModified:(BOOL)a3
{
  self->super._modified = a3;
}

- (void)setInUnnamedTabGroup:(BOOL)a3
{
  self->super._inUnnamedTabGroup = a3;
}

- (void)didInsertIntoTabGroup:(id)a3
{
  id v4;

  v4 = a3;
  -[WBMutableTab setAdded:](self, "setAdded:", 1);
  -[WBMutableTab setSyncable:](self, "setSyncable:", objc_msgSend(v4, "isSyncable"));
  -[WBMutableTab _setPropertiesFromTabGroup:](self, "_setPropertiesFromTabGroup:", v4);

}

- (void)setAdded:(BOOL)a3
{
  self->super._added = a3;
}

- (void)setSyncable:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[WebBookmark isInserted](self->super._bookmark, "isInserted"))
    -[WebBookmark _setSyncable:](self->super._bookmark, "_setSyncable:", v3);
}

- (void)markClean
{
  self->super._added = 0;
  self->super._moved = 0;
  self->super._modified = 0;
}

- (void)setUrl:(id)a3
{
  id v4;

  v4 = a3;
  -[WBMutableTab setLocalURL:](self, "setLocalURL:", v4);
  -[WBMutableTab setSyncableURL:](self, "setSyncableURL:", v4);

}

- (NSURL)localURL
{
  void *v2;
  void *v3;
  void *v4;

  -[WebBookmark extraAttributes](self->super._bookmark, "extraAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LocalURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (void)setLocalURL:(id)a3
{
  -[WBMutableTab setURL:shouldSync:](self, "setURL:shouldSync:", a3, 0);
}

- (void)setSyncableURL:(id)a3
{
  -[WBMutableTab setURL:shouldSync:](self, "setURL:shouldSync:", a3, 1);
}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[WBMutableTab setLocalTitle:](self, "setLocalTitle:", v4);
  -[WBMutableTab setSyncableTitle:](self, "setSyncableTitle:", v4);

}

- (NSString)localTitle
{
  void *v2;
  void *v3;

  -[WebBookmark extraAttributes](self->super._bookmark, "extraAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LocalTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocalTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[WBMutableTab localTitle](self, "localTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    self->super._modified = 1;
    -[WebBookmark setExtraAttributesValue:forKey:](self->super._bookmark, "setExtraAttributesValue:forKey:", v6, CFSTR("LocalTitle"));
  }

}

- (NSString)syncableTitle
{
  return -[WebBookmark title](self->super._bookmark, "title");
}

- (void)setSyncableTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[WBMutableTab syncableTitle](self, "syncableTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    self->super._modified = 1;
    -[WebBookmark setTitle:](self->super._bookmark, "setTitle:", v6);
  }

}

- (void)setLocalAttributes:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WebBookmark *bookmark;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark localAttributes](self->super._bookmark, "localAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBSIsEqual();

  if ((v6 & 1) == 0)
  {
    self->super._modified = 1;
    objc_msgSend(v14, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setLocalAttributes:](self->super._bookmark, "setLocalAttributes:", v7);

    objc_msgSend(v14, "lastVisitTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WebBookmark dateLastViewed](self->super._bookmark, "dateLastViewed");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastVisitTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      bookmark = self->super._bookmark;
      if (v9)
      {
        -[WebBookmark dateLastViewed](bookmark, "dateLastViewed");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "laterDate:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WebBookmark setTabDateLastViewed:](self->super._bookmark, "setTabDateLastViewed:", v13);

      }
      else
      {
        -[WebBookmark setTabDateLastViewed:](bookmark, "setTabDateLastViewed:", v10);
      }

    }
  }

}

- (void)setSyncPosition:(id)a3
{
  -[WebBookmark setSyncPosition:](self->super._bookmark, "setSyncPosition:", a3);
}

- (void)setOrderIndex:(int)a3
{
  -[WebBookmark _setOrderIndex:](self->super._bookmark, "_setOrderIndex:", *(_QWORD *)&a3);
}

- (void)adoptAttributesFromTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "localAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBMutableTab setLocalAttributes:](self, "setLocalAttributes:", v5);

  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBMutableTab setTitle:](self, "setTitle:", v6);

  objc_msgSend(v4, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBMutableTab setUrl:](self, "setUrl:", v7);

  v8 = objc_msgSend(v4, "isPinned");
  objc_msgSend(v4, "pinnedTitle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinnedURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBMutableTab setPinned:title:url:](self, "setPinned:title:url:", v8, v10, v9);
}

- (void)didRemoveFromTabGroup
{
  -[WBMutableTab setTabGroupUUID:](self, "setTabGroupUUID:", 0);
  -[WBMutableTab setPrivateBrowsing:](self, "setPrivateBrowsing:", 0);
  -[WBMutableTab setInUnnamedTabGroup:](self, "setInUnnamedTabGroup:", 0);
  -[WBMutableTab setShared:](self, "setShared:", 0);
}

- (void)markAsRead
{
  -[WebBookmark markAsRead](self->super._bookmark, "markAsRead");
}

- (void)mergeWithTab:(id)a3
{
  WBMutableTab *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  WBMutableTab *v15;
  void *v16;
  WebBookmark *bookmark;
  void *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = (WBMutableTab *)a3;
  -[WBTab bookmark](v4, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WebBookmark labelField](self->super._bookmark, "labelField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "generation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "compare:", v7);

    v11 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10 == -1)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Adopting other tab's local title and URL", buf, 2u);
      }
      -[WBMutableTab localTitle](v4, "localTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBMutableTab setLocalTitle:](self, "setLocalTitle:", v16);

      -[WBMutableTab localURL](v4, "localURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self;
    }
    else
    {
      if (v12)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Using tab's local title and URL", v19, 2u);
      }
      -[WBMutableTab localTitle](self, "localTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBMutableTab setLocalTitle:](v4, "setLocalTitle:", v13);

      -[WBMutableTab localURL](self, "localURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v4;
    }
    -[WBMutableTab setLocalURL:](v15, "setLocalURL:", v14);

  }
  bookmark = self->super._bookmark;
  -[WBTab bookmark](v4, "bookmark");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark mergeWithBookmark:](bookmark, "mergeWithBookmark:", v18);

}

@end
