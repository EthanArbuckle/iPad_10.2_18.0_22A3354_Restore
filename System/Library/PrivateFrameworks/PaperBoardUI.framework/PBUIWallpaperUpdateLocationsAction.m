@implementation PBUIWallpaperUpdateLocationsAction

- (PBUIWallpaperUpdateLocationsAction)initWithLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 responder:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PBUIWallpaperUpdateLocationsAction *v13;
  objc_super v15;

  v8 = (objc_class *)MEMORY[0x1E0D017D0];
  v9 = a5;
  v10 = objc_alloc_init(v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forSetting:", v11, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forSetting:", v12, 2);

  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperUpdateLocationsAction;
  v13 = -[PBUIWallpaperUpdateLocationsAction initWithInfo:responder:](&v15, sel_initWithInfo_responder_, v10, v9);

  return v13;
}

- (int64_t)locations
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PBUIWallpaperUpdateLocationsAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)wallpaperMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PBUIWallpaperUpdateLocationsAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("wallpaperMode");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("locations");
  else
    return (id)v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (a5 == 2)
  {
    PBUIStringForWallpaperMode(objc_msgSend(v6, "integerValue"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    PBUIStringForWallpaperLocations(objc_msgSend(v6, "integerValue"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_7:

  return v9;
}

@end
