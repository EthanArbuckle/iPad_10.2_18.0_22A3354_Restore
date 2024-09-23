@implementation SBUserNotificationAlert

- (id)_headerImage
{
  void *v3;
  void *v4;

  -[SBUserNotificationAlert headerImageDefinition](self, "headerImageDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _imageForDefinition:](self, "_imageForDefinition:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_attachmentImage
{
  void *v3;
  void *v4;

  -[SBUserNotificationAlert attachmentImageDefinition](self, "attachmentImageDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _imageForDefinition:](self, "_imageForDefinition:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)iconImage
{
  void *v3;
  void *v4;

  -[SBUserNotificationAlert iconImageDefinition](self, "iconImageDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _imageForDefinition:](self, "_imageForDefinition:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_safeLocalizedValue:(id)a3 withBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            safeStringValue(*(void **)(*((_QWORD *)&v17 + 1) + 8 * v12));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v6)
            {
              objc_msgSend(v6, "localizedStringForKey:value:table:", v13, &stru_1E8EC7EC0, 0, (_QWORD)v17);
              v14 = objc_claimAutoreleasedReturnValue();

              v13 = (void *)v14;
            }
            objc_msgSend(v7, "addObject:", v13, (_QWORD)v17);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

    }
    else
    {
      safeStringValue(v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E8EC7EC0, 0);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v8;
        v8 = v15;
      }
      v7 = v15;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SBUserNotificationAlert)initWithMessage:(id)a3 replyPort:(unsigned int)a4 requestFlags:(int)a5 auditToken:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  unsigned int *v12;
  uint64_t v13;
  void *v14;
  uintptr_t v15;
  dispatch_source_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  unsigned int *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  unsigned int *v35;
  _QWORD handler[4];
  unsigned int *v37;
  objc_super v38;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a6;
  v38.receiver = self;
  v38.super_class = (Class)SBUserNotificationAlert;
  v12 = -[SBAlertItem init](&v38, sel_init);
  if (v12)
  {
    v12[30] = objc_msgSend(v11, "pid");
    v12[31] = a4;
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C9B818]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v12 + 14);
    *((_QWORD *)v12 + 14) = v13;

    v15 = v12[31];
    if ((v15 + 1) >= 2)
    {
      v17 = dispatch_source_create(MEMORY[0x1E0C80DA0], v15, 1uLL, MEMORY[0x1E0C80D38]);
      v18 = (void *)*((_QWORD *)v12 + 16);
      *((_QWORD *)v12 + 16) = v17;

      v19 = *((_QWORD *)v12 + 16);
      if (v19)
      {
        v20 = MEMORY[0x1E0C809B0];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke;
        handler[3] = &unk_1E8E9DED8;
        v21 = v12;
        v37 = v21;
        dispatch_source_set_event_handler(v19, handler);
        v22 = *((_QWORD *)v12 + 16);
        v31 = v20;
        v32 = 3221225472;
        v33 = __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke_2;
        v34 = &unk_1E8E9DED8;
        v35 = v21;
        dispatch_source_set_cancel_handler(v22, &v31);
        dispatch_resume(*((dispatch_object_t *)v12 + 16));

      }
      v23 = (void *)MEMORY[0x1E0D22990];
      if (v11)
      {
        objc_msgSend(v11, "realToken");
      }
      else
      {
        v29 = 0u;
        v30 = 0u;
      }
      if (objc_msgSend(v23, "authenticateAuditToken:forEntitlement:error:", &v29, CFSTR("com.apple.UIKit.vends-view-services"), 0))
      {
        v24 = objc_alloc(MEMORY[0x1E0D00DB8]);
        objc_msgSend(v11, "bundleID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v24, "initWithBundleIdentifier:flags:reason:name:", v25, 1, 9, v26);
        v28 = (void *)*((_QWORD *)v12 + 58);
        *((_QWORD *)v12 + 58) = v27;

      }
    }
    objc_msgSend(v12, "updateWithMessage:requestFlags:", v10, v7, v29, v30, v31, v32, v33, v34);
  }

  return (SBUserNotificationAlert *)v12;
}

void __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 128));
}

uint64_t __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;

  SBLogCFUserNotifications();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke_2_cold_1(a1, v2);

  result = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(result + 128);
  if (v4)
  {
    *(_QWORD *)(result + 128) = 0;

    result = *(_QWORD *)(a1 + 32);
  }
  if ((~*(_DWORD *)(result + 160) & 3) == 0
    || (*(_QWORD *)(result + 160) & 0x20) != 0
    && !*(_QWORD *)(result + 216)
    && !*(_QWORD *)(result + 224)
    && !*(_QWORD *)(result + 232))
  {
    return objc_msgSend((id)result, "cancel");
  }
  return result;
}

