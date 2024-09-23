@implementation VOSCommandProfile

- (VOSCommandProfile)initWithProfileProperties:(id)a3 overlayProperties:(id)a4
{
  void *v5;
  VOSCommandProfile *v6;

  +[VOSCommandProfile _parseProfileProperties:overlayProperties:](VOSCommandProfile, "_parseProfileProperties:overlayProperties:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VOSCommandProfile _initWithModes:](self, "_initWithModes:", v5);

  return v6;
}

- (id)_initWithModes:(id)a3
{
  id v5;
  VOSCommandProfile *v6;
  VOSCommandProfile *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOSCommandProfile;
  v6 = -[VOSCommandProfile init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modes, a3);

  return v7;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  NSMutableSet *obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("VOSCommandProfile:<%p>\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = self->_modes;
  v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v55;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v55 != v34)
          objc_enumerationMutation(obj);
        v36 = v4;
        v5 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v4);
        objc_msgSend(v3, "appendFormat:", CFSTR(" %@\n"), v5);
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v5, "commands");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v51 != v8)
                objc_enumerationMutation(v37);
              v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), v10);
              objc_msgSend(v10, "gestures");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "count");

              if (v12)
              {
                objc_msgSend(v3, "appendString:", CFSTR("   Gestures:\n"));
                v48 = 0u;
                v49 = 0u;
                v46 = 0u;
                v47 = 0u;
                objc_msgSend(v10, "gestures");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
                if (v14)
                {
                  v15 = v14;
                  v16 = *(_QWORD *)v47;
                  do
                  {
                    for (j = 0; j != v15; ++j)
                    {
                      if (*(_QWORD *)v47 != v16)
                        objc_enumerationMutation(v13);
                      objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
                    }
                    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
                  }
                  while (v15);
                }

              }
              objc_msgSend(v10, "keyboardShortcuts");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "count");

              if (v19)
              {
                objc_msgSend(v3, "appendString:", CFSTR("   Keyboard Shortcuts:\n"));
                v44 = 0u;
                v45 = 0u;
                v42 = 0u;
                v43 = 0u;
                objc_msgSend(v10, "keyboardShortcuts");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
                if (v21)
                {
                  v22 = v21;
                  v23 = *(_QWORD *)v43;
                  do
                  {
                    for (k = 0; k != v22; ++k)
                    {
                      if (*(_QWORD *)v43 != v23)
                        objc_enumerationMutation(v20);
                      objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k));
                    }
                    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
                  }
                  while (v22);
                }

              }
              objc_msgSend(v10, "quickNavShortcuts");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "count");

              if (v26)
              {
                objc_msgSend(v3, "appendString:", CFSTR("   QuickNav Shortcuts:\n"));
                v40 = 0u;
                v41 = 0u;
                v38 = 0u;
                v39 = 0u;
                objc_msgSend(v10, "quickNavShortcuts");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
                if (v28)
                {
                  v29 = v28;
                  v30 = *(_QWORD *)v39;
                  do
                  {
                    for (m = 0; m != v29; ++m)
                    {
                      if (*(_QWORD *)v39 != v30)
                        objc_enumerationMutation(v27);
                      objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * m));
                    }
                    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
                  }
                  while (v29);
                }

              }
            }
            v7 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
          }
          while (v7);
        }

        v4 = v36 + 1;
      }
      while (v36 + 1 != v35);
      v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v35);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VOSCommandProfile)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  VOSCommandProfile *v11;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("modes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = -[VOSCommandProfile _initWithModes:](self, "_initWithModes:", v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_modes, CFSTR("modes"));
}

- (id)commandForTouchGesture:(id)a3 withResolver:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  VOSCommandProfile *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[VOSCommandProfile _modifiedGestureRespectingHandednessSetting:](self, "_modifiedGestureRespectingHandednessSetting:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenreaderMode");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode BrailleScreenInput](VOSScreenreaderMode, "BrailleScreenInput");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 != v10)
    goto LABEL_2;
  v28 = objc_msgSend(v6, "bsiTypingMode");

  if (v28 == 1)
  {
    +[VOSGesture horizontalMirrorGestureForGesture:](VOSGesture, "horizontalMirrorGestureForGesture:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;
    if (!v29)
      goto LABEL_3;
    v9 = v29;
    v10 = v7;
    v7 = v9;
LABEL_2:

LABEL_3:
  }
  objc_msgSend(v6, "screenreaderMode");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode Default](VOSScreenreaderMode, "Default");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v12)
    goto LABEL_5;
  v30 = objc_msgSend(v6, "shouldApplyRTL");

  if (v30)
  {
    +[VOSGesture rtlGestureForGesture:](VOSGesture, "rtlGestureForGesture:", v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;
    if (!v31)
      goto LABEL_6;
    v11 = v31;
    v12 = v7;
    v7 = v11;
LABEL_5:

LABEL_6:
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v8, "commands");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v43;
    v35 = v8;
    v36 = v6;
    v37 = v13;
    v33 = self;
    v34 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v18, "gestures");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v39;
          while (2)
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v39 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "gesture");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "isEqual:", v7);

              if (v25)
              {
                objc_msgSend(v18, "command");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (v26)
                {
                  v6 = v36;
                  v13 = v37;
                  if (-[VOSCommandProfile availabilityForCommand:withResolver:](v33, "availabilityForCommand:withResolver:", v26, v36) == 1)
                  {
                    VOTLogCommon();
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      -[VOSCommandProfile commandForTouchGesture:withResolver:].cold.1();

                    v26 = 0;
                    v6 = v36;
                  }
                  v8 = v35;
                }
                else
                {
                  v8 = v35;
                  v6 = v36;
                  v13 = v37;
                }

                goto LABEL_38;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v21)
              continue;
            break;
          }
        }

        v13 = v37;
        v16 = v34;
      }
      v15 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      v26 = 0;
      v8 = v35;
      v6 = v36;
    }
    while (v15);
  }
  else
  {
    v26 = 0;
  }
