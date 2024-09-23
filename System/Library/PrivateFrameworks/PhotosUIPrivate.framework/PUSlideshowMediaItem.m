@implementation PUSlideshowMediaItem

- (id)_initWithType:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowMediaItem;
  result = -[PUSlideshowMediaItem init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 3) = a3;
  return result;
}

- (PUSlideshowMediaItem)init
{
  return (PUSlideshowMediaItem *)-[PUSlideshowMediaItem _initWithType:](self, "_initWithType:", 0);
}

- (id)initWitPreset:(id)a3
{
  id v6;
  id *v7;
  id *v8;
  void *v10;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowMediaItem.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preset"));

  }
  v7 = -[PUSlideshowMediaItem _initWithType:](self, "_initWithType:", 2);
  v8 = v7;
  if (v7)
    objc_storeStrong(v7 + 2, a3);

  return v8;
}

- (id)initWitMediaItem:(id)a3
{
  id v6;
  id *v7;
  id *v8;
  void *v10;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowMediaItem.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaItem"));

  }
  v7 = -[PUSlideshowMediaItem _initWithType:](self, "_initWithType:", 1);
  v8 = v7;
  if (v7)
    objc_storeStrong(v7 + 1, a3);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[PUSlideshowMediaItem audioURL](self, "audioURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (-[PUSlideshowMediaItem audioURL](self, "audioURL"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "audioURL"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      -[PUSlideshowMediaItem uniqueIdentifier](self, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", v12))
      {
        -[PUSlideshowMediaItem localizedName](self, "localizedName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedName");
        v17 = v4;
        v14 = v3;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqualToString:", v15);

        v3 = v14;
        v4 = v17;

      }
      else
      {
        v10 = 0;
      }

      if (v8 == v9)
        goto LABEL_11;
    }
    else
    {
      v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PUSlideshowMediaItem audioURL](self, "audioURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[PUSlideshowMediaItem uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ (1739761 * v4);

  -[PUSlideshowMediaItem localizedName](self, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ (1319 * v6);

  return v8;
}

- (NSURL)audioURL
{
  int64_t type;
  void *v3;
  void *v4;

  type = self->_type;
  if (type == 1)
  {
    -[MPMediaItem assetURL](self->_mediaItem, "assetURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (type == 2)
  {
    -[OKProducerPreset audioURLs](self->_preset, "audioURLs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSURL *)v4;
}

- (NSString)uniqueIdentifier
{
  int64_t type;
  __CFString *v3;
  void *v4;
  void *v5;

  type = self->_type;
  if (type == 2)
  {
    -[OKProducerPreset uniqueIdentifier](self->_preset, "uniqueIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (type == 1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MPMediaItem persistentID](self->_mediaItem, "persistentID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (type)
  {
    v3 = 0;
  }
  else
  {
    v3 = CFSTR("PUSlideshowMediaItemNoneUniqueIdentifier");
  }
  return (NSString *)v3;
}

- (NSString)localizedName
{
  int64_t type;
  void *v3;

  type = self->_type;
  if (type == 2)
  {
    -[OKProducerPreset localizedName](self->_preset, "localizedName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (type == 1)
  {
    -[MPMediaItem title](self->_mediaItem, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (type)
  {
    v3 = 0;
  }
  else
  {
    PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_MUSIC_NONE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preset, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

+ (id)mediaItemsForOKThemes
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  PUSlideshowMediaItem *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getOKProducerPresetsManagerClass(), "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v3 = (_QWORD *)getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr;
  v24 = getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr;
  if (!getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr)
  {
    v4 = SlideshowKitLibrary();
    v3 = dlsym(v4, "kOKProducerPresetsFamilyPhotosPhone");
    v22[3] = (uint64_t)v3;
    getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v21, 8);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkOKProducerPresetsFamilyPhotosPhone(void)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PUSlideshowMediaItem.m"), 20, CFSTR("%s"), dlerror());

    __break(1u);
  }
  objc_msgSend(v2, "presetsForFamily:", *v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PUSlideshowMediaItem);
  objc_msgSend(v6, "addObject:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = -[PUSlideshowMediaItem initWitPreset:]([PUSlideshowMediaItem alloc], "initWitPreset:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  return v13;
}

+ (id)mediaItemForType:(int64_t)a3 uniqueIdentifier:(id)a4
{
  id v5;
  void *v6;
  PUSlideshowMediaItem *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  if (a3 == 2)
  {
    objc_msgSend(getOKProducerPresetsManagerClass(), "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presetForUniqueIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v7 = -[PUSlideshowMediaItem initWitPreset:]([PUSlideshowMediaItem alloc], "initWitPreset:", v9);
    else
      v7 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v5, *MEMORY[0x1E0CC1ED0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0CC2438]);
    objc_msgSend(v10, "addFilterPredicate:", v9);
    objc_msgSend(v10, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v7 = -[PUSlideshowMediaItem initWitMediaItem:]([PUSlideshowMediaItem alloc], "initWitMediaItem:", v12);
    else
      v7 = 0;

    goto LABEL_15;
  }
  if (a3 || !objc_msgSend(v5, "isEqualToString:", CFSTR("PUSlideshowMediaItemNoneUniqueIdentifier")))
  {
LABEL_7:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = objc_alloc_init(PUSlideshowMediaItem);
LABEL_16:

  return v7;
}

@end