- (id)parseVisualStyleForMessage:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  id v7;

  objc_msgSend(a3, "bs_safeNumberForKey:", *MEMORY[0x1E0DABB50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = -[SBUserNotificationAlert _uiAlertActionLayoutDirectionFromSBUserNotificationButtonLayoutDirection:](self, "_uiAlertActionLayoutDirectionFromSBUserNotificationButtonLayoutDirection:", objc_msgSend(v4, "unsignedIntValue"));
    v7 = objc_alloc_init(MEMORY[0x1E0DAC208]);
    objc_msgSend(v7, "setPermittedActionLayoutDirection:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateWithMessage:(id)a3 requestFlags:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  UIAlertControllerVisualStyle *v35;
  UIAlertControllerVisualStyle *visualStyle;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  SBSUserNotificationImageDefinition *v65;
  SBSUserNotificationImageDefinition *headerImageDefinition;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  SBSUserNotificationImageDefinition *v73;
  SBSUserNotificationImageDefinition *iconImageDefinition;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  SBSUserNotificationImageDefinition *v81;
  SBSUserNotificationImageDefinition *attachmentImageDefinition;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  NSArray *v123;
  NSArray *textFieldDefinitions;
  NSArray *v125;
  NSArray *v126;
  void *v127;
  NSArray *v128;
  NSArray *customButtonDefinitions;
  void *v130;
  void *v131;
  void *v132;
  int64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t *p_extensionIdentifier;
  NSString *extensionIdentifier;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  void *v153;
  NSString *remoteViewControllerClassName;
  NSString *remoteServiceBundleIdentifier;
  id v156;
  NSObject *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  id v162;
  void *v164;
  void *v165;
  void *v166;
  void (**v167)(void);
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  _QWORD v173[5];
  void (**v174)(void);
  _QWORD v175[5];
  void (**v176)(void);
  id v177;
  _QWORD v178[11];

  v178[9] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  self->_requestFlags = a4;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B890]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_token = safeIntValue(v7);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B888]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_timeout = safeIntValue(v8);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (isSafePlistTrueBoolean(v9))
    v10 = 16;
  else
    v10 = 0;
  *((_BYTE *)self + 448) = *((_BYTE *)self + 448) & 0xEF | v10;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBB0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (isSafePlistTrueBoolean(v11))
    v12 = 64;
  else
    v12 = 0;
  *((_BYTE *)self + 448) = *((_BYTE *)self + 448) & 0xBF | v12;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB48]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (isSafePlistTrueBoolean(v13))
    v14 = 0x80;
  else
    v14 = 0;
  *((_BYTE *)self + 448) = v14 & 0x80 | *((_BYTE *)self + 448) & 0x7F;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABAF8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)self + 448) = *((_BYTE *)self + 448) & 0xFE | isSafePlistTrueBoolean(v15);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB90]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (isSafePlistTrueBoolean(v16))
    v17 = 16;
  else
    v17 = 0;
  *((_BYTE *)self + 449) = *((_BYTE *)self + 449) & 0xEF | v17;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBE8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (isSafePlistTrueBoolean(v18))
    v19 = 32;
  else
    v19 = 0;
  *((_BYTE *)self + 449) = *((_BYTE *)self + 449) & 0xDF | v19;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB00]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem setAllowInSetup:](self, "setAllowInSetup:", isSafePlistTrueBoolean(v20));

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC38]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem setPendInSetupIfNotAllowed:](self, "setPendInSetupIfNotAllowed:", isSafePlistTrueBoolean(v21));

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC40]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem setPendWhileKeyBagLocked:](self, "setPendWhileKeyBagLocked:", isSafePlistTrueBoolean(v22));

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABAF0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem setAllowInCar:](self, "setAllowInCar:", isSafePlistTrueBoolean(v23));

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC10]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem _setIgnoresQuietMode:](self, "_setIgnoresQuietMode:", isSafePlistTrueBoolean(v24));

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB60]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem setContactIdentifier:](self, "setContactIdentifier:", v25);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB68]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem setContentType:](self, "setContentType:", v26);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBF0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem setShouldMaskIcon:](self, "setShouldMaskIcon:", isSafePlistTrueBoolean(v27) ^ 1);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABAE8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem setAllowDuringTransitionAnimations:](self, "setAllowDuringTransitionAnimations:", isSafePlistTrueBoolean(v28));

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB20]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v29;
  else
    v30 = 0;
  v31 = v30;
  v32 = (void *)objc_msgSend(v31, "mutableCopy");

  if (v32)
  {
    objc_msgSend(v32, "indexesOfObjectsPassingTest:", &__block_literal_global_41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeObjectsAtIndexes:", v33);

  }
  v165 = v32;
  if (objc_msgSend(v32, "count"))
  {
    v34 = (void *)objc_msgSend(v32, "copy");
    -[SBAlertItem setAllowedBundleIDs:](self, "setAllowedBundleIDs:", v34);

  }
  else
  {
    -[SBAlertItem setAllowedBundleIDs:](self, "setAllowedBundleIDs:", 0);
  }
  -[SBUserNotificationAlert parseVisualStyleForMessage:](self, "parseVisualStyleForMessage:", v6);
  v35 = (UIAlertControllerVisualStyle *)objc_claimAutoreleasedReturnValue();
  visualStyle = self->_visualStyle;
  self->_visualStyle = v35;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B820]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (isSafePlistTrueBoolean(v37))
    v38 = 8;
  else
    v38 = 0;
  *((_BYTE *)self + 448) = *((_BYTE *)self + 448) & 0xF7 | v38;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB98]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (isSafePlistTrueBoolean(v39))
    v40 = 32;
  else
    v40 = 0;
  *((_BYTE *)self + 448) = *((_BYTE *)self + 448) & 0xDF | v40;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB10]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)self + 449) = *((_BYTE *)self + 449) & 0xFE | isSafePlistTrueBoolean(v41);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBC8]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (isSafePlistTrueBoolean(v42))
    v43 = 4;
  else
    v43 = 0;
  *((_BYTE *)self + 449) = *((_BYTE *)self + 449) & 0xFB | v43;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBA0]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (isSafePlistTrueBoolean(v44))
    v45 = 8;
  else
    v45 = 0;
  *((_BYTE *)self + 449) = *((_BYTE *)self + 449) & 0xF7 | v45;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB78]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
    v48 = safeIntValue(v46);
  else
    v48 = -1;
  self->_defaultButtonTag = v48;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB08]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
    v50 = safeIntValue(v49);
  else
    v50 = 1;
  *((_BYTE *)self + 472) = *((_BYTE *)self + 472) & 0xFE | v50 & 1;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABCB0]);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABCA8]);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v171;
  if (v171 || (v51 = v166) != 0)
    v52 = *((_BYTE *)self + 449) & 0xFD | (2 * (safeIntValue(v51) & 1));
  else
    v52 = *((_BYTE *)self + 449) | 2;
  *((_BYTE *)self + 449) = v52;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB58]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
    v54 = safeIntValue(v53);
  else
    v54 = -1;
  self->_unlockActionButtonTag = v54;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB80]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setDefaultResponseLaunchBundleID:](self, "setDefaultResponseLaunchBundleID:", v56);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB88]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v57);
  v172 = (void *)objc_claimAutoreleasedReturnValue();

  if (v172)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v172);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUserNotificationAlert setDefaultResponseLaunchURL:](self, "setDefaultResponseLaunchURL:", v58);

  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBE0]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBD8]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBD0]);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _imageDefinitionForPath:catalogPath:catalogImageKey:](self, "_imageDefinitionForPath:catalogPath:catalogImageKey:", v60, v62, v64);
  v65 = (SBSUserNotificationImageDefinition *)objc_claimAutoreleasedReturnValue();
  headerImageDefinition = self->_headerImageDefinition;
  self->_headerImageDefinition = v65;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC08]);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC00]);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBF8]);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _imageDefinitionForPath:catalogPath:catalogImageKey:](self, "_imageDefinitionForPath:catalogPath:catalogImageKey:", v68, v70, v72);
  v73 = (SBSUserNotificationImageDefinition *)objc_claimAutoreleasedReturnValue();
  iconImageDefinition = self->_iconImageDefinition;
  self->_iconImageDefinition = v73;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB40]);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB38]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABB30]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _imageDefinitionForPath:catalogPath:catalogImageKey:](self, "_imageDefinitionForPath:catalogPath:catalogImageKey:", v76, v78, v80);
  v81 = (SBSUserNotificationImageDefinition *)objc_claimAutoreleasedReturnValue();
  attachmentImageDefinition = self->_attachmentImageDefinition;
  self->_attachmentImageDefinition = v81;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B870]);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setSoundPath:](self, "setSoundPath:", v84);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC90]);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v86 = objc_msgSend(v85, "unsignedIntValue");
  else
    v86 = 0;
  -[SBUserNotificationAlert setSoundID:](self, "setSoundID:", v86);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC88]);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v88 = objc_msgSend(v87, "unsignedIntValue");
  else
    v88 = 1;
  -[SBUserNotificationAlert setSoundIDBehavior:](self, "setSoundIDBehavior:", v88);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC70]);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v90 = v89;
  else
    v90 = 0;
  v91 = v90;
  -[SBUserNotificationAlert setVibrationPattern:](self, "setVibrationPattern:", v91);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC60]);
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v92 = objc_msgSend(v170, "integerValue");
  else
    v92 = 0;
  -[SBUserNotificationAlert setSoundAlertType:](self, "setSoundAlertType:", v92);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC58]);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setSoundAlertTopic:](self, "setSoundAlertTopic:", v94);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC68]);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v95, "doubleValue");
    v97 = (int)v96;
  }
  else
  {
    v97 = 0;
  }
  self->_soundRepeatDuration = (double)v97;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B858]);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v98);
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  if (v169)
    v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01700]), "initWithPath:", v169);
  else
    v99 = 0;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B800]);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v100, v99);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setAlertHeader:](self, "setAlertHeader:", v102);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B810]);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v103, v99);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setAlertMessage:](self, "setAlertMessage:", v104);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABAE0]);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v105, v99);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setAlertMessageDelimiter:](self, "setAlertMessageDelimiter:", v107);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC18]);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v108, v99);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setLockScreenAlertHeader:](self, "setLockScreenAlertHeader:", v110);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC28]);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v111, v99);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setLockScreenAlertMessage:](self, "setLockScreenAlertMessage:", v112);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC20]);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v113, v99);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setLockScreenAlertMessageDelimiter:](self, "setLockScreenAlertMessageDelimiter:", v115);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B838]);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v116, v99);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setDefaultButtonTitle:](self, "setDefaultButtonTitle:", v117);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B830]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v118, v99);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setAlternateButtonTitle:](self, "setAlternateButtonTitle:", v119);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B868]);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v120, v99);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setOtherButtonTitle:](self, "setOtherButtonTitle:", v121);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABA70]);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _parseTextFieldDefinitions:locBundle:](self, "_parseTextFieldDefinitions:locBundle:", v122, v99);
  v123 = (NSArray *)objc_claimAutoreleasedReturnValue();
  textFieldDefinitions = self->_textFieldDefinitions;
  self->_textFieldDefinitions = v123;

  if (!self->_textFieldDefinitions)
  {
    -[SBUserNotificationAlert _parseLegacyTextFieldDefinitions:locBundle:](self, "_parseLegacyTextFieldDefinitions:locBundle:", v6, v99);
    v125 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v126 = self->_textFieldDefinitions;
    self->_textFieldDefinitions = v125;

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABA68]);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _parseCustomButtonDefinitions:locBundle:](self, "_parseCustomButtonDefinitions:locBundle:", v127, v99);
  v128 = (NSArray *)objc_claimAutoreleasedReturnValue();
  customButtonDefinitions = self->_customButtonDefinitions;
  self->_customButtonDefinitions = v128;

  objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x1E0DABB70]);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  self->_defaultButtonActionStyle = -[SBUserNotificationAlert _uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:](self, "_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:", objc_msgSend(v130, "intValue"));

  objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x1E0DABC30]);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  self->_otherButtonActionStyle = -[SBUserNotificationAlert _uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:](self, "_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:", objc_msgSend(v131, "intValue"));

  objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x1E0DABB28]);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v132;
  if (v132)
    v133 = -[SBUserNotificationAlert _uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:](self, "_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:", objc_msgSend(v132, "intValue"));
  else
    v133 = -[NSString length](self->_alternateButtonTitle, "length")
        && !-[NSString length](self->_otherButtonTitle, "length");
  self->_alternateButtonActionStyle = v133;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC80]);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = isSafePlistTrueBoolean(v134);

  -[SBUserNotificationAlert setPrefersSystemAperturePresentation:](self, "setPrefersSystemAperturePresentation:", v135);
  if ((_DWORD)v135)
  {
    objc_msgSend(v6, "bs_safeDictionaryForKey:", *MEMORY[0x1E0DABC78]);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUserNotificationAlert _parseSystemApertureContentDefinition:](self, "_parseSystemApertureContentDefinition:", v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUserNotificationAlert setSystemApertureContentDefinition:](self, "setSystemApertureContentDefinition:", v137);

  }
  v178[0] = MEMORY[0x1E0C809B0];
  v178[1] = 3221225472;
  v178[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_139;
  v178[3] = &unk_1E8E9DED8;
  v178[4] = self;
  v167 = (void (**)(void))MEMORY[0x1D17E5550](v178);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC48]);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setRemoteServiceBundleIdentifier:](self, "setRemoteServiceBundleIdentifier:", v139);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC50]);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setRemoteViewControllerClassName:](self, "setRemoteViewControllerClassName:", v141);

  if ((self->_remoteServiceBundleIdentifier == 0) != (self->_remoteViewControllerClassName == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUserNotificationAlert.m"), 675, CFSTR("Must specify both SBUserNotificationRemoteServiceBundleIdentifier and SBUserNotificationRemoteViewControllerClassName or neither"));

  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBB8]);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  safeStringValue(v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert setExtensionIdentifier:](self, "setExtensionIdentifier:", v143);

  p_extensionIdentifier = (uint64_t *)&self->_extensionIdentifier;
  extensionIdentifier = self->_extensionIdentifier;
  if (extensionIdentifier)
  {
    v177 = 0;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", extensionIdentifier, &v177);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = v177;
    if (v146)
    {
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABBC0]);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      if (v164)
      {
        v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v164, 0);
        v161 = (void *)MEMORY[0x1E0C99E60];
        v160 = objc_opt_class();
        v159 = objc_opt_class();
        v148 = objc_opt_class();
        v149 = objc_opt_class();
        v150 = objc_opt_class();
        v151 = objc_opt_class();
        objc_msgSend(v161, "setWithObjects:", v160, v159, v148, v149, v150, v151, objc_opt_class(), 0);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "decodeObjectOfClasses:forKey:", v152, *MEMORY[0x1E0CB2CD0]);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "finishDecoding");

      }
      else
      {
        v153 = 0;
      }
      v175[0] = MEMORY[0x1E0C809B0];
      v175[1] = 3221225472;
      v175[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_155;
      v175[3] = &unk_1E8EA3BE8;
      v175[4] = self;
      v176 = v167;
      objc_msgSend(v146, "instantiateViewControllerWithInputItems:connectionHandler:", v153, v175);

    }
    else
    {
      SBLogCFUserNotifications();
      v157 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
        -[SBUserNotificationAlert updateWithMessage:requestFlags:].cold.1(p_extensionIdentifier, v162, v157);

      v167[2]();
    }

  }
  else
  {
    remoteViewControllerClassName = self->_remoteViewControllerClassName;
    if (remoteViewControllerClassName && (remoteServiceBundleIdentifier = self->_remoteServiceBundleIdentifier) != 0)
    {
      v173[0] = MEMORY[0x1E0C809B0];
      v173[1] = 3221225472;
      v173[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_161;
      v173[3] = &unk_1E8EA3C10;
      v173[4] = self;
      v174 = v167;
      v156 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](_SBLegacyRemoteAlertContentHostViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", remoteViewControllerClassName, remoteServiceBundleIdentifier, v173);

    }
    else
    {
      v167[2]();
    }
  }

}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("swift-playgrounds"));
  if ((_DWORD)v3)
  {
    SBLogCFUserNotifications();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Filtering swift-playgrounds bundleID '%@' from 'allowed' set for user notification", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_139(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  _QWORD v17[5];
  id v18;

  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 448) & 4) != 0)
  {
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "visibleAlertItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);

    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2;
    v17[3] = &unk_1E8E9E820;
    v17[4] = *(_QWORD *)(a1 + 32);
    v7 = v3;
    v18 = v7;
    v8 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v17);
    v9 = v8;
    if (v4 == v5)
    {
      v10 = (void *)MEMORY[0x1E0CEABB8];
      v13[0] = v6;
      v13[1] = 3221225472;
      v13[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_3;
      v13[3] = &unk_1E8E9F170;
      v16 = v8;
      v11 = v7;
      v12 = *(_QWORD *)(a1 + 32);
      v14 = v11;
      v15 = v12;
      objc_msgSend(v10, "_performWithoutDeferringTransitions:", v13);

    }
    else
    {
      v8[2](v8);
      objc_msgSend(v7, "activateAlertItem:animated:", *(_QWORD *)(a1 + 32), 1);
    }

  }
  else if (*(_BYTE *)(v1 + 145))
  {
    objc_msgSend(*(id *)(a1 + 32), "_cleanupCustomContentViewControllers");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAC210], "activateAlertItem:");
  }
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 450) |= 2u;
  result = objc_msgSend(*(id *)(a1 + 40), "deactivateAlertItem:reason:animated:", *(_QWORD *)(a1 + 32), 5, 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 450) &= ~2u;
  return result;
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "activateAlertItem:animated:", *(_QWORD *)(a1 + 40), 0);
}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_155(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 392), a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "setUserNotification:");
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 392);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2_156;
    v15[3] = &unk_1E8E9E8D0;
    v11 = &v16;
    v16 = v9;
    objc_msgSend(v10, "configureWithCompletion:", v15);
  }
  else
  {
    SBLogCFUserNotifications();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_155_cold_1(v8, v12);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_158;
    v13[3] = &unk_1E8E9E8D0;
    v11 = &v14;
    v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v13);
  }

}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2_156(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_3_157;
  block[3] = &unk_1E8E9E8D0;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_3_157(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_158(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_161(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a2;
  if (!v6 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 400), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 400);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2_162;
    v10[3] = &unk_1E8E9E8D0;
    v11 = v8;
    objc_msgSend(v9, "_getPreferredContentSizeWithReplyBlock:", v10);

  }
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2_162(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  NSObject *portWatcher;
  NSObject *expirationTimer;
  _SBLegacyRemoteAlertContentHostViewController *v5;
  _SBSUICFUserNotificationContentHostViewController *v6;
  SBUISound *v7;
  SBUISound *v8;
  _SBLegacyRemoteAlertContentHostViewController *v9;
  _SBSUICFUserNotificationContentHostViewController *v10;
  void *v12;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  _SBSUICFUserNotificationContentHostViewController *v18;
  _SBLegacyRemoteAlertContentHostViewController *v19;
  SBUISound *v20;

  if (!self->_cleanedUp)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUserNotificationAlert.m"), 736, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_cleanedUp == YES"));

  }
  portWatcher = self->_portWatcher;
  if (portWatcher)
    dispatch_source_cancel(portWatcher);
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
    dispatch_source_cancel(expirationTimer);
  -[NSTimer invalidate](self->_soundStopTimer, "invalidate");
  -[BKSProcessAssertion invalidate](self->_processAssertion, "invalidate");
  v5 = self->_viewServiceContentViewController;
  v6 = self->_extensionContentViewController;
  v7 = self->_sound;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __34__SBUserNotificationAlert_dealloc__block_invoke;
  v17 = &unk_1E8E9E270;
  v18 = v6;
  v19 = v5;
  v20 = v7;
  v8 = v7;
  v9 = v5;
  v10 = v6;
  BSDispatchMain();

  v13.receiver = self;
  v13.super_class = (Class)SBUserNotificationAlert;
  -[SBUserNotificationAlert dealloc](&v13, sel_dealloc);
}

