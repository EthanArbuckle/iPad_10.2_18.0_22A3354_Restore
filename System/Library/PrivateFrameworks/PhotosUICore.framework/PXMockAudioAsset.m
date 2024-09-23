@implementation PXMockAudioAsset

- (PXMockAudioAsset)initWithConfiguration:(id)a3
{
  void (**v4)(id, PXMockAudioAsset *);
  PXMockAudioAsset *v5;

  v4 = (void (**)(id, PXMockAudioAsset *))a3;
  v5 = -[PXMockAudioAsset init](self, "init");
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (PXMockAudioAsset)init
{
  PXMockAudioAsset *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *artistName;
  uint64_t v10;
  NSString *albumTitle;
  uint64_t v12;
  Class audioSessionClass;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXMockAudioAsset;
  v2 = -[PXMockAudioAsset init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Mock Song %@"), v2->_identifier);
    title = v2->_title;
    v2->_title = (NSString *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Mock Artist %@"), v2->_identifier);
    artistName = v2->_artistName;
    v2->_artistName = (NSString *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Mock Album %@"), v2->_identifier);
    albumTitle = v2->_albumTitle;
    v2->_albumTitle = (NSString *)v10;

    v2->_pace = 2;
    objc_opt_class();
    v12 = objc_claimAutoreleasedReturnValue();
    audioSessionClass = v2->_audioSessionClass;
    v2->_audioSessionClass = (Class)v12;

    v2->_flags = 0;
  }
  return v2;
}

- (BOOL)isAudioEqualToAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "catalog") == 1)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMockAudioAsset identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)assetTagsDescription
{
  return (NSString *)&stru_1E5149688;
}

- (PXDisplayAsset)artworkDisplayAsset
{
  return 0;
}

- (id)artworkURLForTargetPixelSize:(CGSize)a3
{
  double height;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  height = a3.height;
  *(float *)&a3.width = a3.width;
  *(float *)&a3.width = floorf(*(float *)&a3.width);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = height;
  *(float *)&v8 = floorf(v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXMockAudioAsset artworkURLFormat](self, "artworkURLFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{h}"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (Class)defaultMediaProviderClass
{
  return 0;
}

- (int64_t)catalog
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)artworkURLFormat
{
  return self->_artworkURLFormat;
}

- (void)setArtworkURLFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (NSString)colorGradeCategory
{
  return self->_colorGradeCategory;
}

- (void)setColorGradeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)pace
{
  return self->_pace;
}

- (void)setPace:(int64_t)a3
{
  self->_pace = a3;
}

- (Class)audioSessionClass
{
  return self->_audioSessionClass;
}

- (void)setAudioSessionClass:(Class)a3
{
  objc_storeStrong((id *)&self->_audioSessionClass, a3);
}

- (NSArray)entryPoints
{
  return self->_entryPoints;
}

- (void)setEntryPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exportableDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setExportableDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_exportableDuration.epoch = a3->var3;
  *(_OWORD *)&self->_exportableDuration.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPoints, 0);
  objc_storeStrong((id *)&self->_audioSessionClass, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artworkURLFormat, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int64_t)px_storyResourceKind
{
  return 2;
}

@end
