id sub_1000037A4()
{
  if (qword_1000241E0 != -1)
    dispatch_once(&qword_1000241E0, &stru_100020608);
  return (id)qword_1000241E8;
}

void sub_1000037E4(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.mobile_storage_proxy.filetransfer", 0);
  v2 = (void *)qword_1000241E8;
  qword_1000241E8 = (uint64_t)v1;

}

id sub_100003810()
{
  if (qword_1000241F0 != -1)
    dispatch_once(&qword_1000241F0, &stru_100020628);
  return (id)qword_1000241F8;
}

void sub_100003850(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.mobile_storage_proxy.hostconnections", 0);
  v2 = (void *)qword_1000241F8;
  qword_1000241F8 = (uint64_t)v1;

}

void sub_10000387C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  _QWORD block[5];

  v2 = sub_1000037A4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000038E8;
  block[3] = &unk_100020648;
  block[4] = a1;
  dispatch_sync(v3, block);

}

void sub_1000038E8(uint64_t a1)
{
  const char *v2;

  if (byte_100024200)
  {
    unlink(&byte_100024200);
    bzero(&byte_100024200, 0x400uLL);
  }
  v2 = *(const char **)(a1 + 32);
  if (v2)
    strncpy(&byte_100024200, v2, 0x3FFuLL);
}

uint64_t sub_10000394C()
{
  id v0;
  NSObject *v1;
  uint64_t v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v0 = sub_1000037A4();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000039E4;
  block[3] = &unk_100020670;
  block[4] = &v5;
  dispatch_sync(v1, block);

  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_1000039E4(uint64_t result)
{
  if (byte_100024200)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = &byte_100024200;
  return result;
}

void sub_100003A08(char a1)
{
  id v2;
  NSObject *v3;
  _QWORD block[4];
  char v5;

  v2 = sub_1000037A4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003A74;
  block[3] = &unk_100020690;
  v5 = a1;
  dispatch_sync(v3, block);

}

uint64_t sub_100003A74(uint64_t result)
{
  byte_100024600 = *(_BYTE *)(result + 32);
  return result;
}

uint64_t sub_100003A84()
{
  id v0;
  NSObject *v1;
  uint64_t v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v0 = sub_1000037A4();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003B1C;
  block[3] = &unk_100020670;
  block[4] = &v5;
  dispatch_sync(v1, block);

  v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100003B1C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = byte_100024600;
  return result;
}

uint64_t sub_100003B34()
{
  uint64_t result;

  result = MKBGetDeviceLockState(0);
  if ((_DWORD)result != 1)
    return MKBGetDeviceLockState(0) == 2;
  return result;
}

uint64_t sub_100003B64(const __CFDictionary *a1, __CFDictionary *a2)
{
  const void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFString *v35;
  uint64_t v36;
  int v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v52;
  id value;
  CFTypeRef cf;
  uint8_t buf[4];
  _BYTE v56[10];
  _BYTE v57[10];

  cf = 0;
  if (!a1 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v35 = CFSTR("Invalid input(s).");
    v36 = 122;
    v37 = -3;
    goto LABEL_34;
  }
  value = objc_alloc_init((Class)NSMutableArray);
  if (!value)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create array.", buf, 2u);
    }
    v35 = CFSTR("Failed to create array.");
    v36 = 128;
    v37 = -2;
LABEL_34:
    v38 = sub_10000B11C((uint64_t)"handle_lookup_image", v36, v37, 0, v35, v32, v33, v34, v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    value = 0;
    v8 = 0;
    v5 = 0;
    goto LABEL_35;
  }
  v4 = CFDictionaryGetValue(a1, CFSTR("ImageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = sub_10000A944(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)MobileStorageCopyDevicesWithError(0, &cf);
    v9 = sub_10000A8EC(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v10)
    {
      if (objc_msgSend(v8, "count"))
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        do
        {
          v16 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v11));

          v17 = sub_10000A894(v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DeviceType")));

            v20 = sub_10000A944(v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

            if (v21)
            {
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("DiskImage")))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DiskImageType")));

                v23 = sub_10000A944(v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

                if (v24)
                {
                  if (objc_msgSend(v5, "isEqualToString:", v22))
                  {
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ImageSignature")));

                    v26 = sub_10000A99C(v25);
                    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

                    if (v27)
                    {
                      objc_msgSend(value, "addObject:", v25);
                    }
                    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      v31 = objc_msgSend(v8, "count");
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)v56 = CFSTR("ImageSignature");
                      *(_WORD *)&v56[8] = 1024;
                      *(_DWORD *)v57 = v11 + 1;
                      *(_WORD *)&v57[4] = 1024;
                      *(_DWORD *)&v57[6] = v31;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
                    }
                    v15 = v25;
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v30 = objc_msgSend(v8, "count");
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)v56 = CFSTR("DiskImageType");
                  *(_WORD *)&v56[8] = 1024;
                  *(_DWORD *)v57 = v11 + 1;
                  *(_WORD *)&v57[4] = 1024;
                  *(_DWORD *)&v57[6] = v30;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
                }
                v14 = v22;
              }
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_msgSend(v8, "count");
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v56 = CFSTR("DeviceType");
              *(_WORD *)&v56[8] = 1024;
              *(_DWORD *)v57 = v11 + 1;
              *(_WORD *)&v57[4] = 1024;
              *(_DWORD *)&v57[6] = v29;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
            }
            v13 = v19;
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v28 = objc_msgSend(v8, "count");
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v56 = v11;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = v28;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve entry %d of %d.", buf, 0xEu);
          }
          ++v11;
        }
        while (v11 < objc_msgSend(v8, "count"));
      }
      else
      {
        v15 = 0;
        v14 = 0;
        v13 = 0;
        v12 = 0;
      }
      CFDictionarySetValue(a2, CFSTR("ImageSignature"), value);
      CFDictionarySetValue(a2, CFSTR("Status"), CFSTR("Complete"));
      v39 = 0;
      v40 = 1;
      goto LABEL_51;
    }
    v45 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to copy device list."));
    if (cf)
    {
      v52 = (uint64_t)v45;
      v46 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v45 = (id)v46;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v56 = v45;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v50 = sub_10000B11C((uint64_t)"handle_lookup_image", 143, -2, (void *)cf, CFSTR("Failed to copy device list."), v47, v48, v49, v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v50);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v56 = CFSTR("ImageType");
      *(_WORD *)&v56[8] = 2112;
      *(_QWORD *)v57 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    v44 = sub_10000B11C((uint64_t)"handle_lookup_image", 135, -2, 0, CFSTR("Invalid value for %@: %@"), v41, v42, v43, (uint64_t)CFSTR("ImageType"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(v44);
    CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("MissingImageType"));
    v8 = 0;
  }
LABEL_35:
  v12 = 0;
  v40 = 0;
  if (a2 && v39)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v39, "description"));
    v40 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
LABEL_51:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v40;
}

uint64_t sub_1000042D8(const __CFDictionary *a1, __CFDictionary *a2)
{
  const void *Value;
  void *v5;
  id v6;
  void *v7;
  const void *v8;
  void *v9;
  id v10;
  void *v11;
  const void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  const void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  __CFString **v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  __CFString **v71;
  __CFString *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  CFTypeRef cf;
  uint8_t buf[4];
  const __CFString *v81;
  __int16 v82;
  void *v83;

  cf = 0;
  if (!a1 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v33 = sub_10000B11C((uint64_t)"handle_mount_image", 232, -3, 0, CFSTR("Invalid input(s)."), v30, v31, v32, v78);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v34 = 0;
    v21 = 0;
    v14 = 0;
    v35 = 0;
    v9 = 0;
    v5 = 0;
    goto LABEL_48;
  }
  Value = CFDictionaryGetValue(a1, CFSTR("ImageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v6 = sub_10000A944(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = CFSTR("ImageType");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    v39 = sub_10000B11C((uint64_t)"handle_mount_image", 239, -3, 0, CFSTR("Invalid value for %@."), v36, v37, v38, (uint64_t)CFSTR("ImageType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v39);
    CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("MissingImageType"));
    v34 = 0;
    v21 = 0;
    v14 = 0;
    v35 = 0;
    v9 = 0;
    goto LABEL_48;
  }
  v8 = CFDictionaryGetValue(a1, CFSTR("ImageSignature"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = sub_10000A99C(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = CFSTR("ImageSignature");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    v43 = sub_10000B11C((uint64_t)"handle_mount_image", 247, -3, 0, CFSTR("Invalid value for %@."), v40, v41, v42, (uint64_t)CFSTR("ImageSignature"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v43);
    CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("MissingImageSignature"));
    v34 = 0;
    v21 = 0;
    v14 = 0;
    goto LABEL_47;
  }
  v12 = CFDictionaryGetValue(a1, CFSTR("ImageTrustCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v13)
  {
    v15 = sub_10000A99C(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (!v16)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v81 = CFSTR("ImageTrustCache");
        v82 = 2112;
        v83 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for option %@: %@", buf, 0x16u);
      }
      v54 = sub_10000B11C((uint64_t)"handle_mount_image", 254, -2, 0, CFSTR("Invalid value for option %@: %@"), v51, v52, v53, (uint64_t)CFSTR("ImageTrustCache"));
      goto LABEL_43;
    }
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Cryptex")))
  {
    v21 = 0;
    goto LABEL_24;
  }
  v17 = sub_10000A99C(v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v81 = CFSTR("ImageTrustCache");
      v82 = 2112;
      v83 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for required option %@: %@", buf, 0x16u);
    }
    v54 = sub_10000B11C((uint64_t)"handle_mount_image", 261, -2, 0, CFSTR("Invalid value for required option %@: %@"), v59, v60, v61, (uint64_t)CFSTR("ImageTrustCache"));
LABEL_43:
    v28 = (void *)objc_claimAutoreleasedReturnValue(v54);
    CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("MissingTrustCache"));
    v34 = 0;
    v21 = 0;
    goto LABEL_47;
  }
  v19 = CFDictionaryGetValue(a1, CFSTR("ImageInfoPlist"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v20)
  {
    v22 = sub_10000A99C(v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (!v23)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v81 = CFSTR("ImageInfoPlist");
        v82 = 2112;
        v83 = v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for option %@: %@", buf, 0x16u);
      }
      v27 = sub_10000B11C((uint64_t)"handle_mount_image", 268, -2, 0, CFSTR("Invalid value for option %@: %@"), v24, v25, v26, (uint64_t)CFSTR("ImageInfoPlist"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = off_1000208D8;
LABEL_39:
      CFDictionarySetValue(a2, CFSTR("Error"), *v29);
      v34 = 0;
LABEL_47:
      v35 = 0;
      goto LABEL_48;
    }
  }
LABEL_24:
  v44 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v44)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    v58 = sub_10000B11C((uint64_t)"handle_mount_image", 277, -2, 0, CFSTR("Failed to create dictionary."), v55, v56, v57, v78);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v29 = off_100020908;
    goto LABEL_39;
  }
  v34 = v44;
  v45 = sub_10000394C();
  if (!v45)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disk image is missing.", buf, 2u);
    }
    v65 = sub_10000B11C((uint64_t)"handle_mount_image", 294, -2, 0, CFSTR("Disk image is missing."), v62, v63, v64, v78);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v65);
    CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("MissingImagePath"));
    goto LABEL_47;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v45));
  v46 = sub_10000A944(v35);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);

  if (v47)
  {
    objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("DiskImage"), CFSTR("DeviceType"));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v5, CFSTR("DiskImageType"));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v9, CFSTR("ImageSignature"));
    if (v14)
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v14, CFSTR("ImageTrustCache"));
    if (v21)
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v21, CFSTR("ImageInfoPlist"));
    v48 = MobileStorageMountWithError(v35, v34, &cf);
    if (v48)
    {
      v49 = (void *)v48;
      CFDictionarySetValue(a2, CFSTR("Status"), CFSTR("Complete"));

      v28 = 0;
      v50 = 1;
      goto LABEL_53;
    }
    v72 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to mount %@."), v35);
    if (cf)
    {
      v73 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)"), v72, cf));

      v72 = (__CFString *)v73;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = v72;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v77 = sub_10000B11C((uint64_t)"handle_mount_image", 315, -2, (void *)cf, CFSTR("Failed to mount %@."), v74, v75, v76, (uint64_t)v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v77);

    v71 = off_100020910;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    v70 = sub_10000B11C((uint64_t)"handle_mount_image", 289, -2, 0, CFSTR("Failed to create string."), v67, v68, v69, v78);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v70);
    v71 = off_1000208F8;
  }
  CFDictionarySetValue(a2, CFSTR("Error"), *v71);
LABEL_48:
  sub_10000387C(0);
  v50 = 0;
  if (a2 && v28)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v28, "description"));
    v50 = 0;
  }
LABEL_53:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v50;
}

uint64_t sub_100004C34(const __CFDictionary *a1, __CFDictionary *a2)
{
  void *Value;
  id v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v23;
  CFTypeRef cf;
  uint8_t buf[4];
  const __CFString *v26;

  cf = 0;
  if (a1 && a2)
  {
    Value = (void *)CFDictionaryGetValue(a1, CFSTR("MountPath"));
    v4 = sub_10000A944(Value);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (v5)
    {
      if (!MobileStorageUnmountWithError(Value, 0, &cf))
      {
        CFDictionarySetValue(a2, CFSTR("Status"), CFSTR("Complete"));
        v12 = 0;
        v21 = 1;
        goto LABEL_22;
      }
      v6 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to unmount %@."), Value);
      if (cf)
      {
        v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)"), v6, cf));

        v6 = (__CFString *)v7;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      v11 = sub_10000B11C((uint64_t)"handle_unmount_image", 368, -2, (void *)cf, CFSTR("Failed to unmount %@."), v8, v9, v10, (uint64_t)Value);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = CFSTR("MountPath");
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
      }
      v20 = sub_10000B11C((uint64_t)"handle_unmount_image", 362, -3, 0, CFSTR("Invalid value for %@."), v17, v18, v19, (uint64_t)CFSTR("MountPath"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v20);
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("MissingImagePath"));
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v16 = sub_10000B11C((uint64_t)"handle_unmount_image", 356, -3, 0, CFSTR("Invalid input(s)."), v13, v14, v15, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }
  v21 = 0;
  if (a2 && v12)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v12, "description"));
    v21 = 0;
  }
LABEL_22:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v21;
}

uint64_t sub_100004F54(uint64_t a1, __CFDictionary *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;
  CFTypeRef cf;
  uint8_t buf[4];
  id v19;

  cf = 0;
  if (a1 && a2)
  {
    if ((MobileStorageRollPersonalizationNonceWithError(0, &cf) & 1) != 0)
    {
      CFDictionarySetValue(a2, CFSTR("Status"), CFSTR("Complete"));
      v3 = 0;
      v4 = 1;
      goto LABEL_18;
    }
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to roll personalization nonce."));
    if (cf)
    {
      v16 = (uint64_t)v9;
      v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v9 = (id)v10;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v14 = sub_10000B11C((uint64_t)"handle_roll_personalization_nonce", 409, -2, (void *)cf, CFSTR("Failed to roll personalization nonce."), v11, v12, v13, v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v14);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v8 = sub_10000B11C((uint64_t)"handle_roll_personalization_nonce", 403, -3, 0, CFSTR("Invalid input(s)."), v5, v6, v7, v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  v4 = 0;
  if (a2 && v3)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v3, "description"));
    v4 = 0;
  }
LABEL_18:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v4;
}

uint64_t sub_1000051A0(uint64_t a1, __CFDictionary *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;
  CFTypeRef cf;
  uint8_t buf[4];
  id v19;

  cf = 0;
  if (a1 && a2)
  {
    if ((MobileStorageRollCryptexNonceWithError(0, &cf) & 1) != 0)
    {
      CFDictionarySetValue(a2, CFSTR("Status"), CFSTR("Complete"));
      v3 = 0;
      v4 = 1;
      goto LABEL_18;
    }
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to roll cryptex nonce."));
    if (cf)
    {
      v16 = (uint64_t)v9;
      v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v9 = (id)v10;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v14 = sub_10000B11C((uint64_t)"handle_roll_cryptex_nonce", 450, -2, (void *)cf, CFSTR("Failed to roll cryptex nonce."), v11, v12, v13, v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v14);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v8 = sub_10000B11C((uint64_t)"handle_roll_cryptex_nonce", 444, -3, 0, CFSTR("Invalid input(s)."), v5, v6, v7, v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  v4 = 0;
  if (a2 && v3)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v3, "description"));
    v4 = 0;
  }
LABEL_18:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v4;
}

