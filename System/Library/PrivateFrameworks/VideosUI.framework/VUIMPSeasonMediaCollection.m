@implementation VUIMPSeasonMediaCollection

- (VUIMPSeasonMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 requestedProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  VUIMPSeasonMediaCollection *v14;
  VUIMPSeasonMediaCollection *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaItemCollection"));
    if (v10)
      goto LABEL_4;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
  if (!v9)
    goto LABEL_7;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("requestedProperties"));
LABEL_4:
  objc_msgSend(v9, "representativeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMPSeasonMediaCollectionIdentifier seasonIdentifierWithMediaItem:](VUIMPSeasonMediaCollectionIdentifier, "seasonIdentifierWithMediaItem:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    VUIMPSeasonMediaCollectionKind();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)VUIMPSeasonMediaCollection;
    v14 = -[VUIMPMediaCollection initWithMediaLibrary:mediaItemCollection:identifier:requestedProperties:kind:](&v17, sel_initWithMediaLibrary_mediaItemCollection_identifier_requestedProperties_kind_, v8, v9, v12, v10, v13);

    self = v14;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VUIMPSeasonMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 identifier:(id)a5 requestedProperties:(id)a6 kind:(id)a7
{
  void *v8;
  uint64_t v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "raise:format:", v9, CFSTR("The %@ initializer is not available."), v10);

  return 0;
}

@end
