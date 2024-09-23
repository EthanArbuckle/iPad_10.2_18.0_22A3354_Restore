@implementation ASDGeoCodingKeyedUnarchiver

- (id)allowedClasses
{
  Class Class;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  _QWORD v32[10];

  Class = objc_getClass("ASGeoCodeResult");
  if (!Class)
  {
    v3 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D6E60(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = objc_opt_self(NSArray);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v32[0] = v31;
  v12 = objc_opt_self(NSDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v32[1] = v13;
  v14 = objc_opt_self(NSNumber);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v32[2] = v15;
  v16 = objc_opt_self(NSString);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v32[3] = v17;
  v18 = objc_opt_self(CNPostalAddress);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v32[4] = v19;
  v20 = objc_opt_self(CLLocation);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v32[5] = v21;
  v22 = objc_opt_self(CLLocationSourceInformation);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v32[6] = v23;
  v24 = objc_opt_self(NSDate);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v32[7] = v25;
  v32[8] = Class;
  v26 = objc_opt_self(NSNull);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v32[9] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 10));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v28));

  return v29;
}

@end