uint64_t sub_1000053EC(const __CFDictionary *a1, __CFDictionary *a2)
{
  const void *Value;
  void *v5;
  id v6;
  void *v7;
  const void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v35;
  CFTypeRef cf;
  uint8_t buf[4];
  const __CFString *v38;

  cf = 0;
  if (a1 && a2)
  {
    Value = CFDictionaryGetValue(a1, CFSTR("PersonalizedImageType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
    v6 = sub_10000A944(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (v7)
    {
      v8 = CFDictionaryGetValue(a1, CFSTR("ImageSignature"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = sub_10000A99C(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

      if (v11)
      {
        v12 = (void *)MobileStorageCopyPersonalizationManifestWithError(v5, v9, 0, &cf);
        if (v12)
        {
          v13 = v12;
          CFDictionarySetValue(a2, CFSTR("ImageSignature"), v12);

          v14 = 0;
          v15 = 1;
          goto LABEL_26;
        }
        v28 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to copy personalization manifest."));
        if (cf)
        {
          v35 = (uint64_t)v28;
          v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

          v28 = (__CFString *)v29;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v28;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
        v33 = sub_10000B11C((uint64_t)"handle_query_personalization_manifest", 505, -2, (void *)cf, CFSTR("Failed to copy personalization manifest."), v30, v31, v32, v35);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v33);

      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = CFSTR("ImageSignature");
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
        }
        v27 = sub_10000B11C((uint64_t)"handle_query_personalization_manifest", 499, -3, 0, CFSTR("Invalid value for %@."), v24, v25, v26, (uint64_t)CFSTR("ImageSignature"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v27);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = CFSTR("PersonalizedImageType");
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
      }
      v23 = sub_10000B11C((uint64_t)"handle_query_personalization_manifest", 493, -3, 0, CFSTR("Invalid value for %@."), v20, v21, v22, (uint64_t)CFSTR("PersonalizedImageType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v9 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v19 = sub_10000B11C((uint64_t)"handle_query_personalization_manifest", 487, -3, 0, CFSTR("Invalid input(s)."), v16, v17, v18, v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v9 = 0;
    v5 = 0;
  }
  v15 = 0;
  if (a2 && v14)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v14, "description"));
    v15 = 0;
  }
LABEL_26:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v15;
}

uint64_t sub_1000057B4(const __CFDictionary *a1, __CFDictionary *a2)
{
  id v4;
  const void *Value;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  CFTypeRef cf;
  uint8_t buf[4];
  id v27;

  cf = 0;
  if (a1 && a2)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    Value = CFDictionaryGetValue(a1, CFSTR("PersonalizedImageType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
    v7 = sub_10000A944(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("PersonalizedImageType"));
    v9 = (void *)MobileStorageCopyPersonalizationNonceWithError(v4, &cf);
    if (v9)
    {
      v10 = v9;
      CFDictionarySetValue(a2, CFSTR("PersonalizationNonce"), v9);

      v11 = 0;
      v12 = 1;
      goto LABEL_20;
    }
    v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to copy personalization nonce."));
    if (cf)
    {
      v24 = (uint64_t)v17;
      v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v17 = (id)v18;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v22 = sub_10000B11C((uint64_t)"handle_query_personalization_nonce", 555, -2, (void *)cf, CFSTR("Failed to copy personalization nonce."), v19, v20, v21, v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v22);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v16 = sub_10000B11C((uint64_t)"handle_query_personalization_nonce", 542, -3, 0, CFSTR("Invalid input(s)."), v13, v14, v15, v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v4 = 0;
    v6 = 0;
  }
  v12 = 0;
  if (a2 && v11)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v11, "description"));
    v12 = 0;
  }
LABEL_20:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v12;
}

uint64_t sub_100005A70(const __CFDictionary *a1, __CFDictionary *a2)
{
  id v4;
  const void *Value;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  CFTypeRef cf;
  uint8_t buf[4];
  id v27;

  cf = 0;
  if (a1 && a2)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    Value = CFDictionaryGetValue(a1, CFSTR("PersonalizedImageType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
    v7 = sub_10000A944(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("PersonalizedImageType"));
    v9 = (void *)MobileStorageCopyPersonalizationIdentifiersWithError(v4, &cf);
    if (v9)
    {
      v10 = v9;
      CFDictionarySetValue(a2, CFSTR("PersonalizationIdentifiers"), v9);

      v11 = 0;
      v12 = 1;
      goto LABEL_20;
    }
    v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to copy personalization identifiers."));
    if (cf)
    {
      v24 = (uint64_t)v17;
      v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v17 = (id)v18;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v22 = sub_10000B11C((uint64_t)"handle_query_personalization_identifiers", 604, -2, (void *)cf, CFSTR("Failed to copy personalization identifiers."), v19, v20, v21, v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v22);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v16 = sub_10000B11C((uint64_t)"handle_query_personalization_identifiers", 591, -3, 0, CFSTR("Invalid input(s)."), v13, v14, v15, v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v4 = 0;
    v6 = 0;
  }
  v12 = 0;
  if (a2 && v11)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v11, "description"));
    v12 = 0;
  }
LABEL_20:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v12;
}

uint64_t sub_100005D2C(uint64_t a1, __CFDictionary *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  CFTypeRef cf;
  uint8_t buf[4];
  id v21;

  cf = 0;
  if (a1 && a2)
  {
    v3 = (void *)MobileStorageCopyCryptexNonceWithError(0, &cf);
    if (v3)
    {
      v4 = v3;
      CFDictionarySetValue(a2, CFSTR("CryptexNonce"), v3);

      v5 = 0;
      v6 = 1;
      goto LABEL_18;
    }
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to copy cryptex nonce."));
    if (cf)
    {
      v18 = (uint64_t)v11;
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v11 = (id)v12;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v16 = sub_10000B11C((uint64_t)"handle_query_cryptex_nonce", 644, -2, (void *)cf, CFSTR("Failed to copy cryptex nonce."), v13, v14, v15, v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v16);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v10 = sub_10000B11C((uint64_t)"handle_query_cryptex_nonce", 638, -3, 0, CFSTR("Invalid input(s)."), v7, v8, v9, v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }
  v6 = 0;
  if (a2 && v5)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v5, "description"));
    v6 = 0;
  }
LABEL_18:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v6;
}

uint64_t sub_100005F78(uint64_t a1, __CFDictionary *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v17;
  CFTypeRef cf;
  uint8_t buf[4];
  id v20;

  cf = 0;
  if (a1 && a2)
  {
    v3 = MobileStorageCopyDeveloperModeStatusWithError(0, &cf);
    if ((v3 & 1) != 0 || !cf)
    {
      CFDictionarySetValue(a2, CFSTR("DeveloperModeStatus"), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
      v10 = 0;
      v15 = 1;
      goto LABEL_19;
    }
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to copy developer mode status."));
    if (cf)
    {
      v17 = (uint64_t)v4;
      v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v4 = (id)v5;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v9 = sub_10000B11C((uint64_t)"handle_query_developer_mode_status", 684, -2, (void *)cf, CFSTR("Failed to copy developer mode status."), v6, v7, v8, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v14 = sub_10000B11C((uint64_t)"handle_query_developer_mode_status", 678, -3, 0, CFSTR("Invalid input(s)."), v11, v12, v13, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  v15 = 0;
  if (a2 && v10)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v10, "description"));
    v15 = 0;
  }
LABEL_19:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v15;
}

uint64_t sub_1000061D8(uint64_t a1, __CFDictionary *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  CFTypeRef cf;
  uint8_t buf[4];
  id v22;

  cf = 0;
  if (a1 && a2)
  {
    v3 = (void *)MobileStorageCopyDevicesWithError(0, &cf);
    v4 = sub_10000A8EC(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (v5)
    {
      if (v3)
        CFDictionarySetValue(a2, CFSTR("EntryList"), v3);
      CFDictionarySetValue(a2, CFSTR("Status"), CFSTR("Complete"));
      v6 = 0;
      v7 = 1;
      goto LABEL_20;
    }
    v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to copy device list."));
    if (cf)
    {
      v19 = (uint64_t)v12;
      v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v12 = (id)v13;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v17 = sub_10000B11C((uint64_t)"handle_copy_devices", 724, -2, (void *)cf, CFSTR("Failed to copy device list."), v14, v15, v16, v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v17);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v11 = sub_10000B11C((uint64_t)"handle_copy_devices", 718, -3, 0, CFSTR("Invalid input(s)."), v8, v9, v10, v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v3 = 0;
  }
  v7 = 0;
  if (a2 && v6)
  {
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v6, "description"));
    v7 = 0;
  }
LABEL_20:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v7;
}

uint64_t sub_10000645C(uint64_t a1, CFMutableDictionaryRef theDict)
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;

  if (a1)
    v3 = theDict == 0;
  else
    v3 = 1;
  v4 = !v3;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", (uint8_t *)&v12, 2u);
    }
    v9 = sub_10000B11C((uint64_t)"handle_hangup", 760, -3, 0, CFSTR("Invalid input(s)."), v6, v7, v8, v12);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v5 = (void *)v10;
    if (theDict && v10)
    {
      if (!CFDictionaryGetValue(theDict, CFSTR("Error")))
        CFDictionarySetValue(theDict, CFSTR("Error"), CFSTR("InternalError"));
      CFDictionarySetValue(theDict, CFSTR("DetailedError"), objc_msgSend(v5, "description"));
    }
  }
  else
  {
    CFDictionarySetValue(theDict, CFSTR("Goodbye"), kCFBooleanTrue);
    v5 = 0;
  }

  return v4;
}

BOOL sub_100006590()
{
  id v0;
  void *v1;
  int v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint8_t buf[16];
  uint64_t v7;
  _QWORD v8[2];
  int v9;

  v7 = 0;
  v8[0] = &v7;
  v8[1] = 0x2020000000;
  v9 = 0;
  if (!&_lockdown_checkin_xpc)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Platform does not support lockdown.", buf, 2u);
    }
    goto LABEL_8;
  }
  v0 = sub_100003810();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000066E8;
  v5[3] = &unk_1000206B8;
  v5[4] = &v7;
  v2 = lockdown_checkin_xpc("com.apple.mobile.storage_mounter_proxy", 0, v1, v5);
  *(_DWORD *)(v8[0] + 24) = v2;

  if (!*(_DWORD *)(v8[0] + 24))
  {
LABEL_8:
    v3 = 1;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_100015528((uint64_t)v8);
  v3 = *(_DWORD *)(v8[0] + 24) == 0;
LABEL_9:
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_1000066D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1000066E8(uint64_t a1, uint64_t a2, CFDictionaryRef theDict, __n128 a4)
{
  const void *Value;
  __CFString *v7;
  CFMutableDictionaryRef v8;
  __CFString *v9;
  const void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  char v15;
  const char *v16;
  __CFDictionary *v17;
  const __CFString *v18;
  uint32_t v19;
  int v20;
  int v21;
  int v22;
  __n128 v23;
  __CFString *v24;
  const __CFDictionary *v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  __CFString *v29;

  v25 = 0;
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("ClientName"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
  }
  else
  {
    v24 = 0;
  }
  v7 = 0;
  a4.n128_u64[0] = 138412290;
  v23 = a4;
  while (1)
  {
    v8 = sub_10000A56C();
    if (!v8)
      break;
    v9 = (__CFString *)v8;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = lockdown_receive_message(a2, &v25);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v22;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive message: 0x%08x", buf, 8u);
      }
      CFRelease(v9);
      goto LABEL_106;
    }
    v10 = CFDictionaryGetValue(v25, CFSTR("Command"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);

    v12 = sub_10000A944(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412546;
        v27 = CFSTR("Command");
        v28 = 2112;
        v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
      }
      v17 = (__CFDictionary *)v9;
      v18 = CFSTR("MissingCommand");
LABEL_17:
      CFDictionarySetValue(v17, CFSTR("Error"), v18);
LABEL_48:
      v15 = 0;
      goto LABEL_49;
    }
    if (v14)
    {
      *(_DWORD *)buf = 138543618;
      v27 = v24;
      v28 = 2114;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Host connection (%{public}@): %{public}@", buf, 0x16u);
    }
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("LookupImage"), *(_OWORD *)&v23))
    {
      if ((sub_100003B64(v25, (__CFDictionary *)v9) & 1) != 0)
        goto LABEL_39;
      v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Failed to lookup image.";
        goto LABEL_46;
      }
    }
    else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("CopyDevices")))
    {
      if ((sub_1000061D8((uint64_t)v25, (__CFDictionary *)v9) & 1) != 0)
        goto LABEL_39;
      v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Failed to copy device list.";
        goto LABEL_46;
      }
    }
    else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("MountImage")))
    {
      if (sub_100003B34())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
        goto LABEL_30;
      }
      if ((sub_1000042D8(v25, (__CFDictionary *)v9) & 1) != 0)
        goto LABEL_39;
      v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Failed to mount image.";
        goto LABEL_46;
      }
    }
    else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("UnmountImage")))
    {
      if (sub_100003B34())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
        goto LABEL_30;
      }
      if ((sub_100004C34(v25, (__CFDictionary *)v9) & 1) != 0)
        goto LABEL_39;
      v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Failed to unmount image.";
        goto LABEL_46;
      }
    }
    else
    {
      if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("Hangup")))
      {
        if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("ReceiveBytes")))
        {
          if (sub_100003B34())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_29;
            goto LABEL_30;
          }
          CFDictionarySetValue((CFMutableDictionaryRef)v9, CFSTR("Status"), CFSTR("ReceiveBytesAck"));
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = lockdown_send_message(a2, v9, 100);
          if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          {
            v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
            v21 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
            *(_DWORD *)buf = 67109120;
            LODWORD(v27) = v21;
            v16 = "Failed to send message: 0x%08x";
            v19 = 8;
            goto LABEL_47;
          }
          if (sub_1000071EC(a2, v25, (__CFDictionary *)v9))
          {
            v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
            *(_WORD *)buf = 0;
            v16 = "Failed to receive bytes.";
            goto LABEL_46;
          }
        }
        else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("RollPersonalizationNonce")))
        {
          if (sub_100003B34())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_29;
            goto LABEL_30;
          }
          if ((sub_100004F54((uint64_t)v25, (__CFDictionary *)v9) & 1) == 0)
          {
            v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
            *(_WORD *)buf = 0;
            v16 = "Failed to roll personalization nonce.";
LABEL_46:
            v19 = 2;
LABEL_47:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, buf, v19);
            goto LABEL_48;
          }
        }
        else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("RollCryptexNonce")))
        {
          if (sub_100003B34())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
LABEL_29:
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked, denying host request.", buf, 2u);
            }
LABEL_30:
            v17 = (__CFDictionary *)v9;
            v18 = CFSTR("DeviceLocked");
            goto LABEL_17;
          }
          if ((sub_1000051A0((uint64_t)v25, (__CFDictionary *)v9) & 1) == 0)
          {
            v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
            *(_WORD *)buf = 0;
            v16 = "Failed to roll cryptex nonce.";
            goto LABEL_46;
          }
        }
        else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("QueryPersonalizationManifest")))
        {
          if ((sub_1000053EC(v25, (__CFDictionary *)v9) & 1) == 0)
          {
            v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
            *(_WORD *)buf = 0;
            v16 = "Failed to query personalization manifest.";
            goto LABEL_46;
          }
        }
        else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("QueryNonce")))
        {
          if ((sub_1000057B4(v25, (__CFDictionary *)v9) & 1) == 0)
          {
            v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
            goto LABEL_85;
          }
        }
        else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("QueryPersonalizationIdentifiers")))
        {
          if ((sub_100005A70(v25, (__CFDictionary *)v9) & 1) == 0)
          {
            v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
            *(_WORD *)buf = 0;
            v16 = "Failed to query personalization identifiers.";
            goto LABEL_46;
          }
        }
        else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("QueryCryptexNonce")))
        {
          if ((sub_100005D2C((uint64_t)v25, (__CFDictionary *)v9) & 1) == 0)
          {
            v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
LABEL_85:
            *(_WORD *)buf = 0;
            v16 = "Failed to query personalization nonce.";
            goto LABEL_46;
          }
        }
        else
        {
          if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("QueryDeveloperModeStatus")))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23.n128_u32[0];
              v27 = v11;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid command: %@", buf, 0xCu);
            }
            v17 = (__CFDictionary *)v9;
            v18 = CFSTR("UnknownCommand");
            goto LABEL_17;
          }
          if ((sub_100005F78((uint64_t)v25, (__CFDictionary *)v9) & 1) == 0)
          {
            v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
            *(_WORD *)buf = 0;
            v16 = "Failed to query developer mode status.";
            goto LABEL_46;
          }
        }
LABEL_39:
        v15 = 1;
        goto LABEL_49;
      }
      if ((sub_10000645C((uint64_t)v25, (CFMutableDictionaryRef)v9) & 1) != 0)
        goto LABEL_48;
      v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Failed to hangup.";
        goto LABEL_46;
      }
    }
LABEL_49:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending response: %{public}@", buf, 0xCu);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = lockdown_send_message(a2, v9, 100);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v20;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send message: 0x%08x", buf, 8u);
        v15 = 0;
      }
    }
    CFRelease(v9);
    if (v25)
      CFRelease(v25);
    v25 = 0;
    v7 = v11;
    if ((v15 & 1) == 0)
      goto LABEL_107;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
  }
LABEL_106:
  v11 = v7;
LABEL_107:
  if (a2)
    lockdown_disconnect(a2);

}

uint64_t sub_1000071EC(uint64_t a1, const __CFDictionary *a2, __CFDictionary *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  const void *Value;
  id v23;
  void *v24;
  const void *v25;
  id v26;
  void *v27;
  const void *v28;
  id v29;
  void *v30;
  unsigned int v31;
  uint64_t inited;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  unsigned __int8 v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  __CFString **v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  int *v79;
  char *v80;
  int *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  NSFileAttributeKey v93;
  _UNKNOWN **v94;
  _BYTE buf[12];
  __int16 v96;
  char *v97;
  uint8_t v98[4];
  int v99;
  _OWORD v100[28];
  uint64_t v101;
  char __str[1024];

  bzero(__str, 0x400uLL);
  v101 = 0;
  memset(v100, 0, sizeof(v100));
  if (!a1 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v14 = sub_10000B11C((uint64_t)"handle_receive_bytes", 135, -3, 0, CFSTR("Invalid input(s)."), v11, v12, v13, v90);
    v10 = (id)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_10;
  }
  if (sub_100003A84())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing file transfer in progress.", buf, 2u);
    }
    v9 = sub_10000B11C((uint64_t)"handle_receive_bytes", 140, -2, 0, CFSTR("Existing file transfer in progress."), v6, v7, v8, v90);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("ExistingTransferInProgress"));
LABEL_10:
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
LABEL_11:
    v19 = -1;
LABEL_12:
    v20 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  Value = CFDictionaryGetValue(a2, CFSTR("ImageType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v23 = sub_10000A944(v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  if (!v24)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("ImageType");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    v42 = sub_10000B11C((uint64_t)"handle_receive_bytes", 148, -3, 0, CFSTR("Invalid value for %@."), v39, v40, v41, (uint64_t)CFSTR("ImageType"));
    v10 = (id)objc_claimAutoreleasedReturnValue(v42);
    CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("MissingImageType"));
    v15 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_11;
  }
  v25 = CFDictionaryGetValue(a2, CFSTR("ImageSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v26 = sub_10000A83C(v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  if (!v27)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("ImageSize");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    v46 = sub_10000B11C((uint64_t)"handle_receive_bytes", 156, -3, 0, CFSTR("Invalid value for %@."), v43, v44, v45, (uint64_t)CFSTR("ImageSize"));
    v10 = (id)objc_claimAutoreleasedReturnValue(v46);
    CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("MissingImageSize"));
    v15 = 0;
    v16 = 0;
    goto LABEL_11;
  }
  v28 = CFDictionaryGetValue(a2, CFSTR("ImageSignature"));
  v16 = (id)objc_claimAutoreleasedReturnValue(v28);
  v29 = sub_10000A99C(v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  if (!v30)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("ImageSignature");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    v50 = sub_10000B11C((uint64_t)"handle_receive_bytes", 164, -3, 0, CFSTR("Invalid value for %@."), v47, v48, v49, (uint64_t)CFSTR("ImageSignature"));
    goto LABEL_68;
  }
  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("Personalized")) & 1) != 0
    || objc_msgSend(v18, "isEqualToString:", CFSTR("Cryptex")))
  {
    *(_QWORD *)buf = 0;
    v92 = 0;
    v31 = objc_msgSend(v18, "isEqualToString:", CFSTR("Personalized"));
    v16 = objc_retainAutorelease(v16);
    inited = Img4DecodeInitManifest((uint64_t)objc_msgSend(v16, "bytes"), (uint64_t)objc_msgSend(v16, "length"), (uint64_t)v100);
    if ((_DWORD)inited)
    {
      v33 = inited;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v98 = 67109120;
        v99 = v33;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to init img4 manifest: %d", v98, 8u);
      }
      v37 = CFSTR("Failed to init img4 manifest: %d");
      v90 = v33;
      v38 = 186;
LABEL_67:
      v50 = sub_10000B11C((uint64_t)"handle_receive_bytes", v38, -2, 0, v37, v34, v35, v36, v90);
LABEL_68:
      v10 = (id)objc_claimAutoreleasedReturnValue(v50);
LABEL_69:
      v15 = 0;
      goto LABEL_11;
    }
    if (v31)
      v51 = 1885629799;
    else
      v51 = 1668315236;
    Img4DecodeGetObjectPropertyData((uint64_t)v100, v51, 1145525076, buf, &v92);
    v53 = v52;
    if ((_DWORD)v52 == 1)
    {
      if (!objc_msgSend(v18, "isEqualToString:", CFSTR("Cryptex")))
      {
        v53 = 1;
        goto LABEL_61;
      }
      Img4DecodeGetObjectPropertyData((uint64_t)v100, 1885629799, 1145525076, buf, &v92);
      v53 = v54;
    }
    if (!(_DWORD)v53)
    {
      v55 = objc_alloc((Class)NSData);
      v56 = objc_msgSend(v55, "initWithBytes:length:", *(_QWORD *)buf, v92);

      if (!v56)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v98 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", v98, 2u);
        }
        v78 = sub_10000B11C((uint64_t)"handle_receive_bytes", 206, -2, 0, CFSTR("Failed to create data."), v75, v76, v77, v90);
        v10 = (id)objc_claimAutoreleasedReturnValue(v78);
        v16 = 0;
        goto LABEL_69;
      }
      v16 = v56;
      goto LABEL_49;
    }
LABEL_61:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v98 = 67109120;
      v99 = v53;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", v98, 8u);
    }
    v37 = CFSTR("Failed to retrieve data from manifest: %d");
    v90 = v53;
    v38 = 200;
    goto LABEL_67;
  }
