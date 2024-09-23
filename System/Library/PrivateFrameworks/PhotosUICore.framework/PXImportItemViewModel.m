@implementation PXImportItemViewModel

- (PXImportItemViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportItemViewModel.m"), 43, CFSTR("%s is not available as initializer"), "-[PXImportItemViewModel init]");

  abort();
}

- (PXImportItemViewModel)initWithImportAsset:(id)a3
{
  id v5;
  PXImportItemViewModel *v6;
  PXImportItemViewModel *v7;
  NSString *kind;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXImportItemViewModel;
  v6 = -[PXImportItemViewModel init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_importAsset, a3);
    v7->_duplicate = objc_msgSend(v5, "isDuplicate");
    v7->_selectable = 1;
    kind = v7->_kind;
    v7->_kind = (NSString *)CFSTR("PXImportItemViewModelKindAsset");

  }
  return v7;
}

- (PXImportItemViewModel)initWithKind:(id)a3 selectable:(BOOL)a4
{
  id v7;
  PXImportItemViewModel *v8;
  PXImportItemViewModel *v9;

  v7 = a3;
  v8 = -[PXImportItemViewModel initWithImportAsset:](self, "initWithImportAsset:", 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_kind, a3);
    v9->_selectable = a4;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXImportItemViewModel fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p file: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqualToImportItemViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PXImportItemViewModel uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    -[PXImportItemViewModel kind](self, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PXImportItemViewModel *v4;
  BOOL v5;

  v4 = (PXImportItemViewModel *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PXImportItemViewModel isEqualToImportItemViewModel:](self, "isEqualToImportItemViewModel:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXImportItemViewModel uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isMediaAsset
{
  void *v2;
  BOOL v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isNotYetImported
{
  BOOL v3;
  void *v4;

  if (-[PXImportItemViewModel isDuplicate](self, "isDuplicate"))
    return 0;
  -[PXImportItemViewModel importDate](self, "importDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = 0;
  else
    v3 = -[PXImportItemViewModel isMediaAsset](self, "isMediaAsset");

  return v3;
}

- (NSString)debugDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = CFSTR("(+R)");
  }
  else
  {
    objc_msgSend(v2, "videoComplement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v5 = CFSTR("(+M)");
    }
    else
    {
      objc_msgSend(v2, "audioAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = CFSTR("(+A)");
      if (!v7)
        v5 = &stru_1E5149688;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)uniformTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int64_t)badgeType
{
  void *v4;

  if (-[PXImportItemViewModel state](self, "state") == 1)
    return 2;
  if (-[PXImportItemViewModel isSelected](self, "isSelected"))
    return 1;
  if (-[PXImportItemViewModel state](self, "state") == 3)
    return 4;
  -[PXImportItemViewModel importDate](self, "importDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 3;
  else
    return 0;
}

- (BOOL)isPanoramicImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  void *v9;
  char v10;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exifPixelSize");
  v5 = v4;
  v7 = v6;

  v8 = objc_msgSend((id)objc_opt_class(), "hasPanoramaImageDimensions:", v5, v7);
  if (v8)
  {
    -[PXImportItemViewModel importAsset](self, "importAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isImage");

    LOBYTE(v8) = v10;
  }
  return v8;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXImportItemViewModel;
  -[PXImportItemViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setSelected:(BOOL)a3
{
  uint64_t v3;

  if (self->_selected != a3)
  {
    self->_selected = a3;
    if (a3)
      v3 = 1;
    else
      v3 = 2;
    -[PXImportItemViewModel signalChange:](self, "signalChange:", v3);
  }
}

- (void)setSelectable:(BOOL)a3
{
  void *v6;

  if (self->_selectable != a3)
  {
    if (!a3 && -[PXImportItemViewModel isSelected](self, "isSelected"))
    {
      if (-[PXImportItemViewModel isSelected](self, "isSelected"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportItemViewModel.m"), 220, CFSTR("Attemping to mark import view model as unselectable while it is selected."));

      }
    }
    self->_selectable = a3;
    -[PXImportItemViewModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setDuplicate:(BOOL)a3
{
  if (self->_duplicate != a3)
    self->_duplicate = a3;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXImportItemViewModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)addImageRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[PXImportItemViewModel imageRepresentationsBySize](self, "imageRepresentationsBySize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      -[PXImportItemViewModel setImageRepresentationsBySize:](self, "setImageRepresentationsBySize:", v6);

    }
    -[PXImportItemViewModel imageRepresentationsBySize](self, "imageRepresentationsBySize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "sizeType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v8);

  }
  -[PXImportItemViewModel signalChange:](self, "signalChange:", 256);
}

- (void)setImportDate:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_importDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_importDate, a3);
    -[PXImportItemViewModel signalChange:](self, "signalChange:", 32);
  }

}

- (void)setDeleteSession:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_deleteSession, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_deleteSession, a3);
    -[PXImportItemViewModel signalChange:](self, "signalChange:", 64);
  }

}

- (void)setIsDeleted:(BOOL)a3
{
  if (self->_isDeleted != a3)
  {
    self->_isDeleted = a3;
    -[PXImportItemViewModel signalChange:](self, "signalChange:", 128);
  }
}

- (NSDictionary)imageRepresentations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXImportItemViewModel imageRepresentationsBySize](self, "imageRepresentationsBySize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99D80];
    -[PXImportItemViewModel imageRepresentationsBySize](self, "imageRepresentationsBySize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
  return (NSDictionary *)v6;
}

- (id)assetDataRequestForRequestSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PXImportItemViewModel assetRequestsBySize](self, "assetRequestsBySize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAssetDataRequest:(id)a3 forRequestSize:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a3;
  -[PXImportItemViewModel assetRequestsBySize](self, "assetRequestsBySize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportItemViewModel setAssetRequestsBySize:](self, "setAssetRequestsBySize:", v9);

  }
  -[PXImportItemViewModel assetRequestsBySize](self, "assetRequestsBySize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportItemViewModel.m"), 296, CFSTR("Overwriting an existing asset data request with new one"));

  }
  -[PXImportItemViewModel assetRequestsBySize](self, "assetRequestsBySize");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, v13);

}

