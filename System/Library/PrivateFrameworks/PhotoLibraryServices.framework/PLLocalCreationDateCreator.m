@implementation PLLocalCreationDateCreator

- (PLLocalCreationDateCreator)initWithTimeZoneLookup:(id)a3
{
  id v4;
  PLLocalCreationDateCreator *v5;
  PFTimeZoneLookup *v6;
  PFTimeZoneLookup *timeZoneLookup;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLLocalCreationDateCreator;
  v5 = -[PLLocalCreationDateCreator init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (PFTimeZoneLookup *)v4;
    else
      v6 = (PFTimeZoneLookup *)objc_alloc_init(MEMORY[0x1E0D752E8]);
    timeZoneLookup = v5->_timeZoneLookup;
    v5->_timeZoneLookup = v6;

  }
  return v5;
}

- (id)generateInferredTimeZoneOffsetForAsset:(id)a3
{
  id v4;
  void *v5;
  double latitude;
  double longitude;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  CLLocationCoordinate2D v35;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "utcDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  latitude = v35.latitude;
  longitude = v35.longitude;
  if (!CLLocationCoordinate2DIsValid(v35))
    goto LABEL_30;
  v8 = latitude != 0.0;
  if (longitude != 0.0)
    v8 = 1;
  if (!v8
    || (latitude == 40.0 ? (v9 = longitude == -100.0) : (v9 = 0),
        v9
     || (-[PFTimeZoneLookup timeZoneNameForCoordinate:](self->_timeZoneLookup, "timeZoneNameForCoordinate:", latitude, longitude), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0)))
  {
LABEL_30:
    objc_msgSend(v4, "rawTimeZoneName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_20;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", v10);
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "secondsFromGMTForDate:", v5);
  }
  else
  {
    objc_msgSend((id)_gmtTranslationDictionary, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      v13 = (uint64_t)(v16 * 3600.0);
    }
    else
    {
      PLMomentsGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v18;
        v30 = 2112;
        v31 = v5;
        v32 = 2112;
        v33 = v10;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "[LOCAL DATE] Could not find tz information for asset w/ uuid %{public}@, date %@, tz %@", (uint8_t *)&v28, 0x20u);

      }
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_20:
    objc_msgSend(v4, "rawTimeZoneOffsetValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_24;
    v20 = v19;
    v13 = objc_msgSend(v19, "integerValue");
    PLMomentsGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v22;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "[LOCAL DATE] Using timezone offset from database for asset w/ uuid %{public}@", (uint8_t *)&v28, 0xCu);

    }
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_24:
      objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v23, "secondsFromGMTForDate:", v5);
      PLMomentsGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v25;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "[LOCAL DATE] Using local timezone for asset w/ uuid %{public}@", (uint8_t *)&v28, 0xCu);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (PFTimeZoneLookup)timeZoneLookup
{
  return self->_timeZoneLookup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneLookup, 0);
}

+ (id)_gmtTranslationDictionary
{
  return &unk_1E3764738;
}

+ (void)initialize
{
  _QWORD block[5];
  objc_super v4;

  if ((id)objc_opt_class() == a1)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___PLLocalCreationDateCreator;
    objc_msgSendSuper2(&v4, sel_initialize);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLLocalCreationDateCreator_initialize__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (initialize_onceToken != -1)
      dispatch_once(&initialize_onceToken, block);
  }
}

void __40__PLLocalCreationDateCreator_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "_gmtTranslationDictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_gmtTranslationDictionary;
  _gmtTranslationDictionary = v0;

}

@end