LABEL_49:
  v57 = sub_10000EF68();
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  if (!v58)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query working directory.", buf, 2u);
    }
    v37 = CFSTR("Failed to query working directory.");
    v38 = 213;
    goto LABEL_67;
  }
  v59 = v58;
  v60 = sub_10000E4E8(v16, v58);
  v15 = (id)objc_claimAutoreleasedReturnValue(v60);

  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      v96 = 2112;
      v97 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path with signature %@ in %@.", buf, 0x16u);
    }
    v37 = CFSTR("Failed to create path with signature %@ in %@.");
    v90 = (uint64_t)v16;
    v38 = 219;
    goto LABEL_67;
  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v93 = NSFilePosixPermissions;
  v94 = &off_1000234F8;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
  v91 = 0;
  v63 = objc_msgSend(v61, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, v62, &v91);
  v10 = v91;

  if ((v63 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@.", buf, 0xCu);
    }
    v74 = sub_10000B11C((uint64_t)"handle_receive_bytes", 224, -2, 0, CFSTR("Failed to create %@."), v71, v72, v73, (uint64_t)v15);
    goto LABEL_79;
  }
  v15 = objc_retainAutorelease(v15);
  snprintf(__str, 0x400uLL, "%s/XXXXXX.dmg", (const char *)objc_msgSend(v15, "UTF8String"));
  v64 = mkstemps(__str, 4);
  if (v64 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v79 = __error();
      v80 = strerror(*v79);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = __str;
      v96 = 2080;
      v97 = v80;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %s", buf, 0x16u);
    }
    v81 = __error();
    strerror(*v81);
    v74 = sub_10000B11C((uint64_t)"handle_receive_bytes", 233, -2, 0, CFSTR("Failed to create %s: %s"), v82, v83, v84, (uint64_t)__str);
LABEL_79:
    v85 = objc_claimAutoreleasedReturnValue(v74);

    CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("FileCreateFailed"));
    v19 = -1;
    v10 = (id)v85;
    goto LABEL_12;
  }
  v19 = v64;
  if (sub_10000E6CC(__str))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = __str;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Path is bad: %s", buf, 0xCu);
    }
    v68 = sub_10000B11C((uint64_t)"handle_receive_bytes", 239, -2, 0, CFSTR("Path is bad: %s"), v65, v66, v67, (uint64_t)__str);
    v69 = objc_claimAutoreleasedReturnValue(v68);

    v70 = off_100020918;
  }
  else
  {
    sub_100003A08(1);
    sub_10000387C((uint64_t)__str);
    if ((sub_100007DE0(v19, a1, (unint64_t)objc_msgSend(v17, "unsignedLongValue")) & 1) != 0)
    {
      CFDictionarySetValue(a3, CFSTR("Status"), CFSTR("Complete"));
      v20 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = __str;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive bytes into %s.", buf, 0xCu);
    }
    v89 = sub_10000B11C((uint64_t)"handle_receive_bytes", 249, -2, 0, CFSTR("Failed to receive bytes into %s."), v86, v87, v88, (uint64_t)__str);
    v69 = objc_claimAutoreleasedReturnValue(v89);

    v70 = off_100020938;
  }
  CFDictionarySetValue(a3, CFSTR("Error"), *v70);
  v20 = 0xFFFFFFFFLL;
  v10 = (id)v69;
LABEL_13:
  if (v10)
  {
    if (!CFDictionaryGetValue(a3, CFSTR("Error")))
      CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a3, CFSTR("DetailedError"), objc_msgSend(v10, "description"));
  }
  if (v19 != -1)
    close(v19);
  if (v10)
    sub_10000387C(0);
  sub_100003A08(0);

  return v20;
}

uint64_t sub_100007DE0(int a1, uint64_t a2, unint64_t a3)
{
  _QWORD *v5;
  size_t v6;
  void *v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint32_t v14;
  _QWORD v16[2];
  BOOL (*v17)(uint64_t, void *, size_t);
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  int v22;
  _QWORD v23[4];
  _QWORD v24[3];
  int v25;
  uint8_t buf[4];
  int v27;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v17 = sub_1000080BC;
  v18 = &unk_1000206E0;
  v20 = v24;
  v21 = a3;
  v19 = v23;
  v22 = a1;
  v5 = v16;
  if (a3 >= 0x20000)
    v6 = 0x20000;
  else
    v6 = a3;
  v7 = malloc_type_malloc(v6, 0xF2ABD754uLL);
  if (v7)
  {
    if (!a3)
    {
LABEL_13:
      free(v7);

      v11 = 1;
      goto LABEL_24;
    }
    v8 = 0;
    while (1)
    {
      if (a3 - v8 >= v6)
        v9 = v6;
      else
        v9 = a3 - v8;
      v10 = lockdown_recv(a2, v7, v9);
      if ((unint64_t)(v10 + 1) <= 1)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        v12 = *__error();
        *(_DWORD *)buf = 67109120;
        v27 = v12;
        v13 = "Failed to receive secure message: %{errno}d";
        v14 = 8;
        goto LABEL_20;
      }
      if ((((uint64_t (*)(_QWORD *, void *, uint64_t))v17)(v5, v7, v10) & 1) == 0)
        break;
      v8 += v10;
      if (v8 >= a3)
        goto LABEL_13;
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v13 = "Transfer cancelled.";
    v14 = 2;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
LABEL_21:
    free(v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate buffer.", buf, 2u);
  }

  v11 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive data.", buf, 2u);
    v11 = 0;
  }
LABEL_24:
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  return v11;
}

void sub_10000808C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

BOOL sub_1000080BC(uint64_t a1, void *__buf, size_t __nbyte)
{
  uint64_t v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  ssize_t v10;
  int v11;
  _DWORD v13[2];

  v6 = a1 + 32;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += __nbyte;
  v7 = (uint64_t *)(a1 + 48);
  v8 = (int)(float)((float)((float)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
                          / (float)*(unint64_t *)(a1 + 48))
                  * 100.0);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_DWORD *)(v9 + 24) != v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_1000155AC(v6, v7, v8);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_DWORD *)(v9 + 24) = v8;
  v10 = write(*(_DWORD *)(a1 + 56), __buf, __nbyte);
  if (v10 == -1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *__error();
    v13[0] = 67109120;
    v13[1] = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Write failed: %{errno}d", (uint8_t *)v13, 8u);
  }
  return v10 != -1;
}

uint64_t sub_10000822C()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t remote_service_listener;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;

  v0 = (void *)MGCopyAnswer(CFSTR("DeviceSupportsLockdown"), 0);
  if (!v0)
  {
    remote_service_listener = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v6 = "Failed to read DeviceSupportsLockdown from gestalt.";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    remote_service_listener = 0;
    goto LABEL_11;
  }
  v1 = sub_100003810();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  remote_service_listener = xpc_remote_connection_create_remote_service_listener("com.apple.mobile.storage_mounter_proxy.bridge", v2, 0);

  if (!remote_service_listener)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v6 = "Failed to create remote listener.";
    goto LABEL_10;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000083F8;
  v8[3] = &unk_100020758;
  v9 = v0;
  xpc_remote_connection_set_event_handler(remote_service_listener, v8, v4, v5);
  xpc_remote_connection_activate(remote_service_listener);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "com.apple.mobile.storage_mounter_proxy.bridge";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RemoteXPC service (%s) alive.", buf, 0xCu);
  }

  remote_service_listener = 1;
LABEL_11:

  return remote_service_listener;
}

void sub_1000083F8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000848C;
  v6[3] = &unk_100020730;
  v7 = a2;
  v8 = *(id *)(a1 + 32);
  v3 = v7;
  xpc_remote_connection_set_event_handler(v3, v6, v4, v5);
  xpc_remote_connection_activate(v3);

}

void sub_10000848C(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t reply;
  void *v5;
  dispatch_semaphore_t v6;
  dispatch_semaphore_t v7;
  xpc_object_t value;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  id v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  const void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  const void *v23;
  void *v24;
  id v25;
  void *v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFMutableDictionaryRef v31;
  CFMutableDictionaryRef v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  __CFString **v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  _BOOL4 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  const char *CStringPtr;
  xpc_object_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  xpc_object_t v71;
  const char *v72;
  id v73;
  xpc_object_t v74;
  void *v75;
  void *v76;
  dispatch_queue_global_t global_queue;
  void *v78;
  NSObject *v79;
  dispatch_time_t v80;
  const char *v81;
  void *v82;
  __CFDictionary *v83;
  int v84;
  __CFString *v85;
  void *v86;
  _QWORD v87[4];
  NSObject *v88;
  _BYTE buf[24];
  void *v90;
  id v91;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_remote_connection_cancel(*(_QWORD *)(a1 + 32));
    goto LABEL_18;
  }
  reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    v5 = reply;
    v6 = dispatch_semaphore_create(0);
    if (v6)
    {
      v7 = v6;
      value = xpc_dictionary_get_value(v3, "XPCRequestDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue(value);
      v10 = v9;
      if (!v9 || xpc_get_type(v9) != (xpc_type_t)&_xpc_type_dictionary)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "XPCRequestDictionary";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v10;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %s: %@", buf, 0x16u);
        }
        v14 = CFSTR("Invalid value for %s: %@");
        v81 = "XPCRequestDictionary";
        v15 = 796;
LABEL_9:
        v16 = sub_10000B11C((uint64_t)"remote_service_init_block_invoke", v15, -2, 0, v14, v11, v12, v13, (uint64_t)v81);

LABEL_10:
LABEL_11:

        goto LABEL_18;
      }
      v17 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject(v10);
      if (!v17)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cannot create CF object from XPC request dictionary", buf, 2u);
        }
        v14 = CFSTR("Cannot create CF object from XPC request dictionary");
        v15 = 802;
        goto LABEL_9;
      }
      v18 = v17;
      v19 = CFDictionaryGetValue(v17, CFSTR("HostProcessName"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
      v21 = sub_10000A944(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      if (!v22)
      {

        v20 = CFSTR("unknown");
      }
      v23 = CFDictionaryGetValue(v18, CFSTR("Command"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = sub_10000A944(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

      v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v27)
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v24;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote connection (%{public}@): %{public}@", buf, 0x16u);
        }
        v31 = sub_10000A56C();
        if (v31)
        {
          v32 = v31;
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("ReceiveBytes")))
          {
            if ((sub_10000952C(v3, v5, v18, v32) & 1) != 0)
            {

              CFRelease(v18);
LABEL_132:
              CFRelease(v32);

              goto LABEL_11;
            }
            v85 = v20;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_103;
            *(_WORD *)buf = 0;
            v39 = "Failed to receive bytes.";
            goto LABEL_45;
          }
          v85 = v20;
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("LookupImage")))
          {
            if ((sub_100003B64(v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_103;
            }
            *(_WORD *)buf = 0;
            v39 = "Failed to lookup image.";
            goto LABEL_45;
          }
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("CopyDevices")))
          {
            if ((sub_1000061D8((uint64_t)v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_103;
            }
            *(_WORD *)buf = 0;
            v39 = "Failed to copy device list.";
            goto LABEL_45;
          }
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("MountImage")))
          {
            if (sub_100003B34())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked.", buf, 2u);
              }
              v43 = 855;
LABEL_60:
              v44 = sub_10000B11C((uint64_t)"remote_service_init_block_invoke", v43, -2, 0, CFSTR("Device is locked."), v40, v41, v42, (uint64_t)v81);
              v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
              v46 = off_100020930;
LABEL_74:
              CFDictionarySetValue(v32, CFSTR("Error"), *v46);
LABEL_104:
              v84 = 0;
              goto LABEL_105;
            }
            if (sub_100003A84())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing file transfer in progress.", buf, 2u);
              }
              v50 = 861;
LABEL_73:
              v51 = sub_10000B11C((uint64_t)"remote_service_init_block_invoke", v50, -2, 0, CFSTR("Existing file transfer in progress."), v47, v48, v49, (uint64_t)v81);
              v45 = (void *)objc_claimAutoreleasedReturnValue(v51);
              v46 = off_100020950;
              goto LABEL_74;
            }
            if ((sub_1000042D8(v18, v32) & 1) == 0)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_103;
              *(_WORD *)buf = 0;
              v39 = "Failed to mount image.";
LABEL_45:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
LABEL_103:
              v45 = 0;
              goto LABEL_104;
            }
            goto LABEL_84;
          }
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("UnmountImage")))
          {
            if (sub_100003B34())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked.", buf, 2u);
              }
              v43 = 876;
              goto LABEL_60;
            }
            if (sub_100003A84())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing file transfer in progress.", buf, 2u);
              }
              v50 = 882;
              goto LABEL_73;
            }
            if ((sub_100004C34(v18, v32) & 1) == 0)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_103;
              *(_WORD *)buf = 0;
              v39 = "Failed to unmount image.";
              goto LABEL_45;
            }
LABEL_84:
            v45 = 0;
            v84 = 1;
            goto LABEL_105;
          }
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("Hangup")))
          {
            if ((sub_10000645C((uint64_t)v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_103;
            }
            *(_WORD *)buf = 0;
            v39 = "Failed to hangup.";
            goto LABEL_45;
          }
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("RollPersonalizationNonce")))
          {
            if (sub_100003B34())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked.", buf, 2u);
              }
              v43 = 904;
              goto LABEL_60;
            }
            if ((sub_100004F54((uint64_t)v18, v32) & 1) == 0
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to roll personalization nonce.", buf, 2u);
            }
            v84 = 0;
            v45 = 0;
LABEL_105:
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v32;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending response: %{public}@", buf, 0xCu);
            }
            v53 = _CFXPCCreateXPCObjectFromCFObject(v32);
            v86 = (void *)v53;
            if (v53)
            {
              v54 = (void *)v53;
              v55 = v5;
              *(_QWORD *)buf = _NSConcreteStackBlock;
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = sub_10000A40C;
              v90 = &unk_1000207A8;
              v91 = v55;
              LOBYTE(v54) = xpc_dictionary_apply(v54, buf);

              if ((v54 & 1) != 0)
                goto LABEL_119;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create XPC object from CF object.", buf, 2u);
              }
              v59 = sub_10000B11C((uint64_t)"remote_service_init_block_invoke", 1038, -2, 0, CFSTR("Failed to create XPC object from CF object."), v56, v57, v58, (uint64_t)v81);
              v60 = objc_claimAutoreleasedReturnValue(v59);

              v45 = (void *)v60;
            }
            v61 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v45)
            {
              if (v61)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to merge XPC dictionary.", buf, 2u);
              }
              goto LABEL_120;
            }
            if (v61)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to merge XPC dictionary.", buf, 2u);
            }
            v65 = sub_10000B11C((uint64_t)"remote_service_init_block_invoke", 1043, -2, 0, CFSTR("Failed to merge XPC dictionary."), v62, v63, v64, (uint64_t)v81);
            v45 = (void *)objc_claimAutoreleasedReturnValue(v65);
LABEL_119:
            if (!v45)
            {
LABEL_123:
              xpc_dictionary_send_reply(v5);
              v20 = v85;
              v75 = v86;
              if (v84)
              {
                if (objc_msgSend(*(id *)(a1 + 40), "BOOLValue"))
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Delegating RSD reset to lockdownd.", buf, 2u);
                  }
                }
                else
                {
                  v76 = v24;
                  global_queue = dispatch_get_global_queue(0, 0);
                  v78 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
                  v87[0] = _NSConcreteStackBlock;
                  v87[1] = 3221225472;
                  v87[2] = sub_10000A0DC;
                  v87[3] = &unk_100020708;
                  v79 = v7;
                  v88 = v79;
                  remote_device_browse_present(0xFFFFLL, v78, v87);

                  v80 = dispatch_time(0, 20000000000);
                  if (dispatch_semaphore_wait(v79, v80)
                    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
                  {
                    sub_10001564C();
                  }

                  v24 = v76;
                  v75 = v86;
                }
              }
              CFRelease(v18);

              goto LABEL_132;
            }