- (void)removeAssetDataRequestForRequestSize:(unint64_t)a3
{
  void *v4;
  id v5;

  -[PXImportItemViewModel assetRequestsBySize](self, "assetRequestsBySize");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v4);

}

- (id)thumbnailRequestsForRequestSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXImportItemViewModel thumbnailRequestsBySize](self, "thumbnailRequestsBySize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (void)addThumbnailRequest:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PXImportItemViewModel thumbnailRequestsBySize](self, "thumbnailRequestsBySize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportItemViewModel setThumbnailRequestsBySize:](self, "setThumbnailRequestsBySize:", v5);

  }
  v6 = objc_msgSend(v12, "requestSize");
  -[PXImportItemViewModel thumbnailRequestsBySize](self, "thumbnailRequestsBySize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportItemViewModel thumbnailRequestsBySize](self, "thumbnailRequestsBySize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  objc_msgSend(v9, "addObject:", v12);

}

- (void)removeThumbnailRequest:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "requestSize");
  -[PXImportItemViewModel thumbnailRequestsBySize](self, "thumbnailRequestsBySize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "removeObject:", v8);

}

- (NSString)fileName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PHImportAsset createdFileName](self->_importAsset, "createdFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PHImportAsset fileName](self->_importAsset, "fileName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSDate)fileCreationDate
{
  return (NSDate *)-[PHImportAsset fileCreationDate](self->_importAsset, "fileCreationDate");
}

