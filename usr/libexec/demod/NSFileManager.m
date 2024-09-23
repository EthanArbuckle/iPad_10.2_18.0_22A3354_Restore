@implementation NSFileManager

- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unsigned __int8 v19;
  id v20;
  BOOL v21;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  unsigned __int8 v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_retainAutorelease(v10);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  v15 = objc_retainAutorelease(v11);
  if (copyfile(v14, (const char *)objc_msgSend(v15, "UTF8String"), 0, 0x1008000u))
  {
    v23 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000B95C4((uint64_t)v13, (uint64_t)v15, v18);
    v20 = 0;
    v17 = 0;
    goto LABEL_20;
  }
  if (!v12)
  {
    v17 = 0;
    if (v6)
      goto LABEL_5;
LABEL_9:
    v20 = 0;
    v21 = 1;
    goto LABEL_10;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](NSURL, "fileURLWithString:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fileHash"));

  if ((objc_msgSend(v17, "isEqualToData:", v12) & 1) == 0)
  {
    v24 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v35 = v13;
      v36 = 2114;
      v37 = v17;
      v38 = 2114;
      v39 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "File has been changed after device manifest generation: %{public}@ - Current hash:  %{public}@ - Expected hash:  %{public}@", buf, 0x20u);
    }
    v20 = 0;
    goto LABEL_20;
  }
  if (!v6)
    goto LABEL_9;
LABEL_5:
  v32[0] = NSFileOwnerAccountName;
  v32[1] = NSFileGroupOwnerAccountName;
  v33[0] = CFSTR("mobile");
  v33[1] = CFSTR("mobile");
  v18 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
  v31 = 0;
  v19 = -[NSFileManager setAttributes:ofItemAtPath:error:](self, "setAttributes:ofItemAtPath:error:", v18, v15, &v31);
  v20 = v31;
  if ((v19 & 1) == 0)
  {
    v25 = sub_1000604F0();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1000B9550((uint64_t)v13, v26);

LABEL_20:
    if (!-[NSFileManager fileExistsAtPath:](self, "fileExistsAtPath:", v15))
    {
      v21 = 0;
      goto LABEL_10;
    }
    v30 = v20;
    v27 = -[NSFileManager removeItemAtPath:error:](self, "removeItemAtPath:error:", v15, &v30);
    v28 = v30;

    if ((v27 & 1) != 0)
    {
      v21 = 0;
      v20 = v28;
      goto LABEL_10;
    }
    v29 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000B94A0((uint64_t)v15, v28, v18);
    v21 = 0;
    v20 = v28;
    goto LABEL_7;
  }
  v21 = 1;
LABEL_7:

LABEL_10:
  return v21;
}

@end
