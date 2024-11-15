@implementation PXCuratedLibraryAnimationTracker

- (PXCuratedLibraryAnimationTracker)init
{
  PXCuratedLibraryAnimationTracker *v2;
  NSMutableSet *v3;
  NSMutableSet *inFlightAnimations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCuratedLibraryAnimationTracker;
  v2 = -[PXCuratedLibraryAnimationTracker init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    inFlightAnimations = v2->_inFlightAnimations;
    v2->_inFlightAnimations = v3;

  }
  return v2;
}

- (void)zoomLevelTransitionPreparationDidBegin:(id)a3
{
  -[PXCuratedLibraryAnimationTracker _zoomLevelTransitionOccurred:isPreparation:isBegin:](self, "_zoomLevelTransitionOccurred:isPreparation:isBegin:", a3, 1, 1);
}

- (void)zoomLevelTransitionDidBegin:(id)a3
{
  id v4;

  v4 = a3;
  -[PXCuratedLibraryAnimationTracker _zoomLevelTransitionOccurred:isPreparation:isBegin:](self, "_zoomLevelTransitionOccurred:isPreparation:isBegin:", v4, 1, 0);
  -[PXCuratedLibraryAnimationTracker _zoomLevelTransitionOccurred:isPreparation:isBegin:](self, "_zoomLevelTransitionOccurred:isPreparation:isBegin:", v4, 0, 1);

}

- (void)zoomLevelTransitionDidEnd:(id)a3
{
  -[PXCuratedLibraryAnimationTracker _zoomLevelTransitionOccurred:isPreparation:isBegin:](self, "_zoomLevelTransitionOccurred:isPreparation:isBegin:", a3, 0, 0);
}

- (void)_zoomLevelTransitionOccurred:(id)a3 isPreparation:(BOOL)a4 isBegin:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  const char *v34;
  uint8_t v35[16];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = operator||(v8, CFSTR("PXCuratedLibraryZoomLevelChangeFromKey"));
  v10 = operator||(v8, CFSTR("PXCuratedLibraryZoomLevelChangeToKey"));
  -[PXCuratedLibraryAnimationTracker inFlightAnimations](self, "inFlightAnimations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 | v10)
  {
    if (v5)
      objc_msgSend(v11, "addObject:", v8);
    if (objc_msgSend(v12, "containsObject:", v8))
    {
      switch(v9)
      {
        case 1:
          switch(v10)
          {
            case 1:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v14, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToYearsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToYearsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToYears";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToYears";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 2:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v31 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v31, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToMonthsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToMonthsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToMonths";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToMonths";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 3:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v21 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v21, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToDaysPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToDaysPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToDays";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToDays";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 4:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v22 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v22, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToAllPhotosPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToAllPhotosPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToAllPhotos";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToAllPhotos";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              break;
            default:
              goto LABEL_30;
          }
          goto LABEL_255;
        case 2:
          switch(v10)
          {
            case 1:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v18 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v18, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToYearsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToYearsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToYears";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToYears";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 2:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v32 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v32, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToMonthsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToMonthsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToMonths";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToMonths";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 3:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v23 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v23, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToDaysPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToDaysPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToDays";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToDays";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 4:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v24 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v24, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToAllPhotosPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToAllPhotosPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToAllPhotos";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToAllPhotos";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              break;
            default:
              goto LABEL_30;
          }
          goto LABEL_255;
        case 3:
          switch(v10)
          {
            case 1:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v19 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v19, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToYearsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToYearsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToYears";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToYears";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 2:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v25 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v25, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToMonthsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToMonthsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToMonths";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToMonths";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 3:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v26 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v26, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToDaysPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToDaysPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToDays";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToDays";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 4:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v27 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v27, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToAllPhotosPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToAllPhotosPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToAllPhotos";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToAllPhotos";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              break;
            default:
              goto LABEL_30;
          }
          goto LABEL_255;
        case 4:
          switch(v10)
          {
            case 1:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v20 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v20, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToYearsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToYearsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToYears";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToYears";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 2:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v28 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v28, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToMonthsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToMonthsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToMonths";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToMonths";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 3:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v29 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v29, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToDaysPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToDaysPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToDays";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToDays";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 4:
              PLAnimationTelemetryGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              PLAnimationTelemetryGetLog();
              v30 = objc_claimAutoreleasedReturnValue();
              v15 = os_signpost_id_make_with_pointer(v30, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13))
                    goto LABEL_157;
                  *(_WORD *)v35 = 0;
                  v16 = "AllPhotosToAllPhotosPreparation";
                  v17 = " enableTelemetry=YES ";
LABEL_156:
                  _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, v16, v17, v35, 2u);
LABEL_157:

                  goto LABEL_257;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToAllPhotosPreparation";
                  v34 = " enableTelemetry=YES ";
LABEL_254:
                  _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_END, v15, v33, v34, v35, 2u);
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13))
                    goto LABEL_157;
                  *(_WORD *)v35 = 0;
                  v16 = "AllPhotosToAllPhotos";
                  v17 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_156;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToAllPhotos";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
LABEL_255:

              break;
            default:
              goto LABEL_30;
          }
          break;
        default:
          goto LABEL_30;
      }
    }
    else
    {
LABEL_30:
      if (v5)
        goto LABEL_257;
    }
    objc_msgSend(v12, "removeObject:", v8, *(_QWORD *)v35);
  }
LABEL_257:

}

