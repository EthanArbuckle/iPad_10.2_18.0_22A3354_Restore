void _UIAXBroadcastMainThread(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  id v8;
  id *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  const void *v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  char isKindOfClass;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _QWORD v43[2];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v6;
  v9 = (id *)MEMORY[0x1E0CEB258];
  if ((objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityIsSystemAppServer") & 1) == 0
    && (MEMORY[0x1A1ADC328]() & 1) == 0
    && (AXProcessIsCommandAndControl() & 1) == 0)
  {
    if ((a1 - 1009) <= 0x19 && ((1 << (a1 + 15)) & 0x3001001) != 0)
    {

      goto LABEL_11;
    }
    if ((_DWORD)a1 == 4002)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("event"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnimationsNonActive")) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_57;
        }
      }
      if ((MEMORY[0x1A1ADC334]() & 1) != 0)
        goto LABEL_56;
    }
    else
    {
      isKindOfClass = 0;
    }
    if ((objc_msgSend(*v9, "_accessibilityAllowsNotificationsDuringSuspension") & 1) == 0
      && objc_msgSend(*v9, "isSuspended"))
    {
      v28 = objc_msgSend((id)objc_opt_class(), "safeBoolForKey:", CFSTR("_isSystemUIService"));
      if ((isKindOfClass & 1) != 0)

      if ((v28 & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bundleIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "hasPrefix:", CFSTR("com.apple.AdSheet"));

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "infoDictionary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKey:", CFSTR("SBAppTags"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "containsObject:", CFSTR("hidden")) & 1) != 0)
        v10 = v31 ^ 1;
      else
        v10 = 0;
LABEL_57:

      goto LABEL_5;
    }
LABEL_56:
    v10 = 1;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_5;
    goto LABEL_57;
  }
LABEL_4:
  v10 = 1;
LABEL_5:
  if ((_DWORD)a1 == 1000 && ((AXProcessIsChronod() & 1) != 0 || AXProcessIsPosterBoard()))
  {

  }
  else
  {

    if ((v10 & 1) != 0)
    {
LABEL_11:
      if (UIAccessibilityMoveToElementNotification == (_DWORD)a1
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_msgSend(v8, "objectForKey:", UIAccessibilityMoveToElementNotificationKeyElement),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            v11))
      {
        _preprocessNotificationDataForMoveToElementNotification(v8);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _massageNotificationDataBeforePost(a1, v8);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)v12;

      _massageAssociatedElementBeforePost(v14, v7);
      v15 = objc_claimAutoreleasedReturnValue();

      if (_AXUnitTestNotificationWillBeSentCallback)
      {
        AXRuntimeLogNotifications();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          _UIAXBroadcastMainThread_cold_1(v16);

        _AXUnitTestNotificationWillBeSentCallback(a1, v13, v15);
      }
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend((id)NotificationCallbacks, "allValues", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v17);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i) + 16))();
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        }
        while (v19);
      }

      v22 = (const void *)_AXCreateAXUIElementWithElement();
      v23 = AXPushNotificationToSystemForBroadcast();
      if (v22)
        CFRelease(v22);
      AXRuntimeLogNotifications();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v23)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138413059;
          v39 = &stru_1E3E01CE0;
          v40 = 1024;
          v41 = a1;
          v42 = 1024;
          LODWORD(v43[0]) = v23;
          WORD2(v43[0]) = 2117;
          *(_QWORD *)((char *)v43 + 6) = v13;
          v26 = "Post notification failed. notification: %@ (%d) error:%d data:%{sensitive}@";
LABEL_34:
          _os_log_impl(&dword_19D0DD000, v24, OS_LOG_TYPE_INFO, v26, buf, 0x22u);
        }
      }
      else if (v25)
      {
        *(_DWORD *)buf = 138413059;
        v39 = &stru_1E3E01CE0;
        v40 = 1024;
        v41 = a1;
        v42 = 1024;
        LODWORD(v43[0]) = 0;
        WORD2(v43[0]) = 2117;
        *(_QWORD *)((char *)v43 + 6) = v13;
        v26 = "Did post notification. notification: %@ (%d) error:%d data:%{sensitive}@";
        goto LABEL_34;
      }
      v7 = (id)v15;
      v8 = v13;
      goto LABEL_36;
    }
  }
  if (_AXSInUnitTestMode())
    goto LABEL_11;
  AXRuntimeLogNotifications();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412803;
    v39 = &stru_1E3E01CE0;
    v40 = 1024;
    v41 = a1;
    v42 = 2113;
    v43[0] = v8;
    _os_log_impl(&dword_19D0DD000, v24, OS_LOG_TYPE_INFO, "Did not post. Not allowed. notification: %@ (%d) data:%{private}@", buf, 0x1Cu);
  }
LABEL_36:

}

id _massageNotificationDataBeforePost(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CFTypeID v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  unint64_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t i;
  NSObject *v45;
  id v46;
  uint64_t v47;
  id v48;
  char v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  _QWORD v75[4];
  NSRect v76;

  v75[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((_DWORD)a1 != 1079 && (isKindOfClass & 1) != 0)
  {
    v5 = v3;
    if (objc_msgSend(v5, "count") != 2)
      _AXAssert();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CF4520]);

    if ((v7 & 1) == 0)
      _AXAssert();
    objc_msgSend(v5, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _massageNotificationDataBeforePost(a1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      v75[0] = v10;
      v75[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    else
    {

    }
    v20 = v11;

    goto LABEL_79;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "accessibilityLanguage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accessibilityLanguage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAttribute:forKey:", v15, *MEMORY[0x1E0CF41F8]);

      v3 = v14;
    }
  }
  v5 = 0;
  if (_notificationRequiresElementConversion(a1) && v3)
  {
    v16 = CFGetTypeID(v3);
    if (v16 == AXUIElementGetTypeID()
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), v17 = objc_opt_isKindOfClass(), (v17 & 1) != 0))
    {
      v5 = 0;
    }
    else
    {
      _axuiElementForNotificationData(v17, v3);
      v5 = v3;
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (!_notificationRequiresSenderPID(a1))
  {
    v19 = v3;
    goto LABEL_75;
  }
  if (MEMORY[0x1A1ADC328]())
    v18 = *MEMORY[0x1E0CF4650];
  else
    v18 = getpid();
  if (UIAccessibilityNativeFocusItemDidChangeWithContextNotification == (_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CF4530]);

    if (!v3)
      goto LABEL_71;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (_QWORD *)MEMORY[0x1E0CF4470];
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF4470]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, *v23);

      v25 = (_QWORD *)MEMORY[0x1E0CF4468];
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF4468]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v26, "CGRectValue");
        NSStringFromRect(v76);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, *v25);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, *v25);
      }

      goto LABEL_71;
    }
    v31 = v5;
    v32 = v31;
    if (!v31)
    {
      v54 = 0;
      v50 = 0;
      v48 = 0;
      goto LABEL_70;
    }
    v60 = v19;
    v61 = v3;
    v62 = a1;
    v33 = 0;
    v34 = v31;
    while (1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v34, "_accessibilityUnderlyingElementForFocusItem");
        v35 = objc_claimAutoreleasedReturnValue();

        v34 = (void *)v35;
      }
      if (!objc_msgSend(v34, "isAccessibilityElement", v60, v61))
        goto LABEL_58;
      if (v34 != v32)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_accessibilitySupplementaryHeaderViews");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObjectsFromArray:", v37);

        objc_msgSend(v34, "_accessibilitySupplementaryFooterViews");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObjectsFromArray:", v38);

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v39 = v36;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
        if (v40)
        {
          v41 = v40;
          v63 = v33;
          v42 = 0;
          v43 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v65 != v43)
                objc_enumerationMutation(v39);
              if (objc_msgSend(v32, "_accessibilityIsDescendantOfElement:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i)))
              {
                AXRuntimeLogNotifications();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v71 = v32;
                  v72 = 2112;
                  v73 = v34;
                  _os_log_impl(&dword_19D0DD000, v45, OS_LOG_TYPE_DEFAULT, "Native focus change: Not swapping %@ for %@ because it's a supplementary view (or descendant of one)", buf, 0x16u);
                }

                v42 = 1;
              }
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
          }
          while (v41);

          v33 = v63;
          if ((v42 & 1) != 0)
            goto LABEL_58;
        }
        else
        {

        }
      }
      v46 = v34;

      v33 = v46;
LABEL_58:
      objc_msgSend(v34, "accessibilityContainer");
      v47 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v47;
      if (!v47)
      {
        v48 = v32;
        v19 = v60;
        v3 = v61;
        if (v33)
        {
          v49 = objc_msgSend(v33, "isEqual:", v48);
          LODWORD(a1) = v62;
          v50 = v33;
          v21 = 0x1E0CB3000;
          if ((v49 & 1) == 0)
          {
            v50 = v50;

            AXRuntimeLogNotifications();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v71 = v32;
              v72 = 2112;
              v73 = v50;
              _os_log_impl(&dword_19D0DD000, v51, OS_LOG_TYPE_DEFAULT, "Native focus change: Swapping %@ for %@ because it's the accessible element", buf, 0x16u);
            }

            _axuiElementForNotificationData(v52, v50);
            v53 = objc_claimAutoreleasedReturnValue();

            v48 = v50;
            v3 = (id)v53;
          }
        }
        else
        {
          v50 = 0;
          LODWORD(a1) = v62;
          v21 = 0x1E0CB3000uLL;
        }
LABEL_70:
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CF4460]);

LABEL_71:
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "bundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0CF4438]);
        objc_msgSend(*(id *)(v21 + 2024), "numberWithBool:", _UIApplicationIsExtension());
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0CF4410]);

LABEL_74:
        goto LABEL_75;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v68[0] = *MEMORY[0x1E0CF4530];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v29;
    v68[1] = *MEMORY[0x1E0CF4510];
    v30 = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v69[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    goto LABEL_74;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CF4530]);

LABEL_75:
  if ((_DWORD)a1 == 2041)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = (void *)objc_msgSend(v19, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _massageNotificationDataBeforePost_IdToken);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setObject:forKeyedSubscript:", v58, CFSTR("idToken"));

      ++_massageNotificationDataBeforePost_IdToken;
    }
  }
  v20 = v19;
LABEL_79:

  return v20;
}

uint64_t _notificationRequiresElementConversion(int a1)
{
  _BOOL4 v5;

  if (UIAccessibilityElementMovedNotification == a1
    || *MEMORY[0x1E0CEB0A8] == a1
    || *MEMORY[0x1E0CEB058] == a1
    || UIAccessibilityNativeFocusItemDidChangeWithContextNotification == a1)
  {
    return 1;
  }
  v5 = a1 == 1057;
  if (a1 == 1026)
    v5 = 1;
  return (a1 - 3032) < 2 || v5;
}

id _massageAssociatedElementBeforePost(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (v2)
  {
    v3 = v2;
    _axuiElementForNotificationData((uint64_t)v2, v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (id)*MEMORY[0x1E0CEB258];
  }
  return v4;
}

uint64_t _UIAccessibilityQueueNotification(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  if (_UIAccessibilityQueueNotification_onceToken != -1)
    dispatch_once(&_UIAccessibilityQueueNotification_onceToken, &__block_literal_global_209);
  objc_msgSend((id)_QueuedNotificationsLock, "lock");
  v2 = (void *)_QueuedNotifications;
  if (!_QueuedNotifications)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = (void *)_QueuedNotifications;
    _QueuedNotifications = (uint64_t)v3;

    v2 = (void *)_QueuedNotifications;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  return objc_msgSend((id)_QueuedNotificationsLock, "unlock");
}

uint64_t _UIAccessibilityIsNotificationQueued(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((id)_QueuedNotificationsLock, "lock");
  v2 = (void *)_QueuedNotifications;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  objc_msgSend((id)_QueuedNotificationsLock, "unlock");
  return v4;
}

void _UIAccessibilityBroadcastNotificationFunction(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  __CFString *v6;
  NSObject *v7;
  id v8;
  int v9;
  const __CFString *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  int v31;
  uint8_t buf[4];
  _BYTE v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AXRuntimeLogNotifications();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    v6 = (__CFString *)v3;
    if ((_DWORD)a1 == 1005 || (_DWORD)a1 == 1008 || (_DWORD)a1 == 1072 && (os_variant_has_internal_ui() & 1) == 0)
    {

      v6 = CFSTR("<Announcement data redacted>");
    }
    AXRuntimeLogNotifications();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412803;
      *(_QWORD *)v33 = &stru_1E3E01CE0;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = a1;
      *(_WORD *)&v33[14] = 2117;
      *(_QWORD *)&v33[16] = v6;
      _os_log_impl(&dword_19D0DD000, v7, OS_LOG_TYPE_INFO, "Attempting to send notification: %@ (%d) %{sensitive}@", buf, 0x1Cu);
    }

  }
  v8 = v3;
  v9 = *MEMORY[0x1E0CEB0A0];
  if (*MEMORY[0x1E0CEB078] == (_DWORD)a1 || v9 == (_DWORD)a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CEB060]) & 1) == 0)
    {
      v11 = CFSTR("pause");
      if (v9 == (_DWORD)a1)
        v11 = CFSTR("resume");
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You must pass the identifier of the assistive technology to %@.  See UIAccessibilityConstants.h for the list of valid values."), v11);
    }
  }

  if (_AXBlockAllNotifications == 1)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("notification"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("notificationData"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", _UIAXAssociatedElementContextForNextNotification, CFSTR("associatedObject"));
    objc_msgSend((id)_BlockNotificationsLock, "lock");
    objc_msgSend((id)_BlockedNotificationQueue, "addObject:", v12);
    objc_msgSend((id)_BlockNotificationsLock, "unlock");
    AXRuntimeLogNotifications();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109379;
      *(_DWORD *)v33 = a1;
      *(_WORD *)&v33[4] = 2117;
      *(_QWORD *)&v33[6] = v8;
      _os_log_impl(&dword_19D0DD000, v14, OS_LOG_TYPE_INFO, "Did not post. Blocking all notifications: %d (%{sensitive}@)", buf, 0x12u);
    }

    v15 = (void *)_UIAXAssociatedElementContextForNextNotification;
    _UIAXAssociatedElementContextForNextNotification = 0;
LABEL_42:

    goto LABEL_43;
  }
  if (_AXNextIgnoredNotification() == (_DWORD)a1)
  {
    _AXIgnoreNextNotification();
    AXRuntimeLogNotifications();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v33 = a1;
      v17 = "Did not post. Ignore next notification was set: %d";
LABEL_30:
      _os_log_impl(&dword_19D0DD000, v16, OS_LOG_TYPE_INFO, v17, buf, 8u);
    }
  }
  else
  {
    objc_msgSend((id)_BlockNotificationsLock, "lock");
    v18 = (void *)_BlockedNotifications;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v18, "containsObject:", v19);

    objc_msgSend((id)_BlockNotificationsLock, "unlock");
    if (!(_DWORD)v18)
    {
      v20 = (unint64_t)(id)_UIAXAssociatedElementContextForNextNotification;
      if (v20)
      {
        AXRuntimeLogNotifications();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v33 = v22;
          *(_WORD *)&v33[8] = 2048;
          *(_QWORD *)&v33[10] = v20;
          *(_WORD *)&v33[18] = 1024;
          *(_DWORD *)&v33[20] = a1;
          v23 = v22;
          _os_log_impl(&dword_19D0DD000, v21, OS_LOG_TYPE_INFO, "consuming associated object for notification: <%@: %p> %d", buf, 0x1Cu);

        }
      }
      v24 = (void *)_UIAXAssociatedElementContextForNextNotification;
      _UIAXAssociatedElementContextForNextNotification = 0;

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = ___UIAccessibilityBroadcastNotificationFunction_block_invoke;
      aBlock[3] = &unk_1E3DFF490;
      v31 = a1;
      v25 = (unint64_t)v8;
      v29 = (id)v25;
      v30 = (id)v20;
      v12 = (id)v20;
      v26 = _Block_copy(aBlock);
      v27 = v26;
      if ((_DWORD)a1 == 1021)
      {
        (*((void (**)(void *))v26 + 2))(v26);
      }
      else if (v25 | v20 || (_UIAccessibilityIsNotificationQueued(a1) & 1) == 0)
      {
        _UIAccessibilityQueueNotification(a1);
        AXPerformBlockOnMainThreadAfterDelay();
      }

      v15 = v29;
      goto LABEL_42;
    }
    AXRuntimeLogNotifications();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v33 = a1;
      v17 = "Did not post. Was among blocked notifications: %d";
      goto LABEL_30;
    }
  }

  v12 = (id)_UIAXAssociatedElementContextForNextNotification;
  _UIAXAssociatedElementContextForNextNotification = 0;
LABEL_43:

}

uint64_t _UIAccessibilityFocusedElements()
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    _AXAssert();
  return objc_msgSend((id)__UIAccessibilityFocusedElements, "allValues");
}

uint64_t _UIAccessibilityBlockPostingOfNotification(uint64_t a1)
{
  id v2;
  void *v3;

  if (_UIAccessibilityBlockPostingOfNotification_onceToken != -1)
    dispatch_once(&_UIAccessibilityBlockPostingOfNotification_onceToken, &__block_literal_global_6);
  objc_msgSend((id)_BlockNotificationsLock, "lock");
  if (!_BlockedNotifications)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = (void *)_BlockedNotifications;
    _BlockedNotifications = (uint64_t)v2;

  }
  _UIBlockNotificationsForNotification(a1);
  return objc_msgSend((id)_BlockNotificationsLock, "unlock");
}

void _UIBlockNotificationsForNotification(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  UINotificationsToBlockUnblockForNotification(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend((id)_BlockedNotifications, "addObject:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void _UIAccessibilityCompleteUnregistration(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    _AXAssert();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend((id)__UIAccessibilityFocusedElements, "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend((id)__UIAccessibilityFocusedElements, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == a1)
          objc_msgSend((id)__UIAccessibilityFocusedElements, "removeObjectForKey:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void _UIAXCleanupRotorCache(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)RotorCache, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend((id)RotorCache, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "targetElement");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == a1)
          objc_msgSend((id)RotorCache, "removeObjectForKey:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

id UINotificationsToBlockUnblockForNotification(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v1 = a1;
  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (*MEMORY[0x1E0CEB0A8] == v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", UIAccessibilityScreenWillChangeNotification);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  return v4;
}

id ApplicationElementRetrieval()
{
  return (id)*MEMORY[0x1E0CEB258];
}

id UIAXTimeStringForDuration(double a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld:%f"), (uint64_t)a1 / 3600, (uint64_t)a1 % 3600 / 60, a1 - (double)(3600 * ((uint64_t)a1 / 3600) + 60 * ((uint64_t)a1 % 3600 / 60)));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF4190]);

  return v2;
}

uint64_t _UIAXAppIsSystemAppServer()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityIsSystemAppServer");
}

uint64_t _UIAXAppIsReadyToBeProbed()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityIsAppReadyToBeProbed");
}

uint64_t _UIAXAppBundleIdentifier()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityBundleIdentifier");
}

uint64_t _UIAXIsApplicationAccessiblityReady()
{
  return _gUIAXIsApplicationAccessiblityReady;
}

void _UIAXPostAccessibilityLoadedNotification()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v1;
  uint8_t v2[16];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0CF43E0], 0, 0, 1u);
  AXLogLoading();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19D0DD000, v1, OS_LOG_TYPE_INFO, "Posted kAXAccessibilityLoaded notification", v2, 2u);
  }

}

