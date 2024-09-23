@implementation RTMapItemProviderMapsSupportParameters

- (RTMapItemProviderMapsSupportParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFavoriteConfidence_historyEntryRouteConfidence_historyEntryPlaceDisplayConfidence_);
}

- (RTMapItemProviderMapsSupportParameters)initWithFavoriteConfidence:(double)a3 historyEntryRouteConfidence:(double)a4 historyEntryPlaceDisplayConfidence:(double)a5
{
  RTMapItemProviderMapsSupportParameters *v9;
  RTMapItemProviderMapsSupportParameters *v10;
  NSObject *v11;
  const char *v12;
  objc_super v14;
  uint8_t buf[16];

  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: RTCommonValidConfidence(favoriteConfidence)";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_14;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: RTCommonValidConfidence(historyEntryRouteConfidence)";
    goto LABEL_13;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid parameter not satisfying: RTCommonValidConfidence(historyEntryPlaceDisplayConfidence)";
      goto LABEL_13;
    }
LABEL_14:

    v10 = 0;
    goto LABEL_15;
  }
  v14.receiver = self;
  v14.super_class = (Class)RTMapItemProviderMapsSupportParameters;
  v9 = -[RTMapItemProviderMapsSupportParameters init](&v14, sel_init);
  if (v9)
  {
    v9->_favoriteConfidence = a3;
    v9->_historyEntryRouteConfidence = a4;
    v9->_historyEntryPlaceDisplayConfidence = a5;
  }
  self = v9;
  v10 = self;
LABEL_15:

  return v10;
}

- (RTMapItemProviderMapsSupportParameters)initWithDefaultsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  RTMapItemProviderMapsSupportParameters *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint8_t v18[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsMapItemProviderMapsSupportFavoriteConfidence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      v8 = v7;
    }
    else
    {
      v8 = 0.9;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderMapsSupportHistoryEntryRouteConfidence"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
    }
    else
    {
      v13 = 0.95;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderMapsSupportHistoryEntryPlaceDisplayConfidence"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
    }
    else
    {
      v16 = 0.8;
    }
    self = -[RTMapItemProviderMapsSupportParameters initWithFavoriteConfidence:historyEntryRouteConfidence:historyEntryPlaceDisplayConfidence:](self, "initWithFavoriteConfidence:historyEntryRouteConfidence:historyEntryPlaceDisplayConfidence:", v8, v13, v16);

    v10 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v18, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("favoriteConfidence, %.3f, historyEntryRouteConfidence, %.3f, historyEntryPlaceDisplayConfidence, %.3f"), *(_QWORD *)&self->_favoriteConfidence, *(_QWORD *)&self->_historyEntryRouteConfidence, *(_QWORD *)&self->_historyEntryPlaceDisplayConfidence);
}

- (double)favoriteConfidence
{
  return self->_favoriteConfidence;
}

- (double)historyEntryRouteConfidence
{
  return self->_historyEntryRouteConfidence;
}

- (double)historyEntryPlaceDisplayConfidence
{
  return self->_historyEntryPlaceDisplayConfidence;
}

@end
