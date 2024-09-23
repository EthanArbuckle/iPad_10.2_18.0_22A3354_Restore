@implementation PXAppleMusicAsset

- (PXAppleMusicAsset)initWithConfiguration:(id)a3
{
  void (**v4)(id, PXAppleMusicAsset *);
  PXAppleMusicAsset *v5;
  objc_super v7;

  v4 = (void (**)(id, PXAppleMusicAsset *))a3;
  v7.receiver = self;
  v7.super_class = (Class)PXAppleMusicAsset;
  v5 = -[PXAppleMusicAsset init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (PXAppleMusicAsset)initWithMediaItem:(id)a3
{
  id v4;
  id v5;
  PXAppleMusicAsset *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__PXAppleMusicAsset_initWithMediaItem___block_invoke;
  v8[3] = &unk_1E512F978;
  v9 = v4;
  v5 = v4;
  v6 = -[PXAppleMusicAsset initWithConfiguration:](self, "initWithConfiguration:", v8);

  return v6;
}

- (PXAppleMusicAsset)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicAsset.m"), 91, CFSTR("%s is not available as initializer"), "-[PXAppleMusicAsset init]");

  abort();
}

- (BOOL)isAudioEqualToAsset:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  BOOL v8;
  uint64_t v9;

  v4 = a3;
  -[PXAppleMusicAsset identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
LABEL_5:
    v9 = objc_msgSend(v4, "catalog");
    v8 = v9 == -[PXAppleMusicAsset catalog](self, "catalog");
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PXAppleMusicAsset *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PXAppleMusicAsset *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXAppleMusicAsset identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAppleMusicAsset identifier](self, "identifier");
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

- (Class)audioSessionClass
{
  return (Class)objc_opt_class();
}

- (NSString)colorGradeCategory
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *colorGradeCategory;

  if (!self->_colorGradeCategory)
  {
    -[PXAppleMusicAsset valence](self, "valence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[PXAppleMusicAsset energy](self, "energy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[PXAppleMusicAsset valence](self, "valence");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "doubleValue");

        -[PXAppleMusicAsset energy](self, "energy");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "doubleValue");

        PFStoryColorGradeCategoryFromValenceArousal();
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        colorGradeCategory = self->_colorGradeCategory;
        self->_colorGradeCategory = v8;

      }
    }
  }
  return self->_colorGradeCategory;
}

- (int64_t)pace
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[PXAppleMusicAsset visualTempo](self, "visualTempo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 2;
  objc_msgSend(MEMORY[0x1E0D752A0], "standardConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAppleMusicAsset visualTempo](self, "visualTempo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");

  v6 = PFStoryRecipeSongPaceFromVisualTempo();
  return v6;
}

- (NSString)assetTagsDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXAppleMusicAsset valence](self, "valence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("valence=%.2f"), v5);

  -[PXAppleMusicAsset energy](self, "energy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR(",arousal=%.2f"), v7);

  -[PXAppleMusicAsset visualTempo](self, "visualTempo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR(",visualTempo=%.2f"), v9);

  return (NSString *)v3;
}

- (void)configureCuesWithVideoEventTimestampsInSeconds:(id)a3 videoEventScores:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  PXConcreteAudioCueSource *v12;
  id v13;
  PXAudioCueSource *v14;
  PXAudioCueSource *cueSource;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicAsset.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoEventTimestampsInSeconds.count == videoEventScores.count"));

  }
  v10 = v8;
  v11 = objc_msgSend(v10, "count");
  v12 = [PXConcreteAudioCueSource alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__PXAppleMusicAsset_configureCuesWithVideoEventTimestampsInSeconds_videoEventScores___block_invoke;
  v18[3] = &unk_1E5119888;
  v20 = v10;
  v21 = v11;
  v19 = v7;
  v17 = v10;
  v13 = v7;
  v14 = -[PXConcreteAudioCueSource initWithNumberOfCues:configuration:](v12, "initWithNumberOfCues:configuration:", v11, v18);
  cueSource = self->_cueSource;
  self->_cueSource = v14;

}

- (PXDisplayAsset)artworkDisplayAsset
{
  return (PXDisplayAsset *)-[PXAppleMusicArtworkAsset initWithMusicAsset:]([PXAppleMusicArtworkAsset alloc], "initWithMusicAsset:", self);
}

- (id)artworkURLForTargetPixelSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  PXAppleMusicAsset *v20;
  uint64_t v21;

  height = a3.height;
  width = a3.width;
  v21 = *MEMORY[0x1E0C80C00];
  -[PXAppleMusicAsset artworkURLFormat](self, "artworkURLFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    *(float *)&v7 = width;
    *(float *)&v7 = floorf(*(float *)&v7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = height;
    *(float *)&v11 = floorf(v10);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{h}"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLStoryGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138412290;
      v20 = self;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEBUG, "%@ was asked for an artwork URL, but the required URL format string is missing.", (uint8_t *)&v19, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (Class)defaultMediaProviderClass
{
  return (Class)objc_opt_class();
}

- (int64_t)catalog
{
  return 2;
}

- (PXAudioAsset)previewAudioAsset
{
  return (PXAudioAsset *)-[PXAppleMusicPreviewAsset initWithOriginalAsset:]([PXAppleMusicPreviewAsset alloc], "initWithOriginalAsset:", self);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exportableDuration
{
  return +[PXAppleMusicPreviewAsset previewClipDuration](PXAppleMusicPreviewAsset, "previewClipDuration");
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (void)setDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSNumber)energy
{
  return self->_energy;
}

- (void)setEnergy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)valence
{
  return self->_valence;
}

- (void)setValence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)visualTempo
{
  return self->_visualTempo;
}

- (void)setVisualTempo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setColorGradeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)songURL
{
  return self->_songURL;
}

- (void)setSongURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)introPreviewURL
{
  return self->_introPreviewURL;
}

