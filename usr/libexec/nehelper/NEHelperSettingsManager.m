@implementation NEHelperSettingsManager

- (NEHelperSettingsManager)initWithFirstMessage:(id)a3
{
  xpc_connection_t remote_connection;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  NEHelperSettingsManager *v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  const char *v17;

  remote_connection = xpc_dictionary_get_remote_connection(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  v6 = sub_10000FA04((uint64_t)NEHelperServer, v5, (uint64_t)"com.apple.private.networkextension.configuration");
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)NEHelperSettingsManager;
    self = -[NEHelperSettingsManager init](&v13, "init");
    v8 = self;
  }
  else
  {
    v9 = ne_log_obj(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = sub_10000FA60((uint64_t)NEHelperServer, v5);
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2080;
      v17 = "com.apple.private.networkextension.configuration";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Denying settings manager connection because %@ does not have the %s entitlement", buf, 0x16u);

    }
    v8 = 0;
  }

  return v8;
}

- (void)handleMessage:(id)a3
{
  id v3;
  const char *string;
  int64_t int64;
  uint64_t v6;
  int64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  const __SCPreferences *v11;
  uint64_t v12;
  const __SCPreferences *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  _BOOL4 v19;
  CFPropertyListRef *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  xpc_object_t value;
  xpc_type_t type;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFErrorRef Error;
  CFErrorRef v40;
  CFPropertyListRef v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  CFErrorRef v58;
  CFErrorRef v59;
  CFErrorRef v60;
  CFNumberRef v61;
  const __CFString *v62;
  _BYTE buf[12];
  __int16 v64;
  CFErrorRef v65;

  v3 = a3;
  string = xpc_dictionary_get_string(v3, "setting-name");
  int64 = xpc_dictionary_get_int64(v3, "setting-type");
  v7 = int64;
  if (string)
  {
    int64 = strcmp(string, "CriticalDomains");
    v8 = int64 == 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = ne_log_obj(int64, v6);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = string;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Handling a Settings message with setting name %s", buf, 0xCu);
  }

  v11 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("nehelper"), CFSTR("/Library/Preferences/com.apple.networkextension.control.plist"));
  if (v11)
  {
    v13 = v11;
    v14 = SCPreferencesLock(v11, 1u);
    if ((_DWORD)v14)
    {
      v16 = CFStringCreateWithCString(kCFAllocatorDefault, string, 0x600u);
      v62 = v16;
      v18 = v16;
      switch(v7)
      {
        case 1:
          v19 = xpc_dictionary_get_BOOL(v3, "setting-value");
          v20 = (CFPropertyListRef *)&kCFBooleanTrue;
          if (!v19)
            v20 = (CFPropertyListRef *)&kCFBooleanFalse;
          SCPreferencesSetValue(v13, v18, *v20);
          goto LABEL_39;
        case 2:
          *(_QWORD *)buf = xpc_dictionary_get_int64(v3, "setting-value");
          v61 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, buf);
          SCPreferencesSetValue(v13, v18, v61);
          myCFRelease(&v61);
          goto LABEL_39;
        case 3:
          value = xpc_dictionary_get_value(v3, "setting-value");
          type = (xpc_type_t)objc_claimAutoreleasedReturnValue(value);
          v28 = type;
          if (type)
          {
            type = xpc_get_type(type);
            if (type == (xpc_type_t)&_xpc_type_array)
            {
              v41 = SCPreferencesGetValue(v13, v18);
              Error = (CFErrorRef)objc_claimAutoreleasedReturnValue(v41);
              v42 = (void *)_CFXPCCreateCFObjectFromXPCObject(v28);
              v43 = sub_100010548((uint64_t)NEHelperSettingsManager, Error, v42);
              v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
              if (v8)
              {
                v45 = ne_log_large_obj();
                v46 = objc_claimAutoreleasedReturnValue(v45);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = string;
                  v64 = 2112;
                  v65 = (CFErrorRef)v42;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Saving new %s: %@", buf, 0x16u);
                }

              }
              SCPreferencesSetValue(v13, v18, v44);

              goto LABEL_37;
            }
          }
          v29 = ne_log_obj(type, v27);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Setting value is not a valid array", buf, 2u);
          }

LABEL_29:
          goto LABEL_45;
        case 4:
          v31 = SCPreferencesRemoveValue(v13, v16);
          v32 = v31;
          v34 = ne_log_obj(v31, v33);
          v35 = objc_claimAutoreleasedReturnValue(v34);
          v28 = v35;
          if (v32)
          {
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v18;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Removed %@ setting", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            Error = SCCopyLastError();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v18;
            v64 = 2112;
            v65 = Error;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to remove %@ setting: %@", buf, 0x16u);
LABEL_37:

          }
LABEL_39:
          v37 = SCPreferencesCommitChanges(v13);
          if ((_DWORD)v37)
          {
            sub_1000037E4((uint64_t)NEHelperServer, v3, 0, 0);
            if (v8)
            {
              v47 = notify_post("com.apple.neconfigurationchanged");
              if ((_DWORD)v47)
              {
                v49 = v47;
                v50 = ne_log_obj(v47, v48);
                v51 = objc_claimAutoreleasedReturnValue(v50);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "com.apple.neconfigurationchanged";
                  v64 = 1024;
                  LODWORD(v65) = v49;
                  _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to post %s: %d", buf, 0x12u);
                }

              }
            }
          }
          else
          {
LABEL_45:
            v52 = ne_log_obj(v37, v38);
            v53 = objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v59 = SCCopyLastError();
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = string;
              v64 = 2112;
              v65 = v59;
              _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to change %s: %@", buf, 0x16u);

            }
            sub_1000037E4((uint64_t)NEHelperServer, v3, 22, 0);
          }
          myCFRelease(&v62);
          v54 = SCPreferencesUnlock(v13);
          if (!(_DWORD)v54)
          {
            v56 = ne_log_obj(v54, v55);
            v57 = objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              v60 = SCCopyLastError();
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "/Library/Preferences/com.apple.networkextension.control.plist";
              v64 = 2112;
              v65 = v60;
              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to unlock preferences for %s: %@", buf, 0x16u);

            }
          }
          break;
        default:
          v36 = ne_log_obj(v16, v17);
          v28 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Invalid setting type: %lld", buf, 0xCu);
          }
          goto LABEL_29;
      }
    }
    else
    {
      v23 = ne_log_obj(v14, v15);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v58 = SCCopyLastError();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Preferences/com.apple.networkextension.control.plist";
        v64 = 2112;
        v65 = v58;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to lock SCPreferences for %s: %@", buf, 0x16u);

      }
      sub_1000037E4((uint64_t)NEHelperServer, v3, 22, 0);
    }
    CFRelease(v13);
  }
  else
  {
    v21 = ne_log_obj(0, v12);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v40 = SCCopyLastError();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "/Library/Preferences/com.apple.networkextension.control.plist";
      v64 = 2112;
      v65 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to create SCPreferences for %s: %@", buf, 0x16u);

    }
    sub_1000037E4((uint64_t)NEHelperServer, v3, 22, 0);
  }

}

@end
