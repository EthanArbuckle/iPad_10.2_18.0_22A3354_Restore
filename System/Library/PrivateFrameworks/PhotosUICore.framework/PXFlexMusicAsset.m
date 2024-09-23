@implementation PXFlexMusicAsset

- (BOOL)isEqual:(id)a3
{
  PXFlexMusicAsset *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PXFlexMusicAsset *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXFlexMusicAsset identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFlexMusicAsset identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
        v7 = 1;
      else
        v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isAudioEqualToAsset:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  BOOL v8;
  CMTime v10;
  CMTime time1;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXFlexMusicAsset identifier](self, "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {

    }
    else
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if (!v7)
      {
        v8 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[PXFlexMusicAsset targetDuration](self, "targetDuration");
    if (v4)
      objc_msgSend(v4, "targetDuration");
    else
      memset(&v10, 0, sizeof(v10));
    v8 = CMTimeCompare(&time1, &v10) == 0;
    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (PXFlexMusicAsset)initWithConfiguration:(id)a3
{
  void (**v4)(id, PXFlexMusicAsset *);
  PXFlexMusicAsset *v5;
  objc_super v7;

  v4 = (void (**)(id, PXFlexMusicAsset *))a3;
  v7.receiver = self;
  v7.super_class = (Class)PXFlexMusicAsset;
  v5 = -[PXFlexMusicAsset init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (unint64_t)flags
{
  return 2;
}

- (Class)audioSessionClass
{
  return (Class)objc_opt_class();
}

- (PXDisplayAsset)artworkDisplayAsset
{
  return (PXDisplayAsset *)-[PXFlexMusicArtworkAsset initWithAudioAsset:]([PXFlexMusicArtworkAsset alloc], "initWithAudioAsset:", self);
}

- (Class)defaultMediaProviderClass
{
  return (Class)objc_opt_class();
}

- (int64_t)catalog
{
  return 4;
}

- (NSArray)entryPoints
{
  return 0;
}

- (PXFlexMusicAsset)assetWithTargetDuration:(id *)a3
{
  PXFlexMusicAsset *v5;
  _QWORD v7[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v5 = [PXFlexMusicAsset alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PXFlexMusicAsset_assetWithTargetDuration___block_invoke;
  v7[3] = &unk_1E5115960;
  v7[4] = self;
  v8 = *a3;
  return -[PXFlexMusicAsset initWithConfiguration:](v5, "initWithConfiguration:", v7);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
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

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void)setTargetDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_targetDuration.epoch = a3->var3;
  *(_OWORD *)&self->_targetDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void)setDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (NSString)assetTagsDescription
{
  return self->_assetTagsDescription;
}

- (void)setAssetTagsDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_assetTagsDescription, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __44__PXFlexMusicAsset_assetWithTargetDuration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(*(id *)(a1 + 32), "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtistName:", v6);

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v7);

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v8);

  objc_msgSend(*(id *)(a1 + 32), "assetTagsDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setAssetTagsDescription:", v10);

  objc_msgSend(*(id *)(a1 + 32), "colorGradeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setColorGradeCategory:", v12);

  objc_msgSend(v4, "setPace:", objc_msgSend(*(id *)(a1 + 32), "pace"));
  objc_msgSend(v4, "setFlags:", objc_msgSend(*(id *)(a1 + 32), "flags"));
  v13 = *(_OWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "setTargetDuration:", &v13);

}

- (int64_t)px_storyResourceKind
{
  return 2;
}

@end