void _UIAXInformSystemAppServerIsReady()
{
  uint64_t *v0;
  char v1;
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = (uint64_t *)MEMORY[0x1E0CEB258];
  v1 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySystemAppServerIsReady");
  AXLogLoading();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
  if ((v1 & 1) != 0)
  {
    if (v3)
    {
      v4 = *v0;
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_19D0DD000, v2, OS_LOG_TYPE_INFO, "System app server is ready: %@", (uint8_t *)&v6, 0xCu);
    }

    _UIAXPostAccessibilityLoadedNotification();
  }
  else
  {
    if (v3)
    {
      v5 = *v0;
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19D0DD000, v2, OS_LOG_TYPE_INFO, "System app server is not ready: %@, waiting", (uint8_t *)&v6, 0xCu);
    }

    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void _UIAXInformPreBoardIsReadyToBeProbed()
{
  if ((objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityIsAppReadyToBeProbed") & 1) != 0)
    _UIAXPostAccessibilityLoadedNotification();
  else
    AXPerformBlockOnMainThreadAfterDelay();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void AXServerCacheSetEnabled(int a1)
{
  uint64_t v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v1 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  v2 = (void *)AXServerCache;
  AXServerCache = v1;

}

void _AXServerCacheInsertPossiblyNilObjectForKey(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a1;
  v3 = a2;
  if (v5 && AXServerCache)
  {
    if (v3)
    {
      objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", v3, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", v4, v5);

    }
  }

}

BOOL _AXServerCacheGetPossiblyNilObjectForKey(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    if (v3 && AXServerCache)
    {
      objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "isEqual:", v7))
          v8 = 0;
        else
          v8 = v5;
        *a2 = objc_retainAutorelease(v8);

      }
      else
      {
        *a2 = 0;
      }

    }
    else
    {
      v6 = 0;
      *a2 = 0;
    }
  }
  else
  {
    AXLogAppAccessibility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      _AXServerCacheGetPossiblyNilObjectForKey_cold_1(v9);

    v6 = 0;
  }

  return v6;
}

void _UIAccessibilityStart()
{
  int IsSystemAppServer;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((_AccessibilityStarted & 1) == 0)
  {
    _AccessibilityStarted = 1;
    IsSystemAppServer = _UIAXAppIsSystemAppServer();
    CFRunLoopGetCurrent();
    if (IsSystemAppServer)
      v1 = _AXUIElementRegisterSystemWideServerWithRunLoop();
    else
      v1 = _AXUIElementRegisterServerWithRunLoop();
    v2 = v1;
    if ((_DWORD)v1)
    {
      AXLogAppAccessibility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        _UIAccessibilityStart_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    }
    _AXSetApplicationElementHandler();
    if (_UIAXInitializeConstantValues_onceToken != -1)
      dispatch_once(&_UIAXInitializeConstantValues_onceToken, &__block_literal_global_0);
    objc_msgSend(MEMORY[0x1E0CF39A0], "sharedInstance", 0x19D0E3EF4, 0x19D0E4190, _performActionCallback, _performActionWithValueCallback, 0x19D0E47C4, 0x19D0E570CLL, _copyMultipleAttributeValuesCallback, unk_1E3DFDD60, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIgnoreLogging:", _UIAXAutomationIgnoreLogging());

    AXLogAppAccessibility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v14 = _UIAXAppIsSystemAppServer();
      _os_log_impl(&dword_19D0DD000, v11, OS_LOG_TYPE_INFO, "Started AXRuntime server. SystemApp=%i", buf, 8u);
    }

    AXLogAppAccessibility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D0DD000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UIAccessibilityStart", (const char *)&unk_19D149A3A, buf, 2u);
    }

    MACaptionAppearanceSetDidDisplayCaptionsCallback();
  }
}

uint64_t _copyAttributeValueCallback(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  CFTypeRef v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = a1;
  v24 = a2;
  AXLogAppAccessibility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, &v23);

  AXLogAppAccessibility();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 134218496;
    v26 = v23;
    v27 = 2048;
    v28 = v24;
    v29 = 2048;
    v30 = a3;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyAttribute", "UID:[hash:%llu id:%llu] attr:%ld", buf, 0x20u);
  }

  if (!a4)
    return 4294942095;
  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode())
    return 4294942078;
  v10 = MEMORY[0x1A1ADC7C0](0);
  _AXElementForAXUIElementUniqueId();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && !objc_msgSend(v11, "_accessibilityElementShouldBeInvalid"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)AXServerCache;
    AXServerCache = v15;

    objc_msgSend(v12, "_iosAccessibilityAttributeValue:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIAXRuntimeConvertOutgoingParameterizedValue(a3, v17, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
      v18 = CFRetain(v13);
    else
      v18 = 0;
    *a4 = v18;
    v19 = (void *)AXServerCache;
    AXServerCache = 0;

    MEMORY[0x1A1ADC7A8](v10);
    AXLogAppAccessibility();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D0DD000, v21, OS_SIGNPOST_INTERVAL_END, v7, "AXCopyAttribute", (const char *)&unk_19D149A3A, buf, 2u);
    }

    v14 = 0;
  }
  else
  {
    MEMORY[0x1A1ADC7A8](v10);
    AXLogUIA();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl(&dword_19D0DD000, v13, OS_LOG_TYPE_INFO, "Returning invalid element for copy attribute: %@", buf, 0xCu);
    }
    v14 = 4294942094;
  }

  return v14;
}

uint64_t _setAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode())
    return 4294942078;
  v4 = MEMORY[0x1A1ADC7C0](0);
  _AXElementForAXUIElementUniqueId();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)AXServerCache;
    AXServerCache = v6;

    AXConvertIncomingValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_iosAccessibilitySetValue:forAttribute:", v8, a3);
    v9 = (void *)AXServerCache;
    AXServerCache = 0;

    MEMORY[0x1A1ADC7A8](v4);
    v10 = 0;
  }
  else
  {
    MEMORY[0x1A1ADC7A8](v4);
    AXLogUIA();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = 0;
      _os_log_impl(&dword_19D0DD000, v11, OS_LOG_TYPE_INFO, "Returning invalid element: for set attribute %@", (uint8_t *)&v13, 0xCu);
    }

    v10 = 4294942094;
  }

  return v10;
}

uint64_t _performActionCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = a1;
  v20 = a2;
  AXLogAppAccessibility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, &v19);

  AXLogAppAccessibility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 134218496;
    v22 = v19;
    v23 = 2048;
    v24 = v20;
    v25 = 2048;
    v26 = a3;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PerformAction", "UID:[hash:%llu id:%llu] action:%ld", buf, 0x20u);
  }

  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode())
    return 4294942078;
  v9 = MEMORY[0x1A1ADC7C0](0);
  _AXElementForAXUIElementUniqueId();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)AXServerCache;
    AXServerCache = v11;

    if (objc_msgSend(v10, "_iosAccessibilityPerformAction:withValue:fencePort:", a3, 0, 0))
      v13 = 0;
    else
      v13 = 4294942096;
    v14 = (void *)AXServerCache;
    AXServerCache = 0;

    MEMORY[0x1A1ADC7A8](v9);
    AXLogAppAccessibility();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D0DD000, v16, OS_SIGNPOST_INTERVAL_END, v5, "PerformAction", (const char *)&unk_19D149A3A, buf, 2u);
    }
  }
  else
  {
    MEMORY[0x1A1ADC7A8](v9);
    AXLogAppAccessibility();
    v17 = objc_claimAutoreleasedReturnValue();
    v16 = v17;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D0DD000, v16, OS_SIGNPOST_INTERVAL_END, v5, "PerformAction", (const char *)&unk_19D149A3A, buf, 2u);
    }
    v13 = 4294942094;
  }

  return v13;
}

uint64_t _performActionWithValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = a1;
  v26 = a2;
  AXLogAppAccessibility();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, &v25);

  AXLogAppAccessibility();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134218496;
    v28 = v25;
    v29 = 2048;
    v30 = v26;
    v31 = 2048;
    v32 = a3;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformActionWithValue", "UID:[hash:%llu id:%llu] action:%ld", buf, 0x20u);
  }

  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode())
    return 4294942078;
  v13 = MEMORY[0x1A1ADC7C0](0);
  _AXElementForAXUIElementUniqueId();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)AXServerCache;
    AXServerCache = v15;

    AXConvertIncomingValue();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "_iosAccessibilityPerformAction:withValue:fencePort:", a3, v17, a6);

    if (v18)
      v19 = 0;
    else
      v19 = 4294942096;
    v20 = (void *)AXServerCache;
    AXServerCache = 0;

    MEMORY[0x1A1ADC7A8](v13);
    AXLogAppAccessibility();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D0DD000, v22, OS_SIGNPOST_INTERVAL_END, v9, "PerformActionWithValue", (const char *)&unk_19D149A3A, buf, 2u);
    }
  }
  else
  {
    AXLogAppAccessibility();
    v23 = objc_claimAutoreleasedReturnValue();
    v22 = v23;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D0DD000, v22, OS_SIGNPOST_INTERVAL_END, v9, "PerformActionWithValue", (const char *)&unk_19D149A3A, buf, 2u);
    }
    v19 = 4294942094;
  }

  return v19;
}

uint64_t _copyElementAtPositionCallback(uint64_t a1, uint64_t a2, unsigned int a3, int a4, uint64_t *a5, float a6, float a7)
{
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  double v37;
  double v38;
  uint64_t GSEventRecord;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  unsigned __int8 isKindOfClass;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  _BOOL4 v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  void *v80;
  char v81;
  id v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  double v88;
  BOOL v89;
  void *v90;
  void *v91;
  uint64_t v92;
  int v93;
  NSObject *v94;
  id v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t j;
  void *v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  char v108;
  char v109;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  NSObject *v113;
  NSObject *v114;
  void *v115;
  id v117;
  void *v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  double v124;
  os_signpost_id_t spid;
  _QWORD v128[4];
  id v129;
  id v130;
  id v131;
  _BYTE *v132;
  double v133;
  double v134;
  _QWORD v135[4];
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint64_t v145;
  uint64_t v146;
  void (*v147)(uint64_t);
  void *v148;
  uint8_t *v149;
  uint8_t v150[8];
  uint8_t *v151;
  uint64_t v152;
  uint64_t (*v153)(uint64_t, uint64_t);
  void (*v154)(uint64_t);
  id v155;
  CFTypeRef cf;
  uint64_t ptr;
  uint64_t v158;
  uint8_t v159[4];
  id v160;
  __int16 v161;
  id v162;
  __int16 v163;
  id v164;
  _BYTE v165[128];
  uint8_t v166[128];
  _BYTE buf[24];
  double v168;
  __int128 v169;
  uint64_t v170;
  NSPoint v171;
  CGPoint v172;
  CGPoint v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;

  v170 = *MEMORY[0x1E0C80C00];
  ptr = a1;
  v158 = a2;
  AXLogAppAccessibility();
  v10 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_make_with_pointer(v10, &ptr);

  AXLogAppAccessibility();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)&buf[4] = ptr;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v158;
    *(_WORD *)&buf[22] = 2048;
    v168 = a6;
    LOWORD(v169) = 2048;
    *(double *)((char *)&v169 + 2) = a7;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CopyElementAtPosition", "UID:[hash:%llu id:%llu] Point:[%.2f %.2f]", buf, 0x2Au);
  }

  if (!_UIAXAppIsReadyToBeProbed())
    return 4294942078;
  v122 = MEMORY[0x1A1ADC7C0](0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)AXServerCache;
  AXServerCache = v13;

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v168 = COERCE_DOUBLE(__Block_byref_object_copy_);
  *(_QWORD *)&v169 = __Block_byref_object_dispose_;
  *((_QWORD *)&v169 + 1) = 0;
  cf = 0;
  v15 = (void *)UIAccessibilityCreateEventForSceneReferencePoint(&cf, a6, a7);
  v16 = v15;
  if (!v15)
  {
    v22 = 4294942096;
    goto LABEL_124;
  }
  objc_msgSend(v15, "_setAccessibilityHitTestType:", a3);
  GSEventGetLocationInWindow();
  v19 = v17;
  v20 = v18;
  if (a4)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "_findWithDisplayPoint:", v17, v18);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  *(_QWORD *)v150 = 0;
  v151 = v150;
  v152 = 0x3032000000;
  v153 = __Block_byref_object_copy_;
  v154 = __Block_byref_object_dispose_;
  v155 = 0;
  v145 = MEMORY[0x1E0C809B0];
  v121 = 3221225472;
  v146 = 3221225472;
  v147 = ___copyElementAtPositionCallback_block_invoke;
  v148 = &unk_1E3DFDD78;
  v149 = v150;
  AXPerformSafeBlock();
  if (a4 && !v21)
  {
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v23 = *((id *)v151 + 5);
    v24 = 0;
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v141, v166, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v142;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v142 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
          if (objc_msgSend(v28, "_accessibilityContextId", v121) == a4 && v24 == 0)
            v24 = v28;
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v141, v166, 16);
      }
      while (v25);
    }

    v21 = v24;
  }
  if (!v21 && v158 == 9999)
  {
    _AXElementForAXUIElementUniqueId();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v30, "accessibilityElements");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_accessibilityWindow");
      v21 = (id)objc_claimAutoreleasedReturnValue();

      AXLogUIA();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v159 = 138412546;
        v160 = v30;
        v161 = 2112;
        v162 = v21;
        _os_log_impl(&dword_19D0DD000, v33, OS_LOG_TYPE_INFO, "Incoming remote element hit test -> %@/%@", v159, 0x16u);
      }

    }
    else
    {
      v21 = 0;
    }

  }
  if (_copyElementAtPositionCallback_onceToken == -1)
  {
    if (v21)
      goto LABEL_37;
  }
  else
  {
    dispatch_once(&_copyElementAtPositionCallback_onceToken, &__block_literal_global_183);
    if (v21)
    {
LABEL_37:
      if ((objc_msgSend(v21, "accessibilityElementsHidden", v121) & 1) == 0
        && ((objc_msgSend(v21, "isUserInteractionEnabled") & 1) != 0
         || objc_msgSend(v21, "_accessibilityIsUserInteractionEnabled"))
        && (objc_opt_isKindOfClass() & 1) == 0)
      {
        goto LABEL_46;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CEAC18], "_findWithDisplayPoint:", v19, v20, v121);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v34, "accessibilityElementsHidden"))
  {
    AXLogUIA();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v159 = 138412290;
      v160 = v34;
      _os_log_impl(&dword_19D0DD000, v35, OS_LOG_TYPE_INFO, "Window is marked accessibilityHidden: %@", v159, 0xCu);
    }

    v21 = 0;
  }
  else
  {
    v21 = v34;
  }
LABEL_46:
  AXLogUIA();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v159 = 138412290;
    v160 = v21;
    _os_log_impl(&dword_19D0DD000, v36, OS_LOG_TYPE_INFO, "Hit testing with window: %@", v159, 0xCu);
  }

  v37 = AXConvertFromDisplayPointToWindowPoint(v21, v19, v20);
  v123 = v38;
  v124 = v37;
  GSEventRecord = _GSEventGetGSEventRecord();
  *(double *)(GSEventRecord + 8) = v19;
  *(double *)(GSEventRecord + 16) = v20;
  *(_OWORD *)(GSEventRecord + 24) = *(_OWORD *)(GSEventRecord + 8);
  objc_msgSend(v21, "screen");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "_gsEvent"))
  {
    v41 = _GSEventGetGSEventRecord();
    *(double *)(v41 + 8) = v19;
    *(double *)(v41 + 16) = v20;
  }

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "_isClassic");

  if (v43)
  {
    *(double *)(GSEventRecord + 8) = v124;
    *(double *)(GSEventRecord + 16) = v123;
    *(double *)(GSEventRecord + 24) = v124;
    *(double *)(GSEventRecord + 32) = v123;
  }
  objc_msgSend(v21, "windowScene");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "statusBarManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "statusBarFrame");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;

  if (NSClassFromString(CFSTR("SBWindowSceneStatusBarManager")))
  {
    objc_msgSend(v21, "windowScene");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "statusBarManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & (v53 == 0.0)) != 0)
    {
      objc_msgSend(v21, "windowScene");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "statusBarManager");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "safeUIViewForKey:", CFSTR("statusBar"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "frame");
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v67 = v66;

      v174.origin.x = v61;
      v174.origin.y = v63;
      v174.size.width = v65;
      v174.size.height = v67;
      if (!CGRectIsNull(v174))
      {
        v47 = v61;
        v49 = v63;
        v51 = v65;
        v53 = v67;
      }
    }
  }
  if ((objc_msgSend(v21, "_accessibilityIgnoresStatusBarFrame") & 1) != 0)
  {
    v68 = 0;
  }
  else
  {
    objc_msgSend(v21, "windowScene");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "statusBarManager");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v70, "isStatusBarHidden") & 1) != 0)
    {
      v68 = 0;
    }
    else
    {
      v175.origin.x = v47;
      v175.origin.y = v49;
      v175.size.width = v51;
      v175.size.height = v53;
      v173.y = v123;
      v173.x = v124;
      v68 = CGRectContainsPoint(v175, v173);
    }

  }
  if (AXProcessIsSpringBoard())
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityShouldHitTestStatusBarWindow")
      && (objc_msgSend(v21, "_accessibilityIsInWidgetStack") & 1) == 0)
    {
      v93 = objc_msgSend(v21, "_accessibilityIsInJindo");
      v71 = v21;
      if (((!v68 | v93) & 1) == 0)
      {
        AXLogHitTest();
        v94 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
        {
          v172.y = v123;
          v172.x = v124;
          NSStringFromCGPoint(v172);
          v117 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "windowScene");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "statusBarManager");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "statusBarFrame");
          NSStringFromCGRect(v176);
          v120 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v159 = 138412546;
          v160 = v117;
          v161 = 2112;
          v162 = v120;
          _os_log_debug_impl(&dword_19D0DD000, v94, OS_LOG_TYPE_DEBUG, "Hit test was in the status bar frame, point: %@. Status bar frame: %@", v159, 0x16u);

        }
        v139 = 0u;
        v140 = 0u;
        v138 = 0u;
        v137 = 0u;
        v95 = *((id *)v151 + 5);
        v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v137, v165, 16);
        v97 = v71;
        if (v96)
        {
          v98 = *(_QWORD *)v138;
          v97 = v71;
          do
          {
            for (j = 0; j != v96; ++j)
            {
              if (*(_QWORD *)v138 != v98)
                objc_enumerationMutation(v95);
              v100 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * j);
              if (objc_msgSend(v100, "_isStatusBarWindow"))
              {
                v101 = v100;

                v97 = v101;
              }
            }
            v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v137, v165, 16);
          }
          while (v96);
        }

        v102 = v97;
        v71 = v102;
      }
    }
    else
    {
      v71 = v21;
    }
  }
  else
  {
    v71 = v21;
    if (v68)
      goto LABEL_104;
  }
  objc_msgSend(v71, "_accessibilityHitTest:withEvent:", v16, v124, v123);
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v72;

  AXLogUIA();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    UIAXMassageElementDescription(*(void **)(*(_QWORD *)&buf[8] + 40));
    v75 = (id)objc_claimAutoreleasedReturnValue();
    v171.y = v123;
    v171.x = v124;
    NSStringFromPoint(v171);
    v76 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v159 = 138412802;
    v160 = v75;
    v161 = 2112;
    v162 = v71;
    v163 = 2112;
    v164 = v76;
    _os_log_impl(&dword_19D0DD000, v74, OS_LOG_TYPE_INFO, "Hit testing found: %@ with window: %@ > %@", v159, 0x20u);

  }
  if (a3 == 2 && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    objc_msgSend(v71, "hitTest:withEvent:", v16, v124, v123);
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v77;

    AXLogUIA();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      v80 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v159 = 138412546;
      v160 = v71;
      v161 = 2112;
      v162 = v80;
      _os_log_impl(&dword_19D0DD000, v79, OS_LOG_TYPE_INFO, "Is visible query using real hit test: %@ %@", v159, 0x16u);
    }

  }
  if (v71)
    v81 = v68;
  else
    v81 = 1;
  if ((v81 & 1) == 0)
  {
    v82 = *(id *)(*(_QWORD *)&buf[8] + 40);
    if (!v82 || a3 != 2 && v71 == v82)
    {
      if (objc_msgSend(v71, "accessibilityViewIsModal"))
      {
        objc_msgSend(v71, "windowLevel");
        if (v83 > *MEMORY[0x1E0CEBB18])
        {
          objc_msgSend(v71, "windowLevel");
          v85 = v84;
          objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "window");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "windowLevel");
          v89 = v85 > v88;

          if (v89)
          {
            v90 = 0;
LABEL_103:
            v135[0] = MEMORY[0x1E0C809B0];
            v135[1] = v121;
            v135[2] = ___copyElementAtPositionCallback_block_invoke_2;
            v135[3] = &unk_1E3DFDE00;
            v103 = v71;
            v136 = v103;
            objc_msgSend(v90, "axFilterObjectsUsingBlock:", v135);
            v104 = (void *)objc_claimAutoreleasedReturnValue();

            v128[0] = MEMORY[0x1E0C809B0];
            v128[1] = v121;
            v128[2] = ___copyElementAtPositionCallback_block_invoke_3;
            v128[3] = &unk_1E3DFDE28;
            v129 = v103;
            v71 = v129;
            v133 = v124;
            v134 = v123;
            v130 = v71;
            v132 = buf;
            v131 = v16;
            objc_msgSend(v104, "enumerateObjectsUsingBlock:", v128);

            goto LABEL_104;
          }
        }
        AXUIAllKeyboardWindows();
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v91, "containsObject:", v71))
        {

          v91 = 0;
        }
        objc_msgSend(0, "arrayByAddingObjectsFromArray:", v91);
        v92 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "sortedArrayUsingComparator:", &__block_literal_global_194);
        v92 = objc_claimAutoreleasedReturnValue();
      }
      v90 = (void *)v92;

      goto LABEL_103;
    }
  }