LABEL_38:

  return v26;
}

- (id)commandForKeyChord:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
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
  int v20;
  void *v21;
  VOSCommandProfile *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  NSObject *v25;
  uint64_t v27;
  VOSCommandProfile *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v8, "commands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v29)
  {
    v10 = *(_QWORD *)v37;
    v30 = v8;
    v31 = v9;
    v27 = *(_QWORD *)v37;
    v28 = self;
    while (1)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v9);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isQuickNavKeyboardMode") & 1) != 0)
          objc_msgSend(v12, "quickNavShortcuts");
        else
          objc_msgSend(v12, "keyboardShortcuts");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (!v15)
          goto LABEL_17;
        v16 = v15;
        v17 = *(_QWORD *)v33;
        while (2)
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v33 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "keyChord");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqual:", v6);

            if (v20)
            {
              if ((objc_msgSend(v12, "hasSecondaryCommands") & 1) != 0)
              {
                v22 = v28;
                -[VOSCommandProfile _resolvedSecondaryCommandForProfileCommand:resolver:](v28, "_resolvedSecondaryCommandForProfileCommand:resolver:", v12, v7);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = v30;
                if (!v21)
                  goto LABEL_26;
                goto LABEL_27;
              }
              objc_msgSend(v7, "resolvingEventOccurredBlock");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              v8 = v30;
              v22 = v28;
              if (v23)
              {
                objc_msgSend(v7, "resolvingEventOccurredBlock");
                v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, _QWORD, id))v24)[2](v24, 0, v7);

              }
LABEL_26:
              objc_msgSend(v12, "command");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
LABEL_27:
                if (-[VOSCommandProfile availabilityForCommand:withResolver:](v22, "availabilityForCommand:withResolver:", v21, v7) == 1)
                {
                  VOTLogCommon();
                  v25 = objc_claimAutoreleasedReturnValue();
                  v9 = v31;
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                    -[VOSCommandProfile commandForTouchGesture:withResolver:].cold.1();

                  v21 = 0;
                  v8 = v30;
                  goto LABEL_32;
                }
              }
              v9 = v31;
LABEL_32:

              goto LABEL_33;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v16)
            continue;
          break;
        }
LABEL_17:

        v9 = v31;
        v10 = v27;
      }
      v21 = 0;
      v8 = v30;
      v29 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (!v29)
        goto LABEL_33;
    }
  }
  v21 = 0;
LABEL_33:

  return v21;
}

- (id)_resolvedSecondaryCommandForProfileCommand:(id)a3 resolver:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "pressCount");
  objc_msgSend(v5, "secondaryCommandsForPressCount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v7 >= 2 && !v9)
  {
    objc_msgSend(v6, "resolvingEventOccurredBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "resolvingEventOccurredBlock");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, id))v11)[2](v11, 1, v6);

    }
    objc_msgSend(v5, "secondaryCommandsForPressCount:", 1);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  if (objc_msgSend(v8, "count"))
  {
    v13 = objc_msgSend(v6, "context");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v25;
LABEL_9:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19);
        if (objc_msgSend(v20, "context", (_QWORD)v24) == v13)
          break;
        if (!objc_msgSend(v20, "context"))
        {
          objc_msgSend(v20, "command");
          v21 = objc_claimAutoreleasedReturnValue();

          v17 = (id)v21;
        }
        if (v16 == ++v19)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v16)
            goto LABEL_9;
          goto LABEL_22;
        }
      }
      objc_msgSend(v20, "command");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        goto LABEL_24;
    }
    else
    {
      v17 = 0;
LABEL_22:

    }
    v17 = v17;
    v22 = v17;