void __34__SBUserNotificationAlert_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SBUserNotificationAlert_dealloc__block_invoke_2;
  v4[3] = &unk_1E8E9DED8;
  v5 = v2;
  objc_msgSend(v5, "invalidateWithCompletion:", v4);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "disconnect");
  objc_msgSend(*(id *)(a1 + 48), "stop");

}

id __34__SBUserNotificationAlert_dealloc__block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "disconnect");
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_alertHeader, CFSTR("title"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_alertSource, CFSTR("source"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_sound, CFSTR("sound"), 1);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)_publicDescription
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_alertHeader, CFSTR("title"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_alertSource, CFSTR("source"));
  v6 = (id)objc_msgSend(v3, "appendInt:withName:", self->_originatingPID, CFSTR("pid"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_sound, CFSTR("sound"), 1);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int)token
{
  return self->_token;
}

- (BOOL)shouldShowInLockScreen
{
  return (*((unsigned __int8 *)self + 448) >> 3) & 1;
}

- (BOOL)dismissOnLock
{
  return (*((unsigned __int8 *)self + 448) >> 5) & 1;
}

- (BOOL)allowMenuButtonDismissal
{
  return *((_BYTE *)self + 449) & 1;
}

- (BOOL)wakeDisplay
{
  return (*((unsigned __int8 *)self + 449) >> 1) & 1;
}

- (BOOL)_displayActionButtonOnLockScreen
{
  return (*((unsigned __int8 *)self + 448) >> 4) & 1;
}

- (void)willActivate
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Can't activate a cleaned up alert", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (id)sound
{
  void *v3;
  int64_t soundAlertType;
  id v5;
  NSObject *v6;
  NSString **p_soundAlertTopic;
  SBUISound *v8;
  SBUISound *v9;
  NSString *soundPath;
  id v11;
  void *v12;
  SBUISound *v13;
  SBUISound *sound;
  int v16;
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_sound)
  {
    if (self->_soundPath)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        soundAlertType = self->_soundAlertType;
        v5 = objc_alloc(MEMORY[0x1E0DBF738]);
        if (soundAlertType)
        {
          v6 = objc_msgSend(v5, "initWithType:", self->_soundAlertType);
          p_soundAlertTopic = &self->_soundAlertTopic;
        }
        else
        {
          v6 = objc_msgSend(v5, "initWithType:", 16);
          p_soundAlertTopic = (NSString **)MEMORY[0x1E0DBF780];
        }
        -[NSObject setTopic:](v6, "setTopic:", *p_soundAlertTopic);
        -[NSObject setExternalToneFileURL:](v6, "setExternalToneFileURL:", v3);
        -[NSObject setShouldRepeat:](v6, "setShouldRepeat:", self->_soundRepeatDuration > 0.0);
        -[NSObject setMaximumDuration:](v6, "setMaximumDuration:", self->_soundRepeatDuration);
        if (self->_vibrationPattern)
          -[NSObject setExternalVibrationPattern:](v6, "setExternalVibrationPattern:");
        else
          -[NSObject setVibrationIdentifier:](v6, "setVibrationIdentifier:", *MEMORY[0x1E0DBF790]);
        v11 = objc_alloc(MEMORY[0x1E0DAC2A0]);
        objc_msgSend(MEMORY[0x1E0DBF730], "alertWithConfiguration:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (SBUISound *)objc_msgSend(v11, "initWithToneAlert:", v12);
        sound = self->_sound;
        self->_sound = v13;

      }
      else
      {
        SBLogCFUserNotifications();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          soundPath = self->_soundPath;
          v16 = 138543362;
          v17 = soundPath;
          _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Unable to create file URL for sound path: '%{public}@'", (uint8_t *)&v16, 0xCu);
        }
      }

    }
    else if (self->_soundID)
    {
      v8 = (SBUISound *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC2A0]), "initWithSystemSoundID:behavior:vibrationPattern:", self->_soundID, self->_soundIDBehavior, self->_vibrationPattern);
      v9 = self->_sound;
      self->_sound = v8;

    }
  }
  return self->_sound;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  _BOOL4 v4;
  char v6;
  char v7;
  void *v8;
  NSString **p_lockScreenAlertHeader;
  id *p_lockScreenAlertMessage;
  uint64_t v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  id v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  unint64_t requestFlags;
  BOOL v25;
  NSUInteger v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSString *alternateButtonTitle;
  int64_t alternateButtonActionStyle;
  void *v41;
  NSString *otherButtonTitle;
  int64_t otherButtonActionStyle;
  void *v44;
  NSString *v45;
  void *v46;
  int64_t defaultButtonActionStyle;
  void *v48;
  NSObject *v49;
  int64_t v50;
  _SBSUICFUserNotificationContentHostViewController *extensionContentViewController;
  void *viewServiceContentViewController;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSString *alertSource;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int64_t v62;
  void *v63;
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[6];
  _QWORD v69[6];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v4 = a3;
  v77 = *MEMORY[0x1E0C80C00];
  if (a3)
    v6 = 64;
  else
    v6 = 0;
  *((_BYTE *)self + 449) = *((_BYTE *)self + 449) & 0xBF | v6;
  if (a4)
    v7 = 0x80;
  else
    v7 = 0;
  *((_BYTE *)self + 449) = v7 & 0x80 | *((_BYTE *)self + 449) & 0x7F;
  -[SBAlertItem alertController](self, "alertController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_lockScreenAlertHeader = &self->_lockScreenAlertHeader;
    if (self->_lockScreenAlertHeader && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (p_lockScreenAlertHeader = &self->_alertHeader, self->_alertHeader)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v8, "setTitle:", *p_lockScreenAlertHeader);
    }
    p_lockScreenAlertMessage = &self->_lockScreenAlertMessage;
    if (self->_lockScreenAlertMessage)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = 208;