LABEL_104:
  v105 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (a3 == 3)
  {
    objc_msgSend(v105, "_accessibilityScrollParent");
    v106 = objc_claimAutoreleasedReturnValue();
LABEL_106:
    v107 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v106;

    goto LABEL_114;
  }
  if ((objc_msgSend(v105, "isAccessibilityElement") & 1) == 0)
  {
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v108 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_accessibilityIsTouchContainer");
        v109 = a3 == 2 ? 1 : v108;
        if ((v109 & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_accessibilityTouchContainer");
          v106 = objc_claimAutoreleasedReturnValue();
          goto LABEL_106;
        }
      }
    }
  }
LABEL_114:
  CFRelease(cf);
  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    AXLogUIA();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v159 = 0;
      _os_log_impl(&dword_19D0DD000, v111, OS_LOG_TYPE_INFO, "Returning invalid element for copy element at position", v159, 2u);
    }
    goto LABEL_122;
  }
  v110 = _AXCreateAXUIElementWithElement();
  if (!v110)
  {
    AXLogUIA();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
    {
      v112 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v159 = 138412290;
      v160 = v112;
      _os_log_impl(&dword_19D0DD000, v111, OS_LOG_TYPE_INFO, "Returning invalid element in copy element for position: %@", v159, 0xCu);
    }
LABEL_122:

    v22 = 4294942094;
    goto LABEL_123;
  }
  v22 = 0;
  *a5 = v110;
LABEL_123:

  _Block_object_dispose(v150, 8);
LABEL_124:
  AXLogAppAccessibility();
  v113 = objc_claimAutoreleasedReturnValue();
  v114 = v113;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v113))
  {
    *(_WORD *)v150 = 0;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v114, OS_SIGNPOST_INTERVAL_END, spid, "CopyElementAtPosition", (const char *)&unk_19D149A3A, v150, 2u);
  }

  v115 = (void *)AXServerCache;
  AXServerCache = 0;

  MEMORY[0x1A1ADC7A8](v122);
  _Block_object_dispose(buf, 8);

  return v22;
}

void sub_19D0E565C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  uint64_t v53;

  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t _copyParameterizedAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = a1;
  v26 = a2;
  AXLogAppAccessibility();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, &v25);

  AXLogAppAccessibility();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134218496;
    v28 = v25;
    v29 = 2048;
    v30 = v26;
    v31 = 2048;
    v32 = a3;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CopyParameterizedAttribute", "UID:[hash:%llu id:%llu] attr:%ld", buf, 0x20u);
  }

  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode())
    return 4294942078;
  v11 = MEMORY[0x1A1ADC7C0](0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)AXServerCache;
  AXServerCache = v12;

  if (a5)
  {
    AXConvertIncomingValue();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      _AXElementForAXUIElementUniqueId();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "_iosAccessibilityAttributeValue:forParameter:", a3, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        UIAXRuntimeConvertOutgoingParameterizedValue(a3, v17, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
          v18 = (void *)CFRetain(v18);
        *a5 = v18;

        v20 = 0;
      }
      else
      {
        *a5 = 0;
        v20 = 4294942094;
      }

    }
    else
    {
      *a5 = 0;
      v20 = 4294942095;
    }

  }
  else
  {
    v20 = 4294942095;
  }
  v21 = (void *)AXServerCache;
  AXServerCache = 0;

  MEMORY[0x1A1ADC7A8](v11);
  AXLogAppAccessibility();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v23, OS_SIGNPOST_INTERVAL_END, v8, "CopyParameterizedAttribute", (const char *)&unk_19D149A3A, buf, 2u);
  }

  return v20;
}

uint64_t _copyMultipleAttributeValuesCallback(void *a1, uint64_t a2, const __CFArray *a3, uint64_t a4, __CFArray **a5)
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  CFIndex Count;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  CFIndex v22;
  uint64_t v23;
  __CFArray *Mutable;
  CFIndex i;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  AXValueRef v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v35;
  __CFArray **v36;
  os_signpost_id_t v37;
  void *ptr;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  CFIndex v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  ptr = a1;
  v39 = a2;
  AXLogAppAccessibility();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, &ptr);

  AXLogAppAccessibility();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = ptr;
    v13 = v39;
    Count = CFArrayGetCount(a3);
    *(_DWORD *)buf = 134218496;
    v41 = v12;
    v42 = 2048;
    v43 = v13;
    v44 = 2048;
    v45 = Count;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CopyMultiAttribute", "UID:[hash:%llu id:%llu] attrCount:%ld", buf, 0x20u);
  }

  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode())
    return 4294942078;
  v15 = MEMORY[0x1A1ADC7C0](0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)AXServerCache;
  AXServerCache = v16;

  if (a3)
  {
    _AXElementForAXUIElementUniqueId();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && !objc_msgSend(v18, "_accessibilityElementShouldBeInvalid"))
    {
      v22 = CFArrayGetCount(a3);
      if (v22)
      {
        v23 = v22;
        v35 = v15;
        v36 = a5;
        v37 = v8;
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v22, MEMORY[0x1E0C9B378]);
        if (v23 >= 1)
        {
          for (i = 0; i != v23; ++i)
          {
            v26 = (void *)MEMORY[0x1A1ADCDB4]();
            v27 = objc_msgSend((id)CFArrayGetValueAtIndex(a3, i), "unsignedIntValue");
            objc_msgSend(v19, "_iosAccessibilityAttributeValue:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            UIAXRuntimeConvertOutgoingParameterizedValue(v27, v28, 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              CFArraySetValueAtIndex(Mutable, i, v29);
            }
            else
            {
              *(_DWORD *)buf = -25205;
              v30 = AXValueCreate(kAXValueTypeAXError, buf);
              CFArraySetValueAtIndex(Mutable, i, v30);
              CFRelease(v30);
            }

            objc_autoreleasePoolPop(v26);
          }
        }
        v21 = 0;
        v15 = v35;
        *v36 = Mutable;
        v8 = v37;
      }
      else
      {
        v21 = 4294942095;
      }
    }
    else
    {
      AXLogUIA();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v19;
        _os_log_impl(&dword_19D0DD000, v20, OS_LOG_TYPE_INFO, "Returning invalid element for copy multiple attribute: %@", buf, 0xCu);
      }

      v21 = 4294942094;
    }

  }
  else
  {
    v21 = 4294942095;
  }
  v31 = (void *)AXServerCache;
  AXServerCache = 0;

  MEMORY[0x1A1ADC7A8](v15);
  AXLogAppAccessibility();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v33, OS_SIGNPOST_INTERVAL_END, v8, "CopyMultiAttribute", (const char *)&unk_19D149A3A, buf, 2u);
  }

  return v21;
}

void _UIAXInitializeConstantValues()
{
  if (_UIAXInitializeConstantValues_onceToken != -1)
    dispatch_once(&_UIAXInitializeConstantValues_onceToken, &__block_literal_global_0);
}

void _accessibilityCaptionsDidDisplay(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *MEMORY[0x1E0CF4448];
    v5[0] = a1;
    v1 = (void *)MEMORY[0x1E0C99D80];
    v2 = a1;
    objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(0x42Cu, v3);
  }
}

void _UIAccessibilityStop()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v11[16];

  if (_AccessibilityStarted == 1)
  {
    _AccessibilityStarted = 0;
    v0 = _AXUIElementUnregisterServer();
    if ((_DWORD)v0)
    {
      v1 = v0;
      AXLogAppAccessibility();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        _UIAccessibilityStop_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

    }
    AXLogAppAccessibility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D0DD000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UIAccessibilityStop", (const char *)&unk_19D149A3A, v11, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)1, (CFNotificationName)*MEMORY[0x1E0DDE308], 0);
  }
}

uint64_t _UIAccessibilitySetDisplayPointForEvent(void *a1, double a2, double a3)
{
  uint64_t result;

  result = objc_msgSend(a1, "_gsEvent");
  if (result)
  {
    result = _GSEventGetGSEventRecord();
    *(double *)(result + 8) = a2;
    *(double *)(result + 16) = a3;
  }
  return result;
}

double AXConvertFromDisplayPointToWindowPoint(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;

  v5 = a1;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_FBSScene");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_FBSScene");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 != v8)
    {
      if (v8)
      {
        objc_msgSend(v8, "settings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "frame");
        v14 = v13;
        v16 = v15;
        objc_msgSend(v12, "interfaceOrientation");
        _UIConvertPointFromOrientationToOrientation();
        a2 = v14 + v17;
        a3 = v16 + v18;

      }
      if (v11)
      {
        objc_msgSend(v11, "settings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        objc_msgSend(v19, "interfaceOrientation");
        _UIConvertPointFromOrientationToOrientation();
        a2 = v20;
        a3 = v21;

      }
    }
    objc_msgSend(v9, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertPoint:fromLayer:", 0, a2, a3);
    a2 = v23;

  }
  return a2;
}

id UIAccessibilityWindowForContextId(int a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __UIAccessibilityWindowForContextId_block_invoke;
  v16 = &unk_1E3DFDD78;
  v17 = &v18;
  AXPerformSafeBlock();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)v19[5];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v24, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "_accessibilityContextId", (_QWORD)v9) == a1)
        {
          v7 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v24, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  _Block_object_dispose(&v18, 8);
  return v7;
}

void sub_19D0E6834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id AXConvertOutgoingParameterizedValueByFindingLeafDescendant(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unsigned __int16 v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  v5 = 1;
  if (a1 > 3071)
  {
    if (a1 <= 92599)
    {
      if (a1 == 3072)
        goto LABEL_18;
      v6 = 26975;
    }
    else
    {
      if (a1 == 92600 || a1 == 95234)
        goto LABEL_18;
      v6 = 29714;
    }
    if (a1 == (v6 | 0x10000))
      goto LABEL_18;
  }
  else if (a1 <= 2999)
  {
    if (a1 == 2013 || a1 == 2026 || a1 == 2231)
      goto LABEL_18;
  }
  else if ((unint64_t)(a1 - 3000) <= 0x32)
  {
    if (((1 << (a1 + 72)) & 0x4000000810203) != 0)
    {
LABEL_18:
      _accessibleElementFromElement(v3, v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
      return v4;
    }
    if (a1 == 3006)
    {
      v5 = 10;
      goto LABEL_18;
    }
  }
  return v4;
}

uint64_t AXContextIdForPoint(uint64_t a1, double a2, double a3)
{
  AXValueRef v4;
  const __AXUIElement *SystemWide;
  void *v6;
  AXError v7;
  CFTypeRef v8;
  BOOL v9;
  uint64_t v10;
  CFTypeID v11;
  CFTypeRef cf;
  _QWORD valuePtr[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  *(double *)valuePtr = a2;
  *(double *)&valuePtr[1] = a3;
  cf = 0;
  v4 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  SystemWide = AXUIElementCreateSystemWide();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v7 = AXUIElementCopyParameterizedAttributeValue(SystemWide, (CFStringRef)0x16573, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2), &cf);

  if (SystemWide)
    CFRelease(SystemWide);
  if (v4)
    CFRelease(v4);
  v8 = cf;
  if (v7)
    v9 = 1;
  else
    v9 = cf == 0;
  if (v9)
  {
    v10 = 0;
    if (!cf)
      return v10;
    goto LABEL_16;
  }
  v11 = CFGetTypeID(cf);
  if (v11 == CFNumberGetTypeID())
    v10 = objc_msgSend((id)cf, "unsignedIntValue");
  else
    v10 = 0;
  v8 = cf;
  if (cf)
LABEL_16:
    CFRelease(v8);
  return v10;
}

id UIAXRuntimeConvertOutgoingValue(uint64_t a1, void *a2)
{
  return UIAXRuntimeConvertOutgoingParameterizedValue(a1, a2, 0);
}

id UIAXRuntimeConvertOutgoingParameterizedValue(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (_AXSAutomationLocalizedStringLookupInfoEnabled() || _AXSAutomationPreferredLocalization())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "_accessibilityAttributedLocalizedString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = v7;

          v5 = v9;
        }

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __UIAXRuntimeConvertOutgoingParameterizedValue_block_invoke;
      v13[3] = &unk_1E3DFDE50;
      v14 = v5;
      objc_msgSend(v14, "enumerateAttributesUsingBlock:", v13);

    }
    AXConvertOutgoingParameterizedValueByFindingLeafDescendant(a1, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXConvertOutgoingValue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void ___copyElementAtPositionCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

Class ___copyElementAtPositionCallback_block_invoke_182()
{
  Class result;

  result = NSClassFromString(CFSTR("_UIBackgroundHitTestWindow"));
  _copyElementAtPositionCallback_backgroundHitTestWindowClass = (uint64_t)result;
  return result;
}

uint64_t ___copyElementAtPositionCallback_block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a2;
  objc_msgSend(a3, "windowLevel");
  v6 = v5;
  objc_msgSend(v4, "windowLevel");
  v8 = v7;

  v9 = -1;
  if (v6 >= v8)
    v9 = 1;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

BOOL ___copyElementAtPositionCallback_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == v6;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void ___copyElementAtPositionCallback_block_invoke_3(double *a1, void *a2, uint64_t a3, char *a4)
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  BOOL v15;
  char v16;

  v6 = (void *)*((_QWORD *)a1 + 4);
  v7 = (void *)*((_QWORD *)a1 + 5);
  v8 = a1[8];
  v9 = a1[9];
  v10 = a2;
  objc_msgSend(v7, "convertPoint:toView:", v6, v8, v9);
  objc_msgSend(v6, "convertPoint:toWindow:", v10);
  objc_msgSend(v10, "_accessibilityHitTest:withEvent:", *((_QWORD *)a1 + 6));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*((_QWORD *)a1 + 7) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(id *)(*(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 40);
  if (v14)
    v15 = v14 == v10;
  else
    v15 = 1;
  v16 = !v15;
  *a4 = v16;
}

id _accessibleElementFromElement(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  CFTypeID v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (!v3)
    goto LABEL_28;
  v5 = CFGetTypeID(v3);
  if (v5 != AXUIElementGetTypeID())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v7);
            _accessibleElementFromElement(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), a2);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v6, "addObjectsFromArray:", v12);
            }
            else if (v12)
            {
              objc_msgSend(v6, "addObject:", v12);
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v9);
      }
      goto LABEL_34;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_accessibilityLeafDescendantsWithCount:options:", (int)a2, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v23 != v17)
                objc_enumerationMutation(v14);
              v19 = (void *)_AXCreateAXUIElementWithElement();
              objc_msgSend(v6, "axSafelyAddObject:", v19, v22);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v16);
        }

        if (objc_msgSend(v6, "count") == 1)
        {
          objc_msgSend(v6, "firstObject");
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_32:

          v6 = (id)v20;
          goto LABEL_33;
        }
        if (!objc_msgSend(v6, "count"))
        {
          v20 = 0;
          goto LABEL_32;
        }
      }
      else
      {
        v6 = 0;
      }
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
LABEL_28:
    v6 = 0;
    goto LABEL_35;
  }
  v6 = v4;
LABEL_35:

  return v6;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void AXApplyAttributedLocalizedStringToCopy(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a1, "_accessibilityAttributedLocalizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copyWithZone:", 0);
    objc_msgSend(v6, "_setAccessibilityAttributedLocalizedString:", v5);

  }
}

