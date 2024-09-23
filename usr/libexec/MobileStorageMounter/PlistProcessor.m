@implementation PlistProcessor

+ (id)sharedPlistProcessor
{
  if (qword_100034880 != -1)
    dispatch_once(&qword_100034880, &stru_10002CD78);
  return (id)qword_100034878;
}

- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = (uint64_t (**)(id, void *, _QWORD))a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enumeratorAtPath:", v5));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v14));
        if (v15 && (v6[2](v6, v15, v13) & 1) == 0)
        {

          goto LABEL_12;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)copyAndFixPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v52;
  void *v53;

  v7 = a3;
  v8 = a4;
  v12 = v8;
  if (!v7 || !v8)
  {
    v42 = sub_100013988((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 107, -3, 0, CFSTR("Invalid input(s)."), v9, v10, v11, v52);
    v41 = (id)objc_claimAutoreleasedReturnValue(v42);
    v26 = 0;
    v53 = 0;
    v40 = 0;
    v31 = 0;
    v21 = 0;
    v39 = 0;
    goto LABEL_15;
  }
  v13 = sub_100008B28(v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = sub_100008B28(CFSTR("/private/var/personalized_factory"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_msgSend(v14, "hasPrefix:", v16);

  v53 = v14;
  if ((v17 & 1) == 0)
  {
    v43 = v7;
    v37 = 0;
    v41 = 0;
    v39 = 0;
    goto LABEL_19;
  }
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Label")));
  v19 = sub_1000091D8(v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (!v20)
  {
    v39 = (void *)v18;
    v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("XPCServiceName")));

    if (!v40)
    {
      v48 = sub_100013988((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 127, -2, 0, CFSTR("Missing program arguments."), v44, v45, v46, v52);
      v41 = (id)objc_claimAutoreleasedReturnValue(v48);
      v26 = 0;
      v31 = 0;
      v21 = 0;
      goto LABEL_15;
    }
    v43 = v7;
    v37 = 0;
    v41 = 0;
LABEL_19:
    v21 = 0;
    v31 = 0;
    v40 = 0;
    v26 = 0;
    goto LABEL_28;
  }
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", 0));
  v26 = v22;
  if (v22)
  {
    if ((objc_msgSend(v22, "hasPrefix:", CFSTR("/Developer")) & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("/")));
      v31 = objc_msgSend(v30, "mutableCopy");

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndex:", 0));
      v33 = objc_msgSend(v32, "isEqualToString:", &stru_10002F6C8);

      if (v33)
        objc_msgSend(v31, "removeObjectAtIndex:", 0);
      objc_msgSend(v31, "replaceObjectAtIndex:withObject:", 0, v14);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "componentsJoinedByString:", CFSTR("/")));
      if (v37)
      {
        v38 = objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v21, "replaceObjectAtIndex:withObject:", 0, v37);
        objc_msgSend(v38, "setObject:forKey:", v21, CFSTR("ProgramArguments"));
        objc_msgSend(v38, "removeObjectForKey:", CFSTR("Program"));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          sub_10001E440();
        v39 = (void *)v18;
        v40 = v38;
        v41 = 0;
        if (!a5)
          goto LABEL_27;
      }
      else
      {
        v39 = (void *)v18;
        v49 = sub_100013988((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 158, -2, 0, CFSTR("Failed to update program path %@."), v34, v35, v36, (uint64_t)v26);
        v41 = (id)objc_claimAutoreleasedReturnValue(v49);
        v40 = 0;
        if (!a5)
          goto LABEL_27;
      }
      goto LABEL_16;
    }
    v39 = (void *)v18;
    v47 = sub_100013988((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 144, -2, 0, CFSTR("Invalid program path: %@"), v27, v28, v29, (uint64_t)v26);
  }
  else
  {
    v39 = (void *)v18;
    v47 = sub_100013988((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 135, -2, 0, CFSTR("Invalid program arguments: %@"), v23, v24, v25, (uint64_t)v21);
  }
  v41 = (id)objc_claimAutoreleasedReturnValue(v47);
  v40 = 0;
  v31 = 0;
LABEL_15:
  v37 = 0;
  if (!a5)
  {
LABEL_27:
    v43 = v40;
    goto LABEL_28;
  }
LABEL_16:
  if (v40)
    goto LABEL_27;
  v41 = objc_retainAutorelease(v41);
  v43 = 0;
  *a5 = v41;
LABEL_28:
  v50 = v43;

  return v50;
}

- (id)copyPlistWithMSMKeys:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v26;
  const __CFString *v27;
  void *v28;

  v5 = a3;
  v9 = v5;
  if (v5)
  {
    v10 = objc_msgSend(v5, "mutableCopy");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("_AdditionalProperties")));
    v12 = sub_100013100(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v13)
      v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v11);
    else
      v14 = objc_alloc_init((Class)NSMutableDictionary);
    v21 = v14;
    if (v14)
    {
      v27 = CFSTR("ManagedByMobileStorageMounter");
      v28 = &__kCFBooleanTrue;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("MobileStorageMounter"));

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("_AdditionalProperties"));
      v20 = v10;
      v19 = 0;
      v10 = v20;
      if (!a4)
        goto LABEL_13;
    }
    else
    {
      v23 = sub_100013988((uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]", 208, -2, 0, CFSTR("Failed to allocate dictionary."), v15, v16, v17, v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v20 = 0;
      if (!a4)
        goto LABEL_13;
    }
  }
  else
  {
    v18 = sub_100013988((uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]", 192, -2, 0, CFSTR("Invalid input."), v6, v7, v8, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = 0;
    v10 = 0;
    v11 = 0;
    v21 = 0;
    if (!a4)
      goto LABEL_13;
  }
  if (!v20)
    *a4 = objc_retainAutorelease(v19);
LABEL_13:
  v24 = v20;

  return v24;
}