LABEL_120:
            v83 = v32;
            v82 = v24;
            CStringPtr = CFStringGetCStringPtr(CFSTR("Error"), 0x8000100u);
            v67 = xpc_dictionary_get_value(v5, CStringPtr);
            v68 = (void *)objc_claimAutoreleasedReturnValue(v67);

            if (!v68)
            {
              v69 = CFStringGetCStringPtr(CFSTR("Error"), 0x8000100u);
              v70 = CFStringGetCStringPtr(CFSTR("InternalError"), 0x8000100u);
              v71 = xpc_string_create(v70);
              xpc_dictionary_set_value(v5, v69, v71);

            }
            v72 = CFStringGetCStringPtr(CFSTR("DetailedError"), 0x8000100u);
            v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "description")));
            v74 = xpc_string_create((const char *)objc_msgSend(v73, "UTF8String"));
            xpc_dictionary_set_value(v5, v72, v74);

            v24 = v82;
            v32 = v83;
            goto LABEL_123;
          }
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("RollCryptexNonce")))
          {
            if (!sub_100003B34())
            {
              if ((sub_1000051A0((uint64_t)v18, v32) & 1) != 0
                || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                goto LABEL_103;
              }
              *(_WORD *)buf = 0;
              v39 = "Failed to roll cryptex nonce.";
              goto LABEL_45;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked.", buf, 2u);
            }
            v43 = 917;
            goto LABEL_60;
          }
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("QueryPersonalizationManifest")))
          {
            if ((sub_1000053EC(v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }
            *(_WORD *)buf = 0;
            v52 = "Failed to query personalization manifest.";
          }
          else if (objc_msgSend(v24, "isEqualToString:", CFSTR("QueryNonce")))
          {
            if ((sub_1000057B4(v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }
            *(_WORD *)buf = 0;
            v52 = "Failed to query personalization nonce.";
          }
          else if (objc_msgSend(v24, "isEqualToString:", CFSTR("QueryPersonalizationIdentifiers")))
          {
            if ((sub_100005A70(v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }
            *(_WORD *)buf = 0;
            v52 = "Failed to query personalization identifiers.";
          }
          else if (objc_msgSend(v24, "isEqualToString:", CFSTR("QueryCryptexNonce")))
          {
            if ((sub_100005D2C((uint64_t)v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }
            *(_WORD *)buf = 0;
            v52 = "Failed to query cryptex nonce.";
          }
          else
          {
            if (!objc_msgSend(v24, "isEqualToString:", CFSTR("QueryDeveloperModeStatus")))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v24;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid command: %@", buf, 0xCu);
              }
              CFDictionarySetValue(v32, CFSTR("Error"), CFSTR("UnknownCommand"));
              goto LABEL_150;
            }
            if ((sub_100005F78((uint64_t)v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
LABEL_150:
              v45 = 0;
              v84 = 0;
              goto LABEL_105;
            }
            *(_WORD *)buf = 0;
            v52 = "Failed to query developer mode status.";
          }
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
          goto LABEL_150;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
        }
        v38 = sub_10000B11C((uint64_t)"remote_service_init_block_invoke", 822, -2, 0, CFSTR("Failed to create dictionary."), v35, v36, v37, (uint64_t)v81);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v38);
      }
      else
      {
        if (v27)
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = CFSTR("Command");
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v24;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
        }
        v33 = sub_10000B11C((uint64_t)"remote_service_init_block_invoke", 813, -2, 0, CFSTR("Invalid value for %@: %@"), v28, v29, v30, (uint64_t)CFSTR("Command"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        CFDictionarySetValue(0, CFSTR("Error"), CFSTR("MissingCommand"));
      }
      CFRelease(v18);

      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create semaphore.", buf, 2u);
    }

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create reply.", buf, 2u);
  }
LABEL_18:

}

uint64_t sub_10000952C(void *a1, void *a2, const __CFDictionary *a3, __CFDictionary *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  __CFString **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  xpc_object_t value;
  uint64_t v20;
  void *v21;
  const void *v22;
  void *v23;
  id v24;
  void *v25;
  const void *v26;
  uint64_t v27;
  id v28;
  unsigned int v29;
  uint64_t inited;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  unsigned __int8 v64;
  uint64_t v65;
  int v66;
  _BOOL4 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __CFString *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  int *v88;
  char *v89;
  int *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  _QWORD v97[4];
  id v98;
  id v99;
  uint64_t v100;
  NSFileAttributeKey v101;
  _UNKNOWN **v102;
  _BYTE buf[12];
  __int16 v104;
  char *v105;
  uint8_t v106[4];
  int v107;
  _OWORD v108[28];
  uint64_t v109;
  char __str[1024];

  v7 = a1;
  v8 = a2;
  bzero(__str, 0x400uLL);
  v109 = 0;
  memset(v108, 0, sizeof(v108));
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v18 = sub_10000B11C((uint64_t)"handle_receive_bytes", 59, -3, 0, CFSTR("Invalid input(s)."), v15, v16, v17, v94);
    v13 = (id)objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_22;
  }
  if (sub_100003A84())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing file transfer in progress.", buf, 2u);
    }
    v12 = sub_10000B11C((uint64_t)"handle_receive_bytes", 64, -2, 0, CFSTR("Existing file transfer in progress."), v9, v10, v11, v94);
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    v14 = off_100020950;
LABEL_21:
    CFDictionarySetValue(a4, CFSTR("Error"), *v14);
LABEL_22:
    v40 = 0;
    v28 = 0;
    v23 = 0;
LABEL_23:
    v41 = 0;
    LODWORD(v42) = -1;
    goto LABEL_24;
  }
  value = xpc_dictionary_get_value(v7, "XPCRequestRecvTx");
  v20 = objc_claimAutoreleasedReturnValue(value);
  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "XPCRequestRecvTx";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %s.", buf, 0xCu);
    }
    v39 = sub_10000B11C((uint64_t)"handle_receive_bytes", 71, -3, 0, CFSTR("Invalid value for %s."), v36, v37, v38, (uint64_t)"XPCRequestRecvTx");
    v13 = (id)objc_claimAutoreleasedReturnValue(v39);
    v14 = off_100020940;
    goto LABEL_21;
  }
  v21 = (void *)v20;
  v22 = CFDictionaryGetValue(a3, CFSTR("ImageType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = sub_10000A944(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  if (!v25)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("ImageType");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    v48 = sub_10000B11C((uint64_t)"handle_receive_bytes", 79, -3, 0, CFSTR("Invalid value for %@."), v45, v46, v47, (uint64_t)CFSTR("ImageType"));
    v13 = (id)objc_claimAutoreleasedReturnValue(v48);
    CFDictionarySetValue(a4, CFSTR("Error"), CFSTR("MissingImageType"));
    goto LABEL_40;
  }
  v26 = CFDictionaryGetValue(a3, CFSTR("ImageSignature"));
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (!v27)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("ImageSignature");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    v52 = sub_10000B11C((uint64_t)"handle_receive_bytes", 87, -3, 0, CFSTR("Invalid value for %@."), v49, v50, v51, (uint64_t)CFSTR("ImageSignature"));
    v13 = (id)objc_claimAutoreleasedReturnValue(v52);
LABEL_40:

    v40 = 0;
    v28 = 0;
    goto LABEL_23;
  }
  v28 = (id)v27;
  if ((objc_msgSend(v23, "isEqualToString:", CFSTR("Personalized")) & 1) == 0
    && !objc_msgSend(v23, "isEqualToString:", CFSTR("Cryptex")))
  {
    goto LABEL_50;
  }
  *(_QWORD *)buf = 0;
  v100 = 0;
  v29 = objc_msgSend(v23, "isEqualToString:", CFSTR("Personalized"));
  v28 = objc_retainAutorelease(v28);
  inited = Img4DecodeInitManifest((uint64_t)objc_msgSend(v28, "bytes"), (uint64_t)objc_msgSend(v28, "length"), (uint64_t)v108);
  if ((_DWORD)inited)
  {
    v31 = inited;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v106 = 67109120;
      v107 = v31;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to init img4 manifest: %d", v106, 8u);
    }
    v35 = sub_10000B11C((uint64_t)"handle_receive_bytes", 109, -2, 0, CFSTR("Failed to init img4 manifest: %d"), v32, v33, v34, v31);
    goto LABEL_69;
  }
  if (v29)
    v53 = 1885629799;
  else
    v53 = 1668315236;
  Img4DecodeGetObjectPropertyData((uint64_t)v108, v53, 1145525076, buf, &v100);
  v55 = v54;
  if ((_DWORD)v54 == 1)
  {
    if (!objc_msgSend(v23, "isEqualToString:", CFSTR("Cryptex")))
    {
      v55 = 1;
      goto LABEL_62;
    }
    Img4DecodeGetObjectPropertyData((uint64_t)v108, 1885629799, 1145525076, buf, &v100);
    v55 = v56;
  }
  if ((_DWORD)v55)
  {
LABEL_62:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v106 = 67109120;
      v107 = v55;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", v106, 8u);
    }
    v35 = sub_10000B11C((uint64_t)"handle_receive_bytes", 123, -2, 0, CFSTR("Failed to retrieve data from manifest: %d"), v77, v78, v79, v55);
    goto LABEL_69;
  }
  v57 = objc_alloc((Class)NSData);
  v58 = objc_msgSend(v57, "initWithBytes:length:", *(_QWORD *)buf, v100);

  if (!v58)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v106 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", v106, 2u);
    }
    v87 = sub_10000B11C((uint64_t)"handle_receive_bytes", 129, -2, 0, CFSTR("Failed to create data."), v84, v85, v86, v94);
    v13 = (id)objc_claimAutoreleasedReturnValue(v87);
    v28 = 0;
    goto LABEL_70;
  }
  v28 = v58;
LABEL_50:
  v59 = sub_10000EF68();
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  if (!v60)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query working directory.", buf, 2u);
    }
    v75 = CFSTR("Failed to query working directory.");
    v76 = 136;
    goto LABEL_68;
  }
  v61 = v60;
  v62 = sub_10000E4E8(v28, v60);
  v40 = (id)objc_claimAutoreleasedReturnValue(v62);

  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v28;
      v104 = 2112;
      v105 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path with signature %@ in %@.", buf, 0x16u);
    }
    v75 = CFSTR("Failed to create path with signature %@ in %@.");
    v94 = (uint64_t)v28;
    v76 = 142;
LABEL_68:
    v35 = sub_10000B11C((uint64_t)"handle_receive_bytes", v76, -2, 0, v75, v72, v73, v74, v94);
LABEL_69:
    v13 = (id)objc_claimAutoreleasedReturnValue(v35);
LABEL_70:

    v40 = 0;
    goto LABEL_23;
  }
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v101 = NSFilePosixPermissions;
  v102 = &off_100023510;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1));
  v99 = 0;
  v64 = objc_msgSend(v95, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v40, 1, v63, &v99);
  v13 = v99;

  if ((v64 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v40;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@.", buf, 0xCu);
    }
    v83 = sub_10000B11C((uint64_t)"handle_receive_bytes", 147, -2, 0, CFSTR("Failed to create %@."), v80, v81, v82, (uint64_t)v40);
    goto LABEL_80;
  }
  v40 = objc_retainAutorelease(v40);
  snprintf(__str, 0x400uLL, "%s/XXXXXX.dmg", (const char *)objc_msgSend(v40, "UTF8String"));
  v65 = mkstemps(__str, 4);
  if ((_DWORD)v65 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v88 = __error();
      v89 = strerror(*v88);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = __str;
      v104 = 2080;
      v105 = v89;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %s", buf, 0x16u);
    }
    v90 = __error();
    strerror(*v90);
    v83 = sub_10000B11C((uint64_t)"handle_receive_bytes", 156, -2, 0, CFSTR("Failed to create %s: %s"), v91, v92, v93, (uint64_t)__str);
LABEL_80:
    v96 = objc_claimAutoreleasedReturnValue(v83);

    CFDictionarySetValue(a4, CFSTR("Error"), CFSTR("FileCreateFailed"));
    v41 = 0;
    LODWORD(v42) = -1;
LABEL_81:
    v13 = (id)v96;
    goto LABEL_24;
  }
  v42 = v65;
  v66 = sub_10000E6CC(__str);
  v67 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v66)
  {
    if (v67)
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = __str;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Path is bad: %s", buf, 0xCu);
    }
    v71 = sub_10000B11C((uint64_t)"handle_receive_bytes", 162, -2, 0, CFSTR("Path is bad: %s"), v68, v69, v70, (uint64_t)__str);
    v96 = objc_claimAutoreleasedReturnValue(v71);

    CFDictionarySetValue(a4, CFSTR("Error"), CFSTR("FileCreateFailed"));
    v41 = 0;
    goto LABEL_81;
  }
  if (v67)
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = __str;
    v104 = 1024;
    LODWORD(v105) = v42;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Writing file %s (%d) ...", buf, 0x12u);
  }
  v41 = 1;
  sub_100003A08(1);
  sub_10000387C((uint64_t)__str);
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_10000A1C0;
  v97[3] = &unk_100020780;
  v98 = v8;
  xpc_file_transfer_write_to_fd(v21, v42, v97);

LABEL_24:
  if (v13)
  {
    if (!CFDictionaryGetValue(a4, CFSTR("Error")))
      CFDictionarySetValue(a4, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a4, CFSTR("DetailedError"), objc_msgSend(v13, "description"));
  }
  if ((_DWORD)v42 == -1)
    v43 = 1;
  else
    v43 = v41;
  if ((v43 & 1) == 0)
    close(v42);

  return v41;
}

void sub_10000A0DC(uint64_t a1, void *a2, int a3)
{
  id v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Done resetting devices.", buf, 2u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resetting device.", v7, 2u);
    }
    if ((remote_device_reset(v5) & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000156CC();
  }

}

void sub_10000A1C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  const char *CStringPtr;
  const char *v11;
  xpc_object_t v12;
  void *v13;
  const char *v14;
  id v15;
  xpc_object_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  xpc_object_t v20;
  uint8_t buf[4];
  int v22;

  if ((_DWORD)a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v22 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to write from remote file: %d", buf, 8u);
    }
    v7 = sub_10000B11C((uint64_t)"handle_receive_bytes_block_invoke", 185, -2, 0, CFSTR("Failed to write from remote file: %d"), v4, v5, v6, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = *(void **)(a1 + 32);
    CStringPtr = CFStringGetCStringPtr(CFSTR("Error"), 0x8000100u);
    v11 = CFStringGetCStringPtr(CFSTR("InternalError"), 0x8000100u);
    v12 = xpc_string_create(v11);
    xpc_dictionary_set_value(v9, CStringPtr, v12);

    v13 = *(void **)(a1 + 32);
    v14 = CFStringGetCStringPtr(CFSTR("DetailedError"), 0x8000100u);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
    v16 = xpc_string_create((const char *)objc_msgSend(v15, "UTF8String"));
    xpc_dictionary_set_value(v13, v14, v16);

    xpc_dictionary_send_reply(*(_QWORD *)(a1 + 32));
    if (v8)
    {
      sub_10000387C(0);

    }
  }
  else
  {
    v17 = *(void **)(a1 + 32);
    v18 = CFStringGetCStringPtr(CFSTR("Status"), 0x8000100u);
    v19 = CFStringGetCStringPtr(CFSTR("Complete"), 0x8000100u);
    v20 = xpc_string_create(v19);
    xpc_dictionary_set_value(v17, v18, v20);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully wrote remote file.", buf, 2u);
    }
    xpc_dictionary_send_reply(*(_QWORD *)(a1 + 32));
  }
  sub_100003A08(0);
}

uint64_t sub_10000A40C(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

uint64_t start()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  NSFileAttributeKey v22;
  _UNKNOWN **v23;

  if ((_set_user_dir_suffix("com.apple.mobile_storage_proxy") & 1) == 0)
    sub_1000157F0();
  v0 = sub_10000EF68();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (!v1)
    sub_100015710(0, v2, v3, v4, v5, v6, v7, v8);
  v9 = (void *)v1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v22 = NSFilePosixPermissions;
  v23 = &off_100023528;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v21 = 0;
  v12 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, v11, &v21);
  v13 = v21;

  if ((v12 & 1) == 0)
    sub_10001578C(v13, (uint64_t)v9, v14, v15, v16, v17, v18, v19);
  if ((sub_10000822C() & 1) == 0)
    sub_100015774();
  if (!sub_100006590())
    sub_10001575C();
  CFRunLoopRun();

  return 0;
}

id sub_10000A564(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

CFMutableDictionaryRef sub_10000A56C()
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

id sub_10000A590(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  void *CFProperty;
  id v8;
  id v9;
  io_registry_entry_t entry;

  entry = 0;
  v1 = sub_10000A700(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = v2;
  if (v2)
  {
    v4 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    entry = MatchingService;
    if (MatchingService)
    {
      v6 = MatchingService;
      if (!IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
      {
        v9 = 0;
        CFProperty = 0;
LABEL_17:
        IOObjectRelease(v6);
        goto LABEL_18;
      }
      if (sub_10000A7A0(&entry, "AppleAPFSContainer")
        && sub_10000A7A0(&entry, "AppleAPFSMedia")
        && sub_10000A7A0(&entry, "AppleAPFSContainerScheme")
        && sub_10000A7A0(&entry, "IOMedia"))
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
        if (CFProperty)
        {
          v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("/dev/%@"), CFProperty);
          if (v8)
          {
            v9 = v8;
            goto LABEL_14;
          }
        }
      }
      else
      {
        CFProperty = 0;
      }
      v9 = 0;
LABEL_14:
      v6 = entry;
      if (!entry)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  v9 = 0;
  CFProperty = 0;
LABEL_18:

  return v9;
}

id sub_10000A700(void *a1)
{
  id v1;
  void *v2;
  id v3;
  __CFString *v4;
  uint64_t v5;
  id v6;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    v4 = CFSTR("/dev/r");
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/r")) & 1) != 0
      || (v4 = CFSTR("/dev/"), objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/"))))
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v4, "length")));

      v3 = (id)v5;
    }
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t sub_10000A7A0(io_object_t *a1, const char *a2)
{
  uint64_t result;
  io_registry_entry_t parent;

  result = 0;
  parent = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetParentEntry(*a1, "IOService", &parent) || !IOObjectConformsTo(parent, a2))
    {
      result = parent;
      if (parent)
      {
        IOObjectRelease(parent);
        return 0;
      }
    }
    else
    {
      IOObjectRelease(*a1);
      *a1 = parent;
      return 1;
    }
  }
  return result;
}

id sub_10000A828(void *a1)
{
  return a1;
}

id sub_10000A83C(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_10000A894(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_10000A8EC(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_10000A944(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_10000A99C(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_10000A9F4(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSURL), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

uint64_t sub_10000AA4C(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  void *v11;
  id CFProperty;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  char v22;
  _BYTE entry[12];
  __int16 v26;
  int v27;
  _BYTE v28[3];
  uint64_t v29;
  __int16 v30;
  char v31;

  v3 = a1;
  bzero(v28, 0x1000uLL);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)entry = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", entry, 2u);
    }
    v3 = 0;
    goto LABEL_32;
  }
  v4 = sub_10000A700(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (!v5
    || (v7 = objc_retainAutorelease(v5),
        v8 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)objc_msgSend(v7, "UTF8String")),
        MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v8),
        (*(_DWORD *)entry = MatchingService) == 0))
  {

    goto LABEL_16;
  }
  v10 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "IOMedia"))
  {
    IOObjectRelease(v10);

    goto LABEL_16;
  }
  if (!sub_10000F23C((io_object_t *)entry, "AppleAPFSContainerScheme")
    || !sub_10000F23C((io_object_t *)entry, "AppleAPFSMedia"))
  {
    v22 = 0;
    v11 = 0;
LABEL_45:
    CFProperty = 0;
    goto LABEL_46;
  }
  v11 = (void *)IORegistryEntrySearchCFProperty(*(io_registry_entry_t *)entry, "IOService", CFSTR("Content Hint"), kCFAllocatorDefault, 0);
  if (!v11 || !objc_msgSend(CFSTR("EF57347C-0000-11AA-AA11-00306543ECAC"), "isEqualToString:", v11))
    goto LABEL_44;
  if (!a2)
  {
    CFProperty = 0;
    goto LABEL_55;
  }
  if (!sub_10000F23C((io_object_t *)entry, "AppleAPFSContainer")
    || !sub_10000F23C((io_object_t *)entry, "AppleAPFSVolume"))
  {
LABEL_44:
    v22 = 0;
    goto LABEL_45;
  }
  CFProperty = (id)IORegistryEntryCreateCFProperty(*(io_registry_entry_t *)entry, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
  v13 = sub_10000A944(CFProperty);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/dev/"), "stringByAppendingString:", CFProperty));

    if (v15)
    {
      CFProperty = objc_retainAutorelease(v15);
      *a2 = CFProperty;
LABEL_55:
      v22 = 1;
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  v22 = 0;
LABEL_46:
  if (*(_DWORD *)entry)
    IOObjectRelease(*(io_object_t *)entry);

  if ((v22 & 1) != 0)
  {
    v19 = 6;
    goto LABEL_53;
  }
LABEL_16:
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/"), *(_QWORD *)entry) & 1) == 0)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/dev"), "stringByAppendingString:", v3));

    v3 = (id)v16;
  }
  v3 = objc_retainAutorelease(v3);
  v17 = open((const char *)objc_msgSend(v3, "UTF8String"), 0);
  if (v17 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *__error();
      *(_DWORD *)entry = 138412546;
      *(_QWORD *)&entry[4] = v3;
      v26 = 1024;
      v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open %@: %{errno}d", entry, 0x12u);
    }
LABEL_32:
    v19 = 0;
    goto LABEL_53;
  }
  v18 = v17;
  if (read(v17, v28, 0x1000uLL) == 4096)
  {
    if (v28[0] == 233 || v28[0] == 235 && v28[2] == 144)
    {
      if (v29 == 0x202020205346544ELL)
      {
        v19 = 5;
      }
      else if (v29 == 0x2020205441465845)
      {
        v19 = 4;
      }
      else
      {
        v19 = 1;
      }
    }
    else if (v30 == 11080)
    {
      v19 = 2 * (v31 == 4);
    }
    else if (v31 == 5 && v30 == 22600)
    {
      v19 = 3;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *__error();
      *(_DWORD *)entry = 138412546;
      *(_QWORD *)&entry[4] = v3;
      v26 = 1024;
      v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read %@ volume header: %{errno}d", entry, 0x12u);
      v19 = 0;
    }
  }
  close(v18);
LABEL_53:

  return v19;
}

BOOL sub_10000AEE8()
{
  int *v0;
  _BOOL4 v1;
  _BOOL8 result;
  int v3;
  size_t v4;
  uint64_t v5;
  uint8_t buf[4];
  int v7;

  v4 = 8;
  v5 = 0;
  if (!sysctlbyname("security.mac.amfi.developer_mode_status", &v5, &v4, 0, 0))
    return v5 == 1;
  v0 = __error();
  v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v1)
  {
    v3 = *v0;
    *(_DWORD *)buf = 67109120;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read developer mode status: %{darwin.errno}d", buf, 8u);
    return 0;
  }
  return result;
}

BOOL sub_10000AFD0(BOOL *a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 v10;
  size_t v12;
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v13 = 0;
  v12 = 4;
  if (sysctlbyname("security.codesigning.config", &v13, &v12, 0, 0))
  {
    v4 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "security.codesigning.config";
      v16 = 1024;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read sysctl (%s): %{darwin.errno}d", buf, 0x12u);
    }
    v8 = sub_10000B11C((uint64_t)"systemSupportsRestrictedExecutionMode", 773, -2, 0, CFSTR("Failed to read sysctl (%s): %{darwin.errno}d"), v5, v6, v7, (uint64_t)"security.codesigning.config");
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    if (a2 && v9)
    {
      v9 = objc_retainAutorelease(v9);
      *a2 = v9;
    }
  }
  else
  {
    v9 = 0;
    if (a1)
      *a1 = (v13 & 0x2000000) != 0;
  }
  v10 = v9 == 0;

  return v10;
}

id sub_10000B11C(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v13 = a4;
  v14 = a5;
  v15 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:arguments:", v14, &a9);

  v16 = objc_alloc_init((Class)NSMutableDictionary);
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, NSLocalizedDescriptionKey);
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);
  if (os_variant_allows_internal_security_policies(0))
  {
    if (a1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("FunctionName"));

    }
    if ((_DWORD)a2)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a2));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("SourceLine"));

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MobileStorage.ErrorDomain"), a3, v17));

  return v20;
}

