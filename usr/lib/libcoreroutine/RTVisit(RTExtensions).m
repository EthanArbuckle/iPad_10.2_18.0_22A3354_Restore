@implementation RTVisit(RTExtensions)

- (id)initWithLearnedVisit:()RTExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "creationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exitDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 3;
    else
      v8 = 1;
    objc_msgSend(v5, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exitDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "dataPointCount");
    a1 = (id)objc_msgSend(a1, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v6, v8, v10, v11, v12, v14, *MEMORY[0x1E0D185C8], 0);

    v15 = a1;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisit", buf, 2u);
    }

    v15 = 0;
  }

  return v15;
}

@end