- (BOOL)jobIsManagedByMSM:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v17)
      sub_10001E4B4(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_22;
  }
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Label")));
  if (!v5)
  {
    v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v25)
      sub_10001E4EC(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_22;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_AdditionalProperties")));
  v8 = sub_100013100(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10001E524();

    goto LABEL_21;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MobileStorageMounter")));
  v11 = sub_100013100(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10001E5A8((uint64_t)v6, v33, v34, v35, v36, v37, v38, v39);

    goto LABEL_20;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ManagedByMobileStorageMounter")));
  v14 = sub_1000130A8(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10001E638((uint64_t)v6, v40, v41, v42, v43, v44, v45, v46);

LABEL_20:
LABEL_21:

LABEL_22:
    v16 = 0;
    goto LABEL_23;
  }
  v16 = objc_msgSend(v13, "BOOLValue");

LABEL_23:
  return v16;
}

- (BOOL)verifyPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  unsigned int v33;
  id v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  BOOL v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v52;

  v7 = a3;
  v8 = a4;
  v12 = v8;
  if (!v7 || !v8)
  {
    v42 = sub_100013988((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 282, -3, 0, CFSTR("Invalid input(s)."), v9, v10, v11, v52);
    v40 = (id)objc_claimAutoreleasedReturnValue(v42);
    v22 = 0;
    v25 = 0;
    v30 = 0;
    v16 = 0;
    if (!a5)
      goto LABEL_20;
    goto LABEL_16;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Label")));
  if (!v16)
  {
    v43 = sub_100013988((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 288, -2, 0, CFSTR("Failed to retrieve job label."), v13, v14, v15, v52);
    v40 = (id)objc_claimAutoreleasedReturnValue(v43);
    v22 = 0;
    goto LABEL_15;
  }
  v17 = sub_1000091D8(v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v22 = v18;
  if (!v18)
  {
    v44 = sub_100013988((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 294, -2, 0, CFSTR("Failed to retrieve program arguments."), v19, v20, v21, v52);
    v40 = (id)objc_claimAutoreleasedReturnValue(v44);
    goto LABEL_15;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", 0));
  v24 = sub_100008B28(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  if (!v25)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndex:", 0));
    v49 = sub_100013988((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 300, -2, 0, CFSTR("Failed to normalize %@."), v46, v47, v48, (uint64_t)v45);
    v40 = (id)objc_claimAutoreleasedReturnValue(v49);

LABEL_15:
    v25 = 0;
    v30 = 0;
    if (!a5)
    {
LABEL_20:
      v41 = 0;
      goto LABEL_21;
    }
LABEL_16:
    v40 = objc_retainAutorelease(v40);
    v41 = 0;
    *a5 = v40;
    goto LABEL_21;
  }
  v26 = sub_100008B28(v12);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v26);
  if (!v30)
  {
    v50 = sub_100013988((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 306, -2, 0, CFSTR("Failed to normalize %@."), v27, v28, v29, (uint64_t)v12);
    goto LABEL_19;
  }
  v31 = sub_100008B28(CFSTR("/Developer"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = objc_msgSend(v30, "hasPrefix:", v32);

  if (v33)
  {
    v34 = sub_100008B28(CFSTR("/Developer"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = objc_msgSend(v25, "hasPrefix:", v35);

    if ((v36 & 1) == 0)
    {
      v50 = sub_100013988((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 315, -2, 0, CFSTR("Invalid program path: %@"), v37, v38, v39, (uint64_t)v25);
LABEL_19:
      v40 = (id)objc_claimAutoreleasedReturnValue(v50);
      if (!a5)
        goto LABEL_20;
      goto LABEL_16;
    }
  }
  v40 = 0;
  v41 = 1;
LABEL_21:

  return v41;
}

@end