BOOL sub_10000B290()
{
  const char *v0;
  const char *v1;
  uint32_t v2;
  uint64_t v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;

  v4 = 0;
  if ((os_parse_boot_arg_int("allow_msm_to_invalidate_attestations", &v4) & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v0 = (const char *)&unk_10001E39A;
      *(_DWORD *)buf = 136315650;
      if (!v4)
        v0 = " not";
      v6 = v0;
      v7 = 2080;
      v8 = "allow_msm_to_invalidate_attestations";
      v9 = 2048;
      v10 = v4;
      v1 = "Invalidating system attestation is%s allowed per boot-arg %s=%lld";
      v2 = 32;
      goto LABEL_8;
    }
  }
  else
  {
    v4 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "allow_msm_to_invalidate_attestations";
      v1 = "You can set the boot-arg %s=1 to allow invalidating the system's attestation.";
      v2 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v1, buf, v2);
    }
  }
  return v4 != 0;
}

BOOL sub_10000B3D4(io_registry_entry_t a1)
{
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const __CFString *Value;
  _BOOL8 v4;

  v1 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("Protocol Characteristics"), kCFAllocatorDefault, 3u);
  if (!v1)
    return 0;
  v2 = v1;
  Value = (const __CFString *)CFDictionaryGetValue(v1, CFSTR("Physical Interconnect"));
  if (Value)
    v4 = CFStringCompare(Value, CFSTR("Virtual Interface"), 0) == kCFCompareEqualTo;
  else
    v4 = 0;
  CFRelease(v2);
  return v4;
}

id sub_10000B45C(int a1)
{
  int v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  statfs *v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  int v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  const char *v26;
  uint32_t v27;
  void *v28;
  void *v29;
  __CFString *v30;
  id v31;
  id v32;
  id v33;
  __CFString *v34;
  id v35;
  id v36;
  int v37;
  __int128 v39;
  id v40;
  statfs *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t *v46;
  uint64_t v47;
  CFDictionaryRef *v48;
  uint8_t v49[4];
  uint64_t v50;
  uint8_t v51[4];
  const __CFString *f_mntonname;
  uint8_t buf[8];
  __int128 v54;
  char v55;

  v47 = 0;
  v48 = 0;
  v40 = objc_alloc_init((Class)NSMutableDictionary);
  if (v40)
  {
    v2 = getfsstat(0, 0, 2);
    if (v2 < 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
      }
      v41 = 0;
    }
    else
    {
      v3 = v2;
      v4 = 0;
      v41 = 0;
      do
      {
        v5 = 2168 * v3;
        if (v4 > v5)
        {
          if (v41)
            goto LABEL_22;
          goto LABEL_21;
        }
        if (v41)
          free(v41);
        v4 = v5 + 2168;
        v6 = (statfs *)malloc_type_malloc(v5 + 2168, 0x809D8011uLL);
        if (!v6)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v10;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", buf, 8u);
          }
LABEL_21:
          v41 = 0;
          goto LABEL_22;
        }
        v41 = v6;
        v3 = getfsstat(v6, v5 + 2168, 2);
      }
      while ((v3 & 0x80000000) == 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
      }
LABEL_22:
      if (v3 > 0)
      {
        v11 = (void *)MGCopyAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"), 0);
        v12 = objc_msgSend(v11, "BOOLValue");

        if (((v12 | os_variant_is_recovery("com.apple.mobile.storage_mounter")) & 1) == 0)
        {
          v14 = cryptex_copy_list_4MSM(a1 ^ 1u, &v48, &v47, 0);
          if ((v14 & 0xFFFFFFFD) != 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v15 = strerror(v14);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v14;
              LOWORD(v54) = 2080;
              *(_QWORD *)((char *)&v54 + 2) = v15;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to copy cryptex list (%d (%s)), non-fatal.", buf, 0x12u);
            }
            if (v48)
            {
              cryptex_msm_array_destroy(v48, v47);
              v48 = 0;
            }
            v47 = 0;
          }
        }
        v16 = 0;
        v17 = 0;
        v18 = v3;
        *(_QWORD *)&v13 = 136315138;
        v39 = v13;
        while (1)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&v54 = buf;
          *((_QWORD *)&v54 + 1) = 0x2020000000;
          v55 = 0;
          v19 = sub_10000BE00((uint64_t)&v41[v16], v48, v47);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = v20;
          if (!v20)
            break;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MountPath")));
          if (!v22)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v51 = 138412290;
              f_mntonname = CFSTR("MountPath");
              v26 = "Map entry missing value for key %@.";
              v27 = 12;
LABEL_39:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v26, v51, v27);
            }
            goto LABEL_40;
          }
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DiskImageType")));
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("Cryptex"));

          if (v25)
          {
            *(_BYTE *)(v54 + 24) = 1;
          }
          else
          {
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_10000CB10;
            v43[3] = &unk_100020C48;
            v32 = v23;
            v44 = v32;
            v45 = v21;
            v46 = buf;
            objc_msgSend(&off_1000235B8, "enumerateObjectsUsingBlock:", v43);

            if (!*(_BYTE *)(v54 + 24))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                sub_1000158C8(v49, (uint64_t)v32, &v50);
              v28 = 0;
              v29 = 0;
              v30 = 0;
              v31 = 0;
              v42 = (uint64_t)v17;
              v23 = v32;
              goto LABEL_62;
            }
          }
          v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DeviceNode"), v39));

          if (v42)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DeviceType")));
            if (v28)
            {
              if (objc_msgSend(CFSTR("DiskImage"), "isEqualToString:", v28))
              {
                v33 = sub_10000CB94((uint64_t)v41[v16].f_mntfromname);
                v34 = (__CFString *)objc_claimAutoreleasedReturnValue(v33);
                if (v34)
                {
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, CFSTR("BackingImage"));
                  v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ImageSignature")));
                  if (v31)
                  {
                    v29 = 0;
                    v30 = v34;
LABEL_61:
                    objc_msgSend(v40, "setObject:forKeyedSubscript:", v21, v42);
                    goto LABEL_62;
                  }
                  v35 = sub_10000CB94((uint64_t)v41[v16].f_mntfromname);
                  v30 = (__CFString *)objc_claimAutoreleasedReturnValue(v35);

                  if (v30)
                  {
                    v36 = sub_10000CD38(v30);
                    v29 = (void *)objc_claimAutoreleasedReturnValue(v36);
                    if (v29)
                    {
                      v31 = objc_msgSend(objc_alloc((Class)NSMutableData), "initDataWithHexString:", v29);
                      if (v31)
                      {
                        objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, CFSTR("ImageSignature"));
                      }
                      else
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v51 = 138412290;
                          f_mntonname = v30;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to convert signature from %@", v51, 0xCu);
                        }
                        v31 = 0;
                      }
                      goto LABEL_61;
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v51 = 138412290;
                      f_mntonname = v30;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to recover signature from %@", v51, 0xCu);
                    }
                    v31 = 0;
                    goto LABEL_60;
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_58:
                    *(_DWORD *)v51 = v39;
                    f_mntonname = (const __CFString *)v41[v16].f_mntonname;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get backing image path for %s", v51, 0xCu);
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  goto LABEL_58;
                }
              }
              v31 = 0;
              v30 = 0;
LABEL_60:
              v29 = 0;
              goto LABEL_61;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v51 = 138412290;
              f_mntonname = CFSTR("DeviceType");
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v51, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v51 = 138412290;
              f_mntonname = CFSTR("DeviceNode");
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v51, 0xCu);
            }
            v42 = 0;
          }
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v31 = 0;
LABEL_62:
          _Block_object_dispose(buf, 8);

          ++v16;
          v8 = (void *)v42;
          v17 = (void *)v42;
          if (!--v18)
            goto LABEL_79;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v51 = 0;
          v26 = "Failed to create map entry.";
          v27 = 2;
          goto LABEL_39;
        }
LABEL_40:
        v28 = 0;
        v29 = 0;
        v23 = 0;
        v30 = 0;
        v31 = 0;
        v42 = (uint64_t)v17;
        goto LABEL_62;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v37;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
    }
    v8 = 0;
LABEL_79:
    if (v41)
      free(v41);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    v8 = 0;
  }
  if (v48)
    cryptex_msm_array_destroy(v48, v47);

  return v40;
}

void sub_10000BDE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id sub_10000BE00(uint64_t a1, CFDictionaryRef *a2, uint64_t a3)
{
  uint64_t v3;
  CFDictionaryRef *v4;
  const char *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  __CFString *v17;
  id v18;
  char *v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  io_service_t MatchingService;
  uint64_t v26;
  const char *v27;
  size_t v28;
  uint64_t string;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  __CFString *v36;
  const __CFString *v37;
  __CFString **v38;
  __CFString **v39;
  uint64_t v40;
  __CFBundle *Unique;
  CFTypeRef ValueForInfoDictionaryKey;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  io_object_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char *__s2;
  unsigned int __s2a;
  const __CFDictionary *matching;
  CFDictionaryRef matchinga;
  CFDictionaryRef matchingb;
  mach_port_t mainPort;
  uint8_t buf[4];
  CFStringRef v58;
  __int16 v59;
  id v60;

  if (!a1 || (v3 = a3, (v4 = a2) == 0) && a3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v4 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
LABEL_8:
      v15 = 0;
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v6 = "Invalid intput.";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_7;
  }
  v17 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", a1 + 1112, 4);
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v6 = "Failed to create string.";
    goto LABEL_6;
  }
  v14 = v17;
  v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", a1 + 88, 4);
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v4 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_8;
  }
  v13 = objc_retainAutorelease(v18);
  v19 = (char *)objc_msgSend(v13, "UTF8String");
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v35 = "Failed to get C string.";
LABEL_51:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    }
LABEL_52:
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v4 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  v20 = v19;
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", a1 + 72, 4);
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v35 = "Failed to create string.";
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  v12 = v21;
  v22 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v4 = 0;
    v11 = 0;
    goto LABEL_8;
  }
  v15 = v22;
  __s2 = v20;
  objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("MassStorage"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("DeviceNode"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("MountPath"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("FilesystemType"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("IsMounted"));
  v23 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v14);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v58 = v14;
      v59 = 2080;
      v60 = (id)(a1 + 88);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create URL (%@ / %s).", buf, 0x16u);
    }
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_62;
  }
  v10 = v23;
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent")));
  matching = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)objc_msgSend(v24, "UTF8String"));

  if (!matching)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
      *(_DWORD *)buf = 138412290;
      v58 = v36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create a BSD matching dictionary for %@.", buf, 0xCu);

    }
    v7 = 0;
    v8 = 0;
    v9 = 0;
LABEL_62:
    v4 = 0;
    v11 = 0;
    goto LABEL_9;
  }
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
  mainPort = MatchingService;
  if (!MatchingService || !sub_10000B3D4(MatchingService))
    goto LABEL_99;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("DiskImage"), CFSTR("DeviceType"));
  if (!strcmp("/Developer", __s2))
  {
    v37 = CFSTR("Developer");
    v38 = off_100020B08;
LABEL_98:
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v37, *v38);
    goto LABEL_99;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_automation", 0x24uLL))
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
    v39 = off_100020B50;
LABEL_97:
    v37 = *v39;
    v38 = off_100020B28;
    goto LABEL_98;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_demo", 0x1EuLL))
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
    v39 = off_100020B40;
    goto LABEL_97;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_debug", 0x1FuLL))
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
    v39 = off_100020B30;
    goto LABEL_97;
  }
  if (__s2 != strnstr(__s2, "/System/Developer", 0x11uLL))
  {
    if (__s2 == strnstr(__s2, "/private/var/personalized_factory", 0x21uLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = off_100020B48;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldService", 0x1CuLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = off_100020B60;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceDiagnostic", 0x26uLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = off_100020B68;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceRepair", 0x22uLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = off_100020B70;
    }
    else if (__s2 == strnstr(__s2, "/private/var/personalized_quality", 0x21uLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = off_100020B78;
    }
    else
    {
      if (__s2 != strnstr(__s2, "/private/var/personalized_repair", 0x20uLL))
      {
        if (!v4)
        {
          matchingb = 0;
          v8 = 0;
          v9 = 0;
          goto LABEL_100;
        }
        objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Cryptex"), CFSTR("DiskImageType"));
        if (v3)
        {
          while (1)
          {
            matchinga = *v4;
            v26 = ((uint64_t (*)(void))cryptex_msm_get_string)();
            if (v26)
            {
              v27 = (const char *)v26;
              v28 = strlen((const char *)(a1 + 1112));
              if (strnstr(v27, (const char *)(a1 + 1112), v28))
              {
                string = cryptex_msm_get_string(matchinga, 1);
                if (string)
                {
                  v30 = string;
                  v31 = cryptex_msm_get_string(matchinga, 0);
                  if (v31)
                    break;
                }
              }
            }
            ++v4;
            if (!--v3)
              goto LABEL_37;
          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v31));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v49, CFSTR("CryptexName"));

          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v30));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v50, CFSTR("CryptexVersion"));

        }
LABEL_37:
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CryptexName")));
        if (!v32
          || (v33 = (void *)v32,
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CryptexVersion"))),
              v34,
              v33,
              !v34))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v58 = v14;
            v59 = 2112;
            v60 = v13;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Mount (%@ / %@) is not a cryptex or personalized image (not fatal).", buf, 0x16u);
          }
          v7 = 0;
          matchingb = 0;
          v8 = 0;
          v9 = 0;
          v4 = 0;
          v11 = 0;
LABEL_108:
          v46 = mainPort;
          if (!mainPort)
            goto LABEL_110;
          goto LABEL_109;
        }
LABEL_99:
        matchingb = 0;
        v8 = 0;
        v9 = 0;
        v4 = 0;
LABEL_100:
        v11 = 0;
        goto LABEL_101;
      }
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = off_100020B80;
    }
    goto LABEL_97;
  }
  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("Library/Frameworks/DTRemoteServices.framework")));
  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
    v11 = 0;
    v4 = 0;
    goto LABEL_86;
  }
  v4 = (CFDictionaryRef *)v40;
  Unique = (__CFBundle *)_CFBundleCreateUnique(0, +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v40, 0));
  if (!Unique)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query bundle for DTRemoteServices.framework.", buf, 2u);
    }
    v11 = 0;
LABEL_86:
    v9 = 0;
    v8 = 0;
    matchingb = 0;
    goto LABEL_95;
  }
  matchingb = Unique;
  ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(Unique, kCFBundleVersionKey);
  v43 = objc_claimAutoreleasedReturnValue(ValueForInfoDictionaryKey);
  if (v43)
  {
    v11 = (void *)v43;
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("version.plist")));
    if (v44)
    {
      v8 = (void *)v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      __s2a = objc_msgSend(v45, "fileExistsAtPath:", v8);

      if (__s2a)
      {
        v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", v8);
        if (v9)
        {
LABEL_76:
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("PersonalizedImageVersion"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("PersonalizedImageVersionInfo"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("DeveloperDiskImage"), CFSTR("PersonalizedImageType"));
LABEL_101:
          if ((*(_DWORD *)(a1 + 64) & 1) != 0)
            v47 = &__kCFBooleanTrue;
          else
            v47 = &__kCFBooleanFalse;
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v47, CFSTR("IsReadOnly"));
          if ((*(_DWORD *)(a1 + 64) & 0x80) != 0)
            v48 = &__kCFBooleanTrue;
          else
            v48 = &__kCFBooleanFalse;
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v48, CFSTR("SupportsContentProtection"));
          v7 = v15;
          goto LABEL_108;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_100015908((uint64_t)v8, (uint64_t)v11);
      }
      v9 = 0;
      goto LABEL_76;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = kCFBundleVersionKey;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query bundle key %@.", buf, 0xCu);
    }
    v11 = 0;
  }
  v9 = 0;
  v8 = 0;
LABEL_95:
  v7 = 0;
  v46 = mainPort;
LABEL_109:
  IOObjectRelease(v46);
LABEL_110:
  if (matchingb)
    CFRelease(matchingb);
LABEL_9:

  return v7;
}

void sub_10000CB10(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  unsigned int v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2) & 1) != 0
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("DiskImageType"))),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Cryptex")),
        v6,
        v7))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id sub_10000CB94(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  const char *v6;
  id v8;
  uint8_t buf[4];
  id v10;

  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Invalid input.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
LABEL_10:
    v5 = 0;
    v2 = 0;
    v4 = 0;
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  v1 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", a1);
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Failed to create string.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v2 = v1;
  v8 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DiskImages2 imageURLFromDevice:error:](DiskImages2, "imageURLFromDevice:error:", v1, &v8));
  v4 = v8;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve image URL: %@", buf, 0xCu);
    }
    v5 = 0;
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
LABEL_12:

  return v5;
}

id sub_10000CD38(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pathComponents"));
  if ((unint64_t)objc_msgSend(v1, "count") >= 4)
  {
    v3 = objc_alloc((Class)NSString);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", (char *)objc_msgSend(v1, "count") - 3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", (char *)objc_msgSend(v1, "count") - 2));
    v2 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@%@"), v4, v5);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id sub_10000CDF0()
{
  id v0;
  CFMutableDictionaryRef v1;
  CFMutableDictionaryRef v2;
  void *v3;
  void *v4;
  io_object_t v6;
  io_object_t v7;
  kern_return_t v8;
  __int16 v9;
  void *Value;
  id v11;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v15;

  properties = 0;
  existing = 0;
  v0 = objc_alloc_init((Class)NSMutableDictionary);
  if (v0)
  {
    v1 = IOServiceMatching("IOUSBInterface");
    if (v1
      && (v2 = v1,
          -[__CFDictionary setObject:forKeyedSubscript:](v1, "setObject:forKeyedSubscript:", &off_100023540, CFSTR("bInterfaceClass")), -[__CFDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_100023558, CFSTR("bInterfaceSubClass")), -[__CFDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_100023558, CFSTR("bInterfaceProtocol")), !IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing))&& (v6 = IOIteratorNext(existing)) != 0)
    {
      v7 = v6;
      v4 = 0;
      v3 = 0;
      do
      {
        v8 = IORegistryEntryCreateCFProperties(v7, &properties, 0, 0);
        if (v8)
        {
          v9 = v8;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v15) = v9 & 0x3FFF;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperties failed: 0x%04x", buf, 8u);
          }
        }
        else
        {
          Value = (void *)CFDictionaryGetValue(properties, CFSTR("locationID"));

          if (Value)
          {
            v11 = objc_alloc_init((Class)NSMutableDictionary);

            if (v11)
            {
              objc_msgSend(v11, "setObject:forKeyedSubscript:", Value, CFSTR("LocationID"));
              objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("PTPCamera"), CFSTR("DeviceType"));
              objc_msgSend(v0, "setObject:forKeyedSubscript:", v11, CFSTR("PTPNode"));
              v3 = v11;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
              }
              v3 = 0;
            }
            v4 = Value;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v15 = "locationID";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
            }
            v4 = 0;
          }
        }
        if (properties)
          CFRelease(properties);
        properties = 0;
        IOObjectRelease(v7);
        v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    else
    {
      v3 = 0;
      v4 = 0;
    }
    if (existing)
      IOObjectRelease(existing);
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }

  return v0;
}