id _UIAXCCFindAncestorContentModuleContainerViewController(void *a1)
{
  id v1;
  Class v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v1 = a1;
  v2 = NSClassFromString(CFSTR("CCUIContentModuleContainerViewController"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___UIAXCCFindAncestorContentModuleContainerViewController_block_invoke;
  v6[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v6[4] = v2;
  objc_msgSend(v1, "_accessibilityFindAncestor:startWithSelf:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction(void *a1, char a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v16[4];
  id v17;

  v3 = a1;
  if ((a2 & 1) != 0)
    goto LABEL_11;
  NSProtocolFromString(CFSTR("CCUIContentModuleContentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction_block_invoke;
  v16[3] = &unk_1E3DFDE98;
  v5 = v4;
  v17 = v5;
  objc_msgSend(v3, "_accessibilityFindAncestor:startWithSelf:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "_accessibilityViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "safeBoolForKey:", CFSTR("_accessibilityControlCenterShouldExpandContentModule"));

    v11 = 0;
    goto LABEL_10;
  }
  if (v6)
  {
    objc_msgSend(v6, "_accessibilityViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "_accessibilityViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "safeBoolForKey:", CFSTR("shouldBeginTransitionToExpandedContentModule"));

      if (!v14)
      {
        v11 = 0;
        v10 = 0;
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  v10 = 0;
  v11 = 1;
LABEL_10:

  if (v11)
LABEL_11:
    v10 = UIAccessibilityControlCenterModuleIsExpanded(v3) ^ 1;

  return v10;
}

uint64_t UIAccessibilityControlCenterModuleIsExpanded(void *a1)
{
  void *v1;
  uint64_t v2;

  _UIAXCCFindAncestorContentModuleContainerViewController(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safeBoolForKey:", CFSTR("isExpanded"));

  return v2;
}

id UIAccessibilityControlCenterOpenModuleCustomAction(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  v1 = a1;
  objc_initWeak(&location, v1);
  v2 = objc_alloc(MEMORY[0x1E0CEA280]);
  UIKitAccessibilityLocalizedString(CFSTR("controlcenter.open.module.custom.action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __UIAccessibilityControlCenterOpenModuleCustomAction_block_invoke;
  v6[3] = &unk_1E3DFDEE8;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_msgSend(v2, "initWithName:actionHandler:", v3, v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

void sub_19D0E88F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D0E89E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id UIAccessibilityControlCenterCloseModuleCustomAction(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  v1 = a1;
  objc_initWeak(&location, v1);
  v2 = objc_alloc(MEMORY[0x1E0CEA280]);
  UIKitAccessibilityLocalizedString(CFSTR("controlcenter.close.module.custom.action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __UIAccessibilityControlCenterCloseModuleCustomAction_block_invoke;
  v6[3] = &unk_1E3DFDEE8;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_msgSend(v2, "initWithName:actionHandler:", v3, v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

void sub_19D0E8B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D0E8BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded(void *a1, void *a2, char a3)
{
  id v5;
  int ShouldIncludeOpenModuleAction;
  int IsExpanded;
  void *v8;
  void *v9;
  id v10;

  v10 = a1;
  v5 = a2;
  ShouldIncludeOpenModuleAction = UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction(v10, a3);
  IsExpanded = UIAccessibilityControlCenterModuleIsExpanded(v10);
  if (ShouldIncludeOpenModuleAction)
  {
    objc_msgSend(v10, "_accessibilityValueForKey:", CFSTR("openModuleAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      UIAccessibilityControlCenterOpenModuleCustomAction(v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_accessibilitySetRetainedValue:forKey:", v8, CFSTR("openModuleAction"));
    }
    if ((objc_msgSend(v5, "containsObject:", v8) & 1) == 0)
      objc_msgSend(v5, "axSafelyAddObject:", v8);

  }
  if (IsExpanded)
  {
    objc_msgSend(v10, "_accessibilityValueForKey:", CFSTR("closeModuleAction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      UIAccessibilityControlCenterCloseModuleCustomAction(v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("closeModuleAction"));
    }
    if ((objc_msgSend(v5, "containsObject:", v9) & 1) == 0)
      objc_msgSend(v5, "axSafelyAddObject:", v9);

  }
}

id UIAccessibilityControlCenterModuleExpandPlatterHint()
{
  return UIKitAccessibilityLocalizedString(CFSTR("control.center.expand.platter.hint"));
}

void sub_19D0E94F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UIAccessibilityCustomActionLaunchAppFloatImage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/CoreServices/AssistiveTouch.app"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("SCATIcon_floatApp_launchFloatFromDock"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _UIAccessibilityCustomActionLaunchAppPinLeftImage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/CoreServices/AssistiveTouch.app"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("SCATIcon_floatApp_launchPinFromDockLeft"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _UIAccessibilityCustomActionLaunchAppPinRightImage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/CoreServices/AssistiveTouch.app"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("SCATIcon_floatApp_launchPinFromDockRight"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _UIAccessibilityCustomActionDeleteImage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/CoreServices/AssistiveTouch.app"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("SCATIcon_action_delete"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _UIAccessibilityCustomActionMoreImage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/CoreServices/AssistiveTouch.app"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("SCATIcon_action_more"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_19D0EA84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19D0EB670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0EBCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_19D0EE938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_19D0F0DA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_19D0F2310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id axAuditSwizzlePreferredContentSizeCategory1()
{
  if (_axFontSizeToReturn)
    return (id)_axFontSizeToReturn;
  else
    return (id)*MEMORY[0x1E0CEB428];
}

id axAuditSwizzlePreferredContentSizeCategory2()
{
  if (_axFontSizeToReturn)
    return (id)_axFontSizeToReturn;
  else
    return (id)*MEMORY[0x1E0CEB428];
}

void sub_19D0F5184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_GCGamepadEventImplClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_GCGamepadEventImplClass_softClass;
  v7 = get_GCGamepadEventImplClass_softClass;
  if (!get_GCGamepadEventImplClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __get_GCGamepadEventImplClass_block_invoke;
    v3[3] = &unk_1E3DFDD78;
    v3[4] = &v4;
    __get_GCGamepadEventImplClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19D0F551C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getGCExtendedGamepadClass_block_invoke(uint64_t a1)
{
  Class result;

  GameControllerLibrary();
  result = objc_getClass("GCExtendedGamepad");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getGCExtendedGamepadClass_block_invoke_cold_1();
  getGCExtendedGamepadClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t GameControllerLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!GameControllerLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E3DFE370;
    v3 = 0;
    GameControllerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!GameControllerLibraryCore_frameworkLibrary)
    GameControllerLibrary_cold_1(&v1);
  return GameControllerLibraryCore_frameworkLibrary;
}

Class __getGCControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  GameControllerLibrary();
  result = objc_getClass("GCController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getGCControllerClass_block_invoke_cold_1();
  getGCControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id UIAXMassageElementDescription(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  NSClassFromString(CFSTR("ICTK2TextView"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), v1);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "description");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v2;

  return v3;
}

void sub_19D0F7DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0F7F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0F8104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_19D0F83C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0F85E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _switchControlNegatesPerformEscapeAnswer(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (_AXSAssistiveTouchScannerEnabled())
  {
    v2 = 0;
  }
  else
  {
    if (_switchControlNegatesPerformEscapeAnswer_onceToken != -1)
      dispatch_once(&_switchControlNegatesPerformEscapeAnswer_onceToken, &__block_literal_global_251_0);
    v2 = objc_msgSend((id)_switchControlNegatesPerformEscapeAnswer_DisregardClasses, "containsObject:", objc_opt_class());
  }

  return v2;
}

uint64_t ___switchControlNegatesPerformEscapeAnswer_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_switchControlNegatesPerformEscapeAnswer_DisregardClasses;
  _switchControlNegatesPerformEscapeAnswer_DisregardClasses = (uint64_t)v0;

  objc_msgSend((id)_switchControlNegatesPerformEscapeAnswer_DisregardClasses, "axSafelyAddObject:", NSClassFromString(CFSTR("UINavigationBar")));
  objc_msgSend((id)_switchControlNegatesPerformEscapeAnswer_DisregardClasses, "axSafelyAddObject:", NSClassFromString(CFSTR("UINavigationButton")));
  return objc_msgSend((id)_switchControlNegatesPerformEscapeAnswer_DisregardClasses, "axSafelyAddObject:", NSClassFromString(CFSTR("UIKeyboardLayoutStar")));
}

void sub_19D0F88EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19D0F8F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0F947C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19D0F9A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19D0F9BBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19D0FA0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0FA8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0FBA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0FBC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0FBF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0FC784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D0FD43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0FFCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D0FFE4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLGRRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLGRRequestClass_softClass;
  v7 = getLGRRequestClass_softClass;
  if (!getLGRRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLGRRequestClass_block_invoke;
    v3[3] = &unk_1E3DFDD78;
    v3[4] = &v4;
    __getLGRRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19D105544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLGRRuntimeManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLGRRuntimeManagerClass_softClass;
  v7 = getLGRRuntimeManagerClass_softClass;
  if (!getLGRRuntimeManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLGRRuntimeManagerClass_block_invoke;
    v3[3] = &unk_1E3DFDD78;
    v3[4] = &v4;
    __getLGRRuntimeManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19D1055FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getTinkerRuntimeClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getTinkerRuntimeClass_softClass;
  v7 = getTinkerRuntimeClass_softClass;
  if (!getTinkerRuntimeClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getTinkerRuntimeClass_block_invoke;
    v3[3] = &unk_1E3DFDD78;
    v3[4] = &v4;
    __getTinkerRuntimeClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19D1056B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _accessibilityPostProcessContextKitData(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v1 = a1;
  AXAccessibilityBundlesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ContextKitAccessibilityProcessor.bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = objc_msgSend(v4, "loadAndReturnError:", &v12);
  v6 = v12;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = objc_alloc_init((Class)objc_msgSend(v4, "principalClass"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "performSelector:withObject:", sel_processContextKitAccessibilityData_, v1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSLog(CFSTR("%@ needs to implement: processContextKitAccessibilityData:"), v8);
      v9 = v1;
    }
    v10 = v9;

  }
  else
  {
    NSLog(CFSTR("Could not load: %@ %@"), v3, v6);
    v10 = v1;
  }

  return v10;
}

void sub_19D1095B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_19D109B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D10A0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D10A1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D10A348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D10A600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D10B850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D10DD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D10E894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D10F2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19D10F568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _checkSortPriority(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3 || !v4)
  {
    v30 = v3;
    v31 = v4;
    _AXAssert();
  }
  v35 = 0;
  v6 = objc_msgSend(v3, "_accessibilitySortPriorityWithReturningElement:", &v35, v30, v31);
  v7 = v35;
  objc_msgSend(v3, "_accessibilitySortPriorityContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v9 = objc_msgSend(v5, "_accessibilitySortPriorityWithReturningElement:", &v34);
  v10 = v34;
  objc_msgSend(v5, "_accessibilitySortPriorityContainer");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = v11 == 0;
  v14 = v8 == (void *)v11 || v8 == 0;
  v15 = UIAccessibilityDefaultSortPriority;
  if (v8 == (void *)v11)
    v13 = 1;
  if (v14)
    v16 = v6;
  else
    v16 = UIAccessibilityDefaultSortPriority;
  if (v13)
    v17 = v9;
  else
    v17 = UIAccessibilityDefaultSortPriority;
  if (v7 == v10)
  {
    v17 = UIAccessibilityDefaultSortPriority;
    goto LABEL_20;
  }
  if (objc_msgSend(v7, "_accessibilityIsDescendantOfElement:", v10))
  {
    v15 = UIAccessibilityDefaultSortPriority;
    v17 = UIAccessibilityDefaultSortPriority;
    goto LABEL_21;
  }
  v18 = objc_msgSend(v10, "_accessibilityIsDescendantOfElement:", v7);
  v15 = UIAccessibilityDefaultSortPriority;
  if ((v18 & 1) != 0)
  {
LABEL_20:
    v16 = v15;
    goto LABEL_21;
  }
  if (v16 != UIAccessibilityDefaultSortPriority && v17 != UIAccessibilityDefaultSortPriority)
  {
    v33 = v8;
    objc_msgSend(v7, "accessibilityContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_accessibilitySubviews");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      while (1)
      {
        v24 = objc_msgSend(v21, "_accessibilitySortPriority");
        if (v16 <= v24)
          v16 = v24;
        if ((objc_msgSend(v23, "containsObject:", v21) & 1) != 0)
          break;
        objc_msgSend(v21, "accessibilityContainer");
        v25 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v25;
        if (!v25)
          goto LABEL_36;
      }
      v26 = v23;
    }
    else
    {
LABEL_36:
      objc_msgSend(v10, "accessibilityContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessibilityContainer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_accessibilitySubviews");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
LABEL_41:
        _accessibilityCommonAncestor(v7, v10);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v29, "_accessibilityCompareElement:toElement:", v7, v10);

        if (v19)
        {

          v8 = v33;
          goto LABEL_28;
        }
        v8 = v33;
        goto LABEL_46;
      }
      while (1)
      {
        v27 = objc_msgSend(v21, "_accessibilitySortPriority");
        if (v17 <= v27)
          v17 = v27;
        if ((objc_msgSend(v26, "containsObject:", v21) & 1) != 0)
          break;
        objc_msgSend(v21, "accessibilityContainer");
        v28 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v28;
        if (!v28)
          goto LABEL_41;
      }
    }
    v8 = v33;

LABEL_46:
    v15 = UIAccessibilityDefaultSortPriority;
  }
LABEL_21:
  if (v16 != v15 || v17 != v15)
  {
    if (v16 > v17)
    {
      v19 = -1;
      goto LABEL_28;
    }
    if (v17 > v16)
    {
      v19 = 1;
      goto LABEL_28;
    }
  }
  v19 = 0;
LABEL_28:

  return v19;
}

id _accessibilityCommonAncestor(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(a1, "_accessibilityProxyView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityProxyView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    do
    {
      objc_msgSend(v8, "addObject:", v6);
      objc_msgSend(v6, "superview");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    while (v9);
  }
  if (v7)
  {
    do
    {
      if ((objc_msgSend(v8, "containsObject:", v7) & 1) != 0)
        break;
      objc_msgSend(v7, "superview");
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    while (v10);
  }

  return v7;
}

void sub_19D111590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _scrollParentForComparingGeometryOfView(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p-_scrollParentForComparingGeometryOfView"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(v1, "_accessibilityContainingParentForOrdering");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "_accessibilityUsesScrollParentForOrdering"))
    {
      objc_msgSend(v1, "_accessibilityScrollParent");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "_accessibilityUsesScrollParentForOrdering") & 1) != 0)
      {
        if (v4)
        {
          if (v5 && objc_msgSend(v5, "_accessibilityIsDescendantOfElement:", v4))
          {
            v6 = v5;

            v4 = v6;
          }
          goto LABEL_11;
        }
      }
      else
      {

      }
    }
    v4 = v5;
LABEL_11:
    objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", v4, v2);

    goto LABEL_12;
  }
  objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v4;
}

void sub_19D112E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D1137F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D11498C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _UIAccessibilitySetFocusedElement(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a1;
  v3 = a2;
  if (!v3)
    _AXAssert();
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    _AXAssert();
  if (v3)
  {
    if (_UIAccessibilitySetFocusedElement_onceToken != -1)
      dispatch_once(&_UIAccessibilitySetFocusedElement_onceToken, &__block_literal_global_1028);
    objc_msgSend((id)__UIAccessibilityFocusedElements, "objectForKeyedSubscript:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 != v7)
    {
      if (v4)
        objc_msgSend((id)__UIAccessibilityFocusedElements, "removeObjectForKey:", v3);
      if (v7)
        objc_msgSend((id)__UIAccessibilityFocusedElements, "setObject:forKeyedSubscript:", v7, v3);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x1E0CEB000]);
      if (v4)
        objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0CEB198]);
      objc_msgSend(v5, "setObject:forKey:", v3, *MEMORY[0x1E0CEAFC8]);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:userInfo:", *MEMORY[0x1E0CEAFF8], 0, v5);

    }
  }

}

void _UIAccessibilityClearFocusedElementsStore()
{
  void *v0;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    _AXAssert();
  v0 = (void *)__UIAccessibilityFocusedElements;
  __UIAccessibilityFocusedElements = 0;

}

id _UIAccessibilityFocusedElementForAssistiveTech(uint64_t a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend((id)__UIAccessibilityFocusedElements, "objectForKeyedSubscript:");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)__UIAccessibilityFocusedElements, "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void sub_19D117D68(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_19D119B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D11AAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D11DC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v7 - 144), 8);
  _Unwind_Resume(a1);
}

Class __getLGRRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  LookingGlassRuntimeSupportLibrary();
  result = objc_getClass("LGRRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLGRRequestClass_block_invoke_cold_1();
  getLGRRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void LookingGlassRuntimeSupportLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!LookingGlassRuntimeSupportLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E3DFF380;
    v2 = 0;
    LookingGlassRuntimeSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LookingGlassRuntimeSupportLibraryCore_frameworkLibrary)
    LookingGlassRuntimeSupportLibrary_cold_1(&v0);
}

Class __getLGRRuntimeManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  LookingGlassRuntimeSupportLibrary();
  result = objc_getClass("LGRRuntimeManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLGRRuntimeManagerClass_block_invoke_cold_1();
  getLGRRuntimeManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getTinkerRuntimeClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AXTinkerKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E3DFF398;
    v5 = 0;
    AXTinkerKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AXTinkerKitLibraryCore_frameworkLibrary)
    __getTinkerRuntimeClass_block_invoke_cold_1(&v3);
  result = objc_getClass("TinkerRuntime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getTinkerRuntimeClass_block_invoke_cold_2();
  getTinkerRuntimeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void _UIUnblockNotificationsForNotification(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  UINotificationsToBlockUnblockForNotification(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend((id)_BlockedNotifications, "removeObject:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t _UIAccessibilityUnblockPostingOfNotification(uint64_t a1)
{
  objc_msgSend((id)_BlockNotificationsLock, "lock");
  _UIUnblockNotificationsForNotification(a1);
  return objc_msgSend((id)_BlockNotificationsLock, "unlock");
}

void _UIAccessibilityBlockPostingOfAllNotifications()
{
  id v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend((id)_BlockNotificationsLock, "lock");
  if (!_BlockedNotificationQueue)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v1 = (void *)_BlockedNotificationQueue;
    _BlockedNotificationQueue = (uint64_t)v0;

  }
  objc_msgSend((id)_BlockNotificationsLock, "unlock");
  _AXLastBlockTime = CFAbsoluteTimeGetCurrent();
  _AXBlockAllNotifications = 1;
  AXRuntimeLogNotifications();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19D0DD000, v2, OS_LOG_TYPE_INFO, "Blocking all notifications", v3, 2u);
  }

}

double _UIAccessibilityNotificationLastBlockTime()
{
  return *(double *)&_AXLastBlockTime;
}

uint64_t _UIAccessibilityAllNotificationsBlocked()
{
  return _AXBlockAllNotifications;
}

id _UIAccessibilityNotificationsBlocked()
{
  void *v0;

  objc_msgSend((id)_BlockNotificationsLock, "lock");
  if (objc_msgSend((id)_BlockedNotificationQueue, "count"))
    v0 = (void *)objc_msgSend((id)_BlockedNotificationQueue, "copy");
  else
    v0 = 0;
  objc_msgSend((id)_BlockNotificationsLock, "unlock");
  return v0;
}

void _UIAccessibilityUnblockPostingOfAllNotifications()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend((id)_BlockNotificationsLock, "lock");
  v0 = (void *)_BlockedNotifications;
  _BlockedNotifications = 0;

  objc_msgSend((id)_BlockedNotificationQueue, "removeAllObjects");
  objc_msgSend((id)_BlockNotificationsLock, "unlock");
  _AXBlockAllNotifications = 0;
  AXRuntimeLogNotifications();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19D0DD000, v1, OS_LOG_TYPE_INFO, "Unblocking all notifications", v2, 2u);
  }

}

void _UIAccessibilityPostPlaybackControlsVisibilityChangedNotification(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(0x437u, v5);

  }
}

const __CFString *_debugNameForUIAXNotification()
{
  return &stru_1E3E01CE0;
}

id _axuiElementForNotificationData(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  CFTypeID v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = CFGetTypeID(v2);
    v5 = v3;
    if (v4 == AXUIElementGetTypeID())
      goto LABEL_36;
    v6 = v3;
    do
    {
      if ((objc_msgSend(v6, "isAccessibilityElement") & 1) != 0)
        break;
      NSClassFromString(CFSTR("UITableViewCellAccessibilityElement"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (objc_msgSend(v6, "_accessibilityHasOrderedChildren")
        && objc_msgSend(v6, "accessibilityElementCount") >= 1)
      {
        objc_msgSend(v6, "accessibilityElementAtIndex:", 0);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isViewLoaded"))
        {
          objc_msgSend(v6, "view");
          v8 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v8;
        }
        objc_msgSend(v6, "_accessibilityFindDescendant:", &__block_literal_global_186);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (void *)v7;

      v6 = v9;
    }
    while (v9);
  }
  else
  {
    v6 = 0;
  }
  NSClassFromString(CFSTR("UIMenuItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v3;
    v11 = v6;
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UICalloutBar")), "safeValueForKey:", CFSTR("activeCalloutBar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("m_currentSystemButtons"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("m_extraButtons"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    v6 = v11;
    if (v17)
    {
      v18 = v17;
      v28 = v14;
      v29 = v12;
      v30 = v11;
      v31 = v3;
      v19 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v21, "accessibilityLabel", v28, v29);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "safeValueForKey:", CFSTR("title"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqualToString:", v23);

          if (v24)
          {
            v6 = v21;
            v11 = v30;

            goto LABEL_29;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v18)
          continue;
        break;
      }
      v11 = v30;
      v6 = v30;
LABEL_29:
      v3 = v31;
      v14 = v28;
      v12 = v29;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_view"));
    v25 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v25;
  }
  if (!v6)
    v6 = v3;
  v5 = (void *)_AXCreateAXUIElementWithElement();

LABEL_36:
  v26 = v5;

  return v26;
}

uint64_t ___axuiElementForNotificationData_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isAccessibilityElement"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL _notificationRequiresSenderPID(int a1)
{
  return *MEMORY[0x1E0CEB078] == a1
      || *MEMORY[0x1E0CEB0A0] == a1
      || *MEMORY[0x1E0CEAFC0] == a1
      || UIAccessibilityNativeFocusItemDidChangeWithContextNotification == a1
      || UIAccessibilityDevicePointerDidEnterElementNotification == a1
      || *MEMORY[0x1E0CEB058] == a1
      || *MEMORY[0x1E0CEB0A8] == a1
      || UIAccessibilityMoveToElementNotification == a1;
}

id _preprocessNotificationDataForMoveToElementNotification(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  CFTypeID v5;
  CFTypeID TypeID;
  void *v7;
  void *v8;
  CFTypeID v9;
  CFTypeID v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (MEMORY[0x1A1ADC328]())
    v2 = *MEMORY[0x1E0CF4650];
  else
    v2 = getpid();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(v1, "mutableCopy");
    objc_msgSend(v3, "objectForKeyedSubscript:", UIAccessibilityMoveToElementNotificationKeyElement);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = CFGetTypeID(v1);
      TypeID = AXUIElementGetTypeID();
      if (v5 != TypeID)
      {
        _axuiElementForNotificationData(TypeID, v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, UIAccessibilityMoveToElementNotificationKeyElement);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CF4530]);

  }
  else if (v1)
  {
    v9 = CFGetTypeID(v1);
    v10 = AXUIElementGetTypeID();
    if (v9 == v10)
    {
      v15[0] = *MEMORY[0x1E0CF4530];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = UIAccessibilityMoveToElementNotificationKeyElement;
      v16[0] = v11;
      v16[1] = v1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _axuiElementForNotificationData(v10, v1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = *MEMORY[0x1E0CF4530];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = UIAccessibilityMoveToElementNotificationKeyElement;
      v18[0] = v11;
      v13 = v12;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v18[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void *AXUnitTestNotificationWillBeSentSetter(void *result)
{
  _AXUnitTestNotificationWillBeSentCallback = result;
  return result;
}

void AXAddNotificationCallback(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id aBlock;

  aBlock = a1;
  v3 = a2;
  if (!NotificationCallbacks)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)NotificationCallbacks;
    NotificationCallbacks = v4;

  }
  v6 = _Block_copy(aBlock);
  objc_msgSend((id)NotificationCallbacks, "setObject:forKeyedSubscript:", v6, v3);

}

uint64_t AXRemoveNotificationCallback(uint64_t a1)
{
  uint64_t result;

  result = NotificationCallbacks;
  if (NotificationCallbacks)
    return objc_msgSend((id)NotificationCallbacks, "setObject:forKeyedSubscript:", 0, a1);
  return result;
}

void _UIAccessibilitySetAssociatedElementContextForNextNotification(void *a1)
{
  id v2;

  v2 = a1;
  if (!AXProcessIsMobileMail()
    || !objc_msgSend((id)*MEMORY[0x1E0CEB258], "isSuspended")
    || (NSClassFromString(CFSTR("MFWindow")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_storeStrong((id *)&_UIAXAssociatedElementContextForNextNotification, a1);
  }

}

id _UIAccessibilityAssociatedElementContextForNextNotification()
{
  return (id)_UIAXAssociatedElementContextForNextNotification;
}

void sub_19D121DD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id UIAXCurrentLanguage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("GlobalPreferences"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v1);
  objc_msgSend(v2, "objectForKey:", CFSTR("AppleLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void _UIAXSetLastKeyboardUsed(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "copy");
  v2 = (void *)_LastKeyboardUsed;
  _LastKeyboardUsed = v1;

}

id _UIAXLastKeyboardUsed()
{
  return (id)_LastKeyboardUsed;
}

const __CFString *_UIAccessibilityVoiceOverVersion()
{
  return CFSTR("VoiceOver");
}

id accessibilityUIKitSymbolNamesLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  AXSSAccessibilityDescriptionForSymbolName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = v1;
  v4 = v3;

  return v4;
}

id accessibilityUIKitLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityUIKitLocalizedString_axBundle;
  if (accessibilityUIKitLocalizedString_axBundle)
    goto LABEL_6;
  if (_CFMZEnabled())
    objc_msgSend(MEMORY[0x1E0CB34D0], "accessibilityMacCalystBundleWithLastPathComponent:", CFSTR("UIKit.axbundle"));
  else
    objc_msgSend(MEMORY[0x1E0CB34D0], "accessibilityBundleWithLastPathComponent:", CFSTR("UIKit.axbundle"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)accessibilityUIKitLocalizedString_axBundle;
  accessibilityUIKitLocalizedString_axBundle = v3;

  v2 = (void *)accessibilityUIKitLocalizedString_axBundle;
  if (accessibilityUIKitLocalizedString_axBundle)
  {
LABEL_6:
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E3E01CE0, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void UIAccessibilitySpeak(id argument)
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0CEAFC0], argument);
}

void UIAccessibilitySpeakOrQueueIfNeeded(uint64_t a1)
{
  id argument;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", a1);
    argument = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(argument, "setAttribute:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CF4290]);
    UIAccessibilityPostNotification(*MEMORY[0x1E0CEAFC0], argument);

  }
}

void UIAccessibilitySpeakIfNotSpeaking(uint64_t a1)
{
  id argument;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", a1);
    argument = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(argument, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF4328]);
    UIAccessibilityPostNotification(*MEMORY[0x1E0CEAFC0], argument);

  }
}

void UIAccessibilitySpeakAndDoNotBeInterrupted(void *a1)
{
  objc_class *v1;
  id v2;
  id argument;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0CF40C0];
    v2 = a1;
    argument = (id)objc_msgSend([v1 alloc], "initWithStringOrAttributedString:", v2);

    objc_msgSend(argument, "setAttribute:forKey:", &unk_1E3E10910, *MEMORY[0x1E0CF4128]);
    UIAccessibilityPostNotification(*MEMORY[0x1E0CEAFC0], argument);

  }
}

BOOL UIAccessibilityColorEqualToColor(void *a1, void *a2)
{
  id v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v11 = 0.0;
  v12 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v3 = a2;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  objc_msgSend(v3, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5);

  return vabdd_f64(v12, v8) < 2.22044605e-16
      && vabdd_f64(v11, v7) < 2.22044605e-16
      && vabdd_f64(v10, v6) < 2.22044605e-16
      && vabdd_f64(v9, v5) < 2.22044605e-16;
}

id UIAccessibilitySafeTextForCoreTextObject(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    v3 = 0;
    v4 = &v3;
    v5 = 0x2020000000;
    v6 = 0;
    AXPerformSafeBlock();
    v1 = v4[3];
    _Block_object_dispose(&v3, 8);
    if (v1 == CTFrameGetTypeID())
      a1 = (void *)CTFrameCopyVisibleString();
    else
      a1 = 0;
  }
  return a1;
}

void sub_19D123178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void UIAccessibilityRelateElements(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a1;
  v3 = a2;
  if (v8 && v3)
  {
    objc_msgSend(v8, "_accessibilityUserDefinedLinkedUIElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXGuaranteedMutableArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_accessibilityUserDefinedLinkedUIElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXGuaranteedMutableArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "containsObject:", v3) & 1) == 0)
    {
      objc_msgSend(v5, "addObject:", v3);
      objc_msgSend(v8, "_setAccessibilityLinkedUIElements:", v5);
    }
    if ((objc_msgSend(v7, "containsObject:", v8) & 1) == 0)
    {
      objc_msgSend(v7, "addObject:", v8);
      objc_msgSend(v3, "_setAccessibilityLinkedUIElements:", v7);
    }

  }
}

void UIAccessibilityUnrelateElements(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a1;
  v3 = a2;
  if (v8 && v3)
  {
    objc_msgSend(v8, "_accessibilityUserDefinedLinkedUIElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXGuaranteedMutableArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_accessibilityUserDefinedLinkedUIElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXGuaranteedMutableArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "containsObject:", v3))
    {
      objc_msgSend(v5, "removeObject:", v3);
      objc_msgSend(v8, "_setAccessibilityLinkedUIElements:", v5);
    }
    if (objc_msgSend(v7, "containsObject:", v8))
    {
      objc_msgSend(v7, "removeObject:", v8);
      objc_msgSend(v3, "_setAccessibilityLinkedUIElements:", v7);
    }

  }
}

void UIAccessibilityUnrelateAllElements(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "_accessibilityUserDefinedLinkedUIElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AXGuaranteedMutableArray();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "_accessibilityUserDefinedLinkedUIElements", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          AXGuaranteedMutableArray();
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "containsObject:", v2))
          {
            objc_msgSend(v12, "removeObject:", v2);
            objc_msgSend(v10, "_setAccessibilityLinkedUIElements:", v12);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(v2, "_setAccessibilityLinkedUIElements:", MEMORY[0x1E0C9AA60]);
  }

}

BOOL _AXStrictIsKindOfClass(void *a1, objc_class *a2)
{
  objc_class *Class;
  _BOOL8 i;

  Class = object_getClass(a1);
  for (i = Class != 0; Class != a2 && Class; i = Class != 0)
    Class = class_getSuperclass(Class);
  return i;
}

void sub_19D1245A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void UIAccessibilityStartCapturingStringDrawingText()
{
  id v0;
  void *v1;

  AXCaptureStringDrawingText = 1;
  v0 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v1 = (void *)AXCapturedString;
  AXCapturedString = (uint64_t)v0;

  if (UIAccessibilityStartCapturingStringDrawingText_onceToken != -1)
    dispatch_once(&UIAccessibilityStartCapturingStringDrawingText_onceToken, &__block_literal_global_10);
}

id UIAccessibilityStopCapturingStringDrawingText()
{
  void *v0;
  void *v1;

  AXCaptureStringDrawingText = 0;
  v0 = (void *)objc_msgSend((id)AXCapturedString, "copy");
  v1 = (void *)AXCapturedString;
  AXCapturedString = 0;

  return v0;
}

uint64_t UIAXKeyboardIsOnScreen()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", CFSTR("UIAXKeyboardIsOnScreen"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", CFSTR("UIAXKeyboardIsOnScreen"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLValue");
  }
  else
  {
    v2 = AXUIKeyboardIsOnScreen();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", v1, CFSTR("UIAXKeyboardIsOnScreen"));
  }

  return v2;
}

uint64_t _UIAXObjectIsBehindKeyboard(void *a1)
{
  return _UIAXObjectIsBehindKeyboardWithIntersectionType(a1, 0);
}

uint64_t _UIAXObjectIsBehindKeyboardWithIntersectionType(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  NSObject *v50;
  void *v51;
  _DWORD v52[2];
  __int16 v53;
  void *v54;
  uint64_t v55;
  CGRect v56;
  CGRect v57;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (AXUIKeyboardIsOnScreen())
  {
    AXUIKeyboardWindow();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v3, "_accessibilityIsDescendantOfElement:", v4) & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboardForScreen:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "_accessibilityIsDescendantOfElement:", v7);

    if ((v8 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(v3, "_accessibilityParentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowLevel");
    v12 = v11;
    objc_msgSend(v4, "windowLevel");
    v14 = v13;

    if (v12 > v14)
    {
LABEL_5:
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstResponder");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "inputAccessoryView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safeValueForKey:", CFSTR("containerRootController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "safeValueForKey:", CFSTR("_inputAccessoryView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v23 = v19 == v22;
      else
        v23 = 0;
      v24 = !v23;
      if (v23 && (objc_msgSend(v3, "_accessibilityIsDescendantOfElement:", v19) & 1) != 0)
      {
        v15 = 0;
      }
      else
      {
        AXUIKeyboardScreenFrame();
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;
        objc_msgSend(v3, "accessibilityFrame");
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v41 = v26;
        v42 = v28;
        v43 = v30;
        v44 = v32;
        v45 = v34;
        v46 = v36;
        v47 = v38;
        v48 = v40;
        if (a2)
        {
          AXMIntersectionOverUnion();
          v15 = v49 > 0.75;
        }
        else
        {
          v15 = CGRectIntersectsRect(*(CGRect *)&v41, *(CGRect *)&v45);
        }
        if (((v24 | v15 ^ 1) & 1) == 0
          && objc_msgSend(v19, "_accessibilityIsKeyboardPassthroughInputAccessoryView"))
        {
          objc_msgSend(v19, "accessibilityFrame");
          v57.origin.x = v34;
          v57.origin.y = v36;
          v57.size.width = v38;
          v57.size.height = v40;
          v15 = v15 & !CGRectIntersectsRect(v56, v57);
        }
        AXLogUIA();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          UIAXMassageElementDescription(v3);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = 67109378;
          v52[1] = v15;
          v53 = 2112;
          v54 = v51;
          _os_log_impl(&dword_19D0DD000, v50, OS_LOG_TYPE_INFO, "Object is behind keyboard? %d - %@", (uint8_t *)v52, 0x12u);

        }
      }

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t _UIAXObjectIsCompletelyBehindKeyboard(void *a1)
{
  return _UIAXObjectIsBehindKeyboardWithIntersectionType(a1, 1);
}

const void *UIAccessibilityCreateEventForSceneReferencePoint(_QWORD *a1, double a2, double a3)
{
  const void *result;
  const void *v7;

  if (!UIAccessibilityCreateEventForSceneReferencePoint_TouchEventClass)
    UIAccessibilityCreateEventForSceneReferencePoint_TouchEventClass = (uint64_t)NSClassFromString(CFSTR("UITouchesEvent"));
  result = (const void *)GSEventCreateWithEventRecord();
  if (result)
  {
    v7 = result;
    if (a1)
    {
      *a1 = result;
    }
    else
    {
      CFRelease(result);
      v7 = 0;
    }
    return (const void *)objc_msgSend(objc_allocWithZone((Class)UIAccessibilityCreateEventForSceneReferencePoint_TouchEventClass), "_initWithEvent:touches:", v7, 0, 1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a2, *(_QWORD *)&a3, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

double UIAXMidPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

id _UIAccessibilityLocalizedKeyboardName(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CF4E80], "nonlocalizedNameForLanguage:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v3, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfString:", v5);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v10;
      v13 = v11;
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("emoji")) & 1) == 0)
        objc_msgSend(v9, "setAttribute:forKey:withRange:", v6, *MEMORY[0x1E0CF4250], v12, v13);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id UIAccessibilityLocalizedKeyboardName(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  UIKitAccessibilityLocalizedString(CFSTR("keyboard.type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAccessibilityLocalizedKeyboardName(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id UIKitAccessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (objc_msgSend(0, "length"))
  {
    UIKitAccessibilityLocalizedStringInTable(v1, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (!v2 || objc_msgSend(v2, "isEqual:", v1))
    {
      UIKitAccessibilityLocalizedStringInTable(v1, CFSTR("Accessibility"));
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
  }
  else
  {
    UIKitAccessibilityLocalizedStringInTable(v1, CFSTR("Accessibility"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id UIAccessibilityLocalizedCurrentKeyboardName()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentInputMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  UIKitAccessibilityLocalizedString(CFSTR("keyboard.type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAccessibilityLocalizedKeyboardName(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id UIAccessibilityAvailableLanguages()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v0 = (void *)UIAccessibilityAvailableLanguages__AvailableLanguages;
  if (!UIAccessibilityAvailableLanguages__AvailableLanguages)
  {
    v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
    v2 = (void *)UIAccessibilityAvailableLanguages__AvailableLanguages;
    UIAccessibilityAvailableLanguages__AvailableLanguages = v1;

    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = (id)_AXSVoiceOverTouchCopyLanguageRotorItems();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "objectForKey:", CFSTR("RotorItem"), (_QWORD)v12);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "length"))
          {
            v9 = (void *)UIAccessibilityAvailableLanguages__AvailableLanguages;
            objc_msgSend(v8, "lowercaseString");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v10);

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    v0 = (void *)UIAccessibilityAvailableLanguages__AvailableLanguages;
  }
  return v0;
}

id UIAccessibilityLanguageForCurrentInputMode()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentInputMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "primaryLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXCRemapLanguageCodeToFallbackIfNeccessary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id UIAccessibilityLocalizedNextKeyboardName()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activeInputModes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "nextInputModeFromList:withFilter:withTraits:", v1, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  UIKitAccessibilityLocalizedString(CFSTR("next.international.keyboard.key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAccessibilityLocalizedKeyboardName(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    UIKitAccessibilityLocalizedString(CFSTR("next.international.keyboard.key.fallback"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t _UIAXDismissKeyboardIfNecessary(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySoftwareKeyboardActive"))
  {
    v2 = 0;
    if (_UIAXObjectIsBehindKeyboardWithIntersectionType(v1, 0))
    {
      _UIAccessibilityIgnoreNextNotification(*MEMORY[0x1E0CEB0A8]);
      if ((objc_msgSend(v1, "_accessibilityUsesSpecialKeyboardDismiss") & 1) == 0)
      {
        objc_msgSend(v1, "_accessibilityWindow");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "firstResponder");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "resignFirstResponder");

      }
      v2 = 1;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id UIAXApplyPhoneContextTokenToString(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("-"));
  v26 = v2;
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
  v5 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __UIAXApplyPhoneContextTokenToString_block_invoke;
  v36[3] = &unk_1E3DFF628;
  v25 = v3;
  v37 = v25;
  v6 = v4;
  v38 = v6;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v36);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
  v9 = objc_msgSend(v6, "count");
  v31[0] = v5;
  v31[1] = 3221225472;
  v31[2] = __UIAXApplyPhoneContextTokenToString_block_invoke_2;
  v31[3] = &unk_1E3DFF650;
  v10 = v7;
  v32 = v10;
  v24 = v1;
  v33 = v24;
  v11 = v8;
  v34 = v11;
  v35 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v31);
  objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    v17 = *MEMORY[0x1E0C9AE50];
    v18 = (uint64_t *)MEMORY[0x1E0CF4270];
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v20 = *v18;
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v19), "rangeValue");
        objc_msgSend(v12, "setAttribute:forKey:withRange:", v17, v20, v21, v22);
        ++v19;
      }
      while (v15 != v19);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v15);
  }

  return v12;
}

id UIAXStringForAllChildren(void *a1)
{
  return _UIAXStringForAllChildren(a1, 0);
}

id _UIAXStringForAllChildren(void *a1, char a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___UIAXStringForAllChildren_block_invoke;
  v10[3] = &unk_1E3DFF7A8;
  v13 = a2;
  v11 = v3;
  v12 = v4;
  v5 = v4;
  v6 = v3;
  v7 = (id)objc_msgSend(v6, "_accessibilityFindDescendant:", v10);
  AXLabelAndValueForElements();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id UIAXStringForAllChildrenIncludingNonAXElements(void *a1)
{
  return _UIAXStringForAllChildren(a1, 1);
}

id UIAccessibilityConvertAttachmentsInAttributedStringToAX(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    v17 = 0;
    v5 = objc_msgSend(v3, "length");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __UIAccessibilityConvertAttachmentsInAttributedStringToAX_block_invoke;
    v8[3] = &unk_1E3DFF678;
    v11 = &v12;
    v9 = v3;
    v10 = v4;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v8);
    v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithString:", &stru_1E3E01CE0);
  }

  return v6;
}

void sub_19D1283C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

id _UIAccessibilityProcessImageAttachment(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  const __CFString *v19;

  v1 = a1;
  objc_msgSend(v1, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8) == v4 && *MEMORY[0x1E0C9D820] == v3;
  if (v2)
    v6 = v5;
  else
    v6 = 1;
  if (v6)
    v7 = v1;
  else
    v7 = v2;
  v8 = v7;
  if ((objc_msgSend(v8, "isAccessibilityElement") & 1) == 0 && !v5)
  {
    if (v2)
    {
      v9 = objc_msgSend(v2, "accessibilityTraits");
      if ((*MEMORY[0x1E0CEB170] & v9) == 0)
        objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x1E0CEB128]);
    }
    objc_msgSend(v2, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v1, "fileWrapper");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferredFilename");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v1, "fileWrapper");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "filename");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      UIAXFileTypeDescriptionForFileExtension();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v16;
      v19 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "setAccessibilityLabel:", v10, v18, v19);
    objc_msgSend(v8, "setIsAccessibilityElement:", 1);

  }
  return v8;
}

id AXSSTextualContextFromUITextualContext(void *a1)
{
  id v1;
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB0F8]))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v2 = (id *)getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_ptr;
    v14 = getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_ptr)
    {
      v3 = (void *)AccessibilitySharedSupportLibrary();
      v2 = (id *)dlsym(v3, "AXSSVoiceOverTextualContextWordProcessing");
      v12[3] = (uint64_t)v2;
      getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_ptr = (uint64_t)v2;
    }
    _Block_object_dispose(&v11, 8);
    if (!v2)
      AXSSTextualContextFromUITextualContext_cold_1();
LABEL_25:
    v8 = *v2;
    goto LABEL_26;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB0F0]))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v2 = (id *)getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_ptr;
    v14 = getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_ptr)
    {
      v4 = (void *)AccessibilitySharedSupportLibrary();
      v2 = (id *)dlsym(v4, "AXSSVoiceOverTextualContextSpreadsheet");
      v12[3] = (uint64_t)v2;
      getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_ptr = (uint64_t)v2;
    }
    _Block_object_dispose(&v11, 8);
    if (!v2)
      AXSSTextualContextFromUITextualContext_cold_2();
    goto LABEL_25;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB0E8]))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v2 = (id *)getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_ptr;
    v14 = getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_ptr)
    {
      v5 = (void *)AccessibilitySharedSupportLibrary();
      v2 = (id *)dlsym(v5, "AXSSVoiceOverTextualContextSourceCode");
      v12[3] = (uint64_t)v2;
      getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_ptr = (uint64_t)v2;
    }
    _Block_object_dispose(&v11, 8);
    if (!v2)
      AXSSTextualContextFromUITextualContext_cold_3();
    goto LABEL_25;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB0C8]))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v2 = (id *)getAXSSVoiceOverTextualContextConsoleSymbolLoc_ptr;
    v14 = getAXSSVoiceOverTextualContextConsoleSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextConsoleSymbolLoc_ptr)
    {
      v6 = (void *)AccessibilitySharedSupportLibrary();
      v2 = (id *)dlsym(v6, "AXSSVoiceOverTextualContextConsole");
      v12[3] = (uint64_t)v2;
      getAXSSVoiceOverTextualContextConsoleSymbolLoc_ptr = (uint64_t)v2;
    }
    _Block_object_dispose(&v11, 8);
    if (!v2)
      AXSSTextualContextFromUITextualContext_cold_4();
    goto LABEL_25;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB0D0]))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v2 = (id *)getAXSSVoiceOverTextualContextFileSystemSymbolLoc_ptr;
    v14 = getAXSSVoiceOverTextualContextFileSystemSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextFileSystemSymbolLoc_ptr)
    {
      v7 = (void *)AccessibilitySharedSupportLibrary();
      v2 = (id *)dlsym(v7, "AXSSVoiceOverTextualContextFileSystem");
      v12[3] = (uint64_t)v2;
      getAXSSVoiceOverTextualContextFileSystemSymbolLoc_ptr = (uint64_t)v2;
    }
    _Block_object_dispose(&v11, 8);
    if (!v2)
      AXSSTextualContextFromUITextualContext_cold_5();
    goto LABEL_25;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB0E0]))
  {
    getAXSSVoiceOverTextualContextNarrative();
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB0D8]))
    {
      v9 = 0;
      goto LABEL_27;
    }
    getAXSSVoiceOverTextualContextMessaging();
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_26:
  v9 = v8;