LABEL_22:
        v12 = *(__CFString **)((char *)&self->super.super.isa + v11);
        if (!v12)
          v12 = CFSTR(" ");
        v13 = *p_lockScreenAlertMessage;
        v14 = v12;
        objc_msgSend(v13, "componentsJoinedByString:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *p_lockScreenAlertMessage;
        *p_lockScreenAlertMessage = (id)v15;

        goto LABEL_25;
      }
      goto LABEL_25;
    }
  }
  else if (self->_alertHeader)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v8, "setTitle:", self->_alertHeader);
  }
  p_lockScreenAlertMessage = &self->_alertMessage;
  if (!self->_alertMessage)
    goto LABEL_26;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 184;
    goto LABEL_22;
  }
LABEL_25:
  objc_msgSend(v8, "setMessage:", *p_lockScreenAlertMessage);
LABEL_26:
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v17 = self->_textFieldDefinitions;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v71;
    v21 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v71 != v20)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
        v69[0] = v21;
        v69[1] = 3221225472;
        v69[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke;
        v69[3] = &unk_1E8EA3C38;
        v69[4] = v23;
        v69[5] = self;
        objc_msgSend(v8, "addTextFieldWithConfigurationHandler:", v69);
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v19);
  }

  requestFlags = self->_requestFlags;
  if (-[NSString length](self->_alternateButtonTitle, "length"))
    v25 = 1;
  else
    v25 = -[NSString length](self->_otherButtonTitle, "length") != 0;
  v26 = -[NSArray count](self->_customButtonDefinitions, "count");
  if ((v26 || v25 || (requestFlags & 0x20) == 0)
    && (!v4 || -[SBUserNotificationAlert _displayActionButtonOnLockScreen](self, "_displayActionButtonOnLockScreen")))
  {
    if (v26)
    {
      if (-[NSArray count](self->_customButtonDefinitions, "count"))
      {
        v27 = 0;
        v28 = 0x1E0CEA000uLL;
        v29 = MEMORY[0x1E0C809B0];
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->_customButtonDefinitions, "objectAtIndexedSubscript:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "title");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "length"))
          {
            v32 = *(void **)(v28 + 736);
            v33 = -[SBUserNotificationAlert _uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:](self, "_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:", objc_msgSend(v30, "presentationStyle"));
            v68[0] = v29;
            v68[1] = 3221225472;
            v68[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_2;
            v68[3] = &unk_1E8EA3C60;
            v68[4] = self;
            v68[5] = v27;
            objc_msgSend(v32, "actionWithTitle:style:handler:", v31, v33, v68);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addAction:", v34);
            if (objc_msgSend(v30, "isPreferredButton"))
            {
              v35 = v29;
              v36 = v28;
              objc_msgSend(v8, "setPreferredAction:", v34);
              SBLogCFUserNotifications();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                v38 = objc_msgSend(v34, "style");
                *(_DWORD *)buf = 134217984;
                v75 = v38;
                _os_log_impl(&dword_1D0540000, v37, OS_LOG_TYPE_DEFAULT, "presenting defaultAction with style: %ld", buf, 0xCu);
              }

              v28 = v36;
              v29 = v35;
            }

          }
          ++v27;
        }
        while (v27 < -[NSArray count](self->_customButtonDefinitions, "count"));
      }
    }
    else
    {
      if (-[NSString length](self->_alternateButtonTitle, "length"))
      {
        alternateButtonTitle = self->_alternateButtonTitle;
        alternateButtonActionStyle = self->_alternateButtonActionStyle;
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_190;
        v67[3] = &unk_1E8E9DCB0;
        v67[4] = self;
        objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", alternateButtonTitle, alternateButtonActionStyle, v67);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v41);
        if (self->_defaultButtonTag == 1)
          objc_msgSend(v8, "setPreferredAction:", v41);

      }
      if (-[NSString length](self->_otherButtonTitle, "length"))
      {
        otherButtonTitle = self->_otherButtonTitle;
        otherButtonActionStyle = self->_otherButtonActionStyle;
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_2_191;
        v66[3] = &unk_1E8E9DCB0;
        v66[4] = self;
        objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", otherButtonTitle, otherButtonActionStyle, v66);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v44);
        if (self->_defaultButtonTag == 2)
          objc_msgSend(v8, "setPreferredAction:", v44);

      }
      v45 = self->_defaultButtonTitle;
      if (!v45)
      {
        if ((self->_requestFlags & 0x20) != 0)
        {
          v45 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
          v45 = (NSString *)objc_claimAutoreleasedReturnValue();

        }
      }
      if (-[NSString length](v45, "length"))
      {
        defaultButtonActionStyle = self->_defaultButtonActionStyle;
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_3;
        v65[3] = &unk_1E8E9DCB0;
        v65[4] = self;
        objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v45, defaultButtonActionStyle, v65);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v48);
        SBLogCFUserNotifications();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = self->_defaultButtonActionStyle;
          *(_DWORD *)buf = 134217984;
          v75 = v50;
          _os_log_impl(&dword_1D0540000, v49, OS_LOG_TYPE_DEFAULT, "presenting defaultAction with style: %ld", buf, 0xCu);
        }

        if (self->_defaultButtonTag <= 0)
          objc_msgSend(v8, "setPreferredAction:", v48);

      }
    }
  }
  extensionContentViewController = self->_extensionContentViewController;
  if (extensionContentViewController)
  {
    -[_UIRemoteViewController setServiceViewShouldShareTouchesWithHost:](extensionContentViewController, "setServiceViewShouldShareTouchesWithHost:", 1);
    viewServiceContentViewController = self->_extensionContentViewController;
LABEL_74:
    objc_msgSend(v8, "setContentViewController:", viewServiceContentViewController);
    goto LABEL_75;
  }
  viewServiceContentViewController = self->_viewServiceContentViewController;
  if (viewServiceContentViewController)
    goto LABEL_74;
LABEL_75:
  objc_msgSend(v8, "title");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53 || (objc_msgSend(v8, "message"), (v53 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v8, "actions");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "count"))
    {

    }
    else
    {
      objc_msgSend(v8, "contentViewController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v55)
      {
        SBLogCFUserNotifications();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          alertSource = self->_alertSource;
          *(_DWORD *)buf = 138543362;
          v75 = (uint64_t)alertSource;
          _os_log_impl(&dword_1D0540000, v56, OS_LOG_TYPE_DEFAULT, "'%{public}@' trying to show malformed CFUserNotification.", buf, 0xCu);
        }

        if (os_variant_has_internal_content())
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ trying to show malformed CFUserNotification. Please file Radar."), self->_alertSource);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTitle:", v58);

        }
        v59 = (void *)MEMORY[0x1E0CEA2E0];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = self->_defaultButtonActionStyle;
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_199;
        v64[3] = &unk_1E8E9DCB0;
        v64[4] = self;
        objc_msgSend(v59, "actionWithTitle:style:handler:", v61, v62, v64);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v63);

      }
    }
  }

}

void __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v3);

  objc_msgSend(*(id *)(a1 + 32), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v4);

  objc_msgSend(v5, "setSecureTextEntry:", objc_msgSend(*(id *)(a1 + 32), "isSecure"));
  objc_msgSend(v5, "setKeyboardAppearance:", 1);
  objc_msgSend(v5, "setAutocapitalizationType:", objc_msgSend(*(id *)(a1 + 32), "autocapitalizationType"));
  objc_msgSend(v5, "setAutocorrectionType:", objc_msgSend(*(id *)(a1 + 32), "autocorrectionType"));
  objc_msgSend(v5, "setKeyboardType:", objc_msgSend(*(id *)(a1 + 32), "keyboardType"));
  if (objc_msgSend(*(id *)(a1 + 32), "_hasSetMaxLength"))
  {
    objc_msgSend(v5, "sb_setMaxInputLength:", objc_msgSend(*(id *)(a1 + 32), "maxLength"));
    objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 40));
  }

}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissIfNecessaryWithResponse:customButtonResponse:", 2, *(unsigned int *)(a1 + 40));
}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_190(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissIfNecessaryWithResponse:", 1);
}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_2_191(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissIfNecessaryWithResponse:", 2);
}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissIfNecessaryWithResponse:", 0);
}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_199(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissIfNecessaryWithResponse:", 0);
}

