@implementation CLPPoiWifiAccessPoint(RTExtensions)

- (void)initWithRTWifiAccessPoint:()RTExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "age");
    objc_msgSend(v5, "setAge:");
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "setScanTimestamp:");

    objc_msgSend(v5, "setChannel:", objc_msgSend(v4, "channel"));
    objc_msgSend(v4, "mac");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "length12StringForMac:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "setMac:", v8);
    }
    else
    {
      objc_msgSend(v4, "mac");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMac:", v10);

    }
    objc_msgSend(v5, "setRssi:", objc_msgSend(v4, "rssi"));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[CLPPoiWifiAccessPoint(RTExtensions) initWithRTWifiAccessPoint:]";
      v14 = 1024;
      v15 = 231;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: rtWifiAccessPoint (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }

    v5 = 0;
  }

  return v5;
}

- (id)length12StringForMac:()RTExtensions
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 6)
  {
    v4 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "length", (_QWORD)v13) != 2)
          {
            if (objc_msgSend(v10, "length") != 1)
            {

              v11 = 0;
              goto LABEL_15;
            }
            objc_msgSend(v4, "appendString:", CFSTR("0"));
          }
          objc_msgSend(v4, "appendString:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

    v11 = v4;
LABEL_15:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