LABEL_27:

  return v9;
}

void sub_19D129048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIAXColorForObject(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  CFTypeID v4;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
        v3 = objc_msgSend(objc_retainAutorelease(v1), "CGColor");
      else
        v3 = 0;

    }
    else
    {
      v4 = CFGetTypeID(v1);
      if (v4 == CGColorGetTypeID())
        v3 = (uint64_t)v1;
      else
        v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id getAXSSVoiceOverTextualContextNarrative()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAXSSVoiceOverTextualContextNarrativeSymbolLoc_ptr;
  v6 = getAXSSVoiceOverTextualContextNarrativeSymbolLoc_ptr;
  if (!getAXSSVoiceOverTextualContextNarrativeSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilitySharedSupportLibrary();
    v0 = (id *)dlsym(v1, "AXSSVoiceOverTextualContextNarrative");
    v4[3] = (uint64_t)v0;
    getAXSSVoiceOverTextualContextNarrativeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAXSSVoiceOverTextualContextNarrative_cold_1();
  return *v0;
}

void sub_19D1291BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAXSSVoiceOverTextualContextMessaging()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAXSSVoiceOverTextualContextMessagingSymbolLoc_ptr;
  v6 = getAXSSVoiceOverTextualContextMessagingSymbolLoc_ptr;
  if (!getAXSSVoiceOverTextualContextMessagingSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilitySharedSupportLibrary();
    v0 = (id *)dlsym(v1, "AXSSVoiceOverTextualContextMessaging");
    v4[3] = (uint64_t)v0;
    getAXSSVoiceOverTextualContextMessagingSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAXSSVoiceOverTextualContextMessaging_cold_1();
  return *v0;
}

void sub_19D129254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id AXAttributedStringForBetterPronuciation(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("en"));

  if (v7 && objc_msgSend(v3, "isEqualToString:", UIAXBetterPronuciationKeyLive))
    objc_msgSend(v4, "setAttribute:forKey:", &unk_1E3E10E48, *MEMORY[0x1E0CF4048]);

  return v4;
}