- (id)elementIdentifier
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUserNotificationAlert;
  -[SBAlertItem elementIdentifier](&v6, sel_elementIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-<%p>"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)clientIdentifier
{
  NSString *alertSource;

  alertSource = self->_alertSource;
  if (alertSource)
    return alertSource;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("process with pid:%d"), self->_originatingPID);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createSystemApertureElement
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _SBUserNotificationAlertElement *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id location;

  if (!-[SBUserNotificationAlert prefersSystemAperturePresentation](self, "prefersSystemAperturePresentation"))
    return 0;
  -[SBUserNotificationAlert systemApertureContentDefinition](self, "systemApertureContentDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DAC6A8]);
  objc_msgSend(v3, "leadingAssetDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[SBUserNotificationAlert _imageForDefinition:](self, "_imageForDefinition:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_13:

LABEL_14:
      goto LABEL_15;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B8]), "initWithImage:", v7);
    objc_msgSend(v6, "sb_resolvedTintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "setContentColor:", v9);
    objc_msgSend(v4, "setLeadingContentViewProvider:", v8);

LABEL_12:
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "caPackagePath");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_14;
    v7 = (void *)v11;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6A0]), "initWithURL:", v11);
    objc_msgSend(v4, "setLeadingContentViewProvider:", v8);
    goto LABEL_12;
  }
LABEL_15:
  v50 = v5;
  objc_msgSend(v3, "alertTextAlignment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v12;
  if (v12)
    v13 = (int)safeIntValue(v12);
  else
    v13 = 4;
  objc_msgSend(v3, "alertHeader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    -[SBUserNotificationAlert alertHeader](self, "alertHeader");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  objc_msgSend(v3, "alertMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");
  v47 = v17;
  if (objc_msgSend(v17, "length"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6E8]), "initWithText:style:", v17, v19 != 0, v17, v49);
    objc_msgSend(v20, "setTextAlignment:", v13);
    objc_msgSend(v20, "setNumberOfLines:", 0);
    objc_msgSend(v3, "alertHeaderColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sb_resolvedColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(v20, "setContentColor:", v22);
    objc_msgSend(v4, "setPrimaryContentViewProvider:", v20);

  }
  if (v19)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6E8]), "initWithText:style:", v18, 3);
    objc_msgSend(v23, "setTextAlignment:", v13);
    objc_msgSend(v23, "setNumberOfLines:", 0);
    objc_msgSend(v4, "setSecondaryContentViewProvider:", v23);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v47);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v3, "defaultButtonTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "length"))
  {
    v26 = objc_alloc(MEMORY[0x1E0DAC690]);
    v27 = (void *)MEMORY[0x1E0CEA2A8];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke_2;
    v53[3] = &unk_1E8EA3C88;
    objc_copyWeak(&v54, &location);
    objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v25, 0, 0, v53);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v26, "initWithDefaultTextActionConfigurationWithAction:", v28);

    __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke(v30, self->_defaultButtonActionStyle);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      objc_msgSend(v29, "setContentColor:", v31);
    objc_msgSend(v24, "addObject:", v29);

    objc_destroyWeak(&v54);
  }
  objc_msgSend(v3, "alternateButtonTitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    v34 = v32;
  }
  else
  {
    -[SBUserNotificationAlert alternateButtonTitle](self, "alternateButtonTitle");
    v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  v35 = v34;

  if (objc_msgSend(v35, "length"))
  {
    v36 = objc_alloc(MEMORY[0x1E0DAC690]);
    v37 = (void *)MEMORY[0x1E0CEA2A8];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke_3;
    v51[3] = &unk_1E8EA3C88;
    objc_copyWeak(&v52, &location);
    objc_msgSend(v37, "actionWithTitle:image:identifier:handler:", v35, 0, 0, v51);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v36, "initWithDefaultTextActionConfigurationWithAction:", v38);

    __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke(v40, self->_alternateButtonActionStyle);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      objc_msgSend(v39, "setContentColor:", v41);
    objc_msgSend(v24, "addObject:", v39);

    objc_destroyWeak(&v52);
  }
  v42 = objc_msgSend(v24, "count");
  if (v42)
  {
    if (v42 == 1)
    {
      objc_msgSend(v24, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6E0]), "initWithContentViewProviders:", v24);
    }
    objc_msgSend(v4, "setActionContentViewProvider:", v43);

  }
  v44 = -[SBSystemApertureProvidedContentElement initWithIdentifier:contentProvider:]([_SBUserNotificationAlertElement alloc], "initWithIdentifier:contentProvider:", self, v4);
  objc_msgSend(v3, "keyColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sb_resolvedColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
    -[_SBUserNotificationAlertElement setKeyColor:](v44, "setKeyColor:", v46);
  -[_SBUserNotificationAlertElement setPreventsAutomaticDismissal:](v44, "setPreventsAutomaticDismissal:", objc_msgSend(v3, "preventsAutomaticDismissal"));

  objc_destroyWeak(&location);
  return v44;
}

id __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissIfNecessaryWithResponse:", 0);

}

void __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissIfNecessaryWithResponse:", 1);

}

- (id)_prepareNewAlertControllerWithLockedState:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  -[SBUserNotificationAlert _clearRemoteViewControllerIfPresent](self, "_clearRemoteViewControllerIfPresent");
  v8.receiver = self;
  v8.super_class = (Class)SBUserNotificationAlert;
  -[SBAlertItem _prepareNewAlertControllerWithLockedState:requirePasscodeForActions:](&v8, sel__prepareNewAlertControllerWithLockedState_requirePasscodeForActions_, v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_clearRemoteViewControllerIfPresent
{
  void *v3;
  _SBSUICFUserNotificationContentHostViewController *v4;
  _SBSUICFUserNotificationContentHostViewController *extensionContentViewController;
  _SBLegacyRemoteAlertContentHostViewController *v6;
  _SBLegacyRemoteAlertContentHostViewController *viewServiceContentViewController;
  id v8;
  id v9;

  -[SBAlertItem alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)self + 448) & 4) == 0)
  {
    if (v3)
    {
      if (self->_extensionContentViewController)
      {
        v8 = v3;
        objc_msgSend(v3, "contentViewController");
        v4 = (_SBSUICFUserNotificationContentHostViewController *)objc_claimAutoreleasedReturnValue();
        extensionContentViewController = self->_extensionContentViewController;

        v3 = v8;
        if (v4 == extensionContentViewController)
        {
          objc_msgSend(v8, "setContentViewController:", 0);
          v3 = v8;
        }
      }
    }
  }
  if ((*((_BYTE *)self + 448) & 4) == 0)
  {
    if (v3)
    {
      if (self->_viewServiceContentViewController)
      {
        v9 = v3;
        objc_msgSend(v3, "contentViewController");
        v6 = (_SBLegacyRemoteAlertContentHostViewController *)objc_claimAutoreleasedReturnValue();
        viewServiceContentViewController = self->_viewServiceContentViewController;

        v3 = v9;
        if (v6 == viewServiceContentViewController)
        {
          objc_msgSend(v9, "setContentViewController:", 0);
          v3 = v9;
        }
      }
    }
  }

}

- (void)doCleanupAfterDeactivationAnimation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUserNotificationAlert;
  -[SBAlertItem doCleanupAfterDeactivationAnimation](&v3, sel_doCleanupAfterDeactivationAnimation);
  -[SBUserNotificationAlert _clearRemoteViewControllerIfPresent](self, "_clearRemoteViewControllerIfPresent");
}

- (void)_setActivated:(BOOL)a3
{
  _BOOL4 v3;
  int v6;
  NSObject *expirationTimer;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  dispatch_time_t v11;
  NSObject *v12;
  void *v14;
  _QWORD handler[5];

  v3 = a3;
  if (self->_cleanedUp && a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUserNotificationAlert.m"), 1164, CFSTR("cannot activate an already cleaned up alert"));

  }
  if (v3)
    v6 = 4;
  else
    v6 = 0;
  *((_BYTE *)self + 448) = *((_BYTE *)self + 448) & 0xFB | v6;
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel(expirationTimer);
    v8 = self->_expirationTimer;
    self->_expirationTimer = 0;

    v6 = *((_BYTE *)self + 448) & 4;
  }
  if (v6)
  {
    if (self->_timeout >= 1)
    {
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 2uLL, 0, MEMORY[0x1E0C80D38]);
      v10 = self->_expirationTimer;
      self->_expirationTimer = v9;

      v11 = dispatch_time(0x8000000000000000, 1000000000 * self->_timeout);
      dispatch_source_set_timer((dispatch_source_t)self->_expirationTimer, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v12 = self->_expirationTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __41__SBUserNotificationAlert__setActivated___block_invoke;
      handler[3] = &unk_1E8E9DED8;
      handler[4] = self;
      dispatch_source_set_event_handler(v12, handler);
      dispatch_resume((dispatch_object_t)self->_expirationTimer);
    }
  }
}

void __41__SBUserNotificationAlert__setActivated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 136);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = 0;

  }
}

