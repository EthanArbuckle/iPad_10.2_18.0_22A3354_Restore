@implementation SBFWallpaperAggdLogger

- (SBFWallpaperAggdLogger)init
{
  SBFWallpaperAggdLogger *v2;
  PBUIWallpaperDefaultsDomain *v3;
  PBUIWallpaperDefaultsDomain *wallpaperDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFWallpaperAggdLogger;
  v2 = -[SBFWallpaperAggdLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = (PBUIWallpaperDefaultsDomain *)objc_alloc_init(MEMORY[0x1E0D652A8]);
    wallpaperDefaults = v2->_wallpaperDefaults;
    v2->_wallpaperDefaults = v3;

    -[SBFWallpaperAggdLogger _clearAggdKeysForLocations:](v2, "_clearAggdKeysForLocations:", 3);
  }
  return v2;
}

- (void)updateWallpaperAggdKeysForLocations:(int64_t)a3 withHasVideo:(BOOL)a4 hasProcedural:(BOOL)a5 name:(id)a6
{
  _BOOL4 v7;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  id v14;

  v7 = a4;
  v14 = a6;
  -[SBFWallpaperAggdLogger _clearAggdKeysForLocations:](self, "_clearAggdKeysForLocations:", a3);
  v10 = objc_msgSend(v14, "length");
  v11 = 1;
  if (v7)
    v11 = 2;
  v12 = 3;
  if (v7)
    v12 = 4;
  if (v10)
    v11 = v12;
  if (a5)
    v11 = 0;
  if ((a3 & 1) != 0)
  {
    self->_aggd_lockscreenWallpaperType = v11;
    if ((a3 & 2) == 0)
    {
LABEL_11:
      if (!v10)
        goto LABEL_20;
      goto LABEL_15;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_aggd_homescreenWallpaperType = v11;
  if (!v10)
    goto LABEL_20;
LABEL_15:
  v13 = objc_msgSend(v14, "integerValue");
  if ((v13 & 0x8000000000000000) == 0)
  {
    if ((a3 & 1) != 0)
      self->_aggd_lockscreenWallpaperIdentifier = v13;
    if ((a3 & 2) != 0)
      self->_aggd_homescreenWallpaperIdentifier = v13;
  }
LABEL_20:
  if ((a3 & 1) != 0)
    self->_aggd_irisWallpaperEnabled = v7;
  self->_aggd_sharedWallpaper = a3 == 3;

}

- (void)saveWallpaperAggdCurrentValues
{
  if ((self->_aggd_lockscreenWallpaperType & 0x8000000000000000) == 0)
    ADClientSetValueForScalarKey();
  if ((self->_aggd_lockscreenWallpaperIdentifier & 0x8000000000000000) == 0)
    ADClientSetValueForScalarKey();
  if ((self->_aggd_homescreenWallpaperType & 0x8000000000000000) == 0)
    ADClientSetValueForScalarKey();
  if ((self->_aggd_lockscreenWallpaperIdentifier & 0x8000000000000000) == 0)
    ADClientSetValueForScalarKey();
  if ((self->_aggd_irisWallpaperEnabled & 0x8000000000000000) == 0)
    ADClientSetValueForScalarKey();
  if ((self->_aggd_sharedWallpaper & 0x8000000000000000) == 0)
    ADClientSetValueForScalarKey();
}

- (void)incrementIrisPlayCount
{
  uint64_t v3;
  void *v4;
  int v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  -[PBUIWallpaperDefaultsDomain dateIrisWallpaperLastPlayed](self->_wallpaperDefaults, "dateIrisWallpaperLastPlayed");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PBUIWallpaperDefaultsDomain irisWallpaperPlayCount](self->_wallpaperDefaults, "irisWallpaperPlayCount");
  if (v11
    && (objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isDateInToday:", v11),
        v4,
        v5))
  {
    v6 = v3 + 1;
    v7 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = 1;
    v7 = (id)v8;
  }
  v12 = v7;
  -[PBUIWallpaperDefaultsDomain setDateIrisWallpaperLastPlayed:](self->_wallpaperDefaults, "setDateIrisWallpaperLastPlayed:");
  -[PBUIWallpaperDefaultsDomain setIrisWallpaperPlayCount:](self->_wallpaperDefaults, "setIrisWallpaperPlayCount:", v6);
  v9 = 0;
  v10 = 8u;
  do
  {
    if (*(_QWORD *)((char *)&buckets + v10) > v6)
      break;
    v9 += 0x100000000;
    v10 += 8;
  }
  while (v10 != 56);
  ADClientSetValueForScalarKey();

}

- (void)_clearAggdKeysForLocations:(int64_t)a3
{
  if ((a3 & 1) != 0)
  {
    self->_aggd_irisWallpaperEnabled = -1;
    self->_aggd_lockscreenWallpaperType = -1;
    self->_aggd_lockscreenWallpaperIdentifier = -1;
  }
  if ((a3 & 2) != 0)
  {
    self->_aggd_homescreenWallpaperType = -1;
    self->_aggd_homescreenWallpaperIdentifier = -1;
  }
  self->_aggd_sharedWallpaper = -1;
}

- (id)_valueString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld/%lld/%lld/%lld/%lld/%lld"), self->_aggd_lockscreenWallpaperType, self->_aggd_lockscreenWallpaperIdentifier, self->_aggd_homescreenWallpaperType, self->_aggd_homescreenWallpaperIdentifier, self->_aggd_irisWallpaperEnabled, self->_aggd_sharedWallpaper);
}

- (unint64_t)_bucketedPlayCount
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t result;

  v2 = -[PBUIWallpaperDefaultsDomain irisWallpaperPlayCount](self->_wallpaperDefaults, "irisWallpaperPlayCount");
  v3 = 0;
  v4 = 8u;
  result = 1000;
  while (*(_QWORD *)((char *)&buckets + v4) <= v2)
  {
    v3 += 0x100000000;
    v4 += 8;
    if (v4 == 56)
      return result;
  }
  return *(_QWORD *)((char *)&buckets + (v3 >> 29));
}

- (void)_resetPlayCountDate
{
  PBUIWallpaperDefaultsDomain *wallpaperDefaults;
  id v3;

  wallpaperDefaults = self->_wallpaperDefaults;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsDomain setDateIrisWallpaperLastPlayed:](wallpaperDefaults, "setDateIrisWallpaperLastPlayed:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperDefaults, 0);
}

@end
