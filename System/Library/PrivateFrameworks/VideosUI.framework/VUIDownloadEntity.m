@implementation VUIDownloadEntity

- (VUIDownloadEntity)initWithMediaEntity:(id)a3 withDownloadType:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  VUIDownloadEntity *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[VUIDownloadEntity initWithMediaEntities:withDownloadType:](self, "initWithMediaEntities:withDownloadType:", v8, a4, v11, v12);
  return v9;
}

- (VUIDownloadEntity)initWithMediaEntities:(id)a3 withDownloadType:(int64_t)a4
{
  id v6;
  VUIDownloadEntity *v7;
  VUIDownloadEntity *v8;
  NSMutableArray *v9;
  NSMutableArray *assetControllers;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIDownloadEntity;
  v7 = -[VUIDownloadEntity init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_downloadType = a4;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetControllers = v8->_assetControllers;
    v8->_assetControllers = v9;

    -[VUIDownloadEntity _configureWithMediaEntities:](v8, "_configureWithMediaEntities:", v6);
  }

  return v8;
}

- (NSNumber)numberOfMediaItemsDownloading
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSNumber *v13;
  NSNumber *numberOfMediaItemsDownloading;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_mediaEntities;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "assetController", (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "state");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "status") == 2)
        {

        }
        else
        {
          objc_msgSend(v9, "state");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "status");

          if (v12 != 1)
            goto LABEL_10;
        }
        v6 = (v6 + 1);
LABEL_10:

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v5)
        goto LABEL_14;
    }
  }
  v6 = 0;
LABEL_14:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  numberOfMediaItemsDownloading = self->_numberOfMediaItemsDownloading;
  self->_numberOfMediaItemsDownloading = v13;

  return self->_numberOfMediaItemsDownloading;
}

- (void)setMediaEntities:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[VUIDownloadEntity mediaEntities](self, "mediaEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = objc_msgSend(v4, "count");
  -[VUIDownloadEntity _configureWithMediaEntities:](self, "_configureWithMediaEntities:", v4);

  if (v6 != v7)
  {
    -[VUIDownloadEntity delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "downloadEntity:numberOfItemsDidChange:", self, v7);

  }
}

- (VUIMediaEntityIdentifier)identifier
{
  VUIMediaEntityIdentifier *identifier;
  VUIMediaEntityIdentifier *v4;
  void *v5;
  void *v6;
  VUIMediaEntityIdentifier *v7;
  VUIMediaEntityIdentifier *v8;

  identifier = self->_identifier;
  if (!identifier)
  {
    if (-[VUIDownloadEntity downloadType](self, "downloadType"))
    {
      -[VUIDownloadEntity showIdentifier](self, "showIdentifier");
      v4 = (VUIMediaEntityIdentifier *)objc_claimAutoreleasedReturnValue();
      v5 = self->_identifier;
      self->_identifier = v4;
    }
    else
    {
      -[VUIDownloadEntity mediaEntities](self, "mediaEntities");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "identifier");
      v7 = (VUIMediaEntityIdentifier *)objc_claimAutoreleasedReturnValue();
      v8 = self->_identifier;
      self->_identifier = v7;

    }
    identifier = self->_identifier;
  }
  return identifier;
}

- (VUIMediaEntityIdentifier)showIdentifier
{
  VUIMediaEntityIdentifier *showIdentifier;
  void *v4;
  void *v5;
  VUIMediaEntityIdentifier *v6;
  VUIMediaEntityIdentifier *v7;
  VUIMediaEntityIdentifier *v8;

  showIdentifier = self->_showIdentifier;
  if (!showIdentifier)
  {
    if (-[VUIDownloadEntity downloadType](self, "downloadType") != 1
      && -[VUIDownloadEntity downloadType](self, "downloadType") != 2)
    {
      v8 = 0;
      return v8;
    }
    -[VUIDownloadEntity mediaEntities](self, "mediaEntities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "showIdentifier");
    v6 = (VUIMediaEntityIdentifier *)objc_claimAutoreleasedReturnValue();
    v7 = self->_showIdentifier;
    self->_showIdentifier = v6;

    showIdentifier = self->_showIdentifier;
  }
  v8 = showIdentifier;
  return v8;
}

- (void)_configureWithMediaEntities:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("VUIMediaEntityAssetControllerStateDidChangeNotification"), 0);

  if (-[NSMutableArray count](self->_assetControllers, "count"))
    -[NSMutableArray removeAllObjects](self->_assetControllers, "removeAllObjects");
  objc_storeStrong((id *)&self->_mediaEntities, a3);
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(self->_downloadType)
  {
    case 0:
      objc_msgSend(v7, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadEntity setTitle:](self, "setTitle:", v9);

      -[VUIDownloadEntity setDownloadType:](self, "setDownloadType:", 0);
      objc_msgSend(v8, "releaseYear");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadEntity setReleaseYear:](self, "setReleaseYear:", v10);

      objc_msgSend(v8, "duration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadEntity setDuration:](self, "setDuration:", v11);

      goto LABEL_9;
    case 1:
      objc_msgSend(v7, "showTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadEntity setTitle:](self, "setTitle:", v12);

      -[VUIDownloadEntity setDownloadType:](self, "setDownloadType:", 1);
      goto LABEL_9;
    case 2:
      objc_msgSend(v7, "showTitle");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(v7, "title");
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v14 = (void *)v13;
      -[VUIDownloadEntity setTitle:](self, "setTitle:", v13);

      v15 = v8;
      objc_msgSend(v15, "episodeNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadEntity setEpisodeNumber:](self, "setEpisodeNumber:", v16);

      objc_msgSend(v15, "fractionalEpisodeNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadEntity setFractionalEpisodeNumber:](self, "setFractionalEpisodeNumber:", v17);

      objc_msgSend(v15, "duration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIDownloadEntity setDuration:](self, "setDuration:", v18);
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadEntity setNumberOfMediaItems:](self, "setNumberOfMediaItems:", v19);

      break;
    default:
      break;
  }
  if (-[VUIDownloadEntity downloadType](self, "downloadType") == 2
    || -[VUIDownloadEntity downloadType](self, "downloadType") == 1)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[VUIDownloadEntity mediaEntities](self, "mediaEntities", v8, v5, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v24), "assetController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            -[NSMutableArray addObject:](self->_assetControllers, "addObject:", v25);
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObserver:selector:name:object:", self, sel__assetControllerStateDidChange_, CFSTR("VUIMediaEntityAssetControllerStateDidChangeNotification"), v25);

          }
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

    v8 = v27;
    v5 = v28;
  }

}