- (void)setIntroPreviewURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)loudnessMainPeak
{
  return self->_loudnessMainPeak;
}

- (void)setLoudnessMainPeak:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)loudnessMainValue
{
  return self->_loudnessMainValue;
}

- (void)setLoudnessMainValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- (NSArray)entryPoints
{
  return self->_entryPoints;
}

- (void)setEntryPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_entryPoints, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_loudnessMainValue, 0);
  objc_storeStrong((id *)&self->_loudnessMainPeak, 0);
  objc_storeStrong((id *)&self->_introPreviewURL, 0);
  objc_storeStrong((id *)&self->_songURL, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_visualTempo, 0);
  objc_storeStrong((id *)&self->_valence, 0);
  objc_storeStrong((id *)&self->_energy, 0);
  objc_storeStrong((id *)&self->_artworkURLFormat, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __85__PXAppleMusicAsset_configureCuesWithVideoEventTimestampsInSeconds_videoEventScores___block_invoke(uint64_t a1, CMTime *a2)
{
  id v4;
  unint64_t v5;
  void *v6;
  float v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  CMTime v11;

  v4 = *(id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 48))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      CMTimeMakeWithSeconds(&v11, v7, PXAudioDefaultCMTimeScale);
      *a2 = v11;

      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "intValue");

      if (v9 >= 0x384)
        v10 = 0;
      else
        v10 = 3;
      if (v9 < 0x2BC)
        v10 = 4;
      if (v9 < 0x1F4)
        v10 = 2;
      if ((int)v9 < 300)
        v10 = 1;
      a2[1].value = v10;
      ++v5;
      a2 = (CMTime *)((char *)a2 + 32);
    }
    while (v5 < *(_QWORD *)(a1 + 48));
  }

}

void __39__PXAppleMusicAsset_initWithMediaItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  Float64 v10;
  CMTime v11;
  CMTime v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CC1EE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStoreID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CC1FD8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CC1D98]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArtistName:", v6);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CC1D88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlbumTitle:", v7);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CC1EE0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v10 <= 0.0)
    v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  else
    CMTimeMakeWithSeconds(&v12, v10, PXAudioDefaultCMTimeScale);
  v11 = v12;
  objc_msgSend(v3, "setDuration:", &v11);
  objc_msgSend(v3, "setFlags:", objc_msgSend(*(id *)(a1 + 32), "isExplicitItem"));
  objc_msgSend(v3, "setArtworkURLFormat:", 0);
  objc_msgSend(v3, "setSongURL:", 0);
  objc_msgSend(v3, "setIntroPreviewURL:", 0);
  objc_msgSend(v3, "setVisualTempo:", 0);
  objc_msgSend(v3, "setLoudnessMainPeak:", 0);
  objc_msgSend(v3, "setLoudnessMainValue:", 0);

}

- (int64_t)px_storyResourceKind
{
  return 2;
}

@end