uint64_t UIAccessibilityIsAppExtension()
{
  if (UIAccessibilityIsAppExtension_onceToken != -1)
    dispatch_once(&UIAccessibilityIsAppExtension_onceToken, &__block_literal_global_416);
  return UIAccessibilityIsAppExtension_IsExtension;
}

uint64_t UIAccessibilityIsWidgetExtension()
{
  if (UIAccessibilityIsWidgetExtension_onceToken != -1)
    dispatch_once(&UIAccessibilityIsWidgetExtension_onceToken, &__block_literal_global_423);
  return UIAccessibilityIsWidgetExtension_IsWidget;
}

void sub_19D12A100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

double UIAccessibilityFrameForBounds(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;

  v9 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "_axConvertRect:toWindow:", 0, a2, a3, a4, a5);
    v11 = v10;
  }
  else
  {
    objc_msgSend(v9, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v9, "convertRect:toView:", 0, a2, a3, a4, a5);
      objc_msgSend(v12, "_axConvertRect:toWindow:", 0);
      v11 = v13;
    }
    else
    {
      objc_msgSend(v9, "_accessibilityProxyViewAncestorWhenMissingWindow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "convertRect:toView:", 0, a2, a3, a4, a5);
      v11 = v15;
      v9 = v14;
    }

  }
  return v11;
}

id _UIAccessibilityPathForPath(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v5 = a1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___UIAccessibilityPathForPath_block_invoke;
  v9[3] = &unk_1E3DFF730;
  v10 = v5;
  v11 = a3;
  v6 = v5;
  UIAccessibilityPathForPath((uint64_t)v6, a2, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id UIAccessibilityPathForPath(uint64_t a1, void *a2, void *a3)
{
  id v4;
  CGMutablePathRef Mutable;
  void *v6;
  uint64_t v8;
  id v9;

  v4 = a3;
  if (a2)
  {
    objc_msgSend(objc_retainAutorelease(a2), "CGPath");
    Mutable = CGPathCreateMutable();
    v8 = MEMORY[0x1E0C809B0];
    v9 = v4;
    AX_CGPathEnumerateElementsUsingBlock();
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithCGPath:", Mutable, v8, 3221225472, __UIAccessibilityPathForPath_block_invoke, &unk_1E3DFF758);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (Mutable)
      CFRelease(Mutable);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id UIAccessibilityPathForAccessibilityPath(void *a1, void *a2)
{
  return _UIAccessibilityPathForPath(a1, a2, (uint64_t)UIAccessibilityPointToPoint);
}

double UIAccessibilityPointToPoint(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a1;
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromWindow:", 0, a2, a3);
  objc_msgSend(v5, "convertPoint:fromView:", v6);
  v8 = v7;

  return v8;
}

id UIAccessibilityConvertPathFunction(void *a1, void *a2)
{
  return _UIAccessibilityPathForPath(a2, a1, (uint64_t)UIAccessibilityPointForPoint);
}

double UIAccessibilityPointForPoint(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a1;
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toView:", v6, a2, a3);
  v8 = v7;
  v10 = v9;

  if (v6)
  {
    objc_msgSend(v6, "convertPoint:toWindow:", 0, v8, v10);
    v8 = v11;
  }

  return v8;
}

id UIAccessibilityConvertAccessibilityPathToViewFunction(void *a1, void *a2)
{
  return _UIAccessibilityPathForPath(a2, a1, (uint64_t)UIAccessibilityPointToPoint);
}

id UIAccessibilitySceneReferencePathForScreenPath(void *a1)
{
  return _UIAccessibilityPathForPath(0, a1, (uint64_t)_UIAccessibilitySceneReferencePointForScreenPoint);
}

id UIAccessibilitySceneReferencePathToScreenPath(void *a1)
{
  return _UIAccessibilityPathForPath(0, a1, (uint64_t)_UIAccessibilitySceneReferencePointToScreenPoint);
}

id UIAccessibilitySceneReferencePathToScreenPathWithView(void *a1, void *a2)
{
  return _UIAccessibilityPathForPath(a1, a2, (uint64_t)UIAccessibilitySceneReferencePointToScreenPointWithView);
}

double UIAccessibilitySceneReferencePointToScreenPointWithView(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v5 = a1;
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromWindow:", 0, a2, a3);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", v8, v10);
  v13 = v12;

  return v13;
}

id UIAccessibilityInsetBezierPath(void *a1, CGFloat a2, CGFloat a3)
{
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double sx;
  __int128 v20;
  __int128 v21;
  double v22;
  __int128 v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithCGPath:", objc_msgSend(objc_retainAutorelease(a1), "CGPath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
    v28 = CGRectInset(v27, a2, a3);
    v10 = v28.size.width;
    v11 = v28.size.height;
    v12 = v28.origin.x;
    v13 = v28.origin.y;
    v22 = CGRectGetWidth(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    sx = v22 / CGRectGetWidth(v29);
    v30.origin.x = v12;
    v30.origin.y = v13;
    v30.size.width = v10;
    v30.size.height = v11;
    v14 = CGRectGetHeight(v30);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v15 = CGRectGetHeight(v31);
    memset(&v26, 0, sizeof(v26));
    v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x1E0C9BAA8];
    v21 = *(_OWORD *)&v25.a;
    *(_OWORD *)&v25.c = v23;
    *(_OWORD *)&v25.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v20 = *(_OWORD *)&v25.tx;
    CGAffineTransformScale(&v26, &v25, sx, v14 / v15);
    v25 = v26;
    objc_msgSend(v5, "applyTransform:", &v25);
    objc_msgSend(v5, "bounds");
    *(_OWORD *)&v24.a = v21;
    *(_OWORD *)&v24.c = v23;
    *(_OWORD *)&v24.tx = v20;
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformTranslate(&v25, &v24, v12 - v16, v13 - v17);
    v24 = v25;
    objc_msgSend(v5, "applyTransform:", &v24);
    objc_msgSend(v5, "closePath");
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

double UIAccessibilityFrameToBounds(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;

  v9 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v9, "window");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v10, "convertRect:fromWindow:", 0, a2, a3, a4, a5);
  objc_msgSend(v9, "convertRect:fromView:", 0);
  v13 = v12;

  return v13;
}

double UIAccessibilitySceneReferencePointForScreenPoint(double a1, double a2)
{
  void *v4;
  double v5;
  double v6;

  _anyMainScreenWindow();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromWindow:", 0, a1, a2);
  objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
  v6 = v5;

  return v6;
}

id _anyMainScreenWindow()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "screen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1 != v2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    AXUIApplicationWindows();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v8, "screen", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 == v10)
          {
            v11 = v8;

            v0 = v11;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

  }
  return v0;
}

double UIAccessibilitySceneReferencePointToScreenPoint(double a1, double a2)
{
  void *v4;
  double v5;
  double v6;

  _anyMainScreenWindow();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_convertPointFromSceneReferenceSpace:", a1, a2);
  objc_msgSend(v4, "convertPoint:toWindow:", 0);
  v6 = v5;

  return v6;
}

double UIAXFrameForElements(void *a1)
{
  id v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  CGFloat v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v3 = *MEMORY[0x1E0C9D628];
  v2 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "accessibilityFrame");
        x = v21.origin.x;
        y = v21.origin.y;
        width = v21.size.width;
        height = v21.size.height;
        if (!CGRectIsEmpty(v21))
        {
          v22.origin.x = v3;
          v22.origin.y = v2;
          v22.size.width = v5;
          v22.size.height = v4;
          if (CGRectIsEmpty(v22))
          {
            v4 = height;
            v5 = width;
            v2 = y;
            v3 = x;
          }
          else
          {
            v23.origin.x = v3;
            v23.origin.y = v2;
            v23.size.width = v5;
            v23.size.height = v4;
            v25.origin.x = x;
            v25.origin.y = y;
            v25.size.width = width;
            v25.size.height = height;
            v24 = CGRectUnion(v23, v25);
            v3 = v24.origin.x;
            v2 = v24.origin.y;
            v5 = v24.size.width;
            v4 = v24.size.height;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

id UIKitAccessibilityLocalizedStringInTable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = (void *)UIKitAccessibilityLocalizedStringInTable_axBundle;
  if (UIKitAccessibilityLocalizedStringInTable_axBundle)
    goto LABEL_6;
  if (_CFMZEnabled())
    objc_msgSend(MEMORY[0x1E0CB34D0], "accessibilityMacCalystBundleWithLastPathComponent:", CFSTR("UIKit.axbundle"));
  else
    objc_msgSend(MEMORY[0x1E0CB34D0], "accessibilityBundleWithLastPathComponent:", CFSTR("UIKit.axbundle"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)UIKitAccessibilityLocalizedStringInTable_axBundle;
  UIKitAccessibilityLocalizedStringInTable_axBundle = v6;

  v5 = (void *)UIKitAccessibilityLocalizedStringInTable_axBundle;
  if (UIKitAccessibilityLocalizedStringInTable_axBundle)
  {
LABEL_6:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_1E3E01CE0, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __UIAXStringForVariables()
{
  __AXStringForVariablesWithVariadics();
  return (id)objc_claimAutoreleasedReturnValue();
}

__CFString *UIAXPrivateLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v1 = a1;
  v2 = (void *)UIAXPrivateLocalizedString_axBundle;
  if (UIAXPrivateLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AXExtraExtras.axbundle")),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)UIAXPrivateLocalizedString_axBundle,
        UIAXPrivateLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)UIAXPrivateLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E3E01CE0, CFSTR("Accessibility"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = &stru_1E3E01CE0;
  v7 = v6;

  return v7;
}

id UIAXLocalizedStringForKnownAXIdentifier(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIButtonBarPlay")) & 1) != 0)
  {
    v2 = CFSTR("play.button");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIButtonBarListIcon")) & 1) != 0)
  {
    v2 = CFSTR("item.list.button");
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("UITabBarMoreTemplate")) & 1) != 0)
  {
    v2 = CFSTR("more.button");
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("UIButtonBarArrowUp")) & 1) != 0)
  {
    v2 = CFSTR("previous.input.item");
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("UIButtonBarArrowDown")) & 1) != 0)
  {
    v2 = CFSTR("next.input.item");
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("UIButtonBarMarkup")) & 1) != 0)
  {
    v2 = CFSTR("markup.button.label");
  }
  else
  {
    if (!objc_msgSend(v1, "containsString:", CFSTR("UniversalSearchBarButtonIcon")))
    {
      v3 = 0;
      goto LABEL_16;
    }
    v2 = CFSTR("search.button");
  }
  UIKitAccessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v3;
}