- (void)_cleanup
{
  NSObject *portWatcher;
  OS_dispatch_source *v4;
  NSObject *expirationTimer;
  OS_dispatch_source *v6;
  id v7;

  if (!self->_cleanedUp)
  {
    -[SBUserNotificationAlert _setActivated:](self, "_setActivated:", 0);
    portWatcher = self->_portWatcher;
    if (portWatcher)
    {
      dispatch_source_cancel(portWatcher);
      v4 = self->_portWatcher;
      self->_portWatcher = 0;

    }
    expirationTimer = self->_expirationTimer;
    if (expirationTimer)
    {
      dispatch_source_cancel(expirationTimer);
      v6 = self->_expirationTimer;
      self->_expirationTimer = 0;

    }
    self->_cleanedUp = 1;
    if (-[SBAlertItem _presentationState](self, "_presentationState") == 4)
      -[SBUserNotificationAlert _cleanupCustomContentViewControllers](self, "_cleanupCustomContentViewControllers");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SBUserNotificationDoneNotification"), self);

  }
}

- (void)cancel
{
  *((_BYTE *)self + 448) |= 2u;
  if (!self->_sentResponse)
    -[SBUserNotificationAlert _sendResponseAndCleanUp:](self, "_sendResponseAndCleanUp:", 3);
  -[SBAlertItem deactivate](self, "deactivate");
}

- (void)_sendResponseAndCleanUp:(int)a3
{
  -[SBUserNotificationAlert _sendResponseAndCleanUp:customButtonResponse:](self, "_sendResponseAndCleanUp:customButtonResponse:", *(_QWORD *)&a3, 0xFFFFFFFFLL);
}

- (void)_sendResponseAndCleanUp:(int)a3 customButtonResponse:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  int v9;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  const __CFString *v19;
  NSObject *v20;
  const __CFData *v21;
  mach_msg_size_t v22;
  id v23;
  void *v24;
  void *v25;
  const __CFData *Data;
  char *v27;
  UInt8 *v28;
  unsigned int *p_replyPort;
  NSObject *v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;
  CFRange v34;

  v33 = *MEMORY[0x1E0C80C00];
  if (!self->_sentResponse)
  {
    v4 = *(_QWORD *)&a4;
    self->_sentResponse = 1;
    -[SBAlertItem alertController](self, "alertController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_replyFlags = a3;
    objc_msgSend(v7, "textFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (self->_replyFlags == 3 || v9 < 1)
    {
      v11 = 0;
    }
    else if (v9 == 1)
    {
      objc_msgSend(v7, "textFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "text");
      v14 = objc_claimAutoreleasedReturnValue();

      if (v14)
        v11 = (__CFString *)v14;
      else
        v11 = &stru_1E8EC7EC0;
    }
    else
    {
      v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
      v15 = 0;
      do
      {
        objc_msgSend(v7, "textFields");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "text");
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v18)
          v19 = v18;
        else
          v19 = &stru_1E8EC7EC0;
        -[__CFString addObject:](v11, "addObject:", v19);

        ++v15;
      }
      while (v9 != v15);
      v4 = v4;
    }
    SBLogCFUserNotifications();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v32 = v9;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_INFO, "Sending back %d textField response(s) to alert item owner.", buf, 8u);
    }

    if ((v4 & 0x80000000) == 0 || v11)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v24 = v23;
      if (v11)
        objc_msgSend(v23, "setObject:forKey:", v11, *MEMORY[0x1E0C9B880]);
      if ((v4 & 0x80000000) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v25, *MEMORY[0x1E0DABA60]);

      }
      Data = CFPropertyListCreateData(0, v24, kCFPropertyListXMLFormat_v1_0, 0, 0);
      v21 = Data;
      if (Data)
        v22 = ((CFDataGetLength(Data) + 3) & 0xFFFFFFFC) + 28;
      else
        v22 = 28;

    }
    else
    {
      v21 = 0;
      v22 = 28;
    }
    v27 = (char *)malloc_type_calloc(v22, 1uLL, 0x4CB55D88uLL);
    if (v27)
    {
      v28 = (UInt8 *)v27;
      *(_DWORD *)v27 = 18;
      *((_DWORD *)v27 + 1) = v22;
      p_replyPort = &self->_replyPort;
      *((_DWORD *)v27 + 2) = self->_replyPort;
      *((_DWORD *)v27 + 3) = 0;
      *(_QWORD *)(v27 + 20) = self->_replyFlags;
      if (v21)
      {
        v34.length = CFDataGetLength(v21);
        v34.location = 0;
        CFDataGetBytes(v21, v34, v28 + 28);
      }
      if (mach_msg((mach_msg_header_t *)v28, 1, v22, 0, 0, 0, 0))
      {
        mach_msg_destroy((mach_msg_header_t *)v28);
        *p_replyPort = 0;
        SBLogCFUserNotifications();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[SBUserNotificationAlert _sendResponseAndCleanUp:customButtonResponse:].cold.2((int *)&self->_replyPort, v30);
      }
      else
      {
        *p_replyPort = 0;
        SBLogCFUserNotifications();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[SBUserNotificationAlert _sendResponseAndCleanUp:customButtonResponse:].cold.1(v30);
      }

      free(v28);
    }
    if (v21)
      CFRelease(v21);
    -[SBUserNotificationAlert _cleanup](self, "_cleanup");

  }
}

- (void)performUnlockAction
{
  char v2;
  uint64_t unlockActionButtonTag;
  void *v6;
  int v7;
  NSURL *defaultResponseLaunchURL;
  id v9;
  void *v10;
  id v11;

  v2 = *((_BYTE *)self + 450);
  if (self->_unlockActionButtonTag != -1 || (v2 & 1) != 0)
  {
    *((_BYTE *)self + 450) = v2 & 0xFE;
    unlockActionButtonTag = self->_unlockActionButtonTag;
    if ((unlockActionButtonTag + 1) <= 1)
    {
      objc_msgSend((id)SBApp, "authenticationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isAuthenticated");

      if (v7)
      {
        defaultResponseLaunchURL = self->_defaultResponseLaunchURL;
        if (defaultResponseLaunchURL)
        {
          v11 = 0;
          SBWorkspaceApplicationForURLWithError(defaultResponseLaunchURL, 0, &v11);
          unlockActionButtonTag = objc_claimAutoreleasedReturnValue();
          v9 = v11;
          if (!unlockActionButtonTag)
            goto LABEL_17;
          goto LABEL_15;
        }
        if (self->_defaultResponseLaunchBundleID)
        {
          +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "applicationWithBundleIdentifier:", self->_defaultResponseLaunchBundleID);
          unlockActionButtonTag = objc_claimAutoreleasedReturnValue();

          v9 = 0;
          if (unlockActionButtonTag)
          {
LABEL_15:
            -[SBUserNotificationAlert _activateApplication:withURL:](self, "_activateApplication:withURL:", unlockActionButtonTag, v9);

            goto LABEL_16;
          }
LABEL_17:
          -[SBUserNotificationAlert _sendResponseAndCleanUp:](self, "_sendResponseAndCleanUp:", unlockActionButtonTag);

          return;
        }
      }
      else if ((_DWORD)unlockActionButtonTag == -1)
      {
        return;
      }
      v9 = 0;
LABEL_16:
      unlockActionButtonTag = 0;
      goto LABEL_17;
    }
    v9 = 0;
    goto LABEL_17;
  }
}

- (void)dismissIfNecessaryWithResponse:(int)a3
{
  -[SBUserNotificationAlert dismissIfNecessaryWithResponse:customButtonResponse:](self, "dismissIfNecessaryWithResponse:customButtonResponse:", *(_QWORD *)&a3, 0xFFFFFFFFLL);
}

- (void)dismissIfNecessaryWithResponse:(int)a3 customButtonResponse:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSString *defaultResponseLaunchBundleID;
  NSURL *defaultResponseLaunchURL;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  SBLockScreenUnlockRequest *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  SBUserNotificationAlert *v20;
  id v21;
  id v22;
  id v23;
  id location;
  id v25;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (!a3)
  {
    defaultResponseLaunchBundleID = self->_defaultResponseLaunchBundleID;
    defaultResponseLaunchURL = self->_defaultResponseLaunchURL;
    if (defaultResponseLaunchBundleID)
    {
      if (!defaultResponseLaunchURL)
      {
        +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "applicationWithBundleIdentifier:", self->_defaultResponseLaunchBundleID);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = 0;
        if (!v10)
          goto LABEL_11;
        goto LABEL_8;
      }
LABEL_7:
      v25 = 0;
      SBWorkspaceApplicationForURLWithError(defaultResponseLaunchURL, 0, &v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v25;
      if (!v10)
      {
LABEL_11:

        goto LABEL_12;
      }
LABEL_8:
      objc_msgSend((id)SBApp, "authenticationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isAuthenticated");

      if ((v13 & 1) == 0)
        *((_BYTE *)self + 450) |= 1u;
      v14 = objc_alloc_init(SBLockScreenUnlockRequest);
      -[SBLockScreenUnlockRequest setSource:](v14, "setSource:", 10);
      -[SBLockScreenUnlockRequest setIntent:](v14, "setIntent:", 3);
      -[SBLockScreenUnlockRequest setName:](v14, "setName:", CFSTR("SpringBoard: unlock from SBUserNotificationAlert"));
      objc_initWeak(&location, self);
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __79__SBUserNotificationAlert_dismissIfNecessaryWithResponse_customButtonResponse___block_invoke;
      v19 = &unk_1E8EA3CB0;
      v20 = self;
      objc_copyWeak(&v23, &location);
      v21 = v10;
      v22 = v11;
      objc_msgSend(v15, "unlockWithRequest:completion:", v14, &v16);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

      goto LABEL_11;
    }
    if (defaultResponseLaunchURL)
      goto LABEL_7;
  }
LABEL_12:
  -[SBUserNotificationAlert _setActivated:](self, "_setActivated:", 0, v16, v17, v18, v19, v20);
  -[SBUserNotificationAlert _sendResponseAndCleanUp:customButtonResponse:](self, "_sendResponseAndCleanUp:customButtonResponse:", v5, v4);
  -[SBAlertItem deactivateForButton](self, "deactivateForButton");
}

