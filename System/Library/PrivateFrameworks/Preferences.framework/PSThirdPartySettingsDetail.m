@implementation PSThirdPartySettingsDetail

+ (id)preferencesURLForBundleID:(id)a3 forSettingType:(int64_t)a4
{
  __CFString *v5;
  NSObject *v6;
  __CFString **v7;
  __CFString **v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  _QWORD *v20;
  const __CFString *v21;
  void *v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  __CFString *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  _PSLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v46 = v5;
    v47 = 1024;
    v48 = a4;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "########### Find (%@) type (%d)", buf, 0x12u);
  }

  v7 = (__CFString **)MEMORY[0x1E0DB10D0];
  v8 = &kTCCContactsID;
  switch(a4)
  {
    case 0:
      _PSLoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "########### PSSettingTypeTopLevel", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "applicationIsInstalled:", v5);

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("app-prefs:%@"), v5);
        goto LABEL_18;
      }
      v17 = 0;
      goto LABEL_46;
    case 1:
      +[PSNotificationSettingsController sharedInstance](PSNotificationSettingsController, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sectionInfoForIdentifier:", v5);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v12 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prefs:root=NOTIFICATIONS_ID&path=%@"), v5);
LABEL_18:
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLWithString:", v14);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_45;
      }
      goto LABEL_46;
    case 2:
      if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("com.apple.weather")) & 1) != 0)
      {
        v15 = CFSTR("com.apple.locationd.bundle-/System/Library/PrivateFrameworks/Weather.framework");
LABEL_51:

        goto LABEL_54;
      }
      if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("com.apple.AssistantServices")))
      {
        v15 = CFSTR("com.apple.locationd.bundle-/System/Library/PrivateFrameworks/AssistantServices.framework");
        goto LABEL_51;
      }
      v15 = v5;
LABEL_54:
      v5 = (__CFString *)CLCopyAppsUsingLocation();
      -[__CFString allKeys](v5, "allKeys");
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v31 = -[__CFString countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (!v31)
      {
LABEL_62:

        v14 = CFSTR("LOCATION");
        v24 = v5;
        v5 = (__CFString *)v15;
        v15 = 0;
        goto LABEL_36;
      }
      v32 = v31;
      v33 = *(_QWORD *)v40;
      v14 = CFSTR("LOCATION");
LABEL_56:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(v18);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v34), "isEqualToString:", v15) & 1) != 0)
          break;
        if (v32 == ++v34)
        {
          v32 = -[__CFString countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          if (!v32)
            goto LABEL_62;
          goto LABEL_56;
        }
      }
LABEL_35:
      v24 = v18;
LABEL_36:

      v18 = v24;
      v25 = v5;
      v5 = (__CFString *)v15;
LABEL_38:
      v26 = v5;

      v5 = v25;
LABEL_40:

      if (-[__CFString length](v14, "length") && -[__CFString length](v26, "length"))
      {
        v27 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prefs:root=Privacy&path=%@#%@"), v14, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "URLWithString:", v28);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }
      v5 = v26;
LABEL_45:

LABEL_46:
      _PSLoggingFacility();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v17;
        _os_log_impl(&dword_1A3819000, v29, OS_LOG_TYPE_DEFAULT, "########### URL (%@)", buf, 0xCu);
      }

      return v17;
    case 3:
      goto LABEL_25;
    case 4:
      v7 = (__CFString **)MEMORY[0x1E0DB10E8];
      v8 = &kTCCCalendarsID;
      goto LABEL_25;
    case 5:
      v7 = (__CFString **)MEMORY[0x1E0DB1198];
      v8 = &kTCCRemindersID;
      goto LABEL_25;
    case 6:
      v7 = (__CFString **)MEMORY[0x1E0DB1188];
      v8 = &kTCCPhotosID;
      goto LABEL_25;
    case 7:
      v7 = (__CFString **)MEMORY[0x1E0DB10E0];
      v8 = &kTCCBluetoothSharingID;
      goto LABEL_25;
    case 8:
      v7 = (__CFString **)MEMORY[0x1E0DB1168];
      v8 = &kTCCMicrophoneID;
      goto LABEL_25;
    case 9:
      v7 = (__CFString **)MEMORY[0x1E0DB11B8];
      v8 = &kTCCSpeechRecognitionID;
      goto LABEL_25;
    case 10:
      v7 = (__CFString **)MEMORY[0x1E0DB1148];
      v8 = &kTCCLiverpoolID;
      goto LABEL_25;
    case 11:
      v7 = (__CFString **)MEMORY[0x1E0DB1170];
      v8 = &kTCCMotionID;
      goto LABEL_25;
    case 12:
      v7 = (__CFString **)MEMORY[0x1E0DB10F0];
      v8 = &kTCCCameraID;
      goto LABEL_25;
    case 13:
      v7 = (__CFString **)MEMORY[0x1E0DB1158];
      v8 = &kTCCMediaLibraryID;
      goto LABEL_25;
    case 14:
      v7 = (__CFString **)MEMORY[0x1E0DB11E0];
      v8 = &kTCCWebKitIntelligentTrackingPreventionID;
LABEL_25:
      v14 = *v8;
      v13 = *v7;
      goto LABEL_26;
    default:
      v13 = &stru_1E4A69238;
      v14 = &stru_1E4A69238;
LABEL_26:
      if (-[__CFString length](v13, "length"))
      {
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v18 = (__CFString *)(id)TCCAccessCopyInformation();
        v15 = (const __CFString *)-[__CFString countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (!v15)
          goto LABEL_35;
        v19 = *(_QWORD *)v36;
        v20 = (_QWORD *)MEMORY[0x1E0DB1098];
        while (1)
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v36 != v19)
              objc_enumerationMutation(v18);
            CFBundleGetIdentifier((CFBundleRef)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v21), "objectForKey:", *v20));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", v5);

            if ((v23 & 1) != 0)
            {
              v25 = v18;
              goto LABEL_38;
            }
            v21 = (const __CFString *)((char *)v21 + 1);
          }
          while (v15 != v21);
          v15 = (const __CFString *)-[__CFString countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (!v15)
            goto LABEL_35;
        }
      }
      v26 = 0;
      goto LABEL_40;
  }
}

@end