id UIAXPriceRangeDescription(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    UIKitAccessibilityLocalizedString(CFSTR("price.range.output"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v3, v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeOfString:", v1);
    objc_msgSend(v5, "setAttribute:forKey:withRange:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF42F8], v6, v7);

  }
  else
  {
    v5 = v1;
  }

  return v5;
}

id UIAXStarRatingStringForRatingWithMaxRatingGranularity(uint64_t a1, int a2, double a3)
{
  BOOL v5;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  id v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;

  if (a2 == 1)
  {
    if (a3 < 0.25 && a3 >= -0.25)
      goto LABEL_65;
    if (a3 < 0.5 && a3 >= 0.0)
    {
LABEL_62:
      v9 = CFSTR("star.count.onequarters");
      goto LABEL_63;
    }
    if (a3 < 0.75 && a3 >= 0.25)
    {
LABEL_78:
      v13 = CFSTR("star.count.onehalf");
      goto LABEL_66;
    }
    if (a3 >= 1.0 || a3 < 0.5)
    {
      if (a3 >= 1.25 || a3 < 0.75)
      {
        if (a3 >= 1.5 || a3 < 1.0)
        {
          if (a3 >= 1.75 || a3 < 1.25)
          {
            if (a3 >= 2.0 || a3 < 1.5)
            {
              if (a3 >= 2.25 || a3 < 1.75)
              {
                if (a3 >= 2.5 || a3 < 2.0)
                {
                  if (a3 >= 2.75 || a3 < 2.25)
                  {
                    if (a3 >= 3.0 || a3 < 2.5)
                    {
                      if (a3 >= 3.25 || a3 < 2.75)
                      {
                        if (a3 >= 3.5 || a3 < 3.0)
                        {
                          if (a3 >= 3.75 || a3 < 3.25)
                          {
                            if (a3 >= 4.0 || a3 < 3.5)
                            {
                              if (a3 >= 4.25 || a3 < 3.75)
                              {
                                if (a3 >= 4.5 || a3 < 4.0)
                                {
                                  if (a3 >= 4.75 || a3 < 4.25)
                                  {
                                    if (a3 >= 5.0 || a3 < 4.5)
                                    {
                                      if (a3 >= 5.25 || a3 < 4.75)
                                        goto LABEL_130;
                                      goto LABEL_129;
                                    }
                                    goto LABEL_126;
                                  }
LABEL_123:
                                  v13 = CFSTR("star.count.fourandhalf");
                                  goto LABEL_66;
                                }
LABEL_120:
                                v9 = CFSTR("star.count.fourandquarters");
                                goto LABEL_63;
                              }
LABEL_117:
                              v13 = CFSTR("star.count.four");
                              goto LABEL_66;
                            }
LABEL_114:
                            v9 = CFSTR("star.count.threeandthreequarters");
                            goto LABEL_63;
                          }
LABEL_111:
                          v13 = CFSTR("star.count.threeandhalf");
                          goto LABEL_66;
                        }
LABEL_108:
                        v9 = CFSTR("star.count.threeandquarters");
                        goto LABEL_63;
                      }
LABEL_105:
                      v13 = CFSTR("star.count.three");
                      goto LABEL_66;
                    }
LABEL_102:
                    v9 = CFSTR("star.count.twoandthreequarters");
                    goto LABEL_63;
                  }
LABEL_99:
                  v13 = CFSTR("star.count.twoandhalf");
                  goto LABEL_66;
                }
LABEL_96:
                v9 = CFSTR("star.count.twoandquarters");
                goto LABEL_63;
              }
LABEL_93:
              v13 = CFSTR("star.count.two");
              goto LABEL_66;
            }
LABEL_90:
            v9 = CFSTR("star.count.oneandthreequarters");
            goto LABEL_63;
          }
LABEL_87:
          v13 = CFSTR("star.count.oneandhalf");
          goto LABEL_66;
        }
LABEL_84:
        v9 = CFSTR("star.count.oneandquarters");
        goto LABEL_63;
      }
LABEL_81:
      v13 = CFSTR("star.count.one");
      goto LABEL_66;
    }
LABEL_77:
    v9 = CFSTR("star.count.onethreequarters");
    goto LABEL_63;
  }
  if (a2 || (a3 < 0.125 ? (v5 = a3 < -0.125) : (v5 = 1), !v5))
  {
LABEL_65:
    v13 = CFSTR("star.count.zerostars");
LABEL_66:
    UIKitAccessibilityLocalizedString(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_67;
  }
  if (a3 < 0.375 && a3 >= 0.125)
    goto LABEL_62;
  if (a3 < 0.625 && a3 >= 0.375)
    goto LABEL_78;
  if (a3 < 0.875 && a3 >= 0.625)
    goto LABEL_77;
  if (a3 < 1.125 && a3 >= 0.875)
    goto LABEL_81;
  if (a3 < 1.375 && a3 >= 1.125)
    goto LABEL_84;
  if (a3 < 1.625 && a3 >= 1.375)
    goto LABEL_87;
  if (a3 < 1.875 && a3 >= 1.625)
    goto LABEL_90;
  if (a3 < 2.125 && a3 >= 1.875)
    goto LABEL_93;
  if (a3 < 2.375 && a3 >= 2.125)
    goto LABEL_96;
  if (a3 < 2.625 && a3 >= 2.375)
    goto LABEL_99;
  if (a3 < 2.875 && a3 >= 2.625)
    goto LABEL_102;
  if (a3 < 3.125 && a3 >= 2.875)
    goto LABEL_105;
  if (a3 < 3.375 && a3 >= 3.125)
    goto LABEL_108;
  if (a3 < 3.625 && a3 >= 3.375)
    goto LABEL_111;
  if (a3 < 3.875 && a3 >= 3.625)
    goto LABEL_114;
  if (a3 < 4.125 && a3 >= 3.875)
    goto LABEL_117;
  if (a3 < 4.375 && a3 >= 4.125)
    goto LABEL_120;
  if (a3 < 4.625 && a3 >= 4.375)
    goto LABEL_123;
  if (a3 >= 4.875 || a3 < 4.625)
  {
    if (a3 >= 5.125 || a3 < 4.875)
    {
LABEL_130:
      UIAXFormatInteger((uint64_t)a3);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_67:
      v10 = (void *)v14;
      v11 = 1;
      if (a1)
        goto LABEL_68;
      goto LABEL_64;
    }
LABEL_129:
    v13 = CFSTR("star.count.five");
    goto LABEL_66;
  }
LABEL_126:
  v9 = CFSTR("star.count.fourandthreequarters");
LABEL_63:
  UIKitAccessibilityLocalizedString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 2;
  if (a1)
  {
LABEL_68:
    v15 = (void *)MEMORY[0x1E0CB3940];
    UIKitAccessibilityLocalizedString(CFSTR("star.verbose.count.format"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a3;
    UIAXFormatFloat(v11, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v16, v18, a1);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_69;
  }
LABEL_64:
  v12 = v10;
LABEL_69:

  return v12;
}

id UIAXStarRatingStringForRatingWithGranularity(int a1, double a2)
{
  return UIAXStarRatingStringForRatingWithMaxRatingGranularity(0, a1, a2);
}

id UIAXStarRatingStringForRatingWithMaxRating(uint64_t a1, double a2)
{
  return UIAXStarRatingStringForRatingWithMaxRatingGranularity(a1, 1, a2);
}

id UIAXStarRatingStringForRating(double a1)
{
  return UIAXStarRatingStringForRatingWithMaxRatingGranularity(0, 1, a1);
}

id UIAXPriceRangeRating(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = a1;
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UnicodeHex.%04hx"), objc_msgSend(v2, "characterAtIndex:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VOTBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXNSLocalizedStringForLocale();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  UIKitAccessibilityLocalizedString(CFSTR("price.range.output"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "length");

  AXFormatInteger();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id UIAccessibilityGetKeyboardLayoutStar()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "safeValueForKey:", CFSTR("_layout"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("UIKeyboardLayoutStar"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _AXAssert();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void UIAccessibilityPerformBlockForOrientationChange(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a1;
  v3 = a2;
  objc_msgSend(v8, "_accessibilityWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  objc_msgSend(v8, "_accessibilityValueForKey:", CFSTR("__accessibilityLastSeenInterfaceOrientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v8, "_accessibilityIntegerValueForKey:", CFSTR("__accessibilityLastSeenInterfaceOrientation")) != v6)
    {
      objc_msgSend(v8, "_accessibilitySetIntegerValue:forKey:", v6, CFSTR("__accessibilityLastSeenInterfaceOrientation"));
      v3[2](v3);
    }
  }
  else
  {
    objc_msgSend(v8, "_accessibilitySetIntegerValue:forKey:", v6, CFSTR("__accessibilityLastSeenInterfaceOrientation"));
  }

}

void UIAccessibilityConvertRectToPortraitCoordinates()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");

}

uint64_t UIAccessibilityViewHasHiddenOrZeroAlphaAncestor(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    while (!v4 || v7 != v4)
    {
      if ((objc_msgSend(v7, "isHidden") & 1) != 0 || (objc_msgSend(v7, "alpha"), v8 < 2.22044605e-16))
      {
        v9 = 1;
        goto LABEL_12;
      }
      objc_msgSend(v7, "superview");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v9;
      if (!v9)
        goto LABEL_12;
    }
    v9 = 0;
    v7 = v4;
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id AXUIKeyboardEntryNotificationBlockTimer()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)_UnblockTimer;
  if (!_UnblockTimer)
  {
    v1 = objc_alloc(MEMORY[0x1E0CF3978]);
    v2 = objc_msgSend(v1, "initWithTargetSerialQueue:", MEMORY[0x1E0C80D38]);
    v3 = (void *)_UnblockTimer;
    _UnblockTimer = v2;

    v0 = (void *)_UnblockTimer;
  }
  return v0;
}

void AXUIUnblockKeyboardEntryNotifications()
{
  void *v0;
  NSObject *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  UIAccessibilityNotifications v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BYTE v26[12];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)_UnblockTimer, "cancel");
  _UIAccessibilityNotificationsBlocked();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogUIA();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v38 = objc_msgSend(v0, "count");
    _os_log_impl(&dword_19D0DD000, v1, OS_LOG_TYPE_INFO, "Finished keyboard task, unblocking notifications[%d]", buf, 8u);
  }

  _UIAccessibilityUnblockPostingOfAllNotifications();
  if (objc_msgSend(v0, "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v3 = v0;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    v25 = v0;
    if (v4)
    {
      v5 = v4;
      *(_DWORD *)&v26[8] = 0;
      v6 = 0;
      v7 = *(_QWORD *)v32;
      *(_QWORD *)v26 = *MEMORY[0x1E0CEB0A8];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("notification"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "unsignedIntValue");

          if (v11 == UIAccessibilitySelectionChangedNotification)
          {
            v12 = v9;

            v6 = v12;
          }
          else if (v11 == UIAccessibilityValueChangedNotification)
          {
            v13 = v9;

            *(_QWORD *)&v26[4] = v13;
          }
          else if (v11 != *(_DWORD *)v26)
          {
            objc_msgSend(v2, "addObject:", v9);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v5);

      if (v6)
        objc_msgSend(v2, "insertObject:atIndex:", v6, 0);
      v24 = v6;
      if (*(_QWORD *)&v26[4])
        objc_msgSend(v2, "insertObject:atIndex:", *(_QWORD *)&v26[4], 0);
      else
        *(_QWORD *)&v26[4] = 0;
    }
    else
    {

      *(_QWORD *)&v26[4] = 0;
      v24 = 0;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v2;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("notification"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "unsignedIntValue");

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("notificationData"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("associatedObject"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          _UIAccessibilitySetAssociatedElementContextForNextNotification(v23);
          UIAccessibilityPostNotification(v21, v22);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v16);
    }

    v0 = v25;
  }

}

uint64_t AXSelectionModeVoiceOverSelectionMovement()
{
  return AXIsVoiceOverSelectionMovement;
}

uint64_t AXSetSelectionModeVoiceOverSelectionMovement(uint64_t result)
{
  AXIsVoiceOverSelectionMovement = result;
  return result;
}

uint64_t AccessibilitySharedSupportLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!AccessibilitySharedSupportLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E3DFF7C8;
    v3 = 0;
    AccessibilitySharedSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilitySharedSupportLibraryCore_frameworkLibrary)
    AccessibilitySharedSupportLibrary_cold_1(&v1);
  return AccessibilitySharedSupportLibraryCore_frameworkLibrary;
}

char *OUTLINED_FUNCTION_0_3()
{
  return dlerror();
}

void AXUIAutomationHandleKeyComplete(__CFString *a1, __CFString *a2, void *a3)
{
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("event");
  v16[1] = CFSTR("ModifiedInput");
  v5 = &stru_1E3E01CE0;
  if (a1)
    v6 = a1;
  else
    v6 = &stru_1E3E01CE0;
  v17[0] = CFSTR("KeyEventComplete");
  v17[1] = v6;
  if (a2)
    v5 = a2;
  v16[2] = CFSTR("UnmodifiedInput");
  v16[3] = CFSTR("ModifierFlags");
  v7 = &unk_1E3E10958;
  if (a3)
    v7 = a3;
  v17[2] = v5;
  v17[3] = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a3;
  v10 = a2;
  v11 = a1;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogUIA();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_19D0DD000, v13, OS_LOG_TYPE_INFO, "Posting key notification: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  UIAccessibilityPostNotification(0xFA2u, v12);
}

uint64_t _UIAXAutomationIgnoreLogging()
{
  if (_UIAXAutomationIgnoreLogging_onceToken != -1)
    dispatch_once(&_UIAXAutomationIgnoreLogging_onceToken, &__block_literal_global_11);
  return _UIAXAutomationIgnoreLogging_IgnoreLogging;
}

id _accessibilityAttributesForObject(void *a1, void *a2, unint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  BOOL v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  unsigned int v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _QWORD v61[4];
  id v62;
  id v63;
  unint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = v9;
  v49 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v49)
  {
    v47 = 0;
    v12 = *(_QWORD *)v53;
    v48 = *(_QWORD *)v53;
    v43 = v10;
    v44 = v8;
    v42 = a4;
    v46 = v11;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v53 != v12)
          objc_enumerationMutation(v11);
        v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1A1ADCDB4]();
        v51 = v14;
        v16 = objc_msgSend(v14, "integerValue");
        objc_msgSend(v8, "_iosAccessibilityAttributeValue:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          objc_opt_class();
          v50 = v15;
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "count") > a3)
          {
            v19 = v18;
            v20 = v47;
            if (!v47)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v20;
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v51);

            v18 = v19;
            if (objc_msgSend(v19, "count") > a3)
            {
              objc_msgSend(v19, "subarrayWithRange:", 0, a3);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v12 = v48;
          }
          UIAXRuntimeConvertOutgoingValue(v16, v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
            v24 = (_DWORD)a4 == 0;
          else
            v24 = 1;
          if (!v24)
          {
            v25 = v22;
            v26 = v11;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v25, "count"));
              v23 = (id)objc_claimAutoreleasedReturnValue();
              v56 = 0u;
              v57 = 0u;
              v58 = 0u;
              v59 = 0u;
              v45 = v25;
              v27 = v25;
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v57;
                do
                {
                  for (j = 0; j != v29; ++j)
                  {
                    if (*(_QWORD *)v57 != v30)
                      objc_enumerationMutation(v27);
                    _fetchAttributesIfNecessary(*(void **)(*((_QWORD *)&v56 + 1) + 8 * j), v26, a3);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v32)
                      objc_msgSend(v23, "addObject:", v32);

                  }
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
                }
                while (v29);
              }

              v10 = v43;
              v8 = v44;
              a4 = v42;
              v12 = v48;
              v25 = v45;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v61[0] = MEMORY[0x1E0C809B0];
                v61[1] = 3221225472;
                v61[2] = ___fetchAttributesForAllAXUIElementsInOutgoingValue_block_invoke;
                v61[3] = &unk_1E3DFF8D8;
                v62 = v26;
                v64 = a3;
                v34 = v33;
                v63 = v34;
                objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v61);
                v35 = a4;
                v36 = v10;
                v37 = v25;
                v38 = v63;
                v39 = v34;
                v12 = v48;
                v23 = v39;

                v25 = v37;
                v10 = v36;
                a4 = v35;
                v8 = v44;

              }
              else
              {
                _fetchAttributesIfNecessary(v25, v26, a3);
                v23 = (id)objc_claimAutoreleasedReturnValue();
              }
            }

            v11 = v46;
          }
          if (v23)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, v51);

          v15 = v50;
        }
        objc_autoreleasePoolPop(v15);
      }
      v49 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v49);
  }
  else
  {
    v47 = 0;
  }

  if (a5)
    *a5 = objc_retainAutorelease(v47);

  return v10;
}

id _fetchAttributesIfNecessary(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  CFTypeID v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v15;

  v5 = a1;
  v6 = a2;
  v7 = CFGetTypeID(v5);
  if (v7 == AXUIElementGetTypeID())
  {
    _UIAXElementForAXUIElementRef();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      v15 = 0;
      _accessibilityAttributesForObject(v8, v6, a3, 0, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, CFSTR("UIAccessibilitySnapshotKeyElement"));
        AXLogUIA();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          _fetchAttributesIfNecessary_cold_1();

        objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("UIAccessibilitySnapshotKeyAttributes"));
        if (v11)
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("UIAccessibilitySnapshotKeyAttributeArrayCounts"));
      }
      else
      {
        v12 = v5;
      }

    }
    else
    {
      v12 = v5;
    }

  }
  else
  {
    v12 = v5;
  }

  return v12;
}

void ___fetchAttributesForAllAXUIElementsInOutgoingValue_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  _fetchAttributesIfNecessary(a3, *(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v6);

}

void ___accessibilityPluginPostProcessAutomationData_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  AXAccessibilityBundlesDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("UIAutomationSnapshotProcessing.bundle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v3 = objc_msgSend(v2, "loadAndReturnError:", &v15);
  v4 = v15;
  if (!v3)
  {
    AXLogUIA();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      ___accessibilityPluginPostProcessAutomationData_block_invoke_cold_2((uint64_t)v1, (uint64_t)v4, v7);
    goto LABEL_8;
  }
  v5 = objc_alloc_init((Class)objc_msgSend(v2, "principalClass"));
  v6 = (void *)_accessibilityPluginPostProcessAutomationData_Processor;
  _accessibilityPluginPostProcessAutomationData_Processor = (uint64_t)v5;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    AXLogUIA();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___accessibilityPluginPostProcessAutomationData_block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_8:

    goto LABEL_9;
  }
  _accessibilityPluginPostProcessAutomationData_Loaded = 1;
LABEL_9:

}

void ___defaultSnapshotAttributes_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E3E10E70, "copy");
  v1 = (void *)_defaultSnapshotAttributes_defaultAttributes;
  _defaultSnapshotAttributes_defaultAttributes = v0;

}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_6_0(void *a1)
{
  return a1;
}

void sub_19D1324B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_19D133608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, id *a13, uint64_t a14, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id a44)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a44);
  _Unwind_Resume(a1);
}

void sub_19D135C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSCRCMathExpressionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ScreenReaderCoreLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E3DFFAC8;
    v5 = 0;
    ScreenReaderCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ScreenReaderCoreLibraryCore_frameworkLibrary)
    __getSCRCMathExpressionClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SCRCMathExpression");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSCRCMathExpressionClass_block_invoke_cold_2();
  getSCRCMathExpressionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19D137A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id UIAccessibilityBundle()
{
  if (UIAccessibilityBundle_onceToken != -1)
    dispatch_once(&UIAccessibilityBundle_onceToken, &__block_literal_global_18);
  return (id)UIAccessibilityBundle_UIAXBundle;
}