void __79__SBUserNotificationAlert_dismissIfNecessaryWithResponse_customButtonResponse___block_invoke(uint64_t a1)
{
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 450) &= ~1u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_activateApplication:withURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_activateApplication:(id)a3 withURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SBUserNotificationAlert__activateApplication_withURL___block_invoke;
  v10[3] = &unk_1E8EA0260;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "requestTransitionWithBuilder:", v10);

}

void __56__SBUserNotificationAlert__activateApplication_withURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SBUserNotificationAlert__activateApplication_withURL___block_invoke_2;
  v4[3] = &unk_1E8E9ECA8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __56__SBUserNotificationAlert__activateApplication_withURL___block_invoke_2(uint64_t a1, void *a2)
{
  SBDeviceApplicationSceneEntity *v3;
  SBDeviceApplicationSceneEntity *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    -[SBWorkspaceEntity setObject:forActivationSetting:](v3, "setObject:forActivationSetting:", v5, 5);
  objc_msgSend(v6, "setEntity:forLayoutRole:", v4, 1);

}

- (BOOL)allowLockScreenDismissal
{
  return *((_BYTE *)self + 472) & 1;
}

- (BOOL)allowInLoginWindow
{
  return *((_BYTE *)self + 448) & 1;
}

- (BOOL)behavesSuperModally
{
  return *((unsigned __int8 *)self + 448) >> 7;
}

- (BOOL)forcesModalAlertAppearance
{
  return (*((_BYTE *)self + 449) & 4) != 0 || *((char *)self + 448) < 0;
}

- (BOOL)dismissesOverlaysOnLockScreen
{
  return (*((unsigned __int8 *)self + 449) >> 3) & 1;
}

- (BOOL)hideOnClonedDisplay
{
  return (*((unsigned __int8 *)self + 449) >> 5) & 1;
}

- (BOOL)reappearsAfterLock
{
  return (*((_BYTE *)self + 448) & 0x20) == 0;
}

- (BOOL)reappearsAfterUnlock
{
  return (*((unsigned __int8 *)self + 448) >> 6) & 1;
}

- (void)_noteSilencingHardwareButtonPressed
{
  id v2;

  -[SBUserNotificationAlert sound](self, "sound");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)willDeactivateForReason:(int)a3
{
  BSInvalidatable *idleTimerDisableAssertion;
  BSInvalidatable *v5;
  id v6;

  if ((*((_BYTE *)self + 449) & 0x10) != 0)
  {
    idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
    if (idleTimerDisableAssertion)
    {
      -[BSInvalidatable invalidate](idleTimerDisableAssertion, "invalidate", *(_QWORD *)&a3);
      v5 = self->_idleTimerDisableAssertion;
      self->_idleTimerDisableAssertion = 0;

    }
  }
  -[SBUserNotificationAlert sound](self, "sound", *(_QWORD *)&a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

}

- (void)didDeactivateForReason:(int)a3
{
  uint64_t v4;
  char v5;
  int v6;
  objc_super v7;

  if ((*((_BYTE *)self + 450) & 2) != 0)
  {
    -[SBUserNotificationAlert _setActivated:](self, "_setActivated:", 0);
    return;
  }
  v4 = *(_QWORD *)&a3;
  if ((*((_BYTE *)self + 448) & 2) != 0)
    goto LABEL_13;
  v5 = *((_BYTE *)self + 448);
  LOBYTE(v6) = a3 != 1 && (v5 & 4) != 0;
  if (a3 == 6)
  {
    if ((*((_BYTE *)self + 448) & 0x40) != 0 || (*((_BYTE *)self + 450) & 1) != 0)
    {
      -[SBUserNotificationAlert _setActivated:](self, "_setActivated:", 0);
      goto LABEL_14;
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 1)
        goto LABEL_14;
      -[SBUserNotificationAlert _setActivated:](self, "_setActivated:", 0);
      if ((v5 & 4) == 0 || (v4 | 2) == 3)
        goto LABEL_14;
      goto LABEL_13;
    }
    v6 &= *((unsigned __int8 *)self + 448) >> 5;
  }
  -[SBUserNotificationAlert _setActivated:](self, "_setActivated:", 0);
  if ((v6 & 1) != 0)
LABEL_13:
    -[SBUserNotificationAlert _sendResponseAndCleanUp:](self, "_sendResponseAndCleanUp:", 3);
LABEL_14:
  v7.receiver = self;
  v7.super_class = (Class)SBUserNotificationAlert;
  -[SBAlertItem didDeactivateForReason:](&v7, sel_didDeactivateForReason_, v4);
}

- (void)didFailToActivate
{
  objc_super v3;

  -[SBUserNotificationAlert _setActivated:](self, "_setActivated:", 0);
  -[SBUserNotificationAlert _sendResponseAndCleanUp:](self, "_sendResponseAndCleanUp:", 3);
  v3.receiver = self;
  v3.super_class = (Class)SBUserNotificationAlert;
  -[SBAlertItem didFailToActivate](&v3, sel_didFailToActivate);
}

- (void)presentationStateDidChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUserNotificationAlert;
  -[SBAlertItem presentationStateDidChangeFromState:toState:](&v6, sel_presentationStateDidChangeFromState_toState_, a3);
  if (a4 == 4 && self->_cleanedUp)
    -[SBUserNotificationAlert _cleanupCustomContentViewControllers](self, "_cleanupCustomContentViewControllers");
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  length = a4.length;
  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10 >= length)
    v11 = v10 - length;
  else
    v11 = 0;
  v12 = objc_msgSend(v7, "length");

  v13 = v12 + v11;
  v14 = objc_msgSend(v8, "sb_maxInputLength");

  return v13 <= v14;
}

- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5
{
  return self->_visualStyle;
}

- (void)_cleanupCustomContentViewControllers
{
  NSObject *v4;
  _SBSUICFUserNotificationContentHostViewController *v5;
  _SBSUICFUserNotificationContentHostViewController *v6;
  id v7;
  _SBLegacyRemoteAlertContentHostViewController *viewServiceContentViewController;
  _SBSUICFUserNotificationContentHostViewController *extensionContentViewController;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _SBSUICFUserNotificationContentHostViewController *v13;
  uint8_t buf[4];
  SBUserNotificationAlert *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_cleanedUp)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUserNotificationAlert.m"), 1519, CFSTR("AlertItem must be cleaned up to clear custom content view controller."));

  }
  if (-[SBAlertItem _presentationState](self, "_presentationState") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUserNotificationAlert.m"), 1520, CFSTR("Presentation state must be \"disappeared\" before the custom content view controller may be cleaned up."));

  }
  SBLogCFUserNotifications();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Clearing custom user content view controller for complete CFUserNotification.", buf, 0xCu);
  }

  v5 = self->_extensionContentViewController;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SBUserNotificationAlert__cleanupCustomContentViewControllers__block_invoke;
  v12[3] = &unk_1E8E9DED8;
  v13 = v5;
  v6 = v5;
  -[_SBSUICFUserNotificationContentHostViewController invalidateWithCompletion:](v6, "invalidateWithCompletion:", v12);
  v7 = -[_UIRemoteViewController disconnect](self->_viewServiceContentViewController, "disconnect");
  viewServiceContentViewController = self->_viewServiceContentViewController;
  self->_viewServiceContentViewController = 0;

  extensionContentViewController = self->_extensionContentViewController;
  self->_extensionContentViewController = 0;

}

id __63__SBUserNotificationAlert__cleanupCustomContentViewControllers__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "disconnect");
}

- (id)_parseLegacyTextFieldDefinitions:(id)a3 locBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SBUserNotificationAlert *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B878]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v8, v7);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B880]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = self;
  v40 = v7;
  -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v10, v7);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = (void *)v9;
  v39 = (void *)v9;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v13 = 0;
  }
  v14 = v13;
LABEL_6:
  v15 = v14;
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();
  v17 = (void *)v11;
  if ((v16 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v17 = 0;
  }
  v18 = v17;
LABEL_11:
  v19 = v18;
  v38 = (void *)v11;
  if (!objc_msgSend(v15, "count"))
  {
    v21 = 0;
    v23 = 0;
    v25 = 0;
    goto LABEL_37;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9B850]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  safeArrayOfIntNumberValue(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABC98]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  safeArrayOfIntNumberValue(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DABCA0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  safeArrayOfIntNumberValue(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "count"))
  {
LABEL_37:
    v27 = 0;
    goto LABEL_38;
  }
  v37 = v6;
  v26 = 0;
  v27 = 0;
  v41 = v19;
  do
  {
    if (v19 && objc_msgSend(v19, "count") > v26)
    {
      objc_msgSend(v19, "objectAtIndex:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      safeStringValue(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = 0;
    }
    if (objc_msgSend(v15, "count") <= v26)
    {
      v30 = 0;
    }
    else
    {
      objc_msgSend(v15, "objectAtIndex:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v31 = objc_alloc_init(MEMORY[0x1E0DAAF28]);
    objc_msgSend(v31, "setValue:", v29);
    objc_msgSend(v31, "setTitle:", v30);
    if (((v42->_requestFlags >> v26) & 0x10000) != 0)
      objc_msgSend(v31, "setSecure:", 1);
    if (v23 && objc_msgSend(v23, "count") > v26)
    {
      objc_msgSend(v23, "objectAtIndex:", v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAutocapitalizationType:", (int)objc_msgSend(v32, "intValue"));

      v19 = v41;
    }
    if (v25 && objc_msgSend(v25, "count") > v26)
    {
      objc_msgSend(v25, "objectAtIndex:", v26);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAutocorrectionType:", (int)objc_msgSend(v33, "intValue"));

      v19 = v41;
    }
    if (v21 && objc_msgSend(v21, "count") > v26)
    {
      objc_msgSend(v21, "objectAtIndex:", v26);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setKeyboardType:", (int)objc_msgSend(v34, "intValue"));

      v19 = v41;
    }
    if (!v27)
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v27, "addObject:", v31);

    ++v26;
  }
  while (objc_msgSend(v15, "count") > v26);
  v6 = v37;
LABEL_38:
  v35 = v27;

  return v35;
}

- (id)_parseTextFieldDefinitions:(id)a3 locBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  id v24;
  id v25;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v25 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v24 = v5;
        obj = v5;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (!v8)
        {
          v28 = 0;
          v7 = v25;
          goto LABEL_26;
        }
        v9 = v8;
        v28 = 0;
        v10 = *(_QWORD *)v30;
        v7 = v25;
        while (1)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF28]), "_initWithDictionary:", v12);
              objc_msgSend(v13, "title");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v14, v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "value");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v16, v7);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "title");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((BSEqualObjects() & 1) != 0)
              {
                objc_msgSend(v13, "value");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = BSEqualObjects();

                v7 = v25;
                if ((v20 & 1) != 0)
                  goto LABEL_15;
              }
              else
              {

              }
              objc_msgSend(v13, "setTitle:", v15);
              objc_msgSend(v13, "setValue:", v17);