LABEL_24:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)allCommandsWithResolver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t, uint64_t);
  void *v20;
  VOSCommandProfile *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v5, "commands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "command");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  v13 = (void *)MEMORY[0x24BDD1758];
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __45__VOSCommandProfile_allCommandsWithResolver___block_invoke;
  v20 = &unk_24CBAD868;
  v21 = self;
  v22 = v4;
  v14 = v4;
  objc_msgSend(v13, "predicateWithBlock:", &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterUsingPredicate:", v15, v17, v18, v19, v20, v21);

  return v6;
}

BOOL __45__VOSCommandProfile_allCommandsWithResolver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "availabilityForCommand:withResolver:", a2, *(_QWORD *)(a1 + 40)) == 0;
}

- (id)allSiriShortcutCommandsWithResolver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[VOSCommandProfile delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableSiriShortcuts:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

VOSCommand *__57__VOSCommandProfile_allSiriShortcutCommandsWithResolver___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VOSCommand commandWithSiriShortcut:](VOSCommand, "commandWithSiriShortcut:", a2);
}

- (id)allShortcutBindingsWithResolver:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copy");

  +[VOSScreenreaderMode Default](VOSScreenreaderMode, "Default");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScreenreaderMode:", v8);

  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v7);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commands");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
        if ((objc_msgSend(v7, "isQuickNavKeyboardMode") & 1) != 0)
          objc_msgSend(v13, "quickNavShortcuts");
        else
          objc_msgSend(v13, "keyboardShortcuts");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v25;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v25 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "keyChord");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v20);

              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v17);
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)userPresentableAllShortcutBindingsWithResolver:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[VOSCommandProfile allShortcutBindingsWithResolver:](self, "allShortcutBindingsWithResolver:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_203_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __68__VOSCommandProfile_userPresentableAllShortcutBindingsWithResolver___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isFunctionKeyChord");
  v7 = objc_msgSend(v5, "isFunctionKeyChord");
  if (!v6 || v7)
  {
    if ((v6 | v7 ^ 1) == 1)
    {
      objc_msgSend(v4, "keys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reverseObjectEnumerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", &stru_24CBADC48);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "keys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reverseObjectEnumerator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", &stru_24CBADC48);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "keys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lowercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "keys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lowercaseString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v12, "compare:options:", v16, objc_msgSend(v19, "isEqualToString:", v22) ^ 1);
    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)gestureBindingsForCommand:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v9, "commands");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v15, "command");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v6);

        if (v17)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v15, "gestures");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v27 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "gesture");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v23);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v20);
          }

          goto LABEL_18;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_18:

  return v8;
}

- (id)shortcutBindingsForCommand:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v7);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "command");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v6);

        if (v16)
        {
          if ((objc_msgSend(v7, "isQuickNavKeyboardMode") & 1) != 0)
            objc_msgSend(v14, "quickNavShortcuts");
          else
            objc_msgSend(v14, "keyboardShortcuts");
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v26 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "keyChord");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v22);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v19);
          }

          goto LABEL_21;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_21:

  return v8;
}

- (BOOL)commandHasAnyBindings:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[VOSCommandProfile gestureBindingsForCommand:withResolver:](self, "gestureBindingsForCommand:withResolver:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9
    || (-[VOSCommandProfile shortcutBindingsForCommand:withResolver:](self, "shortcutBindingsForCommand:withResolver:", v6, v7), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "count"), v10, v11))
  {
    v12 = 1;
  }
  else
  {
    v14 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v14, "setKeyboardMode:", 1);
    -[VOSCommandProfile shortcutBindingsForCommand:withResolver:](self, "shortcutBindingsForCommand:withResolver:", v6, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v15, "count") != 0;

  }
  return v12;
}