- (id)groupIdentifier
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString **p_collectionIdentifier;
  NSObject *v15;
  NSString *v16;
  NSString *v17;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  PXImportItemViewModel *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[PXImportItemViewModel isDuplicate](self, "isDuplicate"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v5 = (void *)v4;
    goto LABEL_13;
  }
  +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "groupItemsByEXIFDate");

  if (v7)
  {
    -[PXImportItemViewModel importAsset](self, "importAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "creationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      _importGridLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315394;
        v21 = "-[PXImportItemViewModel groupIdentifier]";
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "%s: import asset does not have an EXIF date. Resorting to file creation date. %@", (uint8_t *)&v20, 0x16u);
      }

      -[PXImportItemViewModel fileCreationDate](self, "fileCreationDate");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
  else
  {
    -[PXImportItemViewModel fileCreationDate](self, "fileCreationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      _importGridLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315394;
        v21 = "-[PXImportItemViewModel groupIdentifier]";
        v22 = 2112;
        v23 = self;
        _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "%s: import asset does not have a file creation date (stable). Resorting to image date (possibly unstable). %@", (uint8_t *)&v20, 0x16u);
      }

      -[PXImportItemViewModel importAsset](self, "importAsset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "creationDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_13:
  objc_msgSend((id)objc_opt_class(), "dateFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    p_collectionIdentifier = &self->_collectionIdentifier;
    if (!self->_collectionIdentifier)
    {
LABEL_20:
      objc_storeStrong((id *)p_collectionIdentifier, v13);
      v16 = *p_collectionIdentifier;
      goto LABEL_21;
    }
    if ((objc_msgSend(v13, "isEqualToString:") & 1) == 0)
    {
      _importGridLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315394;
        v21 = "-[PXImportItemViewModel groupIdentifier]";
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "%s: *** warning*** model collection identifier has changed. %@", (uint8_t *)&v20, 0x16u);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportItemViewModel.m"), 420, CFSTR("Unable to create a group identifier because a date for the asset could not be determined."));

    p_collectionIdentifier = &self->_collectionIdentifier;
  }
  v16 = *p_collectionIdentifier;
  if (!*p_collectionIdentifier)
    goto LABEL_20;
LABEL_21:
  v17 = v16;

  return v17;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_opt_new();
  PLLocalizedFrameworkString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileCreationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXImportItemViewModel kind](self, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PXImportItemViewModelKindExpansionPlaceholder"));

  if ((v8 & 1) != 0)
    goto LABEL_4;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isImage");

  if ((v10 & 1) != 0
    || (-[PXImportItemViewModel importAsset](self, "importAsset"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isMovie"),
        v11,
        v12))
  {
LABEL_4:
    PLLocalizedFrameworkString();
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
  }
  objc_msgSend(v3, "appendString:", v4);
  objc_msgSend(v3, "appendString:", CFSTR("."));
  if (v6)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v6, 2, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@."), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v16);

  }
  -[PXImportItemViewModel importDate](self, "importDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    PLLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v18);

    objc_msgSend(v3, "appendString:", CFSTR("."));
  }
  if (-[PXImportItemViewModel isSelected](self, "isSelected"))
  {
    PLLocalizedFrameworkString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v19);

    objc_msgSend(v3, "appendString:", CFSTR("."));
  }
  v20 = (void *)objc_msgSend(v3, "copy");

  return v20;
}

- (PXImportDisplayDelegate)displayDelegate
{
  return (PXImportDisplayDelegate *)objc_loadWeakRetained((id *)&self->_displayDelegate);
}

- (void)setDisplayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_displayDelegate, a3);
}

- (PHImportAsset)importAsset
{
  return self->_importAsset;
}

- (PXImportAssetCollection)assetCollection
{
  return (PXImportAssetCollection *)objc_loadWeakRetained((id *)&self->_assetCollection);
}

- (void)setAssetCollection:(id)a3
{
  objc_storeWeak((id *)&self->_assetCollection, a3);
}

- (NSString)kind
{
  return self->_kind;
}

- (CGSize)largeThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_largeThumbnailSize.width;
  height = self->_largeThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLargeThumbnailSize:(CGSize)a3
{
  self->_largeThumbnailSize = a3;
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (PHImportAssetDataRequest)thumbnailRequest
{
  return (PHImportAssetDataRequest *)objc_loadWeakRetained((id *)&self->_thumbnailRequest);
}

- (void)setThumbnailRequest:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailRequest, a3);
}

- (NSError)thumbnailError
{
  return self->_thumbnailError;
}

- (void)setThumbnailError:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailError, a3);
}

- (double)imageProcessingStartTime
{
  return self->_imageProcessingStartTime;
}

- (void)setImageProcessingStartTime:(double)a3
{
  self->_imageProcessingStartTime = a3;
}

- (double)imageProcessingEndTime
{
  return self->_imageProcessingEndTime;
}

