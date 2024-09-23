@implementation HMFObjectCacheHAPCharacteristicMetadata

+ (id)hap_cacheInstanceForMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v3 = a3;
  v5 = objc_autoreleasePoolPush();
  if (!v3)
  {
    v10 = 0;
    goto LABEL_16;
  }
  v6 = objc_opt_class(HAPCharacteristicMetadata, v4);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    v11 = objc_autoreleasePoolPush();
    v12 = HMFGetOSLogHandle(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier(0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v17 = (void *)objc_opt_class(v3, v16);
      v18 = v17;
      v27 = 138544130;
      v28 = v15;
      v29 = 2112;
      v30 = v3;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = (id)objc_opt_class(HAPCharacteristicMetadata, v19);
      v20 = v34;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Object %@ of class %@ mismatches cache class %@:", (uint8_t *)&v27, 0x2Au);

    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___NSCopying) & 1) == 0)
  {
    v11 = objc_autoreleasePoolPush();
    v21 = HMFGetOSLogHandle(0);
    v13 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier(0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v27 = 138543874;
      v28 = v23;
      v29 = 2112;
      v30 = v3;
      v31 = 2112;
      v32 = (id)objc_opt_class(HAPCharacteristicMetadata, v24);
      v25 = v32;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Object %@ of class %@ does not conform to NSCopying protocol", (uint8_t *)&v27, 0x20u);

    }
LABEL_15:

    objc_autoreleasePoolPop(v11);
    v10 = v3;
    goto LABEL_16;
  }
  os_unfair_lock_lock_with_options(&unk_1002716C8, 0);
  v7 = (void *)qword_1002716C0;
  if (!qword_1002716C0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v9 = (void *)qword_1002716C0;
    qword_1002716C0 = v8;

    v7 = (void *)qword_1002716C0;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "member:", v3));
  if (!v10)
  {
    v10 = objc_msgSend(v3, "copy");
    objc_msgSend((id)qword_1002716C0, "addObject:", v10);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002716C8);
LABEL_16:
  objc_autoreleasePoolPop(v5);

  return v10;
}

@end