- (unint64_t)availabilityForGesture:(id)a3 withResolver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  int v54;
  BOOL v56;
  uint64_t v57;
  void *v58;
  char v59;
  void *v60;
  char v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "screenreaderMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode Default](VOSScreenreaderMode, "Default");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    +[VOSGesture OneFingerSingleTap](VOSGesture, "OneFingerSingleTap");
    v12 = objc_claimAutoreleasedReturnValue();
    if ((id)v12 == v5)
      goto LABEL_35;
    v13 = (void *)v12;
    +[VOSGesture OneFingerDoubleTap](VOSGesture, "OneFingerDoubleTap");
    v14 = objc_claimAutoreleasedReturnValue();
    if ((id)v14 == v5)
    {

    }
    else
    {
      v15 = (void *)v14;
      +[VOSGesture OneFingerFlickLeft](VOSGesture, "OneFingerFlickLeft");
      v16 = objc_claimAutoreleasedReturnValue();
      if ((id)v16 != v5)
      {
        v17 = (void *)v16;
        +[VOSGesture OneFingerFlickRight](VOSGesture, "OneFingerFlickRight");
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (v18 == v5)
          goto LABEL_40;
        +[VOSGesture TwoFingerSingleTapAndHold](VOSGesture, "TwoFingerSingleTapAndHold");
        v19 = (id)objc_claimAutoreleasedReturnValue();

        if (v19 == v5)
          goto LABEL_40;
        +[VOSGesture OneFingerSingleTapAndHold](VOSGesture, "OneFingerSingleTapAndHold");
        v20 = objc_claimAutoreleasedReturnValue();
        if ((id)v20 == v5)
        {
LABEL_60:

          goto LABEL_68;
        }
        v21 = (void *)v20;
        +[VOSGesture OneFingerDoubleTapAndHold](VOSGesture, "OneFingerDoubleTapAndHold");
        v22 = objc_claimAutoreleasedReturnValue();
        if ((id)v22 == v5)
        {

        }
        else
        {
          v23 = (void *)v22;
          +[VOSGesture TwoFingerDoubleTapAndHold](VOSGesture, "TwoFingerDoubleTapAndHold");
          v24 = objc_claimAutoreleasedReturnValue();
          if ((id)v24 == v5)
          {

          }
          else
          {
            v25 = (void *)v24;
            +[VOSGesture ThreeFingerSingleTapAndHold](VOSGesture, "ThreeFingerSingleTapAndHold");
            v26 = objc_claimAutoreleasedReturnValue();
            if ((id)v26 != v5)
            {
              v27 = (void *)v26;
              +[VOSGesture ThreeFingerDoubleTapAndHold](VOSGesture, "ThreeFingerDoubleTapAndHold");
              v28 = (id)objc_claimAutoreleasedReturnValue();

              if (v28 == v5)
              {
LABEL_68:
                v11 = 2;
LABEL_41:
                if ((objc_msgSend(v6, "isIPad") & 1) == 0)
                {
                  +[VOSGesture fiveFingerGestures](VOSGesture, "fiveFingerGestures");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v48, "containsObject:", v5);

                  if (v49)
                    v11 = 2;
                }
                +[VOSGesture oneFingerSplitGestures](VOSGesture, "oneFingerSplitGestures");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v50, "containsObject:", v5))
                  goto LABEL_50;
                +[VOSGesture twoFingerSplitGestures](VOSGesture, "twoFingerSplitGestures");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v51, "containsObject:", v5);

                if ((v52 & 1) != 0)
                  goto LABEL_51;
LABEL_58:
                if (v11 != -1)
                  goto LABEL_52;
                goto LABEL_4;
              }
              +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickLeft");
              v29 = objc_claimAutoreleasedReturnValue();
              if ((id)v29 != v5)
              {
                v30 = (void *)v29;
                +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickRight");
                v31 = (id)objc_claimAutoreleasedReturnValue();

                if (v31 != v5)
                {
                  +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickUp");
                  v32 = objc_claimAutoreleasedReturnValue();
                  if ((id)v32 != v5)
                  {
                    v33 = (void *)v32;
                    +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickDown");
                    v34 = (id)objc_claimAutoreleasedReturnValue();

                    if (v34 != v5)
                    {
                      +[VOSGesture TwoFingerPinch](VOSGesture, "TwoFingerPinch");
                      v35 = (id)objc_claimAutoreleasedReturnValue();

                      if (v35 == v5)
                        v11 = 2;
                      else
                        v11 = -1;
                      goto LABEL_41;
                    }
                    goto LABEL_68;
                  }
                  goto LABEL_60;
                }
LABEL_40:
                v11 = 1;
                goto LABEL_41;
              }
LABEL_35:

              goto LABEL_40;
            }

          }
        }

        goto LABEL_68;
      }

    }
    goto LABEL_40;
  }
  +[VOSScreenreaderMode Handwriting](VOSScreenreaderMode, "Handwriting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    +[VOSScreenreaderMode BrailleScreenInput](VOSScreenreaderMode, "BrailleScreenInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_52;
    }
    +[VOSGesture TwoFingerRotateCounterclockwise](VOSGesture, "TwoFingerRotateCounterclockwise");
    v43 = objc_claimAutoreleasedReturnValue();
    if ((id)v43 != v5)
    {
      v44 = (void *)v43;
      +[VOSGesture TwoFingerRotateClockwise](VOSGesture, "TwoFingerRotateClockwise");
      v45 = (id)objc_claimAutoreleasedReturnValue();

      if (v45 == v5)
        goto LABEL_51;
      +[VOSGesture TwoFingerScrub](VOSGesture, "TwoFingerScrub");
      v46 = (id)objc_claimAutoreleasedReturnValue();

      if (v46 == v5)
      {
LABEL_64:
        v11 = 1;
        goto LABEL_52;
      }
      if (+[VOSGestureCategory isTapGesture:](VOSGestureCategory, "isTapGesture:", v5)
        || +[VOSGestureCategory isTapAndHoldGesture:](VOSGestureCategory, "isTapAndHoldGesture:", v5))
      {
LABEL_51:
        v11 = 2;
        goto LABEL_52;
      }
      +[VOSGesture oneFingerSplitGestures](VOSGesture, "oneFingerSplitGestures");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v47, "containsObject:", v5))
      {

        goto LABEL_64;
      }
      +[VOSGesture twoFingerSplitGestures](VOSGesture, "twoFingerSplitGestures");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "containsObject:", v5);

      if ((v61 & 1) != 0)
        goto LABEL_64;
      +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickLeft");
      v62 = objc_claimAutoreleasedReturnValue();
      if ((id)v62 != v5)
      {
        v63 = (void *)v62;
        +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickRight");
        v64 = objc_claimAutoreleasedReturnValue();
        if ((id)v64 == v5)
        {

        }
        else
        {
          v65 = (void *)v64;
          +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickUp");
          v66 = objc_claimAutoreleasedReturnValue();
          if ((id)v66 != v5)
          {
            v67 = (void *)v66;
            +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickDown");
            v68 = (id)objc_claimAutoreleasedReturnValue();

            if (v68 != v5)
              goto LABEL_4;
            goto LABEL_51;
          }

        }
        goto LABEL_51;
      }
    }

    goto LABEL_51;
  }
  +[VOSGesture TwoFingerRotateCounterclockwise](VOSGesture, "TwoFingerRotateCounterclockwise");
  v36 = objc_claimAutoreleasedReturnValue();
  if ((id)v36 == v5)
  {

    goto LABEL_48;
  }
  v37 = (void *)v36;
  +[VOSGesture TwoFingerRotateClockwise](VOSGesture, "TwoFingerRotateClockwise");
  v38 = objc_claimAutoreleasedReturnValue();
  if ((id)v38 == v5)
  {

    goto LABEL_48;
  }
  v39 = (void *)v38;
  +[VOSGesture TwoFingerScrub](VOSGesture, "TwoFingerScrub");
  v40 = (id)objc_claimAutoreleasedReturnValue();

  if (v40 == v5)
  {
LABEL_48:
    v42 = 1;
    goto LABEL_49;
  }
  +[VOSGesture TwoFingerPinch](VOSGesture, "TwoFingerPinch");
  v41 = (id)objc_claimAutoreleasedReturnValue();

  if (v41 == v5)
    v42 = 2;
  else
    v42 = -1;