- (void)setImageProcessingEndTime:(double)a3
{
  self->_imageProcessingEndTime = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (BOOL)isDuplicate
{
  return self->_duplicate;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)thumbnailIndex
{
  return self->_thumbnailIndex;
}

- (NSDate)importDate
{
  return self->_importDate;
}

- (NSString)deleteSession
{
  return self->_deleteSession;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (NSMutableDictionary)imageRepresentationsBySize
{
  return self->_imageRepresentationsBySize;
}

- (void)setImageRepresentationsBySize:(id)a3
{
  objc_storeStrong((id *)&self->_imageRepresentationsBySize, a3);
}

- (NSMutableDictionary)assetRequestsBySize
{
  return self->_assetRequestsBySize;
}

- (void)setAssetRequestsBySize:(id)a3
{
  objc_storeStrong((id *)&self->_assetRequestsBySize, a3);
}

- (NSMutableDictionary)thumbnailRequestsBySize
{
  return self->_thumbnailRequestsBySize;
}

- (void)setThumbnailRequestsBySize:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailRequestsBySize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailRequestsBySize, 0);
  objc_storeStrong((id *)&self->_assetRequestsBySize, 0);
  objc_storeStrong((id *)&self->_imageRepresentationsBySize, 0);
  objc_storeStrong((id *)&self->_deleteSession, 0);
  objc_storeStrong((id *)&self->_importDate, 0);
  objc_storeStrong((id *)&self->_thumbnailError, 0);
  objc_destroyWeak((id *)&self->_thumbnailRequest);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_destroyWeak((id *)&self->_assetCollection);
  objc_storeStrong((id *)&self->_importAsset, 0);
  objc_destroyWeak((id *)&self->_displayDelegate);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

+ (id)importAssetsFromModels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "importAsset", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)hasPanoramaImageDimensions:(CGSize)a3
{
  double v4;

  if (a3.height == 0.0)
    return 0;
  v4 = a3.width / a3.height;
  return v4 < 0.5 || v4 > 2.0;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1)
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_82272);
  return (id)dateFormatter_formatter;
}

+ (NSString)alreadyImportedGroupIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PXImportItemViewModel_alreadyImportedGroupIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (alreadyImportedGroupIdentifier_onceToken != -1)
    dispatch_once(&alreadyImportedGroupIdentifier_onceToken, block);
  return (NSString *)(id)alreadyImportedGroupIdentifier_alreadyImportedIdentifier;
}

void __55__PXImportItemViewModel_alreadyImportedGroupIdentifier__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dateFormatter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringFromDate:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)alreadyImportedGroupIdentifier_alreadyImportedIdentifier;
  alreadyImportedGroupIdentifier_alreadyImportedIdentifier = v1;

}

uint64_t __38__PXImportItemViewModel_dateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dateFormatter_formatter;
  dateFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)dateFormatter_formatter, "setDateStyle:", 2);
  objc_msgSend((id)dateFormatter_formatter, "setTimeStyle:", 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)dateFormatter_formatter, "setLocale:", v2);

  return objc_msgSend((id)dateFormatter_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd"));
}

- (int64_t)mediaType
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAudio");

  if ((v4 & 1) != 0)
    return 3;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMovie");

  if (v7)
    return 2;
  else
    return 1;
}

- (unint64_t)mediaSubtypes
{
  void *v3;
  int v4;
  unint64_t v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;

  if (-[PXImportItemViewModel mediaType](self, "mediaType") == 1)
  {
    -[PXImportItemViewModel importAsset](self, "importAsset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHDR");

    if (v4)
      v5 = 2;
    else
      v5 = 0;
    -[PXImportItemViewModel importAsset](self, "importAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLivePhoto");

    v8 = v5 | 8;
  }
  else
  {
    if (-[PXImportItemViewModel mediaType](self, "mediaType") != 2)
      return 0;
    -[PXImportItemViewModel importAsset](self, "importAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSloMo");

    if (v10)
      v5 = 0x20000;
    else
      v5 = 0;
    -[PXImportItemViewModel importAsset](self, "importAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "isTimelapse");

    v8 = v5 | 0x40000;
  }
  if (v7)
    return v8;
  else
    return v5;
}

- (NSDate)creationDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PXImportItemViewModel importAsset](self, "importAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileCreationDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)v6;
}

