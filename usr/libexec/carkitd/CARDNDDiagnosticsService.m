@implementation CARDNDDiagnosticsService

+ (id)TTRURLforEvent:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = CRStringForDate(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_radarURLForDiagnosticsAtTime:withEvent:", v7, a3));
  return v8;
}

+ (id)_radarURLForDiagnosticsAtTime:(id)a3 withEvent:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      v7 = a1;
      v8 = v6;
      v9 = 1;
      goto LABEL_4;
    case 1uLL:
      v7 = a1;
      v8 = v6;
      v9 = 0;
LABEL_4:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_radarURLForDiagnosticsAtTime:didStartRhodes:", v8, v9));
      goto LABEL_8;
    case 2uLL:
      v11 = a1;
      v12 = v6;
      v13 = 1;
      goto LABEL_7;
    case 3uLL:
      v11 = a1;
      v12 = v6;
      v13 = 0;
LABEL_7:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_radarURLForDiagnosticsAtTime:didEnterRhodesGeofence:", v12, v13));
LABEL_8:
      a1 = v10;
      break;
    default:
      break;
  }

  return a1;
}

+ (id)_radarURLForDiagnosticsAtTime:(id)a3 didStartRhodes:(BOOL)a4
{
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = CFSTR("Exited DNDWD at %@");
  if (a4)
    v5 = CFSTR("Entered DNDWD at %@");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Please describe what you were doing to trigger Do Not Disturb While Driving. \n\n\n"), "stringByAppendingString:", v6));

  v8 = objc_msgSend((id)objc_opt_class(a1), "_radarURLForDiagnosticsAndDescriptionText:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

+ (id)_radarURLForDiagnosticsAtTime:(id)a3 didEnterRhodesGeofence:(BOOL)a4
{
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = CFSTR("Exited geofence at %@");
  if (a4)
    v5 = CFSTR("Entered geofence at %@");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, a3));
  v7 = objc_msgSend((id)objc_opt_class(a1), "_radarURLForDiagnosticsAndDescriptionText:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

+ (id)_radarURLForDiagnosticsAndDescriptionText:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[7];
  _QWORD v17[7];

  v3 = a3;
  v4 = CRFormattedBuildAndDeviceIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR(": [DNDWD]")));

  }
  else
  {
    v7 = CFSTR("[DNDWD]");
  }
  v16[0] = CFSTR("ComponentName");
  v16[1] = CFSTR("ComponentVersion");
  v17[0] = CFSTR("Do Not Disturb While Driving");
  v17[1] = CFSTR("1.0");
  v16[2] = CFSTR("ComponentID");
  v16[3] = CFSTR("Keywords");
  v17[2] = CFSTR("831192");
  v17[3] = CFSTR("814490");
  v16[4] = CFSTR("Reproducibility");
  v16[5] = CFSTR("Title");
  v17[4] = CFSTR("I Didn't Try");
  v17[5] = v7;
  v16[6] = CFSTR("ExtensionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000BF260, "componentsJoinedByString:", CFSTR(",")));
  v17[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 7));
  v10 = objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, CFSTR("Description"));
  v11 = CRURLEncodedString(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("tap-to-radar://new?"), "stringByAppendingString:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));

  return v14;
}

@end
