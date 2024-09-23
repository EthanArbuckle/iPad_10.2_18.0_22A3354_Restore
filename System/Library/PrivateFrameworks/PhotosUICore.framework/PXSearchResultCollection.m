@implementation PXSearchResultCollection

- (PXSearchResultCollection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultCollection.m"), 28, CFSTR("%s is not available as initializer"), "-[PXSearchResultCollection init]");

  abort();
}

- (PXSearchResultCollection)initWithTitle:(id)a3 subtitle:(id)a4 assetCount:(unint64_t)a5 collectionUUID:(id)a6 thumbnailAssetUUID:(id)a7 startDate:(id)a8 endDate:(id)a9 subtype:(unint64_t)a10
{
  id v16;
  id v17;
  __CFString *v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;
  PXSearchResultCollection *v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  unint64_t v29;
  id v30;
  id v31;
  PXSearchResultCollection *v32;
  id v33;
  NSObject *v34;
  PXSearchResultCollection *v35;
  uint64_t v36;
  NSString *title;
  uint64_t v38;
  NSString *subtitle;
  uint64_t v40;
  NSString *collectionUUID;
  uint64_t v42;
  NSString *thumbnailAssetUUID;
  uint64_t v44;
  NSString *identifier;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v58;
  objc_super v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  __CFString *v65;
  __int16 v66;
  unint64_t v67;
  uint64_t v68;

  v16 = a9;
  v68 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = (__CFString *)a4;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v58 = a9;
  if (v17)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = v21;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultCollection.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

    v21 = v47;
    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v49 = v21;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultCollection.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionUUID"));

  v21 = v49;
LABEL_3:
  v22 = a10;
  if (v20)
  {
    if (a10)
      goto LABEL_5;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = v21;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultCollection.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtype"));

    v21 = v55;
    if (a5)
      goto LABEL_9;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v54 = v21;
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultCollection.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailAssetUUID"));

  v21 = v54;
  if (!a10)
    goto LABEL_23;
LABEL_5:
  if (a5)
    goto LABEL_9;
LABEL_6:
  v23 = a8;
  v24 = self;
  v25 = v21;
  PLPhotosSearchGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    v61 = v19;
    v62 = 2112;
    v63 = v17;
    v64 = 2112;
    v65 = v18;
    v66 = 2048;
    v67 = a10;
    _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "PXSearchResultCollection Initialization: Search result collection asset count is 0 with uuid:%@, title: %@, subtitle: %@, subtype: %ld", buf, 0x2Au);
  }

  v21 = v25;
  self = v24;
  a8 = v23;
  v16 = a9;
LABEL_9:
  if (objc_msgSend(v19, "length"))
  {
    if (v18)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = v21;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultCollection.m"), 48, CFSTR("Search result collection UUID string is empty with title: %@, subtitle: %@, subtype: %ld"), v17, v18, a10);

    v21 = v56;
    if (v18)
      goto LABEL_17;
  }
  if (v21 && v58)
  {
    v18 = 0;
  }
  else
  {
    v27 = v20;
    v28 = v17;
    v29 = a5;
    v30 = v16;
    v31 = a8;
    v32 = self;
    v33 = v21;
    PLPhotosSearchGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v19;
      _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_ERROR, "PXSearchResultCollection Initialization: No subtitle string or dates were provided for collection UUID: %@", buf, 0xCu);
    }

    v18 = &stru_1E5149688;
    v21 = v33;
    self = v32;
    a8 = v31;
    v16 = v30;
    a5 = v29;
    v17 = v28;
    v20 = v27;
    v22 = a10;
  }
LABEL_17:
  v59.receiver = self;
  v59.super_class = (Class)PXSearchResultCollection;
  v35 = -[PXSearchResultCollection init](&v59, sel_init);
  if (v35)
  {
    v36 = objc_msgSend(v17, "copy");
    title = v35->_title;
    v35->_title = (NSString *)v36;

    v38 = -[__CFString copy](v18, "copy");
    subtitle = v35->_subtitle;
    v35->_subtitle = (NSString *)v38;

    v35->_assetCount = a5;
    v40 = objc_msgSend(v19, "copy");
    collectionUUID = v35->_collectionUUID;
    v35->_collectionUUID = (NSString *)v40;

    v42 = objc_msgSend(v20, "copy");
    thumbnailAssetUUID = v35->_thumbnailAssetUUID;
    v35->_thumbnailAssetUUID = (NSString *)v42;

    v35->_subtype = v22;
    objc_storeStrong((id *)&v35->_startDate, a8);
    objc_storeStrong((id *)&v35->_endDate, v16);
    v44 = objc_msgSend(v19, "copy");
    identifier = v35->_identifier;
    v35->_identifier = (NSString *)v44;

    v35->_type = 2;
  }

  return v35;
}

- (NSString)subtitle
{
  NSString *subtitle;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  subtitle = self->_subtitle;
  if (!subtitle)
  {
    +[PXSearchResultCollection _dateIntervalFormatter](PXSearchResultCollection, "_dateIntervalFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultCollection startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultCollection endDate](self, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:toDate:", v5, v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_subtitle;
    self->_subtitle = v7;

    subtitle = self->_subtitle;
  }
  return subtitle;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXSearchResultCollection identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXSearchResultCollection *v4;
  PXSearchResultCollection *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXSearchResultCollection *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXSearchResultCollection identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchResultCollection identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  -[PXSearchResultCollection identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PXSearchResultCollection type](self, "type");
  -[PXSearchResultCollection title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultCollection subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXSearchResultCollection assetCount](self, "assetCount");
  v7 = -[PXSearchResultCollection subtype](self, "subtype");
  -[PXSearchResultCollection collectionUUID](self, "collectionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultCollection thumbnailAssetUUID](self, "thumbnailAssetUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultCollection startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultCollection endDate](self, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, type: %ld, title: %@, subtitle: %@, assetCount: %ld, subtype: %ld, collectionUUID: %@thumbnailAssetUUID: %@startDate: %@endDate: %@>"), v15, self, v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)collectionUUID
{
  return self->_collectionUUID;
}

- (void)setCollectionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (NSString)thumbnailAssetUUID
{
  return self->_thumbnailAssetUUID;
}

- (void)setThumbnailAssetUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (void)setAssetCount:(unint64_t)a3
{
  self->_assetCount = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_thumbnailAssetUUID, 0);
  objc_storeStrong((id *)&self->_collectionUUID, 0);
}

+ (id)_dateIntervalFormatter
{
  if (_dateIntervalFormatter_onceToken != -1)
    dispatch_once(&_dateIntervalFormatter_onceToken, &__block_literal_global_168581);
  return (id)_dateIntervalFormatter_dateIntervalFormatter;
}

uint64_t __50__PXSearchResultCollection__dateIntervalFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3590]);
  v1 = (void *)_dateIntervalFormatter_dateIntervalFormatter;
  _dateIntervalFormatter_dateIntervalFormatter = (uint64_t)v0;

  objc_msgSend((id)_dateIntervalFormatter_dateIntervalFormatter, "setDateStyle:", 2);
  return objc_msgSend((id)_dateIntervalFormatter_dateIntervalFormatter, "setTimeStyle:", 0);
}

@end