id sub_10000D118()
{
  const __CFDictionary *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  io_object_t v10;
  io_object_t v11;
  kern_return_t v12;
  __int16 v13;
  const char *v14;
  uint32_t v15;
  const void *Value;
  void *v17;
  id v18;
  void *v19;
  id v20;
  const void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  void *v28;
  id v29;
  void *v30;
  const void *v31;
  void *v32;
  id v33;
  void *v34;
  const void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  unsigned __int8 v40;
  int v41;
  id v42;
  void *v43;
  id v44;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint8_t v50;
  _BYTE v51[15];
  uint8_t v52;
  _BYTE v53[3];
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t v56[4];
  uint64_t v57;
  uint8_t v58[4];
  uint64_t v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  const char *v63;
  _BYTE v64[72];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  properties = 0;
  existing = 0;
  bzero(v64, 0x878uLL);
  v0 = IOServiceMatching("IOMedia");
  v1 = 0;
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v0, &existing))
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    if (v9)
    {
      v1 = v9;
      v10 = IOIteratorNext(existing);
      if (v10)
      {
        v11 = v10;
        v48 = v1;
        v49 = 0;
        v8 = 0;
        v7 = 0;
        v6 = 0;
        v5 = 0;
        v4 = 0;
        v3 = 0;
        v47 = 1;
        while (1)
        {
          if (!sub_10000B3D4(v11))
          {
            v12 = IORegistryEntryCreateCFProperties(v11, &properties, 0, 0);
            if (v12)
            {
              v13 = v12;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v61) = v13 & 0x3FFF;
                v14 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
                v15 = 8;
LABEL_9:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
              }
            }
            else
            {
              if (properties)
              {
                Value = CFDictionaryGetValue(properties, CFSTR("BSD Name"));
                v17 = (void *)objc_claimAutoreleasedReturnValue(Value);

                v18 = sub_10000A944(v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

                if (v19)
                {
                  v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("/dev/%@"), v17);

                  if (v20)
                  {
                    v21 = CFDictionaryGetValue(properties, CFSTR("Content"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

                    v23 = sub_10000A944(v22);
                    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

                    if (v24)
                    {
                      if (objc_msgSend(CFSTR("C12A7328-F81F-11D2-BA4B-00A0C93EC93B"), "isEqualToString:", v22))
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                          sub_100015990(&v52, v53, v25);
LABEL_32:
                        v3 = v20;
                        v5 = v22;
                        v6 = v17;
                        goto LABEL_33;
                      }
                      if (objc_msgSend(CFSTR("Apple_partition_map"), "isEqualToString:", v22))
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                          sub_1000159C8(&v50, v51, v26);
                        goto LABEL_32;
                      }
                      v27 = CFDictionaryGetValue(properties, CFSTR("Removable"));
                      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

                      v29 = sub_10000A83C(v28);
                      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

                      if (v30)
                      {
                        if ((objc_msgSend(v28, "BOOLValue") & 1) == 0 && (sub_10000DBBC(v11) & 1) == 0)
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                            sub_100015A40(v58, (uint64_t)v17, &v59);
                          v3 = v20;
                          v5 = v22;
                          v6 = v17;
LABEL_59:
                          v8 = v28;
                          goto LABEL_33;
                        }
                        v31 = CFDictionaryGetValue(properties, CFSTR("Leaf"));
                        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

                        v33 = sub_10000A83C(v32);
                        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

                        if (v34)
                        {
                          if ((objc_msgSend(v32, "BOOLValue") & 1) != 0)
                          {
                            v46 = v32;
                            v35 = CFDictionaryGetValue(properties, CFSTR("Writable"));
                            v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

                            v37 = sub_10000A83C(v36);
                            v38 = objc_claimAutoreleasedReturnValue(v37);
                            if (v38)
                            {
                              v39 = (void *)v38;
                              v40 = objc_msgSend(v36, "BOOLValue");

                              v47 &= v40 ^ 1;
                            }
                            v41 = sub_10000AA4C(v20, 0);
                            if (v41 == 4 || (v41 & 3) == 1)
                            {
                              v3 = objc_retainAutorelease(v20);
                              if ((unint64_t)__strlcpy_chk(&v66, objc_msgSend(v3, "UTF8String"), 1024, 1024) >= 0x400)
                              {
                                v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                  goto LABEL_72;
LABEL_71:
                                *(_WORD *)buf = 0;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid string size.", buf, 2u);
                                goto LABEL_72;
                              }
                              v3 = objc_retainAutorelease(v3);
                              if ((unint64_t)__strlcpy_chk(&v67, objc_msgSend(v3, "UTF8String"), 1024, 1024) >= 0x400)
                              {
                                v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                  goto LABEL_72;
                                goto LABEL_71;
                              }
                              if ((unint64_t)__strlcpy_chk(&v65, "exfat", 16, 16) >= 0x10)
                              {
                                v8 = v28;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                  goto LABEL_71;
LABEL_72:
                                v4 = v36;
                                v5 = v22;
                                v6 = v17;
                                v7 = v46;
                                goto LABEL_33;
                              }
                              v44 = sub_10000BE00((uint64_t)v64, 0, 0);
                              v42 = (id)objc_claimAutoreleasedReturnValue(v44);

                              if (!v42)
                              {
                                v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  v49 = 0;
                                  v4 = v36;
                                  v5 = v22;
                                  v6 = v17;
                                  v7 = v46;
                                  goto LABEL_33;
                                }
                                *(_DWORD *)buf = 138412290;
                                v61 = (const char *)v3;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create map entry for %@.", buf, 0xCu);
                                v49 = 0;
                                goto LABEL_72;
                              }
                            }
                            else
                            {
                              v42 = objc_alloc_init((Class)NSMutableDictionary);

                              if (!v42)
                              {
                                v8 = v28;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
                                }
                                v49 = 0;
                                v3 = v20;
                                goto LABEL_72;
                              }
                              objc_msgSend(v42, "setObject:forKeyedSubscript:", CFSTR("MassStorage"), CFSTR("DeviceType"));
                              objc_msgSend(v42, "setObject:forKeyedSubscript:", v20, CFSTR("DeviceNode"));
                              objc_msgSend(v42, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("IsMounted"));
                              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v47 & 1));
                              objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, CFSTR("IsReadOnly"));

                            }
                            objc_msgSend(v48, "setObject:forKeyedSubscript:", v42, v20);
                            v49 = v42;
                            v3 = v20;
                            v4 = v36;
                            v5 = v22;
                            v6 = v17;
                            v7 = v32;
                          }
                          else
                          {
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                              sub_100015A00(v56, (uint64_t)v17, &v57);
                            v3 = v20;
                            v5 = v22;
                            v6 = v17;
                            v7 = v32;
                          }
                          goto LABEL_59;
                        }
                        v7 = v32;
                        v8 = v28;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v61 = (const char *)v17;
                          v62 = 2080;
                          v63 = "Leaf";
LABEL_26:
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The attached media object %@ does not have a '%s' flag.", buf, 0x16u);
                        }
                      }
                      else
                      {
                        v8 = v28;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v61 = (const char *)v17;
                          v62 = 2080;
                          v63 = "Removable";
                          goto LABEL_26;
                        }
                      }
                    }
                    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v61 = (const char *)v17;
                      v62 = 2080;
                      v63 = "Content";
                      goto LABEL_26;
                    }
                    v3 = v20;
                    v5 = v22;
                  }
                  else
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
                    }
                    v3 = 0;
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v61 = "BSD Name";
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
                }
                v6 = v17;
                goto LABEL_33;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v14 = "Failed to retrieve any properties for the matched service.";
                v15 = 2;
                goto LABEL_9;
              }
            }
          }
LABEL_33:
          IOObjectRelease(v11);
          if (properties)
            CFRelease(properties);
          properties = 0;
          v11 = IOIteratorNext(existing);
          if (!v11)
          {
            v1 = v48;
            v2 = v49;
            goto LABEL_81;
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
      }
      v1 = 0;
    }
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
LABEL_81:
  if (existing)
    IOObjectRelease(existing);

  return v1;
}

uint64_t sub_10000DBBC(io_object_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  kern_return_t ParentEntry;
  _QWORD v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[4];
  int v19;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = (void (*)(void))sub_10000E460;
  v10 = &unk_100020C70;
  v11 = &v12;
  v2 = v8;
  v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry != -536870208 && ParentEntry != 0)
          break;
        a1 = parent;
        if (!parent)
          goto LABEL_3;
        ((void (*)(_QWORD *, _QWORD, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v19 = ParentEntry & 0x3FFF;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryGetParentEntry failed: 0x%04x", buf, 8u);
      }
    }
  }
LABEL_3:

  v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_10000DD78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(exception_object);
}

id sub_10000DD9C(int a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  if (v2)
  {
    v3 = sub_10000CDF0();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4)
      objc_msgSend(v2, "addEntriesFromDictionary:", v4);
    v5 = sub_10000D118();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (v6)
      objc_msgSend(v2, "addEntriesFromDictionary:", v6);
    v7 = sub_10000B45C(a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      objc_msgSend(v2, "addEntriesFromDictionary:", v8);

    }
  }
  return v2;
}

id sub_10000DE3C(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v1 = sub_10000DEE8(CFSTR("MassStorage"), CFSTR("DeviceNode"), a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = v2;
  if (v2
    && objc_msgSend(v2, "count")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0)),
        v5 = sub_10000A894(v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(v5),
        v6,
        v4,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id sub_10000DEE8(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const __CFString *v41;
  _BYTE v42[128];

  v7 = a1;
  v33 = a2;
  v32 = a3;
  if (!v7 || !v33 || !v32)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    goto LABEL_26;
  }
  v8 = sub_10000DD9C(a4);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v26)
      sub_100015A80(v26, v27, v28);
LABEL_26:
    v31 = 0;
    v29 = 0;
    v13 = 0;
    v10 = 0;
    goto LABEL_32;
  }
  v10 = (id)v9;
  v31 = objc_alloc_init((Class)NSMutableArray);
  if (v31)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v11)
    {
      v12 = v11;
      v35 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v37;
      do
      {
        v15 = 0;
        v34 = v12;
        do
        {
          v16 = v13;
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v15)));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DeviceType")));

          if (v13)
          {
            if (objc_msgSend(v13, "isEqual:", v7))
            {
              v18 = v14;
              v19 = v10;
              v20 = v7;
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v33));

              v22 = sub_10000A944(v21);
              v23 = objc_claimAutoreleasedReturnValue(v22);
              if (v23)
              {
                v24 = (void *)v23;
                v25 = objc_msgSend(v21, "isEqual:", v32);

                if (v25)
                  objc_msgSend(v31, "addObject:", v17);
              }
              v35 = v21;
              v7 = v20;
              v10 = v19;
              v14 = v18;
              v12 = v34;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("DeviceType");
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
          }

          v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v12);
    }
    else
    {
      v35 = 0;
      v13 = 0;
    }

    v29 = v35;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create array.", buf, 2u);
    }
    v31 = 0;
    v29 = 0;
    v13 = 0;
  }
LABEL_32:

  return v31;
}

id sub_10000E25C(void *a1, int a2)
{
  return sub_10000DEE8(CFSTR("DiskImage"), CFSTR("DiskImageType"), a1, a2);
}

id sub_10000E280(void *a1, int a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = a1;
  v4 = sub_10000DD9C(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v25 = v6;
      v10 = 0;
      v11 = *(_QWORD *)v27;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12)));
        v14 = sub_10000A894(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MountPath")));

          v10 = (void *)v16;
        }
        v17 = sub_10000A944(v10);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (v18)
        {
          v19 = (void *)v18;
          v20 = objc_msgSend(v10, "isEqualToString:", v3);

          if ((v20 & 1) != 0)
            break;
        }

        if (v9 == (id)++v12)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v9)
            goto LABEL_4;
          v13 = 0;
          break;
        }
      }
      v6 = v25;
    }
    else
    {
      v10 = 0;
      v13 = 0;
    }

  }
  else
  {
    v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v21)
      sub_100015A80(v21, v22, v23);
    v10 = 0;
    v13 = 0;
  }

  return v13;
}

void sub_10000E460(uint64_t a1, io_registry_entry_t entry, _BYTE *a3)
{
  CFTypeRef CFProperty;
  const void *v6;

  CFProperty = IORegistryEntryCreateCFProperty(entry, CFSTR("removable"), 0, 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    if (CFEqual(CFProperty, kCFBooleanTrue))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
    CFRelease(v6);
  }
}

id sub_10000E4E8(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint32_t v11;
  id v12;
  uint8_t buf[4];
  unsigned int v15;
  __int16 v16;
  id v17;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initHexStringWithData:", v3);
  v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      v8 = 0;
      v7 = 0;
      v9 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v10 = "Failed to create hex string with data.";
    v11 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "length") != (id)256
    && objc_msgSend(v6, "length") != (id)96
    && objc_msgSend(v6, "length") != (id)40)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 67109378;
    v15 = objc_msgSend(v6, "length");
    v16 = 2112;
    v17 = v3;
    v10 = "Unsupported signature length: %d characters (%@)";
    v11 = 18;
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1));
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@/%@/%@"), v4, v7, v8);
LABEL_10:
  v12 = v9;

  return v12;
}

uint64_t sub_10000E6CC(const char *a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  uint64_t result;
  _QWORD v15[2];
  uint64_t (*v16)(uint64_t);
  void *v17;
  _BYTE *v18;
  const char *v19;
  char __s1[1024];
  _BYTE buf[24];
  char v22;

  bzero(__s1, 0x400uLL);
  if (strlen(a1) > 0x400)
    goto LABEL_18;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v22 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_10000F2E8;
  v17 = &unk_100020CB8;
  v18 = buf;
  v19 = a1;
  v2 = v15;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_msgSend(v3, "stringWithFileSystemRepresentation:length:", a1, strlen(a1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathComponents"));
  v7 = objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    v8 = (char *)objc_msgSend(v7, "count");
    if (v8)
    {
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v7));
        v10 = v9;
        if (v9)
        {
          v11 = objc_retainAutorelease(v9);
          v12 = objc_msgSend(v11, "fileSystemRepresentation");
          if (!((unsigned int (*)(_QWORD *, id))v16)(v2, v12))
          {

            break;
          }
          objc_msgSend(v7, "removeLastObject");
        }

      }
      while (--v8);
    }
  }

  v13 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  if (v13 || !realpath_DARWIN_EXTSN(a1, __s1) || (result = strcmp(__s1, a1), (_DWORD)result))
  {
LABEL_18:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = __s1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Paths don't match: (%s/%s)", buf, 0x16u);
    }
    return 1;
  }
  return result;
}

void sub_10000E918(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E93C(const char *a1, removefile_flags_t a2)
{
  _removefile_state *v4;
  _removefile_state *v5;
  int v6;
  int *v7;
  char *v8;
  int v9;
  int *v10;
  char *v11;
  uint64_t v12;
  int v13;
  int *v14;
  char *v15;
  int value;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  char *v21;

  value = 0;
  v4 = removefile_state_alloc();
  if (v4)
  {
    v5 = v4;
    if (removefile_state_set(v4, 3u, sub_10000EB74)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *__error();
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      v19 = v6;
      v20 = 2080;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile_state_set(v5, 4u, &value) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *__error();
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      v19 = v9;
      v20 = 2080;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile(a1, v5, a2))
    {
      v12 = 0;
      if (*__error() != 2 || value)
        goto LABEL_17;
    }
    else if (value)
    {
      v12 = 0;
LABEL_17:
      removefile_state_free(v5);
      return v12;
    }
    v12 = 1;
    goto LABEL_17;
  }
  v12 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *__error();
    v14 = __error();
    v15 = strerror(*v14);
    *(_DWORD *)buf = 67109378;
    v19 = v13;
    v20 = 2080;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_alloc failed: %d (%s)", buf, 0x12u);
    return 0;
  }
  return v12;
}

uint64_t sub_10000EB74(_removefile_state *a1, const char *a2, int *a3)
{
  int v5;
  int v6;
  int *v7;
  char *v8;
  const char *v9;
  int v10;
  int *v11;
  char *v12;
  int v13;
  int *v14;
  char *v15;
  stat v17;
  int dst;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;

  dst = 0;
  memset(&v17, 0, sizeof(v17));
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_get failed: %{errno}d", buf, 8u);
    }
    dst = 2;
    goto LABEL_17;
  }
  if (dst == 1)
  {
    if (lstat(a2, &v17))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *__error();
        v7 = __error();
        v8 = strerror(*v7);
        *(_DWORD *)buf = 136315650;
        v20 = a2;
        v21 = 1024;
        v22 = v6;
        v23 = 2080;
        v24 = v8;
        v9 = "lstat failed for %s: %d (%s)";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
      }
    }
    else
    {
      if ((v17.st_flags & 2) == 0)
        goto LABEL_17;
      if (lchflags(a2, v17.st_flags & 0xFFFFFFFD))
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        v10 = *__error();
        v11 = __error();
        v12 = strerror(*v11);
        *(_DWORD *)buf = 136315650;
        v20 = a2;
        v21 = 1024;
        v22 = v10;
        v23 = 2080;
        v24 = v12;
        v9 = "lchflags failed for %s: %d (%s)";
        goto LABEL_9;
      }
      if (!unlink(a2))
        return 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *__error();
        v14 = __error();
        v15 = strerror(*v14);
        *(_DWORD *)buf = 136315650;
        v20 = a2;
        v21 = 1024;
        v22 = v13;
        v23 = 2080;
        v24 = v15;
        v9 = "Failed to unlink %s: %d (%s)";
        goto LABEL_9;
      }
    }
  }
LABEL_17:
  if (a3 && !*a3)
    *a3 = dst;
  return 0;
}

id sub_10000EE0C(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  uint32_t v8;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  int v14;

  v1 = a1;
  v2 = v1;
  v10 = 1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Invalid input.";
      v8 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v3 = objc_retainAutorelease(v1);
  v4 = container_system_group_path_for_identifier(0, objc_msgSend(v3, "UTF8String"), &v10);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      v13 = 1024;
      v14 = v10;
      v7 = "Failed to copy system group container (%@): %d";
      v8 = 18;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v5 = (void *)v4;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v4);
  free(v5);
LABEL_10:

  return v6;
}

id sub_10000EF68()
{
  if (qword_100024608 != -1)
    dispatch_once(&qword_100024608, &stru_100020C90);
  return (id)qword_100024610;
}

void sub_10000EFA8(id a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = sub_10000EE0C(CFSTR("systemgroup.com.apple.mobilestorageproxy"));
  v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("backingStore")));
  v3 = (void *)qword_100024610;
  qword_100024610 = v2;

}

uint64_t sub_10000EFFC(void *a1, void *a2, id a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
      if (objc_msgSend(v9, "isEqualToString:", v7))
      {
        v10 = objc_msgSend(v5, "code");

        if (v10 == a3)
        {
          v8 = 1;
          goto LABEL_9;
        }
      }
      else
      {

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      v5 = (id)v12;
    }
    while (v12);
    v8 = 0;
  }
LABEL_9:

  return v8;
}

id sub_10000F0D8(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *CFProperty;
  io_registry_entry_t v6;
  io_object_t v7;

  v3 = a2;
  v4 = v3;
  CFProperty = 0;
  if (a1 && v3)
  {
    v6 = IORegistryEntryFromPath(kIOMainPortDefault, (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"));
    if (v6)
    {
      v7 = v6;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v4, 0, 0);
      IOObjectRelease(v7);
    }
    else
    {
      CFProperty = 0;
    }
  }

  return CFProperty;
}

id sub_10000F168(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned int v15;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  v15 = 0;
  if (!a1)
    goto LABEL_6;
  v8 = v5;
  if (a2)
  {
    v9 = sub_10000F0D8(a1, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v10 = sub_10000A99C(v7);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend(v7, "length");

      if (v13 == (id)4)
      {
        objc_msgSend(v7, "getBytes:length:", &v15, 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15));

        goto LABEL_7;
      }
    }
LABEL_6:
    v8 = v6;
  }
LABEL_7:

  return v8;
}

uint64_t sub_10000F23C(io_object_t *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v5;
  io_iterator_t iterator;

  v2 = 0;
  iterator = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetChildIterator(*a1, "IOService", &iterator))
    {
      v2 = 0;
    }
    else
    {
      while (1)
      {
        v5 = IOIteratorNext(iterator);
        v2 = v5;
        if (!(_DWORD)v5)
          break;
        if (IOObjectConformsTo(v5, a2))
        {
          IOObjectRelease(*a1);
          *a1 = v2;
          v2 = 1;
          break;
        }
        IOObjectRelease(v2);
      }
    }
    if (iterator)
      IOObjectRelease(iterator);
  }
  return v2;
}