LABEL_49:
  +[VOSGesture oneFingerGestures](VOSGesture, "oneFingerGestures");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "containsObject:", v5);

  +[VOSGesture oneFingerSplitGestures](VOSGesture, "oneFingerSplitGestures");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "containsObject:", v5))
  {
LABEL_50:

    goto LABEL_51;
  }
  v56 = v54 == 0;
  v11 = 2;
  if (v56)
    v57 = v42;
  else
    v57 = 2;
  +[VOSGesture twoFingerSplitGestures](VOSGesture, "twoFingerSplitGestures");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "containsObject:", v5);

  if ((v59 & 1) == 0)
  {
    v11 = v57;
    goto LABEL_58;
  }
LABEL_52:

  return v11;
}

- (unint64_t)availabilityForShortcut:(id)a3 withResolver:(id)a4
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a4;
  objc_msgSend(v4, "screenreaderMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isQuickNavKeyboardMode");

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    +[VOSScreenreaderMode Default](VOSScreenreaderMode, "Default");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v8)
    {
      +[VOSScreenreaderMode Handwriting](VOSScreenreaderMode, "Handwriting");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v9)
      {
        +[VOSScreenreaderMode BrailleScreenInput](VOSScreenreaderMode, "BrailleScreenInput");

      }
    }
    v7 = 0;
  }

  return v7;
}

- (unint64_t)availabilityForCommand:(id)a3 withResolver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  if ((AXIsInternalInstall() & 1) != 0
    || (+[VOSCommandCategory internalOnly](VOSCommandCategory, "internalOnly"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsCommand:", v5),
        v7,
        (v8 & 1) == 0))
  {
    objc_msgSend(v6, "screenreaderMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VOSScreenreaderMode Default](VOSScreenreaderMode, "Default");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {
      if ((objc_msgSend(v6, "isIPad") & 1) != 0 || (objc_msgSend(v6, "isWatch") & 1) != 0)
      {
        v9 = -1;
      }
      else
      {
        +[VOSCommand ToggleDock](VOSCommand, "ToggleDock");
        v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17 == v5)
          v9 = 1;
        else
          v9 = -1;
      }
      if ((objc_msgSend(v6, "isIPhone") & 1) == 0)
      {
        +[VOSCommand ToggleReachability](VOSCommand, "ToggleReachability");
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (v18 == v5)
        {
          v9 = 1;
          goto LABEL_22;
        }
      }
      if (v9 != -1)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
      +[VOSScreenreaderMode Handwriting](VOSScreenreaderMode, "Handwriting");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v10 == (void *)v12)
      {

LABEL_12:
        +[VOSCommand GesturedTextInputLaunchApp](VOSCommand, "GesturedTextInputLaunchApp");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 != v5)
        {
          +[VOSScreenreaderMode Handwriting](VOSScreenreaderMode, "Handwriting");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 != v16)
          {
            +[VOSScreenreaderMode BrailleScreenInput](VOSScreenreaderMode, "BrailleScreenInput");

          }
        }
        goto LABEL_21;
      }
      v13 = (void *)v12;
      +[VOSScreenreaderMode BrailleScreenInput](VOSScreenreaderMode, "BrailleScreenInput");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v14)
        goto LABEL_12;
    }
LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  v9 = 1;
LABEL_23:

  return v9;
}

- (BOOL)commandHasModifiedBindingsWhenZoomEnabled:(id)a3 withResolver:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  -[VOSCommandProfile gestureBindingsForCommand:withResolver:](self, "gestureBindingsForCommand:withResolver:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture conflictingZoomGestures](VOSGesture, "conflictingZoomGestures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intersectsSet:", v5);

  return v6;
}

- (id)_modifiedGestureRespectingHandednessSetting:(id)a3
{
  return a3;
}

- (id)addGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  v8 = a4;
  v9 = a5;
  -[VOSCommandProfile _modifiedGestureRespectingHandednessSetting:](self, "_modifiedGestureRespectingHandednessSetting:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[VOSCommandProfile _profileCommandForCommand:inMode:](self, "_profileCommandForCommand:inMode:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[_VOSProfileCommand profileCommandWithCommand:](_VOSProfileCommand, "profileCommandWithCommand:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[VOSCommand None](VOSCommand, "None");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandProfile _profileCommandForCommand:inMode:](self, "_profileCommandForCommand:inMode:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[_VOSProfileGesture profileGestureWithGesture:](_VOSProfileGesture, "profileGestureWithGesture:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "gestures");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v15);

  if (v17)
    objc_msgSend(v14, "removeGesture:", v15);
  objc_msgSend(v12, "addGesture:", v15);
  objc_msgSend(v11, "addCommand:", v12);

  return 0;
}

- (id)removeGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;

  v8 = a4;
  v9 = a5;
  -[VOSCommandProfile _modifiedGestureRespectingHandednessSetting:](self, "_modifiedGestureRespectingHandednessSetting:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandProfile _profileCommandForCommand:inMode:](self, "_profileCommandForCommand:inMode:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "profileGestureForGesture:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "removeGesture:", v14);
      objc_msgSend(v13, "gestures");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (!v16)
      {
        +[VOSCommand None](VOSCommand, "None");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[VOSCommandProfile addGesture:toCommand:withResolver:](self, "addGesture:toCommand:withResolver:", v10, v17, v9);

      }
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("VoiceOverCommands"), CFSTR("Cannot remove gesture '%@' from command '%@' with resolver '%@'. profileGesture was nil."), v10, v8, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("VoiceOverCommands"), CFSTR("Cannot remove gesture '%@' from command '%@' with resolver '%@'. profileCommand was nil."), v10, v8, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)addKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandProfile _profileCommandForCommand:inMode:](self, "_profileCommandForCommand:inMode:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[_VOSProfileKeyChord profileKeyChordWithKeyChord:](_VOSProfileKeyChord, "profileKeyChordWithKeyChord:", v10);
    v13 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isQuickNavKeyboardMode"))
      objc_msgSend(v12, "addQuickNavShortcut:", v13);
    else
      objc_msgSend(v12, "addKeyboardShortcut:", v13);
    v14 = 0;
    v10 = (id)v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("VoiceOverCommands"), CFSTR("Cannot add keychord '%@' to command '%@' with resolver '%@'. ProfileCommand was nil."), v10, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)removeKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[VOSCommandProfile _profileModeForResolver:](self, "_profileModeForResolver:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandProfile _profileCommandForCommand:inMode:](self, "_profileCommandForCommand:inMode:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((objc_msgSend(v10, "isQuickNavKeyboardMode") & 1) != 0)
      objc_msgSend(v12, "profileQuickNavShortcutForKeyChord:", v8);
    else
      objc_msgSend(v12, "profileKeyboardShortcutForKeyChord:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (objc_msgSend(v10, "isQuickNavKeyboardMode"))
        objc_msgSend(v12, "removeQuickNavShortcut:", v14);
      else
        objc_msgSend(v12, "removeKeyboardShortcut:", v14);
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("VoiceOverCommands"), CFSTR("Cannot remove keychord '%@' from command '%@' with resolver '%@'. profileKeyChord was nil."), v8, v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("VoiceOverCommands"), CFSTR("Cannot remove keychord '%@' from command '%@' with resolver '%@'. profileCommand was nil."), v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)validateCanAddGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  void *v9;
  VOSCommandProfileValidation *v10;
  void *v11;
  char v12;
  VOSCommandProfileValidation *v13;

  v8 = a4;
  -[VOSCommandProfile commandForTouchGesture:withResolver:](self, "commandForTouchGesture:withResolver:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v9, "isEqual:", v8);

  if ((_DWORD)a3)
  {
    v10 = -[VOSCommandProfileValidation initWithType:]([VOSCommandProfileValidation alloc], "initWithType:", 1);
  }
  else if (v9
         && (+[VOSCommand None](VOSCommand, "None"),
             v11 = (void *)objc_claimAutoreleasedReturnValue(),
             v12 = objc_msgSend(v9, "isEqual:", v11),
             v11,
             (v12 & 1) == 0))
  {
    +[VOSCommandProfileValidation gestureAssignedToOtherCommandValidation:](VOSCommandProfileValidation, "gestureAssignedToOtherCommandValidation:", v9);
    v10 = (VOSCommandProfileValidation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[VOSCommandProfileValidation successfulValidation](VOSCommandProfileValidation, "successfulValidation");
    v10 = (VOSCommandProfileValidation *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v10;

  return v13;
}

- (id)validateCanRemoveGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  return +[VOSCommandProfileValidation successfulValidation](VOSCommandProfileValidation, "successfulValidation", a3, a4, a5);
}

- (id)validateCanAddKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  void *v9;
  VOSCommandProfileValidation *v10;
  VOSCommandProfileValidation *v11;

  v8 = a4;
  -[VOSCommandProfile commandForKeyChord:withResolver:](self, "commandForKeyChord:withResolver:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v9, "isEqual:", v8);

  if ((_DWORD)a3)
  {
    v10 = -[VOSCommandProfileValidation initWithType:]([VOSCommandProfileValidation alloc], "initWithType:", 3);
  }
  else
  {
    if (v9)
      +[VOSCommandProfileValidation keyboardShortcutAssignedToOtherCommandValidation:](VOSCommandProfileValidation, "keyboardShortcutAssignedToOtherCommandValidation:", v9);
    else
      +[VOSCommandProfileValidation successfulValidation](VOSCommandProfileValidation, "successfulValidation");
    v10 = (VOSCommandProfileValidation *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)validateCanRemoveKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  return +[VOSCommandProfileValidation successfulValidation](VOSCommandProfileValidation, "successfulValidation", a3, a4, a5);
}

- (id)_profileModeForResolver:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "screenreaderMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandProfile _profileModeForScreenreaderMode:](self, "_profileModeForScreenreaderMode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_profileModeForScreenreaderMode:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_modes;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "mode", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_profileCommandForCommand:(id)a3 inMode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  char v30;
  NSObject *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v6, "commands", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v12, "command");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v5);

        if ((v14 & 1) != 0)
        {
          v18 = v12;

          goto LABEL_28;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v9)
        continue;
      break;
    }
  }

  v15 = objc_msgSend(v5, "commandType");
  if (v15 == 1)
    goto LABEL_22;
  if (v15)
  {
LABEL_27:
    v18 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v6, "mode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode Handwriting](VOSScreenreaderMode, "Handwriting");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == v17)
  {
    +[VOSCommandCategory handwriting](VOSCommandCategory, "handwriting");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsCommand:", v5);

    if ((v20 & 1) != 0)
      goto LABEL_22;
  }
  else
  {

  }
  objc_msgSend(v6, "mode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode BrailleScreenInput](VOSScreenreaderMode, "BrailleScreenInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 == v22)
  {
    +[VOSCommandCategory brailleScreenInput](VOSCommandCategory, "brailleScreenInput");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "containsCommand:", v5);

    if ((v24 & 1) != 0)
      goto LABEL_22;
  }
  else
  {

  }
  objc_msgSend(v6, "mode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode Default](VOSScreenreaderMode, "Default");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 == v26)
  {
    +[VOSCommandCategory allCategories](VOSCommandCategory, "allCategories");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = +[VOSCommandCategory categories:containsCommand:](VOSCommandCategory, "categories:containsCommand:", v27, v5);

    if (v28)
      goto LABEL_22;
  }
  else
  {

  }
  +[VOSCommand None](VOSCommand, "None");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v5, "isEqual:", v29);

  if ((v30 & 1) == 0)
  {
    VOTLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[VOSCommandProfile _profileCommandForCommand:inMode:].cold.1();

    goto LABEL_27;
  }
LABEL_22:
  +[_VOSProfileCommand profileCommandWithCommand:](_VOSProfileCommand, "profileCommandWithCommand:", v5);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v6, "addCommand:", v18);