LABEL_15:
              v21 = (void *)objc_msgSend(v13, "copy");
              if (v21)
              {
                v22 = v28;
                if (!v28)
                  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v28 = v22;
                objc_msgSend(v22, "addObject:", v21);
              }

              continue;
            }
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (!v9)
          {
LABEL_26:

            v5 = v24;
            goto LABEL_27;
          }
        }
      }
    }
    v28 = 0;
    v7 = v25;
  }
  else
  {
    v28 = 0;
  }
LABEL_27:

  return v28;
}

- (id)_parseCustomButtonDefinitions:(id)a3 locBundle:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v20 = v5;
    v6 = v5;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF20]), "_initWithDictionary:", v12);
            objc_msgSend(v13, "title");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBUserNotificationAlert _safeLocalizedValue:withBundle:](self, "_safeLocalizedValue:withBundle:", v14, v22);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "title");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = BSEqualObjects();

            if ((v17 & 1) == 0)
              objc_msgSend(v13, "setTitle:", v15);
            v18 = (void *)objc_msgSend(v13, "copy");
            if (v18)
            {
              if (!v9)
                v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v9, "addObject:", v18);
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v5 = v20;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:(int)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 1);
}

- (int64_t)_uiAlertActionLayoutDirectionFromSBUserNotificationButtonLayoutDirection:(unsigned int)a3
{
  if ((a3 & 3) != 0)
    return a3 & 3;
  else
    return 3;
}

- (id)_parseSystemApertureContentDefinition:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAB070]), "_initWithDictionary:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)_parseAssetDefinition:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DAB058], "_definitionFromSerializedDefinition:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_imageDefinitionForPath:(id)a3 catalogPath:(id)a4 catalogImageKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DAB068], "definitionWithImagePath:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = (void *)v11;
    goto LABEL_7;
  }
  v12 = 0;
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0DAB068], "definitionWithImageCatalogPath:catalogImageKey:", v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:

  return v12;
}

- (id)_imageForDefinition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMapTable *imagesByDefinition;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  -[NSMapTable objectForKey:](self->_imagesByDefinition, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "sb_resolvedImage");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = (void *)v6;
      imagesByDefinition = self->_imagesByDefinition;
      if (!imagesByDefinition)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v9 = self->_imagesByDefinition;
        self->_imagesByDefinition = v8;

        imagesByDefinition = self->_imagesByDefinition;
      }
      -[NSMapTable setObject:forKey:](imagesByDefinition, "setObject:forKey:", v5, v4);
      goto LABEL_7;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
LABEL_7:
  v10 = v5;

LABEL_9:
  return v10;
}

- (id)keyboardTypes
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setKeyboardTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (id)autocapitalizationTypes
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setAutocapitalizationTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (id)autocorrectionTypes
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)setAutocorrectionTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (id)textFieldTitles
{
  return objc_getProperty(self, a2, 320, 1);
}

- (void)setTextFieldTitles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (id)textFieldValues
{
  return objc_getProperty(self, a2, 328, 1);
}

- (void)setTextFieldValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSString)soundPath
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSoundPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (unsigned)soundID
{
  return self->_soundID;
}

- (void)setSoundID:(unsigned int)a3
{
  self->_soundID = a3;
}

- (unsigned)soundIDBehavior
{
  return self->_soundIDBehavior;
}

- (void)setSoundIDBehavior:(unsigned int)a3
{
  self->_soundIDBehavior = a3;
}

- (NSDictionary)vibrationPattern
{
  return (NSDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setVibrationPattern:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (int64_t)soundAlertType
{
  return self->_soundAlertType;
}

- (void)setSoundAlertType:(int64_t)a3
{
  self->_soundAlertType = a3;
}

- (NSString)soundAlertTopic
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSoundAlertTopic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSString)alertHeader
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAlertHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)alertMessage
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAlertMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)alertMessageDelimiter
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAlertMessageDelimiter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)lockScreenAlertHeader
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLockScreenAlertHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)lockScreenAlertMessage
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLockScreenAlertMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)lockScreenAlertMessageDelimiter
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLockScreenAlertMessageDelimiter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)defaultButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)alternateButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)otherButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setOtherButtonTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)defaultResponseLaunchBundleID
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setDefaultResponseLaunchBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSURL)defaultResponseLaunchURL
{
  return (NSURL *)objc_getProperty(self, a2, 368, 1);
}

- (void)setDefaultResponseLaunchURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (SBSUserNotificationImageDefinition)headerImageDefinition
{
  return (SBSUserNotificationImageDefinition *)objc_getProperty(self, a2, 512, 1);
}

- (void)setHeaderImageDefinition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (SBSUserNotificationImageDefinition)iconImageDefinition
{
  return (SBSUserNotificationImageDefinition *)objc_getProperty(self, a2, 520, 1);
}

- (void)setIconImageDefinition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (SBSUserNotificationImageDefinition)attachmentImageDefinition
{
  return (SBSUserNotificationImageDefinition *)objc_getProperty(self, a2, 528, 1);
}

- (void)setAttachmentImageDefinition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (BOOL)prefersSystemAperturePresentation
{
  return self->_prefersSystemAperturePresentation;
}

- (void)setPrefersSystemAperturePresentation:(BOOL)a3
{
  self->_prefersSystemAperturePresentation = a3;
}

- (SBSUserNotificationSystemApertureContentDefinition)systemApertureContentDefinition
{
  return (SBSUserNotificationSystemApertureContentDefinition *)objc_getProperty(self, a2, 536, 1);
}

- (void)setSystemApertureContentDefinition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (NSString)remoteViewControllerClassName
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setRemoteViewControllerClassName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSString)remoteServiceBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setRemoteServiceBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_systemApertureContentDefinition, 0);
  objc_storeStrong((id *)&self->_attachmentImageDefinition, 0);
  objc_storeStrong((id *)&self->_iconImageDefinition, 0);
  objc_storeStrong((id *)&self->_headerImageDefinition, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_imagesByDefinition, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_customButtonDefinitions, 0);
  objc_storeStrong((id *)&self->_textFieldDefinitions, 0);
  objc_storeStrong((id *)&self->_viewServiceContentViewController, 0);
  objc_storeStrong((id *)&self->_extensionContentViewController, 0);
  objc_storeStrong((id *)&self->_remoteServiceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_defaultResponseLaunchURL, 0);
  objc_storeStrong((id *)&self->_defaultResponseLaunchBundleID, 0);
  objc_storeStrong(&self->_textFieldValues, 0);
  objc_storeStrong(&self->_textFieldTitles, 0);
  objc_storeStrong(&self->_autocorrectionTypes, 0);
  objc_storeStrong(&self->_autocapitalizationTypes, 0);
  objc_storeStrong(&self->_keyboardTypes, 0);
  objc_storeStrong((id *)&self->_soundStopTimer, 0);
  objc_storeStrong((id *)&self->_soundAlertTopic, 0);
  objc_storeStrong((id *)&self->_vibrationPattern, 0);
  objc_storeStrong((id *)&self->_soundPath, 0);
  objc_storeStrong((id *)&self->_otherButtonTitle, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_lockScreenAlertMessageDelimiter, 0);
  objc_storeStrong(&self->_lockScreenAlertMessage, 0);
  objc_storeStrong((id *)&self->_lockScreenAlertHeader, 0);
  objc_storeStrong((id *)&self->_alertMessageDelimiter, 0);
  objc_storeStrong(&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertHeader, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_portWatcher, 0);
  objc_storeStrong((id *)&self->_alertSource, 0);
}

void __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 124);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Port %d died. Cancelling.", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)updateWithMessage:(NSObject *)a3 requestFlags:.cold.1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, v6, "Unable to find extension for identifier: \"%{public}@\" error: %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_20();
}

- (void)updateWithMessage:(uint64_t)a3 requestFlags:(NSObject *)a4 .cold.2(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a4, a3, "Exception \"%{public}@\" encountered while decoding archive value for SBUserNotificationExtensionIdentifierKey: %{public}@", (uint8_t *)a3);

}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_155_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = a1;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a2, v5, "Unable to create remote view controller: %{public}@ - error: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_20();
}

- (void)_sendResponseAndCleanUp:(os_log_t)log customButtonResponse:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "Successfully sent reply", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_sendResponseAndCleanUp:(int *)a1 customButtonResponse:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Failed to send reply to %u", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_4();
}

@end
