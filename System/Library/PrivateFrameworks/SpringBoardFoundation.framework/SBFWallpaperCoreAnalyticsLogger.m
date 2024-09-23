@implementation SBFWallpaperCoreAnalyticsLogger

- (SBFWallpaperCoreAnalyticsLogger)init
{
  id v3;
  SBFWallpaperCoreAnalyticsLogger *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D652A8]);
  v4 = -[SBFWallpaperCoreAnalyticsLogger initWithWallpaperDefaultsDomain:](self, "initWithWallpaperDefaultsDomain:", v3);

  return v4;
}

- (SBFWallpaperCoreAnalyticsLogger)initWithWallpaperDefaultsDomain:(id)a3
{
  id v5;
  SBFWallpaperCoreAnalyticsLogger *v6;
  SBFWallpaperCoreAnalyticsLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFWallpaperCoreAnalyticsLogger;
  v6 = -[SBFWallpaperCoreAnalyticsLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wallpaperDefaultsDomain, a3);

  return v7;
}

- (unint64_t)ageOfWallpaper
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  -[PBUIWallpaperDefaultsDomain dateWallpaperLastChanged](self->_wallpaperDefaultsDomain, "dateWallpaperLastChanged");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D48]);
    v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v2, v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "day");

  }
  else
  {
    v7 = 1;
  }
  v8 = 0;
  v9 = 8u;
  v10 = 365;
  while (v7 >= *(_QWORD *)((char *)&unk_18AC15950 + v9))
  {
    v9 += 8;
    v8 += 0x100000000;
    if (v9 == 56)
      goto LABEL_9;
  }
  v10 = *(_QWORD *)((char *)&unk_18AC15950 + (v8 >> 29));
LABEL_9:

  return v10;
}

- (void)saveStateOfWallpaperToCoreAnalytics:(int64_t)a3 withHasVideo:(BOOL)a4 hasProcedural:(BOOL)a5 name:(id)a6
{
  _BOOL4 v8;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  __CFString *v15;
  NSString *lockType;
  NSString *homeType;
  id v18;

  v8 = a4;
  v18 = a6;
  v11 = objc_msgSend(v18, "length");
  v12 = v11;
  v13 = CFSTR("UserPhoto");
  if (v8)
  {
    v13 = CFSTR("UserIris");
    v14 = CFSTR("PreCannedIris");
  }
  else
  {
    v14 = CFSTR("PreCannedPhoto");
  }
  if (v11)
    v13 = v14;
  if (a5)
    v15 = CFSTR("Procedural");
  else
    v15 = (__CFString *)v13;
  if (-[__CFString length](v15, "length"))
  {
    if ((a3 & 1) != 0)
    {
      lockType = self->_lockType;
      self->_lockType = &v15->isa;

    }
    if ((a3 & 2) != 0)
    {
      homeType = self->_homeType;
      self->_homeType = &v15->isa;

    }
  }
  if (v12 && objc_msgSend(v18, "length"))
  {
    if ((a3 & 1) != 0)
      objc_storeStrong((id *)&self->_lockName, a6);
    if ((a3 & 2) != 0)
      objc_storeStrong((id *)&self->_homeName, a6);
  }
  if ((a3 & 1) != 0)
    self->_irisEnabled = v8;
  self->_sharedWallpaper = a3 == 3;

}

- (void)sendStateOfWallpaperToCoreAnalytics
{
  AnalyticsSendEventLazy();
}

id __70__SBFWallpaperCoreAnalyticsLogger_sendStateOfWallpaperToCoreAnalytics__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("irisEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("irisPlayCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "irisWallpaperPlayCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = CFSTR("shared");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "length"))
  {
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("homeType"));

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "length"))
  {
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("lockType"));

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "length"))
  {
    v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("homeName"));

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "length"))
  {
    v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("lockName"));

  }
  return v6;
}

- (void)setAgeOfWallpaper:(unint64_t)a3
{
  self->_ageOfWallpaper = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_lockType, 0);
  objc_storeStrong((id *)&self->_homeType, 0);
  objc_storeStrong((id *)&self->_wallpaperDefaultsDomain, 0);
}

@end