- (void)zoomLevelTransitionsDidEndEarly
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryAnimationTracker inFlightAnimations](self, "inFlightAnimations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PXCuratedLibraryAnimationTracker _zoomLevelTransitionOccurred:isPreparation:isBegin:](self, "_zoomLevelTransitionOccurred:isPreparation:isBegin:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, 0, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSMutableSet)inFlightAnimations
{
  return self->_inFlightAnimations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightAnimations, 0);
}

+ (PXCuratedLibraryAnimationTracker)sharedTracker
{
  if (sharedTracker_onceToken != -1)
    dispatch_once(&sharedTracker_onceToken, &__block_literal_global_116126);
  return (PXCuratedLibraryAnimationTracker *)(id)sharedTracker_tracker;
}

+ (void)scrollAnimationDidBeginWithScrollContext:(id)a3
{
  objc_msgSend(a1, "_scrollAnimationOccurredWithContext:isBegin:", a3.var0, a3.var1, 1);
}

+ (void)scrollAnimationDidEndWithScrollContext:(id)a3
{
  objc_msgSend(a1, "_scrollAnimationOccurredWithContext:isBegin:", a3.var0, a3.var1, 0);
}

+ (void)_scrollAnimationOccurredWithContext:(id)a3 isBegin:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  NSObject *v22;
  os_signpost_type_t v23;
  uint8_t v24[16];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v25 = v4;
  v26 = v5;
  v27 = v6;
  v7 = a4;
  switch(a3.var0)
  {
    case 1:
      switch(a3.var1)
      {
        case 3:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v14 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v14)
              goto LABEL_77;
            *(_WORD *)v24 = 0;
            v10 = "ScrollYearsFast";
            goto LABEL_50;
          }
          if (!v14)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollYearsFast";
          goto LABEL_75;
        case 2:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v15 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v15)
              goto LABEL_77;
            *(_WORD *)v24 = 0;
            v10 = "ScrollYearsMedium";
            goto LABEL_50;
          }
          if (!v15)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollYearsMedium";
          goto LABEL_75;
        case 1:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v9)
              goto LABEL_77;
            *(_WORD *)v24 = 0;
            v10 = "ScrollYearsSlow";
            goto LABEL_50;
          }
          if (!v9)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollYearsSlow";
          goto LABEL_75;
      }
      return;
    case 2:
      switch(a3.var1)
      {
        case 3:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v16 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v16)
              goto LABEL_77;
            *(_WORD *)v24 = 0;
            v10 = "ScrollMonthsFast";
            goto LABEL_50;
          }
          if (!v16)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollMonthsFast";
          goto LABEL_75;
        case 2:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v17 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v17)
              goto LABEL_77;
            *(_WORD *)v24 = 0;
            v10 = "ScrollMonthsMedium";
            goto LABEL_50;
          }
          if (!v17)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollMonthsMedium";
          goto LABEL_75;
        case 1:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v11 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v11)
              goto LABEL_77;
            *(_WORD *)v24 = 0;
            v10 = "ScrollMonthsSlow";
            goto LABEL_50;
          }
          if (!v11)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollMonthsSlow";
          goto LABEL_75;
      }
      return;
    case 3:
      switch(a3.var1)
      {
        case 3:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v18 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v18)
              goto LABEL_77;
            *(_WORD *)v24 = 0;
            v10 = "ScrollDaysFast";
            goto LABEL_50;
          }
          if (!v18)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollDaysFast";
          goto LABEL_75;
        case 2:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v19 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v19)
              goto LABEL_77;
            *(_WORD *)v24 = 0;
            v10 = "ScrollDaysMedium";
            goto LABEL_50;
          }
          if (!v19)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollDaysMedium";
          goto LABEL_75;
        case 1:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v12)
              goto LABEL_77;
            *(_WORD *)v24 = 0;
            v10 = "ScrollDaysSlow";
            goto LABEL_50;
          }
          if (!v12)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollDaysSlow";
          goto LABEL_75;
      }
      return;
    case 4:
      switch(a3.var1)
      {
        case 3:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_enabled(v8);
          if (v7)
          {
            if (v20)
            {
              *(_WORD *)v24 = 0;
              v10 = "ScrollAllPhotosFast";
              goto LABEL_50;
            }
LABEL_77:

            return;
          }
          if (!v20)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollAllPhotosFast";
          break;
        case 2:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v21 = os_signpost_enabled(v8);
          if (v7)
          {
            if (v21)
            {
              *(_WORD *)v24 = 0;
              v10 = "ScrollAllPhotosMedium";
              goto LABEL_50;
            }
            goto LABEL_77;
          }
          if (!v21)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollAllPhotosMedium";
          break;
        case 1:
          PLAnimationTelemetryGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          v13 = os_signpost_enabled(v8);
          if (v7)
          {
            if (v13)
            {
              *(_WORD *)v24 = 0;
              v10 = "ScrollAllPhotosSlow";
LABEL_50:
              v22 = v8;
              v23 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_76:
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v22, v23, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES  isAnimation=YES ", v24, 2u);
              goto LABEL_77;
            }
            goto LABEL_77;
          }
          if (!v13)
            goto LABEL_77;
          *(_WORD *)v24 = 0;
          v10 = "ScrollAllPhotosSlow";
          break;
        default:
          return;
      }
LABEL_75:
      v22 = v8;
      v23 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_76;
    default:
      return;
  }
}

void __49__PXCuratedLibraryAnimationTracker_sharedTracker__block_invoke()
{
  PXCuratedLibraryAnimationTracker *v0;
  void *v1;

  v0 = objc_alloc_init(PXCuratedLibraryAnimationTracker);
  v1 = (void *)sharedTracker_tracker;
  sharedTracker_tracker = (uint64_t)v0;

}

@end