LABEL_28:

  return v18;
}

+ (BOOL)_overlay:(id)a3 shouldIncludeItem:(id)a4
{
  char v4;
  void *v5;

  v4 = 1;
  if (a3 && a4)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(v5, "BOOLValue");

  }
  return v4;
}

+ (id)_parseProfileProperties:(id)a3 overlayProperties:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  void *v20;
  id v21;

  v6 = (void *)MEMORY[0x24BDBCEF0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ScreenReaderModes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ScreenReaderModes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_2;
  v17[3] = &unk_24CBAD960;
  v21 = a1;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v20 = &__block_literal_global_226_1;
  v13 = v11;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);
  v14 = v20;
  v15 = v12;

  return v15;
}

void __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v8 = a4;
  v9 = a5;
  +[_VOSProfileCommand profileCommandWithStringValue:](_VOSProfileCommand, "profileCommandWithStringValue:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v11, "addCommand:", v10);
    +[VOSCommandProfile _addGesturesToCommand:fromCommandProperties:overlayProperties:](VOSCommandProfile, "_addGesturesToCommand:fromCommandProperties:overlayProperties:", v10, v8, v9);
    +[VOSCommandProfile _addKeyboardShortcutsToCommand:fromCommandProperties:overlayProperties:](VOSCommandProfile, "_addKeyboardShortcutsToCommand:fromCommandProperties:overlayProperties:", v10, v8, v9);
    +[VOSCommandProfile _addQuickNavShortcutsToCommand:fromCommandProperties:overlayProperties:](VOSCommandProfile, "_addQuickNavShortcutsToCommand:fromCommandProperties:overlayProperties:", v10, v8, v9);
    +[VOSCommandProfile _addSecondaryCommandsToCommand:fromCommandProperties:overlayProperties:](VOSCommandProfile, "_addSecondaryCommandsToCommand:fromCommandProperties:overlayProperties:", v10, v8, v9);
  }

}

