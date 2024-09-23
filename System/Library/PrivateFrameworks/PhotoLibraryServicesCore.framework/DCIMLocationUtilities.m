@implementation DCIMLocationUtilities

+ (id)_sharedGPSDateAndTimestampFormatter
{
  if (_sharedGPSDateAndTimestampFormatter_onceToken != -1)
    dispatch_once(&_sharedGPSDateAndTimestampFormatter_onceToken, &__block_literal_global_43);
  return (id)_sharedGPSDateAndTimestampFormatter_formatter;
}

+ (id)locationFromImageProperties:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  int v19;
  double v20;
  CLLocationDegrees v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double latitude;
  double longitude;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  CLLocationCoordinate2D v58;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD98]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDA8]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v4)
    v9 = v5 == 0;
  else
    v9 = 1;
  if (v9 || v6 == 0 || v7 == 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "doubleValue");
    v14 = v13;
    objc_msgSend(v5, "doubleValue");
    v16 = v15;
    v17 = objc_msgSend(v6, "isEqualToString:", CFSTR("S"));
    v18 = -fabs(v14);
    if (v17)
      v14 = v18;
    v19 = objc_msgSend(v8, "isEqualToString:", CFSTR("W"));
    v20 = -fabs(v16);
    if (v19)
      v21 = v20;
    else
      v21 = v16;
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD00]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD08]);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = 0.0;
    v26 = -1.0;
    if (v22)
      v27 = v23 == 0;
    else
      v27 = 1;
    v28 = 0.0;
    if (!v27)
    {
      objc_msgSend(v22, "doubleValue");
      v28 = v29;
      v26 = 0.0;
      if (objc_msgSend(v24, "intValue"))
        v28 = -fabs(v28);
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD28]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD30]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v31;
    if (v30 && objc_msgSend(v31, "isEqualToString:", CFSTR("T")))
    {
      objc_msgSend(v30, "doubleValue");
      v25 = v32;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDD0]);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDD8]);
    v34 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v33;
    v35 = (void *)v33;
    v36 = (void *)v34;
    objc_msgSend(v35, "doubleValue");
    v38 = v37;
    v57 = v30;
    if (objc_msgSend(v36, "isEqualToString:", CFSTR("M")))
    {
      v38 = v38 * 1.609344;
    }
    else if (objc_msgSend(v36, "isEqualToString:", CFSTR("N")))
    {
      v38 = v38 * 1.852;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD20]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDE8]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v39;
    v54 = v36;
    if (objc_msgSend(v40, "length") && objc_msgSend(v39, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_sharedGPSDateAndTimestampFormatter");
      v52 = v24;
      v42 = v8;
      v43 = v6;
      v44 = v5;
      v45 = v22;
      v46 = v4;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "dateFromString:", v41);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v46;
      v22 = v45;
      v5 = v44;
      v6 = v43;
      v8 = v42;
      v24 = v52;

    }
    else
    {
      v48 = 0;
    }
    v58 = CLLocationCoordinate2DMake(v14, v21);
    latitude = v58.latitude;
    longitude = v58.longitude;
    if (CLLocationCoordinate2DIsValid(v58))
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v48, latitude, longitude, v28, 0.0, v26, v25, v38);
    else
      v12 = 0;

  }
  return v12;
}

void __60__DCIMLocationUtilities__sharedGPSDateAndTimestampFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x19AEC2E4C]();
  v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v2 = (void *)_sharedGPSDateAndTimestampFormatter_formatter;
  _sharedGPSDateAndTimestampFormatter_formatter = (uint64_t)v1;

  v3 = (void *)_sharedGPSDateAndTimestampFormatter_formatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  objc_msgSend((id)_sharedGPSDateAndTimestampFormatter_formatter, "setDateFormat:", CFSTR("yyyy:MM:dd HH:mm:ss.SS"));
  objc_autoreleasePoolPop(v0);
}

@end