uint64_t sub_10000F2E8(uint64_t a1)
{
  uint64_t result;
  _BOOL4 v3;
  uint64_t v4;
  int v5;
  int *v6;
  char *v7;
  stat v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;

  memset(&v8, 0, sizeof(v8));
  if (!lstat(*(const char **)(a1 + 40), &v8))
  {
    result = 1;
    if ((v8.st_mode & 0xF000) != 0xA000)
      return result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  if (*__error() == 2)
    return 1;
  v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *__error();
    v6 = __error();
    v7 = strerror(*v6);
    *(_DWORD *)buf = 136315650;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    v13 = 2080;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lstat failed for %s: %d (%s)", buf, 0x1Cu);
    return 0;
  }
  return result;
}

void sub_10000F430(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_10000F43C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  char v24;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_54;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_55;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        v17 = v16 < v15 && a3 == 0;
        v18 = (unint64_t)(v12 + 1);
        if (v17)
          return 3;
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL))
          return 7;
        if (v18 <= v18 + v15)
        {
          result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_55;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_56;
        v23 = *v14++;
        v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22)
            v24 = 1;
          else
            v24 = a3;
          result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0)
            goto LABEL_28;
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_54;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_55;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t result;

  v3 = a1[1];
  if (!v3)
    goto LABEL_9;
  if (v3 == (unsigned __int8 *)1)
  {
    v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4;

  v4 = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, &v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[3];

  memset(v8, 170, sizeof(v8));
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[2];

  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[3];

  memset(v12, 170, sizeof(v12));
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;

  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4[3];

  memset(v4, 170, sizeof(v4));
  result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL)
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    else
      return 2;
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  char v7;
  unint64_t v8[3];
  unint64_t v9[2];

  v9[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  v4 = v2 + v3;
  if (v2 > v4)
    goto LABEL_13;
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result)
      break;
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result)
      break;
    if (v7)
      return 0;
  }
  if (result <= 1)
    return 0;
  else
    return result;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  size_t v4;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    return v4 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_100017EC8, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_1000180D6, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  Img4DecodeEvaluateTrustWithCallbacks(a1, a2, a3, (unsigned int (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))img4_verify_signature_with_chain, (unsigned int (*)(uint64_t, uint64_t))Img4DecodeEvaluateCertificateProperties, (void (*)(_QWORD, _QWORD, uint64_t))sha1_digest, a4);
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(_QWORD, _QWORD, __int128 *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v7;
  __int128 v8;

  v7 = 0;
  v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v6[2];

  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6))
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 4)
    return 0xFFFFFFFFLL;
  if (v2 != 4)
    return 1;
  v5 = 0;
  if (DERParseInteger((char **)a1, &v5))
    return 4294967294;
  if (v5 < a2)
    return 0xFFFFFFFFLL;
  return v5 > a2;
}

uint64_t DERImg4Decode(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010)
        {
          v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!(_DWORD)result)
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  uint64_t result;
  unsigned int v5;

  v5 = 2;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!(_DWORD)result)
      {
        result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1)
            return 0;
          else
            return 6;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(_QWORD *)(a2 + 80)
               || (v7 = 0u,
                   v8 = 0u,
                   result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          v6 = *(_QWORD *)(a2 + 96);
          v5 = a2 + 96;
          if (!v6)
            return 0;
          v7 = 0u;
          v8 = 0u;
          result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x50415950u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  result = 6;
  if (a1 && a2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          v6 = *(_QWORD *)(a2 + 80);
          v5 = (unint64_t *)(a2 + 80);
          if (!v6)
            return 0;
          memset(v10, 0, sizeof(v10));
          result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
    else
    {
      v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(_QWORD *a1, unint64_t a2)
{
  return sub_100010754(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_100010754(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result;
  unsigned int v9;

  result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1])
      return 0;
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!(_DWORD)result)
    {
      if (DERImg4DecodeTagCompare(a4, a5))
        return 2;
      v9 = 0;
      result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result)
        return result;
      if (v9 > 2)
        return 2;
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(_QWORD *a1, unint64_t a2)
{
  return sub_100010754(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(_QWORD *a1, unint64_t a2)
{
  return sub_100010754(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(_QWORD *a1, unint64_t a2)
{
  return sub_100010754(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v18 = 0;
  v19 = 0;
  v20 = 0;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              v16 = 0u;
              v17 = 0u;
              v14 = 0u;
              v15 = 0u;
              result = DERDecodeItem((uint64_t)v21, &v18);
              if (!(_DWORD)result)
              {
                if (v18 != 0x2000000000000011)
                  return 2;
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  result = DERDecodeItem((uint64_t)&v16, &v18);
                  if ((_DWORD)result)
                    return result;
                  if (v18 != 0x2000000000000010)
                    return 2;
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    v12 = *((_QWORD *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    result = DERDecodeItem((uint64_t)&v17, &v18);
                    if ((_DWORD)result)
                      return result;
                    if (v18 == 4)
                    {
                      result = 0;
                      v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  __int128 v15;

  result = 6;
  if (a1)
  {
    if (a3)
    {
      v14 = 0;
      v15 = 0uLL;
      v13 = 0uLL;
      v11 = 0;
      v12 = 0;
      v9 = 0;
      v10 = 0;
      v8 = 0;
      result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010)
          return 2;
        result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result)
          return result;
        if (v14 != 22)
          return 2;
        result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result)
          return result;
        if ((v8 | 0xE000000000000000) != a2)
          return 2;
        *(_OWORD *)a3 = v15;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result)
          return result;
        *(_QWORD *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1)
          return 2;
        v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result;
  unsigned int v8;
  _QWORD v9[4];
  __int128 v10;

  v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  v10 = a3;
  result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!(_DWORD)result)
  {
    result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        result = 0;
        *(_QWORD *)(a4 + 16) = a2 | 0xE000000000000000;
        *(_QWORD *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  __int128 v8;

  v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7)
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7[2];

  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7))
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  sub_100010CE0(a1, a2, a3, 0x4D414E42u);
}

void sub_100010CE0(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  _OWORD v12[3];
  _OWORD v13[3];
  unint64_t v14;
  unint64_t v15[2];

  v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2)
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10)
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  sub_100010CE0(a1, a2, a3, 0x43525450u);
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[2];
  unint64_t v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v11 = 0;
  v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  v15 = 0;
  result = 0xFFFFFFFFLL;
  v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010)
            return 2;
          result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result)
            return result;
          if (v11)
          {
            result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1))
                return 7;
              v9 = __CFADD__(v12, v8);
              v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 136))
      v4 = *(_QWORD *)(a1 + 144) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  BOOL v5;

  v5 = 0;
  result = 6;
  if (!a1 || !a2 || (result = Img4DecodePayloadExists(a1, &v5), (_DWORD)result))
  {
LABEL_6:
    if (!a2)
      return result;
    goto LABEL_7;
  }
  if (v5)
  {
    result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  result = 1;
  if (!a2)
    return result;
LABEL_7:
  if ((_DWORD)result)
    *a2 = 0;
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 152))
      v4 = *(_QWORD *)(a1 + 160) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 168))
      v4 = *(_QWORD *)(a1 + 176) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;
  unint64_t *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  BOOL v11;

  v11 = 0;
  result = 6;
  if (!a1)
    goto LABEL_14;
  if (!a2)
    goto LABEL_14;
  if (!a3)
    goto LABEL_14;
  result = Img4DecodePayloadExists(a1, &v11);
  if ((_DWORD)result)
    goto LABEL_14;
  if (!v11)
    goto LABEL_13;
  result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if ((_DWORD)result)
    goto LABEL_14;
  if (!v11)
  {
LABEL_13:
    result = 1;
    goto LABEL_14;
  }
  v9 = 0u;
  v10 = 0u;
  v8 = *(_QWORD *)(a1 + 168);
  v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    result = 0xFFFFFFFFLL;
    if (!a2)
      return result;
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if ((_DWORD)result
    || (result = DERParseInteger((char **)&v9, a2), (_DWORD)result)
    || (result = DERParseInteger((char **)&v10, a3), (_DWORD)result))
  {
LABEL_14:
    if (!a2)
      return result;
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(_QWORD, _QWORD, __int128 *), uint64_t a3, int a4)
{
  __int128 v7;
  BOOL v9;
  __int128 v10;
  int v11;

  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3)
      return *(double *)&v7;
LABEL_9:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9)
    goto LABEL_9;
  if (*(_BYTE *)a1)
  {
    v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    v10 = 0uLL;
    v11 = 0;
    a2(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), &v10);
    *(_QWORD *)&v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t v4;
  BOOL v10;
  _OWORD __src[3];

  v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(_BYTE *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  v4 = (*a4)(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), __src, a3, a4);
                  if (!(_DWORD)v4)
                    memcpy(a2, __src, a3);
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_QWORD *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  __int128 v5;

  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3)
      return *(double *)&v5;
