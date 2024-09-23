@implementation EmbeddedOSSupport

- (id)disableBiometricID
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  unsigned int v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  NSErrorUserInfoKey v23;
  NSErrorUserInfoKey v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];

  v2 = sub_1000031B8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disabling biometry devices...", buf, 2u);
  }

  if (objc_opt_class(BKDeviceDescriptor, v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKDeviceManager availableDevices](BKDeviceManager, "availableDevices"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v27;
      v24 = NSLocalizedDescriptionKey;
      v23 = NSUnderlyingErrorKey;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKDevice deviceWithDescriptor:error:](BKDevice, "deviceWithDescriptor:error:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), 0, v23, v24));
          v12 = sub_1000031B8();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Disabling biometry device - %@", buf, 0xCu);
          }

          if (v11)
          {
            v25 = v8;
            v14 = objc_msgSend(v11, "forceBioLockoutForAllUsersWithError:", &v25);
            v15 = v25;

            v16 = sub_1000031B8();
            v17 = objc_claimAutoreleasedReturnValue(v16);
            v18 = v17;
            if (v14)
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully disabled biometry", buf, 2u);
              }
              v8 = v15;
            }
            else
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v33 = v15;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error disabling biometry: %@", buf, 0xCu);
              }

              v30[0] = v24;
              v30[1] = v23;
              v31[0] = CFSTR("Couldn't disable biometry");
              v31[1] = v15;
              v18 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
              v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FindMyDevice.EmbeddedOSSupport"), 3, v18));

            }
          }
          else
          {
            v19 = sub_1000031B8();
            v18 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not a biometry capable device", buf, 2u);
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    return v8;
  }
  else
  {
    v20 = sub_1000031B8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10022CD2C(v21);

    return (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FindMyDevice.EmbeddedOSSupport"), 1, 0));
  }
}

- (NSNumber)bioLockState
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  void *v7;
  void *i;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v20;
  id obj;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BiometricKit manager](BiometricKit, "manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identities:", 0));
  v22 = objc_msgSend(v3, "copy");

  v32 = 1;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[BKDeviceManager availableDevices](BKDeviceManager, "availableDevices"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v23 = *(_QWORD *)v29;
    *(_QWORD *)&v5 = 138412290;
    v20 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKDevice deviceWithDescriptor:error:](BKDevice, "deviceWithDescriptor:error:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), 0, v20));
        if (v9)
        {
          v10 = sub_1000031B8();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            v35 = v9;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Checking biometry device state - %@", buf, 0xCu);
          }

          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v12 = v22;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v25;
LABEL_11:
            v16 = 0;
            while (1)
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              if (objc_msgSend(v9, "bioLockoutState:forUser:error:", &v32, objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16), "userID"), 0))
              {
                v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v32));

                v7 = (void *)v17;
                if (v32 != 1)
                  break;
              }
              if (v14 == (id)++v16)
              {
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
                v17 = (uint64_t)v7;
                if (v14)
                  goto LABEL_11;
                break;
              }
            }
          }
          else
          {
            v17 = (uint64_t)v7;
          }

          v7 = (void *)v17;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v18 = v7;

  return (NSNumber *)v18;
}

@end