- (NSDate)localCreationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(v6, "secondsFromGMTForDate:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDate *)v7;
}

- (BOOL)isFavorite
{
  return 0;
}

- (BOOL)representsBurst
{
  return 0;
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (unint64_t)pixelWidth
{
  void *v2;
  double v3;
  unint64_t v4;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exifPixelSize");
  v4 = (unint64_t)v3;

  return v4;
}

- (unint64_t)pixelHeight
{
  void *v2;
  double v3;
  unint64_t v4;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exifPixelSize");
  v4 = (unint64_t)v3;

  return v4;
}

- (CGRect)preferredCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)acceptableCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)faceAreaRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (float)audioScore
{
  return 0.0;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (int64_t)isContentEqualTo:(id)a3
{
  PXImportItemViewModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (PXImportItemViewModel *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self != v4)
    {
      -[PXImportItemViewModel uuid](v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[PXImportItemViewModel uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", v9))
      {
        v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
      -[PXImportItemViewModel creationDate](v4, "creationDate");
      v10 = objc_claimAutoreleasedReturnValue();
      -[PXImportItemViewModel creationDate](self, "creationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && v10)
      {
        -[PXImportItemViewModel creationDate](self, "creationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "compare:", v10);

        if (!v14)
        {
          v15 = 2;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {

      }
      -[PXImportItemViewModel creationDate](self, "creationDate");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16 | v10;

      if (v17)
        v15 = 1;
      else
        v15 = 2;
      goto LABEL_16;
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }
LABEL_18:

  return v15;
}

- (double)duration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isImage") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[PXImportItemViewModel importAsset](self, "importAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "durationTimeInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  return v7;
}

- (int64_t)playbackStyle
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMovie");

  if ((v4 & 1) != 0)
    return 4;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLivePhoto");

  if (v7)
    return 3;
  else
    return 1;
}

- (unsigned)playbackVariation
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isAutoloop") & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isMirror") & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isLongExposure"))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)aspectRatio
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double result;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orientedPixelSize");
  v4 = v3;
  v6 = v5;

  result = v4 / v6;
  if (v4 / v6 == 0.0)
    return 1.0;
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orientedPixelSize");

  PXRectWithAspectRatioFittingRect();
  PXRectNormalize();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isLivePhoto
{
  return 0;
}

- (BOOL)canPlayPhotoIris
{
  return (-[PXImportItemViewModel mediaSubtypes](self, "mediaSubtypes") >> 3) & 1;
}

- (BOOL)isPhotoIrisPlaceholder
{
  return 0;
}

- (BOOL)canPlayLoopingVideo
{
  return (~-[PXImportItemViewModel playbackStyle](self, "playbackStyle") & 5) == 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (BOOL)isAnimatedImage
{
  return 0;
}

- (id)modificationDate
{
  return 0;
}

- (NSString)localizedGeoDescription
{
  return 0;
}

- (BOOL)isTemporaryPlaceholder
{
  return 0;
}

- (BOOL)hasPhotoColorAdjustments
{
  return 0;
}

- (BOOL)isGuestAsset
{
  return 0;
}

- (int64_t)originalFilesize
{
  void *v2;
  int64_t v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileSize");

  return v3;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (BOOL)px_isImage
{
  void *v2;
  char v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isImage");

  return v3;
}

- (BOOL)px_isAudio
{
  void *v2;
  char v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAudio");

  return v3;
}

- (BOOL)px_isVideo
{
  void *v2;
  char v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMovie");

  return v3;
}

- (unint64_t)px_type
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  int v25;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isJPEG");

  if ((v4 & 1) != 0)
    return 0;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHEIF");

  if ((v7 & 1) != 0)
    return 1;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRAW");

  if ((v9 & 1) != 0)
    return 2;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isGIF");

  if ((v11 & 1) != 0)
    return 3;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPNG");

  if ((v13 & 1) != 0)
    return 4;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isTIFF");

  if ((v15 & 1) != 0)
    return 5;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isPDF");

  if ((v17 & 1) != 0)
    return 6;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isPSD");

  if ((v19 & 1) != 0)
    return 7;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isJPEG2000");

  if ((v21 & 1) != 0)
    return 8;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isAudio");

  if ((v23 & 1) != 0)
    return 9;
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isMovie");

  if (v25)
    return 10;
  else
    return 12;
}

- (unint64_t)px_fileType
{
  return +[PXMetadataUtilities fileTypeForItem:type:](PXMetadataUtilities, "fileTypeForItem:type:", self, -[PXImportItemViewModel px_type](self, "px_type"));
}

- (unint64_t)px_originalFileType
{
  return +[PXMetadataUtilities fileTypeForItem:type:](PXMetadataUtilities, "fileTypeForItem:type:", self, -[PXImportItemViewModel px_originalType](self, "px_originalType"));
}

- (NSString)px_title
{
  return 0;
}

- (NSString)px_assetDescription
{
  return 0;
}

- (BOOL)px_isExtendedPropertiesProcessed
{
  return 1;
}

- (NSNumber)px_filesize
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "fileSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSDate)px_creationDate
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSTimeZone)px_timeZone
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTimeZone *)v3;
}

- (PXIntSize_st)px_resolution
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  PXIntSize_st result;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exifPixelSize");
  v4 = v3;
  v6 = v5;

  v7 = llround(v4);
  v8 = llround(v6);
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (NSString)px_uniformTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (CLLocation)px_originalLocation
{
  return 0;
}

- (NSString)px_burstUUID
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "burstUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)px_supportsImageProperties
{
  void *v2;
  char v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isImage");

  return v3;
}

- (BOOL)ipx_isFavorite
{
  return 0;
}

- (BOOL)px_isInTrash
{
  return 0;
}

- (BOOL)px_isHidden
{
  return 0;
}

- (BOOL)px_hasKeywords
{
  return 0;
}

- (unsigned)px_fetchCloudLocalState
{
  return 0;
}

- (NSNumber)px_duration
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "durationTimeInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_FPS
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_bitRate
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bitrate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_sampleRate
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleRate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)px_codec
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "codec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)px_aperture
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_exposureBias
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exposureBias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_flash
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flashFired");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_focalLength
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focalLength");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_focalLengthIn35mm
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focalLengthIn35mm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_digitalZoomRatio
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "digitalZoomRatio");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_ISORating
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focalLength");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)px_lensModel
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lensModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)px_make
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraMake");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)px_model
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)px_formattedCameraModel
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedCameraModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)px_meteringMode
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meteringMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_shutterSpeed
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exposureTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)px_whiteBalance
{
  void *v2;
  void *v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "whiteBalance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (unsigned)px_audioTrackFormat
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (id)px_localizedGeoDescriptionForRTL:(BOOL)a3
{
  return 0;
}

- (BOOL)px_canUseLocation
{
  return 0;
}

- (BOOL)px_reverseLocationDataIsValid
{
  return 0;
}

- (BOOL)px_isLivePhoto
{
  void *v2;
  char v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLivePhoto");

  return v3;
}

- (BOOL)px_isTimelapse
{
  void *v2;
  char v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTimelapse");

  return v3;
}

- (BOOL)px_isSloMo
{
  void *v2;
  char v3;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSloMo");

  return v3;
}

- (BOOL)px_representsBurst
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[PXImportItemViewModel importAsset](self, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "burstPick");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportItemViewModel importAsset](self, "importAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  return v8;
}

- (BOOL)px_isDepthEffect
{
  return 0;
}

- (BOOL)px_isActionModeVideo
{
  return 0;
}

- (BOOL)px_isSpatialMedia
{
  return 0;
}

- (BOOL)px_isPanorama
{
  return 0;
}

- (BOOL)px_isSelfie
{
  return 0;
}

- (BOOL)px_isScreenshot
{
  return 0;
}

- (BOOL)px_isScreenRecording
{
  return 0;
}

- (BOOL)px_shotWithNightMode
{
  return 0;
}

- (BOOL)px_isCinematicVideo
{
  return 0;
}

- (BOOL)px_isProRes
{
  return 0;
}

- (BOOL)px_isH264
{
  return 0;
}

- (BOOL)px_isHEVC
{
  return 0;
}

- (NSNumber)px_semanticStylePreset
{
  return 0;
}

@end