LABEL_8:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_8;
  if (*(_BYTE *)(a1 + 1))
  {
    v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(_QWORD *)&v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t v4;
  uint64_t (*v7)(uint64_t, _QWORD, _OWORD *, size_t, _QWORD);
  uint64_t v8;
  _OWORD v10[3];

  v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          v7 = *a4;
          if (*a4)
          {
            v8 = *(_QWORD *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(_BYTE *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                v4 = v7(v8, *(_QWORD *)(a1 + 32), v10, __n, a4);
                if (!(_DWORD)v4)
                  memcpy(__dst, v10, __n);
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v8;

  result = 6;
  if (a1 && a2 && a3)
  {
    v5 = *(_QWORD *)(a1 + 24);
    *a2 = v5;
    v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(_QWORD *a1, unsigned int a2, char *a3)
{
  uint64_t v3;
  char v4;

  v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56])
        goto LABEL_11;
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      v4 = 0;
      goto LABEL_12;
    }
    v4 = 1;
LABEL_12:
    v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(_QWORD *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      v4 = v6;
      if (!(_DWORD)v6)
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  Img4DecodeGetIntegerFromSection(a1, 1u, a2, a3);
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  Img4DecodeGetInteger64FromSection(a1, 1u, a2, a3);
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  Img4DecodeGetDataFromSection(a1, 1u, a2, a3, a4);
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (!a1)
    return 6;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v5 = a1 + 8;
    if (v6)
    {
      result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!(_DWORD)result)
        *a2 = (_QWORD)v8 != 0;
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  int v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[6];
  _OWORD v12[4];

  if (a1)
  {
    if (a4)
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v10 = 0uLL;
        v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(_QWORD *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8)
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v5;
  int v6;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v10 = 0uLL;
    v9 = 0uLL;
    v8 = 0uLL;
    if (a3)
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v19 = 0uLL;
        v20 = 0uLL;
        v17 = 0uLL;
        v18 = 0uLL;
        v15 = 0uLL;
        v16 = 0uLL;
        v13 = 0uLL;
        v14 = 0uLL;
        v11 = 0uLL;
        v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((_QWORD)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7)
                  *a3 = (_QWORD)v8 != 0;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[6];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (!a1)
    return 6;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v5 = a1 + 8;
    if (v6)
    {
      result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!(_DWORD)result)
      {
        if ((_QWORD)v9)
        {
          result = 0;
          v7 = *((_QWORD *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(_QWORD *a1, void *a2, size_t a3, uint64_t (**a4)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t result;
  uint64_t (*v8)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD);
  _OWORD v9[3];

  result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        result = v8(*a1, a1[1], v9, a3, a4);
        if (!(_DWORD)result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, _QWORD *a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17[3];
  unint64_t v18;
  unint64_t v19[2];
  unint64_t v20;
  _QWORD v21[2];
  unint64_t v22[2];
  unint64_t v23[2];

  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v13 = 0uLL;
    v12 = 0uLL;
    v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((_QWORD)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8)
                        break;
                      if (v8 == 1)
                        return;
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9)
                    break;
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4)
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4)
    DERParseInteger((char **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4)
    DERParseInteger64((char **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    v7 = v10;
    *a3 = *((_QWORD *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  double result;
  int v10;
  int v11;
  int v12;
  _OWORD v13[3];
  unint64_t v14[2];

  v14[0] = 0;
  v14[1] = 0;
  result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!(_DWORD)v6)
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4))
        *a4 = 0;
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4))
        *a4 = 0;
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;
  _QWORD v15[2];

  if (a3 && a4)
  {
    v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    v12 = 0uLL;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      v8 = 0;
      *a3 = 0;
    }
    else
    {
      v8 = v11;
      *a3 = *((_QWORD *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  int v10;
  double result;
  int v12;
  unint64_t v13[3];
  char v14;

  *(_OWORD *)v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    v14 = 0;
    if (!Img4DecodeSectionExists((_QWORD *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12)
          return result;
      }
    }
    result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) != 2)
    {
      result = 2;
      if (!a3)
        return result;
      goto LABEL_6;
    }
    if (!a3)
      return 6;
    result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3)
    return result;
LABEL_6:
  if ((_DWORD)result)
    *a3 = 0;
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) != 2)
    {
      result = 2;
      if (!a3)
        return result;
      goto LABEL_6;
    }
    if (!a3)
      return 6;
    result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3)
    return result;
LABEL_6:
  if ((_DWORD)result)
    *a3 = 0;
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) == 1)
    {
      if (a3)
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      else
        return 6;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  result = 6;
  if (a3 && a4)
  {
    v8 = *a1;
    v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!(_DWORD)result)
    {
      if (*((_QWORD *)&v14 + 1) == 4)
      {
        result = 0;
        *a3 = *((_QWORD *)&v13 + 1);
        v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      result = 2;
    }
    v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(_QWORD *a1)
{
  sub_100012734(a1, 0);
}

void sub_100012734(_QWORD *a1, _OWORD *a2)
{
  __int128 *v4;
  int v5;
  int v6;
  __int128 v7;
  __int128 __s2;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *__s1;
  size_t __n;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20[2];
  unint64_t v21[3];

  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  v19 = 0;
  v18 = 0uLL;
  __n = 0;
  v17 = 0;
  v14 = 0;
  __s1 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __s2 = 0uLL;
  v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17))
        return;
      v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((_QWORD *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5)
              break;
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9))
              return;
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((_QWORD *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6)
                return;
              if (__n != *((_QWORD *)&__s2 + 1))
                return;
              v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6)
                return;
            }
            else if (*((_QWORD *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((_QWORD *)&v10 + 1) != 0xA000000000000001 || v6 != 1)
                return;
              v6 = 0;
            }
            if (v6)
              return;
          }
          if (v5 != 1)
            return;
          break;
        case 0xE00000006D616E78:
          if (a2)
            *a2 = v18;
          break;
        case 0xE00000004F424A50:
          v4 = (__int128 *)(a1 + 9);
          if (a1[9])
            goto LABEL_11;
          v4 = (__int128 *)(a1 + 9);
          if (a1[10])
            goto LABEL_11;
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  int v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _BYTE *v12;
  __int128 v13;
  uint64_t v14;
  _QWORD *v15;
  _BYTE v16[48];
  _BYTE v17[208];

  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        v10[2] = Img4DecodeDigestReturnHash;
        *(_QWORD *)&v13 = &unk_100019378;
        *((_QWORD *)&v13 + 1) = 156;
        v14 = a3;
        v15 = v10;
        sub_100012734(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              v11[2] = a1;
              v12 = v17;
              if (!((unsigned int (*)(_QWORD, _BYTE **))*v15)(*(_QWORD *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))sub_10001382C, (uint64_t)v11)&& !((unsigned int (*)(_QWORD, _BYTE **, uint64_t, _BYTE *))v15[2])(*(_QWORD *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13[2];
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  memset(v8, 0, sizeof(v8));
  v9 = 0u;
  if (!a3)
    return 6;
  result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1)
        return 0;
      if ((_DWORD)result)
        return result;
      result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result)
        return result;
      result = 2;
      if (*((_QWORD *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16))
        break;
      v10 = v15;
      LODWORD(v11) = v16;
      v12 = *((_QWORD *)&v9 + 1);
      result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result)
        return result;
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[2];

  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      v7 = 0u;
      v8 = 0u;
      v5 = 0u;
      v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(_QWORD *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;

  if (a1 && a3)
  {
    *(_QWORD *)&v5 = a1;
    *((_QWORD *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(_QWORD *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012E00(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_100012E00(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = 6;
  if (a1 && a4)
  {
    v15 = a1;
    v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(_QWORD *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      v10 = a4 + 232;
      if (a3)
        result = DERImg4DecodeCertificate(&v15, v10);
      else
        result = DERImg4DecodeUnsignedCertificate(&v15, v10);
    }
    else
    {
      if (a5 != 1229796429)
        return 2;
      v9 = a4 + 232;
      if (a3)
        result = DERImg4DecodeManifest(&v15, v9);
      else
        result = DERImg4DecodeUnsignedManifest(&v15, v9);
    }
    if (!(_DWORD)result)
    {
      if (*(_QWORD *)(a4 + 264))
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = a1;
        v16 = a2;
        result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a4 + 24) = a1;
          v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(_QWORD *)(a4 + 32) = v11;
            if (v11 == a2)
              return 0;
            else
              return 7;
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012E00(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012E00(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012E00(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  void (*v9)(uint64_t);

  result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(_QWORD, _QWORD, uint64_t), uint64_t a7)
{
  int v14;
  int v15;
  BOOL v16;
  _OWORD v17[3];

  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(_QWORD *)(a2 + 24))
      {
        v16 = 0;
        a6(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2 + 376);
        if (!a4(*(_QWORD *)(a2 + 296), *(unsigned int *)(a2 + 304), *(_QWORD *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a2 + 184);
                  *(_BYTE *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), a2 + 328);
                  *(_BYTE *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[3];

  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  sub_100013568(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100013568(a1, a2, a3, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[3];

  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  sub_100013568(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, uint64_t a9, uint64_t a10)
{
  uint64_t result;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[5];
  uint64_t v41;

  v41 = 0;
  v39 = 0u;
  memset(v40, 0, sizeof(v40));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  result = 6;
  v17 = 0u;
  v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (sub_100012E00(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(_QWORD, _QWORD, char *, _QWORD, uint64_t))a9)(*((_QWORD *)&v33 + 1), v34, (char *)v40 + 8, **(_QWORD **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, char *, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a9 + 16))(a1, a2, *((_QWORD *)&v34 + 1), v35, (char *)v40 + 8, **(_QWORD **)(a9 + 32), a9, a10, v17, *((_QWORD *)&v17 + 1), v18, *((_QWORD *)&v18 + 1), v19,
           *((_QWORD *)&v19 + 1),
           v20,
           *((_QWORD *)&v20 + 1),
           v21,
           *((_QWORD *)&v21 + 1),
           v22,
           *((_QWORD *)&v22 + 1),
           v23,
           *((_QWORD *)&v23 + 1),
           v24,
           *((_QWORD *)&v24 + 1),
           v25,
           *((_QWORD *)&v25 + 1),
           v26,
           *((_QWORD *)&v26 + 1),
           v27,
           *((_QWORD *)&v27 + 1),
           v28,
           *((_QWORD *)&v28 + 1),
           v29,
           *((_QWORD *)&v29 + 1),
           v30,
           *((_QWORD *)&v30 + 1),
           v31,
           *((_QWORD *)&v31 + 1),
           v32,
           *((_QWORD *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100013568(a1, a2, a3, a4, 0, a5);
}

void sub_100013568(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  _QWORD *v9;
  uint64_t (*v13)(uint64_t, uint64_t);
  const void *v14;
  int v15;
  int v16;
  unsigned int (*v17)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t);
  unint64_t v18;
  unint64_t *v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[3];

  v22 = 0;
  v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      v21 = 0;
      if (a4)
      {
        if (*(_QWORD *)a3)
        {
          if (*(_QWORD *)a4)
          {
            if (*(_QWORD *)(a4 + 24))
            {
              if (*(_QWORD *)(a4 + 8))
              {
                if (*(_QWORD *)(a4 + 16))
                {
                  v9 = *(_QWORD **)(a4 + 32);
                  if (v9)
                  {
                    if (*(_QWORD *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(_QWORD **)(a4 + 32)))
                      {
                        v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(_QWORD *)(a2 + 296), *(_QWORD *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(_QWORD **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(_QWORD, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(_QWORD *)(a2 + 280), *(_QWORD *)(a2 + 288), a2 + 376,
                               **(_QWORD **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16)
                        return;
                      if ((a5 & 1) == 0)
                      {
                        v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        v18 = a1 | 0xE000000000000000;
                        v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6))
                            return;
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20)
                            return;
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(_QWORD **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a2 + 184, **(_QWORD **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(_BYTE *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100013568(0, a1, a2, a3, 1, a4);
}

uint64_t sub_10001382C(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11[3];
  unint64_t v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v10 = a1;
  if (a3)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD **)a4;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((_QWORD *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)(*(_QWORD *)a4 + 24) + 8))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a4 + 24) + 8))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(_QWORD *)a2);
  return 0;
}

uint64_t sha1_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ccdigest(sha1_digest_info, a2, a1, a3);
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD **v8;
  _QWORD *v9;
  uint64_t result;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0xFFFFFFFFLL;
  if (!a5)
    return 0xFFFFFFFFLL;
  if (!a6)
    return 0xFFFFFFFFLL;
  if (!a7)
    return 0xFFFFFFFFLL;
  v7 = *(_QWORD *)(a7 + 32);
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD ***)(v7 + 16);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = *v8;
  if (!v9)
    return 0xFFFFFFFFLL;
  if (*v9 != a6)
    return 0xFFFFFFFFLL;
  result = sub_1000139E4((uint64_t)v13, v9[4], v11, v12, 3072);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t sub_1000139E4(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t v9;
  size_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  _BYTE *v15;
  __int128 i;
  unint64_t v17;
  BOOL v18;
  int v19;
  int v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];

  if (a5 != 4096 && a5 != 3072)
    return 0xFFFFFFFFLL;
  v24[0] = 0;
  v24[1] = 0;
  v9 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  v11 = (unint64_t *)((char *)&v21 - v10);
  bzero((char *)&v21 - v10, v10);
  *v11 = v9;
  v12 = *(unsigned int *)(a1 + 8);
  v23[0] = *(_QWORD *)a1;
  v23[1] = v12;
  v21 = 0u;
  v22 = 0u;
  result = DERParseSequenceToObject((uint64_t)v23, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)&v21, 0x20uLL, 0x20uLL);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  v14 = *((_QWORD *)&v21 + 1);
  v15 = (_BYTE *)v21;
  for (i = v22; v14; --v14)
  {
    if (*v15)
      break;
    if (v15 == (_BYTE *)-1)
      __break(0x5513u);
    ++v15;
  }
  if (v14 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  v17 = (v14 + 7) >> 3;
  if (v17 > *v11)
    return 0xFFFFFFFFLL;
  *v11 = v17;
  if (ccrsa_make_pub(v11, *((_QWORD *)&i + 1), i))
    return 0xFFFFFFFFLL;
  if (&_ccrsa_verify_pkcs1v15_digest)
    v18 = &CCRSA_PKCS1_FAULT_CANARY == 0;
  else
    v18 = 1;
  if (!v18)
  {
    v20 = ccrsa_verify_pkcs1v15_digest(v11, a2, a3[1], *a3, a4[1], *a4, v24);
    if (!v20 && !cc_cmp_safe(16, &CCRSA_PKCS1_FAULT_CANARY, v24))
      return 0;
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v21) = 0;
  v19 = ccrsa_verify_pkcs1v15(v11, a2, a3[1], *a3, a4[1], *a4, &v21);
  result = 0xFFFFFFFFLL;
  if (!v19 && (_BYTE)v21)
    return 0;
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD **v8;
  _QWORD *v9;
  uint64_t result;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0xFFFFFFFFLL;
  if (!a5)
    return 0xFFFFFFFFLL;
  if (!a6)
    return 0xFFFFFFFFLL;
  if (!a7)
    return 0xFFFFFFFFLL;
  v7 = *(_QWORD *)(a7 + 32);
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD ***)(v7 + 16);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = *v8;
  if (!v9)
    return 0xFFFFFFFFLL;
  if (*v9 != a6)
    return 0xFFFFFFFFLL;
  result = sub_1000139E4((uint64_t)v13, v9[4], v11, v12, 4096);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];

  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                v7 = *(_QWORD **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(_QWORD *)(a7 + 48) && *v7 == a6)
                  {
                    v10[0] = a1;
                    v10[1] = a2;
                    v9[0] = a3;
                    v9[1] = a4;
                    v8[0] = a5;
                    v8[1] = a6;
                    sub_100013D10(v10, v8, v9);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_100013D10(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  _QWORD *cp;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  size_t v15;
  _QWORD *v16;
  _BYTE v17[7];
  char v18;

  v18 = 0;
  v6 = ccec_x963_import_pub_size(a1[1]);
  if (ccec_keysize_is_supported())
  {
    cp = (_QWORD *)ccec_get_cp(v6);
    v8 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v8, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      v9 = 24 * v8;
      v10 = __CFADD__(v9, 16);
      v11 = v9 + 16;
      if (!v10)
      {
        v10 = __CFADD__(v11, 16);
        v12 = v11 + 16;
        if (!v10)
        {
          v13 = cp;
          v14 = v12 - 1;
          __chkstk_darwin();
          v16 = &v17[-v15];
          bzero(&v17[-v15], v15);
          if (v14 < 0x10)
          {
            __break(1u);
          }
          else
          {
            *v16 = v13;
            if (!ccec_import_pub(v13, a1[1], *a1, v16))
              ccec_verify(v16, a2[1], *a2, a3[1], *a3, &v18);
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t result;
  unsigned int v9;
  uint64_t v15;
  const void **v16;
  uint64_t *v17;
  const void **v18;
  unint64_t *v19;
  size_t v20;
  const void *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 v25;
  unint64_t v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[216];
  _BYTE v32[24];
  unint64_t v33[30];
  _OWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[32];
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41[2];
  unint64_t v42[2];
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46[2];
  unint64_t v47[3];

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!sub_1000152F4(v26, (uint64_t)v27, 3u)
          && !sub_100014158((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          v24 = a6;
          v15 = 0;
          v16 = (const void **)v32;
          v17 = &v30;
          v18 = (const void **)v32;
          while (1)
          {
            v19 = &v26[20 * v15];
            v20 = v19[37];
            v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21)
              break;
            if (memcmp((const void *)v19[36], *(v16 - 1), v20))
              break;
            result = sub_1000143BC(&v34[v15], v17, a7);
            if ((_DWORD)result)
              break;
            v17 += 6;
            ++v15;
            v16 = v18;
            if (v15 == 2)
            {
              v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42))
                return 0xFFFFFFFFLL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                v43 = 0u;
                v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1)
                        goto LABEL_14;
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  v25 = v44;
                  result = DEROidCompare((uint64_t)&off_100021C20, (uint64_t)&v25);
                  if (!(_DWORD)result)
                    return 0xFFFFFFFFLL;
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  if (!v38)
                    return 0;
                  v23 = v39;
                  if (!v39)
                    return 0;
                  result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      result = 0;
                      *a5 = v38;
                      *v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_100014158(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  char v21;
  __int128 v22;
  __int128 v23;

  if (!a2)
    return 0;
  v8 = 0;
  v15 = result;
  v18 = ~result;
  v17 = ~a3;
  v14 = ~a4;
  v13 = ~a5;
  v11 = ~a6;
  v10 = a2;
  while (1)
  {
    v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17)
      break;
    result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (160 * v8 > v14)
      break;
    result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v9 > v13)
      break;
    v22 = 0u;
    v23 = 0u;
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result)
      return 0xFFFFFFFFLL;
    if (*((_QWORD *)&v20 + 1))
    {
      if (*((_QWORD *)&v20 + 1) != 2 || *(_BYTE *)v20 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v20 == -1)
        break;
      if (*(_BYTE *)(v20 + 1))
        return 0xFFFFFFFFLL;
    }
    result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21)
      return 0xFFFFFFFFLL;
    if (v9 > v11)
      break;
    result = sub_1000153CC(a4 + 160 * v8, (_QWORD *)(a6 + 16 * v8));
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (++v8 == v10)
      return 0;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_1000143BC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  v11 = 0u;
  v12 = 0u;
  v10 = 0;
  memset(v13, 0, sizeof(v13));
  v8 = 0;
  v9 = 0;
  v5 = *(_QWORD **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(_QWORD *)a3
    || !*(_QWORD *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((_QWORD *)&v12 + 1))
  {
    result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((_QWORD *)&v12 + 1) != 2 || *(_BYTE *)v12 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(_BYTE *)(v12 + 1))
        return 0xFFFFFFFFLL;
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(_QWORD *)(a3 + 40)))
    return 0xFFFFFFFFLL;
  if ((*(unsigned int (**)(_QWORD, _QWORD, _OWORD *, _QWORD, uint64_t))a3)(*a2, a2[1], v13, **(_QWORD **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10))
    return 0xFFFFFFFFLL;
  if (v10)
    return 0xFFFFFFFFLL;
  result = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t, _OWORD *, _QWORD, uint64_t, _QWORD))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(_QWORD **)(a3 + 32), a3, 0);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_1000146FC);
}

uint64_t sub_10001456C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v21[2];
  _BYTE v22[48];
  _OWORD v23[9];
  uint64_t v24;
  void *__s1;
  size_t __n;
  _QWORD v27[6];
  _BYTE v28[16];
  uint64_t v29;
  uint64_t v30;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2))
          return 0xFFFFFFFFLL;
        result = sub_100014158((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if ((_DWORD)result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          v16 = 1;
          v17 = 1;
          while ((v16 & 1) != 0)
          {
            v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              result = sub_1000143BC(v27, &v23[3 * v17], a7);
              v16 = 0;
              v17 = 2;
              if (!(_DWORD)result)
                continue;
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (v19 = v30) != 0)
          {
            result = 0;
            if (a5 && a6)
            {
              result = 0;
              *a5 = v29;
              *a6 = v19;
            }
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000146FC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001473C);
}

uint64_t sub_10001473C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001477C);
}

uint64_t sub_10001477C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_1000147BC);
}

uint64_t sub_1000147BC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_1000147FC);
}

uint64_t sub_1000147FC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001483C);
}

uint64_t sub_10001483C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001487C);
}

uint64_t sub_10001487C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_1000148BC);
}

uint64_t sub_1000148BC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_1000148FC);
}

uint64_t sub_1000148FC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001493C);
}

uint64_t sub_10001493C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001497C);
}

uint64_t sub_10001497C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001456C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_1000149BC);
}

uint64_t sub_1000149BC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  uint64_t v15;
  const void **v16;
  uint64_t *v17;
  const void **v18;
  _QWORD *v19;
  size_t v20;
  const void *v21;
  uint64_t v22;
  _QWORD *v25;
  _QWORD v26[2];
  _BYTE v27[48];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[264];
  _OWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[32];
  uint64_t v37;
  uint64_t v38;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !sub_100014BA0((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          v25 = a4;
          v15 = 0;
          v16 = (const void **)v31;
          v17 = &v29;
          v18 = (const void **)v31;
          while (1)
          {
            v19 = &v26[20 * v15];
            v20 = v19[37];
            v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21)
              break;
            if (memcmp((const void *)v19[36], *(v16 - 1), v20))
              break;
            result = sub_1000143BC(&v32[v15], v17, a7);
            if ((_DWORD)result)
              break;
            v17 += 6;
            ++v15;
            v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (v22 = v38) != 0)
              {
                result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_100014BA0(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  char v30;
  __int128 v31;
  __int128 v32;

  if (!a2)
    return 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v21 = result;
  v24 = ~result;
  v23 = ~a3;
  v20 = ~a4;
  if (a5 <= a6)
    v12 = a6;
  else
    v12 = a5;
  v19 = ~v12;
  v16 = ~a7;
  v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v9 > v20)
      break;
    result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v11 > v19)
      break;
    v31 = 0u;
    v32 = 0u;
    v30 = 0;
    v28 = 0u;
    v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey))
      return 0xFFFFFFFFLL;
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30))
      return 0xFFFFFFFFLL;
    if (v30)
      return 0xFFFFFFFFLL;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    result = DERDecodeItem((uint64_t)&v29, &v25);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    v13 = (_QWORD *)(a6 + v11);
    v14 = v27;
    *v13 = v26;
    v13[1] = v14;
    if (v11 > v16)
      break;
    result = sub_1000153CC(a4 + v9, (_QWORD *)(a7 + v11));
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11)
      return 0;
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_100014E1C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_100014F9C);
}

uint64_t sub_100014E1C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  _BYTE v20[32];
  _BYTE v21[48];
  _QWORD v22[6];
  _BYTE v23[80];
  void *__s1;
  size_t __n;
  void *__s2;
  uint64_t v27;
  _QWORD v28[4];
  uint64_t v29;
  _BYTE v30[16];
  uint64_t v31;
  uint64_t v32;

  result = 0xFFFFFFFFLL;
  if (!a1)
    return result;
  v10 = a2;
  if (!a2 || !a3 || !a4)
    return result;
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2))
    return 0xFFFFFFFFLL;
  result = sub_100014BA0((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL)
    goto LABEL_22;
  if (__n != v27)
    return 0xFFFFFFFFLL;
  result = memcmp(__s1, __s2, __n);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  result = sub_1000143BC(v28, v22, a7);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL)
    goto LABEL_22;
  v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL)
    goto LABEL_22;
  if (!v31)
    return 0;
  v17 = v32;
  if (!v32)
    return 0;
  result = 0;
  if (a5)
  {
    if (a6)
    {
      result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t sub_100014F9C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_100014E1C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_100014FDC);
}

uint64_t sub_100014FDC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_100015034);
}

uint64_t sub_100015034(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_100014FDC);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_1000150B0);
}

uint64_t sub_1000150B0(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (sub_1000152F4(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t Img4DecodeDigestInit(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = *(_QWORD **)(a1 + 16);
  if (!v2 || !*v2)
    return 0xFFFFFFFFLL;
  ccdigest_init(*v2, *a2);
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = **(_QWORD **)(a1 + 16);
  if (!v2)
    return 0xFFFFFFFFLL;
  ccdigest_update(v2, *a2);
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, _QWORD *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = **(_QWORD **)(a1 + 16);
  if (!v4 || *(_QWORD *)v4 > a3)
    return 0xFFFFFFFFLL;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t *v3;

  if (a1 && (v3 = **(unint64_t ***)(a1 + 16)) != 0)
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  else
    return 0xFFFFFFFFLL;
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  _QWORD *v8;
  _QWORD **v9;
  _QWORD *v10;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    v8 = *(_QWORD **)(a5 + 32);
    if (v8 && (v9 = (_QWORD **)v8[2]) != 0 && *v8 == a4 && (v10 = *v9) != 0 && *v10 == a4)
    {
      ccdigest(v10, a2, a1, a3);
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  v15 = 0;
  v16 = 0;
  if (verify_chain_img4_v1(a1, a2, &v17, &v18, &v15, &v16, (uint64_t)kImg4DecodeSecureBootRsa1kSha1))
    return 0xFFFFFFFFLL;
  *a7 = v15;
  *a8 = v16;
  result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t sub_1000152F4(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v18 = 0;
  v19 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v5 = ~a2;
  v6 = 1;
  v7 = *a1;
  v8 = a1[1];
  while (1)
  {
    v18 = v7;
    v19 = v8;
    result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (__CFADD__(v16, v17))
      break;
    v10 = v16 + v17;
    v11 = v16 + v17 - v7;
    v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3)
      return 0xFFFFFFFFLL;
    if (v5 < 16 * (unint64_t)v6)
      break;
    v14 = (unint64_t *)(a2 + 16 * v6);
    *v14 = v7;
    v14[1] = v11;
    if (v10 < v7)
      break;
    v12 = v8 >= v11;
    v8 -= v11;
    if (!v12)
      goto LABEL_21;
    ++v6;
    v7 = v10;
    if (!v8)
    {
      if (v6 == a3)
        return 0;
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_1000153CC(uint64_t a1, _QWORD *a2)
{
  char v3;
  int v4;
  _OWORD v6[2];
  __int128 v7;
  unint64_t v8;
  unint64_t v9[2];
  uint64_t v10;
  unint64_t v11[2];
  unint64_t v12[3];

  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  v10 = 0;
  v8 = 0;
  v9[0] = 0;
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(a1 + 152))
    return 0;
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010)
    return 0xFFFFFFFFLL;
  v3 = 1;
  while (1)
  {
    v4 = DERDecodeSeqNext(v11, &v8);
    if (v4)
      break;
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011)
        return 0xFFFFFFFFLL;
      v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

void sub_100015528(uint64_t a1)
{
  int v1;
  _DWORD v2[2];

  v1 = *(_DWORD *)(*(_QWORD *)a1 + 24);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to checkin with lockdown: 0x%08x", (uint8_t *)v2, 8u);
}

void sub_1000155AC(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24);
  v4 = *a2;
  v5[0] = 67109632;
  v5[1] = a3;
  v6 = 2048;
  v7 = v3;
  v8 = 2048;
  v9 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received bytes: %d %% (%ld/%ld).", (uint8_t *)v5, 0x1Cu);
}

void sub_10001564C()
{
  _DWORD v0[2];

  v0[0] = 67109120;
  v0[1] = 20;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Resetting remote services timed out after %d seconds.", (uint8_t *)v0, 8u);
}

void sub_1000156CC()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to reset device.", v0, 2u);
}

void sub_100015710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  uint64_t v14;

  v9 = sub_10000B11C((uint64_t)"main", 36, -2, 0, CFSTR("Failed to query working directory."), a6, a7, a8, v14);
  v10 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(v9), "description");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v10));
  v13 = sub_10000A564(v11, v12);
  _os_crash(v13);

  __break(1u);
}

void sub_10001575C()
{
  _os_crash("Failed to initialize lockdown server.");
  __break(1u);
}

void sub_100015774()
{
  _os_crash("Failed to initialize remote server.");
  __break(1u);
}

void sub_10001578C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;

  v9 = sub_10000B11C((uint64_t)"main", 41, -2, a1, CFSTR("Failed to create %@."), a6, a7, a8, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description")));
  v13 = sub_10000A564(v11, v12);
  _os_crash(v13);

  __break(1u);
}

void sub_1000157F0()
{
  int v0;
  int *v1;
  char *v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  char *v16;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v0 = *__error();
    v1 = __error();
    v2 = strerror(*v1);
    *(_DWORD *)buf = 67109378;
    v14 = v0;
    v15 = 2080;
    v16 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set temporary directory subpath: %d (%s)", buf, 0x12u);
  }
  v3 = *__error();
  v4 = __error();
  strerror(*v4);
  v8 = sub_10000B11C((uint64_t)"main", 28, -2, 0, CFSTR("Failed to set temporary directory subpath: %d (%s)"), v5, v6, v7, v3);
  v9 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(v8), "description");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v9));
  v12 = sub_10000A564(v10, v11);
  _os_crash(v12);

  __break(1u);
}

void sub_1000158C8(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_10000F43C((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "Skipping %@, as we didn't mount it.", a1);
}

void sub_100015908(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to load version dictionary at %@ (image version: %@).", (uint8_t *)&v2, 0x16u);
}

void sub_100015990(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000F430((void *)&_mh_execute_header, &_os_log_default, a3, "Ignoring EFI partition.", a1);
}

void sub_1000159C8(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000F430((void *)&_mh_execute_header, &_os_log_default, a3, "Ignoring Apple_partition_map partition.", a1);
}

void sub_100015A00(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_10000F43C((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "The attached media %@ is not a leaf, ignoring.", a1);
}

void sub_100015A40(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_10000F43C((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "The attached media %@ is not removable, ignoring.", a1);
}

void sub_100015A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_10000F430((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to retrieve the list of attached devices.", v3);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_imageURLFromDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageURLFromDevice:error:");
}

id objc_msgSend_initDataWithHexString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initDataWithHexString:");
}

id objc_msgSend_initHexStringWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initHexStringWithData:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFileSystemRepresentation_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFileSystemRepresentation:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}