- (void)_removeDeletedMediaItemInShowPageIfNeeded
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  VUIDownloadEntity *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[VUIDownloadEntity downloadType](self, "downloadType") == 1
    || -[VUIDownloadEntity downloadType](self, "downloadType") == 2)
  {
    v3 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = self;
    v4 = self->_mediaEntities;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v5)
      goto LABEL_16;
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "assetController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "state");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "status");

        if (v12)
        {
LABEL_9:
          objc_msgSend(v3, "addObject:", v9);
          goto LABEL_14;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v9;
          if (objc_msgSend(v13, "markedAsDeleted"))
          {

          }
          else
          {
            objc_msgSend(v13, "downloadExpirationDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
              goto LABEL_9;
          }
        }
LABEL_14:

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v6)
      {
LABEL_16:

        -[VUIDownloadEntity setMediaEntities:](v15, "setMediaEntities:", v3);
        return;
      }
    }
  }
}

- (void)_assetControllerStateDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "status");

  if (!v5)
    -[VUIDownloadEntity _removeDeletedMediaItemInShowPageIfNeeded](self, "_removeDeletedMediaItemInShowPageIfNeeded");
  -[VUIDownloadEntity delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VUIDownloadEntity numberOfMediaItemsDownloading](self, "numberOfMediaItemsDownloading");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "intValue"))
      -[VUIDownloadEntity setDownloadType:](self, "setDownloadType:", 1);
    objc_msgSend(v6, "downloadEntity:numberOfItemsDownloadingDidChange:", self, v7);

  }
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[VUIDownloadEntity downloadType](self, "downloadType");
  -[VUIDownloadEntity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ (2 * objc_msgSend(v4, "hash"));

  -[VUIDownloadEntity mediaEntities](self, "mediaEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ (8 * objc_msgSend(v6, "count"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VUIDownloadEntity *v4;
  VUIDownloadEntity *v5;
  VUIDownloadEntity *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  v4 = (VUIDownloadEntity *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUIDownloadEntity downloadType](self, "downloadType");
    if (v7 == -[VUIDownloadEntity downloadType](v6, "downloadType")
      && (-[VUIDownloadEntity identifier](self, "identifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          -[VUIDownloadEntity identifier](v6, "identifier"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqual:", v9),
          v9,
          v8,
          v10))
    {
      -[VUIDownloadEntity mediaEntities](self, "mediaEntities");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      -[VUIDownloadEntity mediaEntities](v6, "mediaEntities");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12 == objc_msgSend(v13, "count");

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (VUIDownloadEntityDelegate)delegate
{
  return (VUIDownloadEntityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)downloadType
{
  return self->_downloadType;
}

- (void)setDownloadType:(int64_t)a3
{
  self->_downloadType = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setShowIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_showIdentifier, a3);
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSNumber)releaseYear
{
  return self->_releaseYear;
}

- (void)setReleaseYear:(id)a3
{
  objc_storeStrong((id *)&self->_releaseYear, a3);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_episodeNumber, a3);
}

- (NSNumber)fractionalEpisodeNumber
{
  return self->_fractionalEpisodeNumber;
}

- (void)setFractionalEpisodeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_fractionalEpisodeNumber, a3);
}

- (NSNumber)numberOfMediaItems
{
  return self->_numberOfMediaItems;
}

- (void)setNumberOfMediaItems:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfMediaItems, a3);
}

- (void)setNumberOfMediaItemsDownloading:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfMediaItemsDownloading, a3);
}

- (NSMutableArray)assetControllers
{
  return self->_assetControllers;
}

- (void)setAssetControllers:(id)a3
{
  objc_storeStrong((id *)&self->_assetControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetControllers, 0);
  objc_storeStrong((id *)&self->_numberOfMediaItemsDownloading, 0);
  objc_storeStrong((id *)&self->_numberOfMediaItems, 0);
  objc_storeStrong((id *)&self->_fractionalEpisodeNumber, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_releaseYear, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaEntities, 0);
  objc_storeStrong((id *)&self->_showIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