void __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(a1[7], "_overlay:shouldIncludeItem:", a1[4], v14))
  {
    +[_VOSProfileMode profileModeWithStringValue:](_VOSProfileMode, "profileModeWithStringValue:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1[5], "addObject:", v6);
      objc_msgSend(a1[4], "objectForKeyedSubscript:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x24BDAC760];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_3;
      v19[3] = &unk_24CBAD910;
      v20 = v7;
      v13 = *((_OWORD *)a1 + 3);
      v9 = (id)v13;
      v22 = v13;
      v10 = v6;
      v21 = v10;
      v11 = v7;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v19);
      objc_msgSend(v5, "allKeys");
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_4;
      v15[3] = &unk_24CBAD938;
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v18 = a1[6];
      v17 = v10;
      v12 = v16;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);

    }
  }

}

void __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 56), "_overlay:shouldIncludeItem:", *(_QWORD *)(a1 + 32), v9))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id, id, void *))(v6 + 16))(v6, v7, v9, v5, v8);

  }
}

void __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)_addGesturesToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[3];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "_overlay:shouldIncludeItem:", v10, CFSTR("TouchGesture")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TouchGesture"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TouchGesture"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24[0] = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          +[_VOSProfileGesture profileGestureWithStringValue:](_VOSProfileGesture, "profileGestureWithStringValue:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17), (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v8, "addGesture:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

+ (void)_addKeyboardShortcutsToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "_overlay:shouldIncludeItem:", v10, CFSTR("KeyChord")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("KeyChord"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KeyChord"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "_profileKeyChordsFromDictionaryValue:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v8, "addKeyboardShortcut:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

+ (void)_addQuickNavShortcutsToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "_overlay:shouldIncludeItem:", v10, CFSTR("QuickNav")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("QuickNav"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("QuickNav"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "_profileKeyChordsFromDictionaryValue:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v8, "addQuickNavShortcut:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

+ (void)_addSecondaryCommandsToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("SecondaryCommands"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke;
    v9[3] = &unk_24CBAD988;
    v10 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
  else if (v7)
  {
    VOTLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[VOSCommandProfile _addSecondaryCommandsToCommand:fromCommandProperties:overlayProperties:].cold.1();

  }
}

void __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v9 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TextEntry")) & 1) != 0)
  {
    v9 = 1;
LABEL_7:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PressCount"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = v10;
    else
      v11 = &unk_24CBBC8E8;
    +[_VOSProfileSecondaryCommand profileSecondaryCommandWithStringValue:context:pressCount:](_VOSProfileSecondaryCommand, "profileSecondaryCommandWithStringValue:context:pressCount:", v5, v9, -[NSObject unsignedIntegerValue](v11, "unsignedIntegerValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "addSecondaryCommand:", v12);
    }
    else
    {
      VOTLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke_cold_1();

    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TableNavigation")) & 1) != 0)
  {
    v9 = 2;
    goto LABEL_7;
  }
  VOTLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke_cold_2();
LABEL_16:

}

+ (id)_profileKeyChordsFromDictionaryValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          +[_VOSProfileKeyChord profileKeyChordWithStringValue:](_VOSProfileKeyChord, "profileKeyChordWithStringValue:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (VOSCommandProfileDelegate)delegate
{
  return (VOSCommandProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modes, 0);
}

- (void)commandForTouchGesture:withResolver:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211371000, v0, v1, "commandForGesture resolved to unsupported command for this host: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_profileCommandForCommand:inMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211371000, v0, v1, "built-in command was unexpectedly unmapped: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_addSecondaryCommandsToCommand:fromCommandProperties:overlayProperties:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211371000, v0, v1, "command secondaryInfo is of unexpected type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211371000, v0, v1, "unknown secondary command: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211371000, v0, v1, "command:secondaryInfo:context is of unexpected type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