void _AXServerCacheGetPossiblyNilObjectForKey_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19D0DD000, log, OS_LOG_TYPE_ERROR, "Getting AXServerCache with a nil object pointer!", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void _UIAccessibilityStart_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19D0DD000, a2, a3, "unable to start accessibility server. error=%d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _UIAccessibilityStop_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19D0DD000, a2, a3, "unable to stop accessibility server. error=%d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __getGCExtendedGamepadClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getGCExtendedGamepadClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIAccessibilityGameController.m"), 20, CFSTR("Unable to find class %s"), "GCExtendedGamepad");

  __break(1u);
}

void GameControllerLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *GameControllerLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIAccessibilityGameController.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getGCControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getGCControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIAccessibilityGameController.m"), 19, CFSTR("Unable to find class %s"), "GCController");

  __break(1u);
}

void __getLGRRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLGRRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NSObjectAccessibility.m"), 94, CFSTR("Unable to find class %s"), "LGRRequest");

  __break(1u);
}

void LookingGlassRuntimeSupportLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LookingGlassRuntimeSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("NSObjectAccessibility.m"), 92, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLGRRuntimeManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLGRRuntimeManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NSObjectAccessibility.m"), 93, CFSTR("Unable to find class %s"), "LGRRuntimeManager");

  __break(1u);
}

void __getTinkerRuntimeClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AXTinkerKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("NSObjectAccessibility.m"), 102, CFSTR("%s"), *a1);

  __break(1u);
}

void __getTinkerRuntimeClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTinkerRuntimeClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NSObjectAccessibility.m"), 103, CFSTR("Unable to find class %s"), "TinkerRuntime");

  __break(1u);
}

void _UIAXBroadcastMainThread_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19D0DD000, log, OS_LOG_TYPE_DEBUG, "Unit test callback sending", v1, 2u);
}

void AXSSTextualContextFromUITextualContext_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAXSSVoiceOverTextualContextWordProcessing(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("UIKitAccessibility.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_0_3());

  __break(1u);
}

void AXSSTextualContextFromUITextualContext_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAXSSVoiceOverTextualContextSpreadsheet(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("UIKitAccessibility.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_0_3());

  __break(1u);
}

void AXSSTextualContextFromUITextualContext_cold_3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAXSSVoiceOverTextualContextSourceCode(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("UIKitAccessibility.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_0_3());

  __break(1u);
}

void AXSSTextualContextFromUITextualContext_cold_4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAXSSVoiceOverTextualContextConsole(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("UIKitAccessibility.m"), 42, CFSTR("%s"), OUTLINED_FUNCTION_0_3());

  __break(1u);
}

void AXSSTextualContextFromUITextualContext_cold_5()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAXSSVoiceOverTextualContextFileSystem(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("UIKitAccessibility.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_0_3());

  __break(1u);
}

void getAXSSVoiceOverTextualContextNarrative_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAXSSVoiceOverTextualContextNarrative(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("UIKitAccessibility.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0_3());

  __break(1u);
}

void getAXSSVoiceOverTextualContextMessaging_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAXSSVoiceOverTextualContextMessaging(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("UIKitAccessibility.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_0_3());

  __break(1u);
}

void AccessibilitySharedSupportLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccessibilitySharedSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIKitAccessibility.m"), 30, CFSTR("%s"), *a1);

  __break(1u);
}

void _fetchAttributesIfNecessary_cold_1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_10();
  v0 = (id)OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_19D0DD000, v1, v2, "Set snapshot element %{private}@ for outgoing value %{private}@", v3, v4, v5, v6, 3u);

  OUTLINED_FUNCTION_8();
}

void ___accessibilityPluginPostProcessAutomationData_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, a1, a3, "%{public}@ needs to implement: processSnapshot:options:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void ___accessibilityPluginPostProcessAutomationData_block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_19D0DD000, log, OS_LOG_TYPE_DEBUG, "Could not load: %{public}@ %public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __getSCRCMathExpressionClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ScreenReaderCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIAccessibilityMathExpression.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSCRCMathExpressionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSCRCMathExpressionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIAccessibilityMathExpression.m"), 17, CFSTR("Unable to find class %s"), "SCRCMathExpression");

  __break(1u);
  AXAccessibilityBundlesDirectory();
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x1E0CF3040]();
}

uint64_t AXAccessibilityMacCatalystBundlesDirectory()
{
  return MEMORY[0x1E0CF3048]();
}

uint64_t AXArrayForString()
{
  return MEMORY[0x1E0CF3F28]();
}

uint64_t AXAttributeAllowsRequeryWhenRemoteElementFails()
{
  return MEMORY[0x1E0CF3F30]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x1E0CF3058]();
}

uint64_t AXCRemapLanguageCodeToFallbackIfNeccessary()
{
  return MEMORY[0x1E0CF3078]();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x1E0CF4940]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x1E0CF30B0]();
}

uint64_t AXConvertIncomingValue()
{
  return MEMORY[0x1E0CF3F80]();
}

uint64_t AXConvertOutgoingValue()
{
  return MEMORY[0x1E0CF3F88]();
}

uint64_t AXConvertPointFromHostedCoordinates()
{
  return MEMORY[0x1E0CF3F90]();
}

uint64_t AXDeviceGetMainScreenBounds()
{
  return MEMORY[0x1E0CF4D40]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x1E0CF3100]();
}

uint64_t AXDeviceIsWatch()
{
  return MEMORY[0x1E0CF3128]();
}

uint64_t AXDevicePrimeDisplayManager()
{
  return MEMORY[0x1E0CF4D50]();
}

uint64_t AXDisallowsUIBasedAccessibilityFeatures()
{
  return MEMORY[0x1E0DDD468]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x1E0CF3F98]();
}

uint64_t AXFormatFloat()
{
  return MEMORY[0x1E0CF3158]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x1E0CF3160]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x1E0CF3168]();
}

uint64_t AXGuaranteedMutableArray()
{
  return MEMORY[0x1E0CF3180]();
}

uint64_t AXInternalAccessibilityBundlesDirectory()
{
  return MEMORY[0x1E0CF3190]();
}

uint64_t AXIsBuddyCompleted()
{
  return MEMORY[0x1E0CF31A0]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x1E0CF31A8]();
}

uint64_t AXLabelAndValueForElements()
{
  return MEMORY[0x1E0CF3FD8]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x1E0CF3FE0]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x1E0CF31B8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1E0CF31F8]();
}

uint64_t AXLogDragging()
{
  return MEMORY[0x1E0CF3208]();
}

uint64_t AXLogElementTraversal()
{
  return MEMORY[0x1E0CF3210]();
}

uint64_t AXLogFocusEngine()
{
  return MEMORY[0x1E0CF3220]();
}

uint64_t AXLogHitTest()
{
  return MEMORY[0x1E0CF3230]();
}

uint64_t AXLogLoading()
{
  return MEMORY[0x1E0CF3248]();
}

uint64_t AXLogOpaqueElements()
{
  return MEMORY[0x1E0CF3260]();
}

uint64_t AXLogScrollToVisible()
{
  return MEMORY[0x1E0CF3288]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x1E0CF32A8]();
}

uint64_t AXLogUI()
{
  return MEMORY[0x1E0CF3300]();
}

uint64_t AXLogUIA()
{
  return MEMORY[0x1E0CF3308]();
}

uint64_t AXLogValidations()
{
  return MEMORY[0x1E0CF3318]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x1E0CF3320]();
}

uint64_t AXMIntersectionOverUnion()
{
  return MEMORY[0x1E0CF3F00]();
}

uint64_t AXMediaLogMLElement()
{
  return MEMORY[0x1E0CF3378]();
}

uint64_t AXNSLocalizedStringForLocale()
{
  return MEMORY[0x1E0DDD480]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x1E0CF33D0]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x1E0CF33D8]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x1E0CF33E0]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x1E0CF33E8]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x1E0CF33F8]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x1E0CF3400]();
}

uint64_t AXProcessCanContactSystemWideServer()
{
  return MEMORY[0x1E0CF3FE8]();
}

uint64_t AXProcessIsAXUIServer()
{
  return MEMORY[0x1E0CF3410]();
}

uint64_t AXProcessIsAssistiveTouch()
{
  return MEMORY[0x1E0CF3418]();
}

uint64_t AXProcessIsChronod()
{
  return MEMORY[0x1E0CF3430]();
}

uint64_t AXProcessIsCommandAndControl()
{
  return MEMORY[0x1E0CF3438]();
}

uint64_t AXProcessIsMobileMail()
{
  return MEMORY[0x1E0CF3448]();
}

uint64_t AXProcessIsPosterBoard()
{
  return MEMORY[0x1E0CF3450]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x1E0CF3468]();
}

uint64_t AXProcessIsSystemApplication()
{
  return MEMORY[0x1E0CF3470]();
}

uint64_t AXPushNotificationToSystemForBroadcast()
{
  return MEMORY[0x1E0CF3FF0]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x1E0CF3FF8]();
}

uint64_t AXRuntimeLogCommon()
{
  return MEMORY[0x1E0CF34D8]();
}

uint64_t AXRuntimeLogNotifications()
{
  return MEMORY[0x1E0CF34E0]();
}

uint64_t AXSAssistiveTouchCursorColor()
{
  return MEMORY[0x1E0CF34F8]();
}

uint64_t AXSSAccessibilityDescriptionForSymbolName()
{
  return MEMORY[0x1E0CF4768]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x1E0CF37B0]();
}

uint64_t AXShouldLogValidationErrors()
{
  return MEMORY[0x1E0CF37C8]();
}

uint64_t AXUIAllKeyboardWindows()
{
  return MEMORY[0x1E0CF4948]();
}

uint64_t AXUIApplicationWindows()
{
  return MEMORY[0x1E0CF4950]();
}

uint64_t AXUIConvertPointFromScreenToContextSpace()
{
  return MEMORY[0x1E0CF4958]();
}

uint64_t AXUIConvertRectFromScreenToContextSpace()
{
  return MEMORY[0x1E0CF4960]();
}

AXError AXUIElementCopyAttributeValue(AXUIElementRef element, CFStringRef attribute, CFTypeRef *value)
{
  return MEMORY[0x1E0CF4078](element, attribute, value);
}

AXError AXUIElementCopyParameterizedAttributeValue(AXUIElementRef element, CFStringRef parameterizedAttribute, CFTypeRef parameter, CFTypeRef *result)
{
  return MEMORY[0x1E0CF4080](element, parameterizedAttribute, parameter, result);
}

AXUIElementRef AXUIElementCreateSystemWide(void)
{
  return (AXUIElementRef)MEMORY[0x1E0CF4088]();
}

CFTypeID AXUIElementGetTypeID(void)
{
  return MEMORY[0x1E0CF4090]();
}

uint64_t AXUIKeyboardIsOnScreen()
{
  return MEMORY[0x1E0CF4968]();
}

uint64_t AXUIKeyboardScreenFrame()
{
  return MEMORY[0x1E0CF4970]();
}

uint64_t AXUIKeyboardWindow()
{
  return MEMORY[0x1E0CF4978]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x1E0CF4098](*(_QWORD *)&theType, valuePtr);
}

uint64_t AX_CGPathEnumerateElementsUsingBlock()
{
  return MEMORY[0x1E0CF4E30]();
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x1E0CF4E38]();
}

uint64_t AX_CGRectAlmostEqualToRect()
{
  return MEMORY[0x1E0CF4E40]();
}

uint64_t AX_CGRectBySubtractingRect()
{
  return MEMORY[0x1E0CF4E48]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x1E0CF4E50]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x1E0C92158](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

uint64_t BSGetVersionedPID()
{
  return MEMORY[0x1E0D01320]();
}

uint64_t CALayerGetDelegate()
{
  return MEMORY[0x1E0CD24F0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1E0C9BD38]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1E0C9D318](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1E0C9D448](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFrameCopyVisibleString()
{
  return MEMORY[0x1E0CA7D98]();
}

CFTypeID CTFrameGetTypeID(void)
{
  return MEMORY[0x1E0CA7DC0]();
}

uint64_t GSEventCreateWithEventRecord()
{
  return MEMORY[0x1E0D27AF0]();
}

uint64_t GSEventGetLocationInWindow()
{
  return MEMORY[0x1E0D27B18]();
}

uint64_t MACaptionAppearanceSetDidDisplayCaptionsCallback()
{
  return MEMORY[0x1E0CC1C08]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x1E0CB3038]();
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1E0CB3118](namestr);
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x1E0CB3120]();
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0CEA108]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t UIAXFileTypeDescriptionForFileExtension()
{
  return MEMORY[0x1E0CF3F20]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CEAFE0](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1E0CEB020]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1E0CEB038]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1E0CEB048]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x1E0CEB080](*(_QWORD *)&notification, argument);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0CEB480]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0CEB628]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

uint64_t UIImageGetNavigationBarBackArrow()
{
  return MEMORY[0x1E0CEB670]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0CEB688](image);
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0CEBB28]();
}

uint64_t VOTBundle()
{
  return MEMORY[0x1E0DBEF98]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x1E0CF3A38]();
}

uint64_t _AXCreateAXUIElementWithElement()
{
  return MEMORY[0x1E0CF4330]();
}

uint64_t _AXElementForAXUIElementUniqueId()
{
  return MEMORY[0x1E0CF4338]();
}

uint64_t _AXIgnoreNextNotification()
{
  return MEMORY[0x1E0CF4340]();
}

uint64_t _AXInitializeSafeSwiftValueSupport()
{
  return MEMORY[0x1E0CF3A40]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x1E0CF3A48]();
}

uint64_t _AXNextIgnoredNotification()
{
  return MEMORY[0x1E0CF4348]();
}

uint64_t _AXRetrieveExistingAXUIElementWithElement()
{
  return MEMORY[0x1E0CF4350]();
}

uint64_t _AXSAccessibilityPreferenceDomain()
{
  return MEMORY[0x1E0DDD4E0]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x1E0DDD550]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x1E0DDD588]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x1E0DDD5E8]();
}

uint64_t _AXSAutomationLocalizedStringLookupInfoEnabled()
{
  return MEMORY[0x1E0DDD608]();
}

uint64_t _AXSAutomationPreferredLocalization()
{
  return MEMORY[0x1E0DDD618]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x1E0DDD980]();
}

uint64_t _AXSMossdeepEnabled()
{
  return MEMORY[0x1E0DDDA68]();
}

uint64_t _AXSVoiceOverTouchCopyLanguageRotorItems()
{
  return MEMORY[0x1E0DDDDD0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1E0DDDDE0]();
}

uint64_t _AXSVoiceOverTouchSetEnabledAppTemporaryOverride()
{
  return MEMORY[0x1E0DDDE50]();
}

uint64_t _AXSetApplicationElementHandler()
{
  return MEMORY[0x1E0CF4358]();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason()
{
  return MEMORY[0x1E0CF4360]();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason()
{
  return MEMORY[0x1E0CF4368]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x1E0CF3A50]();
}

uint64_t _AXTraitsAsString()
{
  return MEMORY[0x1E0CF4370]();
}

uint64_t _AXUIElementCopyElementAtPositionWithParams()
{
  return MEMORY[0x1E0CF4378]();
}

uint64_t _AXUIElementCreateAppElementWithPid()
{
  return MEMORY[0x1E0CF4380]();
}

uint64_t _AXUIElementCreateData()
{
  return MEMORY[0x1E0CF4388]();
}

uint64_t _AXUIElementCreateWithPIDAndID()
{
  return MEMORY[0x1E0CF4390]();
}

uint64_t _AXUIElementRegisterServerWithRunLoop()
{
  return MEMORY[0x1E0CF4398]();
}

uint64_t _AXUIElementRegisterSystemWideServerWithRunLoop()
{
  return MEMORY[0x1E0CF43A0]();
}

uint64_t _AXUIElementSetElementBeingHitTested()
{
  return MEMORY[0x1E0CF43A8]();
}

uint64_t _AXUIElementSetMachPortForNextMessage()
{
  return MEMORY[0x1E0CF43B0]();
}

uint64_t _AXUIElementUnregisterServer()
{
  return MEMORY[0x1E0CF43B8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1E0C9A260]();
}

uint64_t _GSEventGetGSEventRecord()
{
  return MEMORY[0x1E0D27C88]();
}

uint64_t _UIAXAssignFocusToItem()
{
  return MEMORY[0x1E0CEBE78]();
}

uint64_t _UIAXElementForAXUIElementRef()
{
  return MEMORY[0x1E0CF43C0]();
}

uint64_t _UIAccessibilitySetBroadcastCallback()
{
  return MEMORY[0x1E0CEBE88]();
}

uint64_t _UIAccessibilitySetConvertAccessibilityPathToViewCallback()
{
  return MEMORY[0x1E0CEBE90]();
}

uint64_t _UIAccessibilitySetConvertFrameCallback()
{
  return MEMORY[0x1E0CEBE98]();
}

uint64_t _UIAccessibilitySetConvertPathCallback()
{
  return MEMORY[0x1E0CEBEA0]();
}

uint64_t _UIAccessibilitySetFocusedElementCallback()
{
  return MEMORY[0x1E0CEBEA8]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1E0CEBEE0]();
}

uint64_t _UIConvertPointFromOrientationToOrientation()
{
  return MEMORY[0x1E0CEBF38]();
}

uint64_t _UIConvertRectFromOrientationToOrientation()
{
  return MEMORY[0x1E0CEBF40]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __AXRuntimeApplicationElement()
{
  return MEMORY[0x1E0CF43C8]();
}

uint64_t __AXStringForVariablesWithVariadics()
{
  return MEMORY[0x1E0CF43D8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x1E0CF3A58]();
}

uint64_t __UIAccessibilityCastAsProtocol()
{
  return MEMORY[0x1E0CF3A60]();
}

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x1E0CF3A68]();
}

uint64_t __UIAccessibilityGetAssociatedCGPoint()
{
  return MEMORY[0x1E0CF3A70]();
}

uint64_t __UIAccessibilityGetAssociatedInt()
{
  return MEMORY[0x1E0CF3A78]();
}

uint64_t __UIAccessibilityGetAssociatedNonRetainedObject()
{
  return MEMORY[0x1E0CF3A80]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x1E0CF3A88]();
}

uint64_t __UIAccessibilityGetAssociatedUnsignedInteger()
{
  return MEMORY[0x1E0CF3A90]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x1E0CF3A98]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x1E0CF3AA0]();
}

uint64_t __UIAccessibilitySetAssociatedCGPoint()
{
  return MEMORY[0x1E0CF3AA8]();
}

uint64_t __UIAccessibilitySetAssociatedCopiedObject()
{
  return MEMORY[0x1E0CF3AB0]();
}

uint64_t __UIAccessibilitySetAssociatedInt()
{
  return MEMORY[0x1E0CF3AB8]();
}

uint64_t __UIAccessibilitySetAssociatedNonRetainedObject()
{
  return MEMORY[0x1E0CF3AC0]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x1E0CF3AC8]();
}

uint64_t __UIAccessibilitySetAssociatedUnsignedInteger()
{
  return MEMORY[0x1E0CF3AD0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1E0DE7AF0](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x1E0DE7B48](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

