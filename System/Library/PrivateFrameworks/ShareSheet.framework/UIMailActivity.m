@implementation UIMailActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

+ (int64_t)activityCategory
{
  return 1;
}

+ (id)applicationBundleID
{
  return CFSTR("com.apple.mobilemail");
}

- (UIMailActivity)init
{
  UIMailActivity *v2;
  UIMailActivity *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIMailActivity;
  v2 = -[UIActivity init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_canSendMailLock._os_unfair_lock_opaque = 0;
    v2->_canSendMailChecked = 0;
    v4 = (void *)MEMORY[0x1E0DC3470];
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[UIMailActivity activityType](v2, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("_$_%@_Restoration_$_"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerObjectForStateRestoration:restorationIdentifier:", v3, v7);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSString setMailComposeDelegate:](self->_autosaveIdentifier, "setMailComposeDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIMailActivity;
  -[UIMailActivity dealloc](&v3, sel_dealloc);
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.Mail");
}

- (id)_bundleIdentifierForActivityImageCreation
{
  return (id)objc_msgSend((id)objc_opt_class(), "applicationBundleID");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Mail[Activity]"), CFSTR("Mail"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mailDraftRestorationURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMailActivity activityType](self, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@.savedMailDraftIdentifier.data"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v7, 0);
  return v8;
}

- (void)_saveDraft:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10[9];

  v10[8] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIMailActivity _mailDraftRestorationURL](self, "_mailDraftRestorationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("kSavedMailDraftIdentifierKey"));
  objc_msgSend(v6, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  objc_msgSend(v7, "writeToURL:options:error:", v5, 805306369, v10);
  v8 = v10[0];

  if (v8)
  {
    share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[UIMailActivity _saveDraft:].cold.1((uint64_t)v4, (uint64_t)v8, v9);

  }
  objc_msgSend(v6, "finishEncoding");

}

- (void)_deleteMailDraftIdentifierRestorationArchive:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[9];

  v5[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 0;
  objc_msgSend(v4, "removeItemAtURL:error:", v3, v5);

}

- (id)_stateRestorationDraftIsAvailable
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v15[9];

  v15[8] = *(id *)MEMORY[0x1E0C80C00];
  -[UIMailActivity _mailDraftRestorationURL](self, "_mailDraftRestorationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[UIMailActivity canShareURLThroughMail:](self, "canShareURLThroughMail:", v3))
  {
    v15[0] = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 0, v15);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v15[0];
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    if (v4 && !v5)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
      objc_msgSend(v8, "setRequiresSecureCoding:", 1);
      objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSavedMailDraftIdentifierKey"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
        v7 = -[objc_class hasAutosavedMessageWithIdentifier:](getMFMailComposeViewControllerClass(), "hasAutosavedMessageWithIdentifier:", v9);
      else
        v7 = 0;
    }

    v12 = (void *)v4;
    v10 = (void *)v9;
    objc_msgSend(v8, "finishDecoding");
    v11 = (void *)v9;
    if (!v7)
    {
      -[UIMailActivity _deleteMailDraftIdentifierRestorationArchive:](self, "_deleteMailDraftIdentifierRestorationArchive:", v3);
      v11 = 0;
    }

  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  v13 = v11;

  return v13;
}

- (BOOL)_restoreDraft
{
  void *v3;
  void *v4;

  -[UIMailActivity _stateRestorationDraftIsAvailable](self, "_stateRestorationDraftIsAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIMailActivity mailComposeViewController](self, "mailComposeViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recoverAutosavedMessageWithIdentifier:", v3);

  }
  return v3 != 0;
}

- (void)autosaveWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIMailActivity mailComposeViewController](self, "mailComposeViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autosaveWithHandler:", v4);

}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v5;
  int CanDisplayActivityForApplicationWithBundleID;
  $7D24B5AD5894795FD85A0EE1D817D743 v7;
  void *v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  void *v13;

  objc_msgSend((id)objc_opt_class(), "applicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CanDisplayActivityForApplicationWithBundleID = _UIActivityCanDisplayActivityForApplicationWithBundleID((uint64_t)v5);

  if (!CanDisplayActivityForApplicationWithBundleID)
    return 0;
  v7 = ($7D24B5AD5894795FD85A0EE1D817D743)-[UIMailActivity _checkCanSendMail](self, "_checkCanSendMail");
  -[objc_class sharedConnection](getMCProfileConnectionClass_0(), "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasAnyMailAccountIgnoringFiltering");

  -[UIMailActivity setHasAnyAccount:](self, "setHasAnyAccount:", v9);
  v10 = -[UIMailActivity isContentManaged](self, "isContentManaged") ? 1 : 2;
  -[UIMailActivity setHasValidAccountForSending:](self, "setHasValidAccountForSending:", (v10 & *(_DWORD *)&v7) != 0);
  if (-[UIMailActivity hasAnyAccount](self, "hasAnyAccount"))
  {
    if (!-[UIMailActivity hasValidAccountForSending](self, "hasValidAccountForSending"))
      return 0;
  }
  if (a3)
    return (_UIActivityItemTypes() & 0x98F) != 0;
  -[UIMailActivity _stateRestorationDraftIsAvailable](self, "_stateRestorationDraftIsAvailable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13 != 0;

  return v11;
}

- (BOOL)canShareURLThroughMail:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scheme");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        goto LABEL_6;
    }
  }
  if (!objc_msgSend(v4, "isFileURL"))
  {
    share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[UIMailActivity canShareURLThroughMail:].cold.2(v4);
    goto LABEL_11;
  }
  v8 = objc_retainAutorelease(v4);
  objc_msgSend(v8, "fileSystemRepresentation");
  if (!sandbox_extension_issue_file())
  {
    share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[UIMailActivity canShareURLThroughMail:].cold.1(v8, v10);
LABEL_11:

    v9 = 0;
    goto LABEL_12;
  }
LABEL_6:
  v9 = 1;
LABEL_12:

  return v9;
}

- ($7D24B5AD5894795FD85A0EE1D817D743)_checkCanSendMail
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  $7D24B5AD5894795FD85A0EE1D817D743 v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint8_t v15[16];
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, self);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CheckCanSendMail", " enableTelemetry=YES ", buf, 2u);
  }

  os_unfair_lock_lock(&self->_canSendMailLock);
  if (!self->_canSendMailChecked)
  {
    -[objc_class sharedConnection](getMCProfileConnectionClass_0(), "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "canSendMail:sourceAccountManagement:", v8, 1))
      v9 = 2;
    else
      v9 = 0;
    *(&self->_managesOwnPresentationChecked + 1) = *(&self->_managesOwnPresentationChecked + 1) & 0xFD | v9;
    *(&self->_managesOwnPresentationChecked + 1) = *(&self->_managesOwnPresentationChecked + 1) & 0xFE | objc_msgSend(v6, "canSendMail:sourceAccountManagement:", v8, 2);
    self->_canSendMailChecked = 1;

  }
  v10 = ($7D24B5AD5894795FD85A0EE1D817D743)*((unsigned __int8 *)&self->_managesOwnPresentationChecked + 1);
  os_unfair_lock_unlock(&self->_canSendMailLock);
  share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v11, OS_SIGNPOST_INTERVAL_END, v13, "CheckCanSendMail", " enableTelemetry=YES ", v15, 2u);
  }

  return v10;
}

- (id)_backgroundPreheatBlock
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_msgSend((id)objc_opt_class(), "applicationBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__UIMailActivity__backgroundPreheatBlock__block_invoke;
  v7[3] = &unk_1E40017C0;
  v8 = v3;
  v4 = v3;
  objc_copyWeak(&v9, &location);
  v5 = (void *)MEMORY[0x1A1AE9514](v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v5;
}

void __41__UIMailActivity__backgroundPreheatBlock__block_invoke(uint64_t a1)
{
  id WeakRetained;

  _UIActivityCanDisplayActivityForApplicationWithBundleID(*(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_checkCanSendMail");

}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *v6;
  NSString *autosaveIdentifier;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  NSString *v38;
  void *v39;
  void *v40;
  Class MFMailComposeViewControllerClass;
  void *v42;
  NSString *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  UIMailActivity *v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  UIImage *v76;
  double v77;
  double v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  const __CFString *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id *p_isa;
  uint64_t v87;
  void *v88;
  __CFString *v89;
  __CFString *v90;
  __CFString *v91;
  void *v92;
  __CFString *v93;
  __CFString *v94;
  __CFString *v95;
  void *v96;
  void *v97;
  CGImageSource *v98;
  CGImageSource *v99;
  CFStringRef v100;
  void *v101;
  void *v102;
  uint64_t v103;
  __CFString *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  NSString *v116;
  NSObject *v117;
  id v118;
  void *v119;
  id v120;
  const __CFString *inConformsToUTI;
  uint64_t v122;
  const __CFString *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  CFStringRef inTagClass;
  const __CFString *inTagClassa;
  void *v129;
  id v130;
  id v131;
  id v132;
  id obj;
  UIMailActivity *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _QWORD v139[4];
  __CFString *v140;
  id v141;
  id *v142;
  uint64_t *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  id v165;
  id v166;
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v118 = a3;
  v134 = self;
  if (-[UIMailActivity hasValidAccountForSending](self, "hasValidAccountForSending"))
  {
    v4 = objc_alloc(getMFMailComposeViewControllerClass());
    if (-[UIMailActivity isContentManaged](self, "isContentManaged"))
      v5 = 2;
    else
      v5 = 1;
    v6 = (NSString *)objc_msgSend(v4, "initWithURL:sourceAccountManagement:", 0, v5);
    autosaveIdentifier = self->_autosaveIdentifier;
    self->_autosaveIdentifier = v6;

    -[NSString setMailComposeDelegate:](self->_autosaveIdentifier, "setMailComposeDelegate:", self);
    -[NSString setKeyboardVisible:](self->_autosaveIdentifier, "setKeyboardVisible:", -[UIMailActivity keyboardVisible](self, "keyboardVisible"));
    -[UIMailActivity collaborationItem](self, "collaborationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudSharingResult");
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v126
      || (-[UIMailActivity collaborationItem](self, "collaborationItem"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "type"),
          v9,
          v10 == 2))
    {
LABEL_45:
      -[UIMailActivity autosaveIdentifier](v134, "autosaveIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        MFMailComposeViewControllerClass = getMFMailComposeViewControllerClass();
        -[UIMailActivity autosaveIdentifier](v134, "autosaveIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(MFMailComposeViewControllerClass) = -[objc_class hasAutosavedMessageWithIdentifier:](MFMailComposeViewControllerClass, "hasAutosavedMessageWithIdentifier:", v42);

        if ((_DWORD)MFMailComposeViewControllerClass)
        {
          v43 = v134->_autosaveIdentifier;
          -[UIMailActivity autosaveIdentifier](v134, "autosaveIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString recoverAutosavedMessageWithIdentifier:](v43, "recoverAutosavedMessageWithIdentifier:", v44);

        }
      }
      if (objc_msgSend(v118, "count") || !-[UIMailActivity _restoreDraft](v134, "_restoreDraft"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v132 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        _UIActivityItemsGetStringsAndURLs(v118, 1);
        v162 = 0u;
        v163 = 0u;
        v160 = 0u;
        v161 = 0u;
        v120 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v45) = 0;
        v46 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v160, v171, 16);
        if (!v46)
        {
          obj = 0;
LABEL_69:

          goto LABEL_70;
        }
        obj = 0;
        v47 = *(_QWORD *)v161;
LABEL_52:
        v48 = 0;
        while (1)
        {
          if (*(_QWORD *)v161 != v47)
            objc_enumerationMutation(v120);
          v49 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v48);
          if (!obj)
          {
            -[UIActivity _subjectForActivityItem:](v134, "_subjectForActivityItem:", v49);
            obj = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LOBYTE(v45) = 1;
            goto LABEL_63;
          }
          v50 = objc_msgSend(v49, "length");
          v51 = v50 >= 0x400 ? 1024 : v50;
          objc_msgSend(v49, "rangeOfString:options:range:", CFSTR("<html"), 1, 0, v51);
          if (v52)
            break;
LABEL_63:
          if (v46 == ++v48)
          {
            v46 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v160, v171, 16);
            if (!v46)
              goto LABEL_69;
            goto LABEL_52;
          }
        }
        v45 = v49;

        if (v45)
        {
          v53 = v45;
          v54 = v134;
          goto LABEL_101;
        }
LABEL_70:
        v158 = 0u;
        v159 = 0u;
        v156 = 0u;
        v157 = 0u;
        v55 = v120;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
        if (!v56)
        {

          goto LABEL_102;
        }
        v57 = 0;
        v58 = *(_QWORD *)v157;
LABEL_72:
        v59 = 0;
        while (1)
        {
          if (*(_QWORD *)v157 != v58)
            objc_enumerationMutation(v55);
          v60 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * v59);
          if (!v57)
          {
            if ((v45 & 1) != 0)
            {
              v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E4004990);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v57 = v61;

          }
          if (!obj)
          {
            -[UIActivity _subjectForActivityItem:](v134, "_subjectForActivityItem:", v60);
            obj = (id)objc_claimAutoreleasedReturnValue();
          }
          if (objc_msgSend(v57, "length"))
          {
            if ((v45 & 1) != 0)
            {
              objc_msgSend(v57, "mutableString");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "appendString:", CFSTR("\n"));

LABEL_86:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v57, "appendAttributedString:", v60);
              }
              else
              {
                v63 = objc_alloc(MEMORY[0x1E0CB3498]);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v60);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = (void *)objc_msgSend(v63, "initWithString:", v64);
                objc_msgSend(v57, "appendAttributedString:", v65);

              }
              goto LABEL_91;
            }
            objc_msgSend(v57, "appendString:", CFSTR("\n"));
          }
          else if ((v45 & 1) != 0)
          {
            goto LABEL_86;
          }
          objc_msgSend(v57, "appendString:", v60);
LABEL_91:
          if (v56 == ++v59)
          {
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
            if (v56)
              goto LABEL_72;

            if (((v57 != 0) & v45) == 1)
            {
              v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33A0]), "initWithAttributedString:", v57);
              v67 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v66, "HTMLData");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = (void *)objc_msgSend(v67, "initWithData:encoding:", v68, 4);

              if (objc_msgSend(v69, "length"))
              {
                v70 = v69;
              }
              else
              {
                objc_msgSend(v57, "string");
                v70 = (id)objc_claimAutoreleasedReturnValue();

                v57 = v70;
              }

              v53 = v70;
            }
            else
            {
              v53 = v57;
            }
            v54 = v134;
            if (v53)
            {
LABEL_101:
              v125 = v53;
              -[NSString setMessageBody:isHTML:](v54->_autosaveIdentifier, "setMessageBody:isHTML:");
              goto LABEL_103;
            }
LABEL_102:
            v125 = 0;
LABEL_103:
            v154 = 0u;
            v155 = 0u;
            v152 = 0u;
            v153 = 0u;
            _UIActivityItemsGetImages(v118, 0, 0);
            v130 = (id)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
            if (!v71)
              goto LABEL_120;
            v72 = *(_QWORD *)v153;
            inTagClass = (CFStringRef)*MEMORY[0x1E0CA5BA8];
            v73 = *MEMORY[0x1E0CA5C10];
            v74 = 1;
            while (2)
            {
              v75 = 0;
LABEL_106:
              if (*(_QWORD *)v153 != v72)
                objc_enumerationMutation(v130);
              v76 = *(UIImage **)(*((_QWORD *)&v152 + 1) + 8 * v75);
              -[UIImage size](v76, "size");
              v79 = v78 < 512.0 && v77 <= 512.0;
              -[UIActivity _attachmentNameForActivityItem:](v134, "_attachmentNameForActivityItem:", v76);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v80, "length"))
              {
                if (v79)
                  goto LABEL_113;
LABEL_117:
                UIImageJPEGRepresentation(v76, 0.8);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v132, "addObject:", inTagClass);
                -[NSString addAttachmentData:mimeType:fileName:](v134->_autosaveIdentifier, "addAttachmentData:mimeType:fileName:", v81, CFSTR("image/jpeg"), v80);
              }
              else
              {
                v82 = CFSTR("jpg");
                if (v79)
                  v82 = CFSTR("png");
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image-%ld.%@"), v74, v82);
                v83 = objc_claimAutoreleasedReturnValue();

                ++v74;
                v80 = (void *)v83;
                if (!v79)
                  goto LABEL_117;
LABEL_113:
                UIImagePNGRepresentation(v76);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v132, "addObject:", v73);
                -[NSString addAttachmentData:mimeType:fileName:](v134->_autosaveIdentifier, "addAttachmentData:mimeType:fileName:", v81, CFSTR("image/png"), v80);
              }

              if (v71 == ++v75)
              {
                v71 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
                if (v71)
                  continue;
LABEL_120:

                v148 = 0;
                v149 = &v148;
                v150 = 0x2020000000;
                v151 = 1;
                v144 = 0u;
                v145 = 0u;
                v146 = 0u;
                v147 = 0u;
                v84 = v118;
                v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v144, v168, 16);
                p_isa = (id *)&v134->super.super.isa;
                if (!v85)
                  goto LABEL_174;
                v131 = *(id *)v145;
                inTagClassa = (const __CFString *)*MEMORY[0x1E0CA5A90];
                v123 = (const __CFString *)*MEMORY[0x1E0CA5A88];
                v124 = *MEMORY[0x1E0CA5C20];
                v122 = *MEMORY[0x1E0CA5A60];
                v119 = (void *)*MEMORY[0x1E0CA5A58];
                inConformsToUTI = (const __CFString *)*MEMORY[0x1E0CA5C18];
                while (2)
                {
                  v87 = 0;
LABEL_123:
                  if (*(id *)v145 != v131)
                    objc_enumerationMutation(v84);
                  v88 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v87);
                  if (!obj)
                  {
                    objc_msgSend(p_isa, "_subjectForActivityItem:", v88);
                    obj = (id)objc_claimAutoreleasedReturnValue();
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v139[0] = MEMORY[0x1E0C809B0];
                    v139[1] = 3221225472;
                    v139[2] = __43__UIMailActivity_prepareWithActivityItems___block_invoke;
                    v139[3] = &unk_1E40017E8;
                    v143 = &v148;
                    v140 = v129;
                    v141 = v132;
                    v142 = p_isa;
                    objc_msgSend(v88, "enumerateKeysAndObjectsUsingBlock:", v139);

                    v89 = v140;
                    goto LABEL_129;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v89 = v88;
                    if (-[__CFString isFileURL](v89, "isFileURL")
                      && objc_msgSend(p_isa, "canShareURLThroughMail:", v89))
                    {
                      _UIActivityUTIForURL(v89);
                      v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      if (-[__CFString isEqualToString:](v90, "isEqualToString:", v122))
                      {
                        v91 = v119;

                        v90 = v91;
                        p_isa = (id *)&v134->super.super.isa;
                      }
                      if (v90)
                      {
                        if (UTTypeConformsTo(v90, inConformsToUTI)
                          && (v92 = (void *)softLinkQLTypeCopyUTIForURLAndMimeType(v89, CFSTR("application/octet-stream"))) != 0)
                        {
                          v93 = v92;

                          v94 = CFSTR("application/octet-stream");
                          p_isa = (id *)&v134->super.super.isa;
                        }
                        else
                        {
                          v94 = (__CFString *)UTTypeCopyPreferredTagWithClass(v90, inTagClassa);
                          if (!v94)
                          {
                            v107 = softLinkQLTypeCopyBestMimeTypeForURLAndMimeType(v89, 0);
                            if (v107)
                              v94 = (__CFString *)v107;
                            else
                              v94 = CFSTR("application/octet-stream");
                          }
                          v93 = v90;
                        }
                        if (-[__CFString isEqualToString:](v93, "isEqualToString:", v124))
                        {
                          v108 = (void *)MEMORY[0x1E0CB3940];
                          -[__CFString path](v89, "path");
                          v109 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v108, "stringWithContentsOfFile:encoding:error:", v109, 4, 0);
                          v110 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v110)
                            objc_msgSend(v129, "addObject:", v110);

                          p_isa = (id *)&v134->super.super.isa;
                        }
                        else
                        {
                          objc_msgSend(v132, "addObject:", v93);
                        }
                        v111 = (id)objc_msgSend(p_isa[21], "_addAttachmentWithFileURL:mimeType:", v89, v94);

                      }
                    }
                    goto LABEL_129;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(p_isa, "_dataTypeIdentifierForActivityItem:", v88);
                    v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    if (v89)
                      goto LABEL_143;
                    v98 = CGImageSourceCreateWithData((CFDataRef)v88, 0);
                    v99 = v98;
                    if (!v98)
                    {
                      v89 = 0;
                      goto LABEL_129;
                    }
                    CGImageSourceGetType(v98);
                    v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    CFRelease(v99);
                    if (v89)
                    {
LABEL_143:
                      v95 = (__CFString *)UTTypeCopyPreferredTagWithClass(v89, inTagClassa);
                      if (v95)
                        goto LABEL_144;
                      v100 = UTTypeCopyPreferredTagWithClass(v89, v123);
                      if (v100)
                      {
                        objc_msgSend(CFSTR("aep"), "stringByAppendingPathExtension:", v100);
                        v101 = (void *)objc_claimAutoreleasedReturnValue();
                        v95 = (__CFString *)softLinkQLTypeCopyBestMimeTypeForFileNameAndMimeType(v101, 0);

                        CFRelease(v100);
                        p_isa = (id *)&v134->super.super.isa;
                        if (v95)
                        {
LABEL_144:
                          objc_msgSend(p_isa, "_attachmentNameForActivityItem:", v88);
                          v96 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v96, "length"))
                          {
                            v97 = v96;
                          }
                          else
                          {
                            v102 = (void *)MEMORY[0x1E0CB3940];
                            v103 = v149[3];
                            v149[3] = v103 + 1;
                            objc_msgSend(v102, "stringWithFormat:", CFSTR("Attachment-%ld"), v103);
                            v97 = (void *)objc_claimAutoreleasedReturnValue();

                            v104 = (__CFString *)UTTypeCopyPreferredTagWithClass(v89, v123);
                            if (v104)
                            {
                              objc_msgSend(v97, "stringByAppendingPathExtension:", v104);
                              v105 = objc_claimAutoreleasedReturnValue();

                              v97 = (void *)v105;
                            }

                            p_isa = (id *)&v134->super.super.isa;
                          }
                          if (-[__CFString isEqualToString:](v89, "isEqualToString:", v124))
                          {
                            v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v88, 4);
                            if (v106)
                              objc_msgSend(v129, "addObject:", v106);

                            p_isa = (id *)&v134->super.super.isa;
                          }
                          else
                          {
                            objc_msgSend(v132, "addObject:", v89);
                          }
                          objc_msgSend(p_isa[21], "addAttachmentData:mimeType:fileName:", v88, v95, v97);
                          CFRelease(v95);

                        }
                      }
                    }
LABEL_129:

                    p_isa = (id *)&v134->super.super.isa;
                  }
                  if (v85 == ++v87)
                  {
                    v112 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v144, v168, 16);
                    v85 = v112;
                    if (!v112)
                    {
LABEL_174:

                      if (obj)
                        -[UIMailActivity setSubject:](v134, "setSubject:", obj);
                      if (objc_msgSend(v132, "count"))
                        -[NSString setUTITypes:](v134->_autosaveIdentifier, "setUTITypes:", v132);
                      _UIActivityItemsGetWebURLs(v84, 1);
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v113, "count"))
                        -[NSString setContentURLs:](v134->_autosaveIdentifier, "setContentURLs:", v113);
                      _UIActivityItemsGetStrings(v84, 0);
                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v114)
                        objc_msgSend(v129, "addObjectsFromArray:", v114);
                      if (objc_msgSend(v129, "count"))
                        -[NSString setContentText:](v134->_autosaveIdentifier, "setContentText:", v129);

                      _Block_object_dispose(&v148, 8);
                      goto LABEL_185;
                    }
                    continue;
                  }
                  goto LABEL_123;
                }
              }
              goto LABEL_106;
            }
          }
        }
      }
      goto LABEL_187;
    }
    objc_msgSend(v126, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      share_sheet_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[UIMailActivity prepareWithActivityItems:].cold.2(v126);
      goto LABEL_44;
    }
    v17 = (void *)MEMORY[0x1E0D97420];
    -[UIMailActivity collaborationItem](v134, "collaborationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "options");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = 0;
    v165 = 0;
    v164 = 0;
    objc_msgSend(v17, "getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:", v19, &v166, &v165, &v164);
    v12 = v166;
    v20 = v165;
    v21 = v164;

    -[UIMailActivity collaborationItem](v134, "collaborationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "type") == 1;

    if (v23)
    {
      -[UIMailActivity collaborationItem](v134, "collaborationItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "containerSetupInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }
    -[UIMailActivity collaborationItem](v134, "collaborationItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "type") == 0;

    if (v36)
    {
      -[UIMailActivity collaborationItem](v134, "collaborationItem");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "fileURL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        +[UISUISecurityScopedResource sandboxingURLWrapperWithFileURL:allowedAccess:](UISUISecurityScopedResource, "sandboxingURLWrapperWithFileURL:allowedAccess:", v37, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          v116 = v134->_autosaveIdentifier;
          objc_msgSend(v126, "share");
          v117 = objc_claimAutoreleasedReturnValue();
          -[NSString _setCKShareURLWrapper:share:permissionType:allowOthersToInvite:](v116, "_setCKShareURLWrapper:share:permissionType:allowOthersToInvite:", v39, v117, (int)objc_msgSend(v20, "intValue"), objc_msgSend(v21, "BOOLValue"));
        }
        else
        {
          share_sheet_log();
          v117 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
            -[UIMailActivity prepareWithActivityItems:].cold.1((uint64_t)v37, v117);
        }

        goto LABEL_43;
      }
    }
    else
    {
      v37 = 0;
    }
    v38 = v134->_autosaveIdentifier;
    objc_msgSend(v126, "share");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString _setCKShare:setupContainerInfo:permissionType:allowOthersToInvite:](v38, "_setCKShare:setupContainerInfo:permissionType:allowOthersToInvite:", v39, v25, (int)objc_msgSend(v20, "intValue"), objc_msgSend(v21, "BOOLValue"));
LABEL_43:

LABEL_44:
    goto LABEL_45;
  }
  if (!-[UIMailActivity hasAnyAccount](self, "hasAnyAccount")
    && !-[UIMailActivity isContentManaged](self, "isContentManaged"))
  {
    _UIActivityItemsGetStringsAndURLs(v118, 0);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v167, 16);
    if (v13)
    {
      v125 = 0;
      v126 = 0;
      v14 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v136 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
          if (v126)
            objc_msgSend(v126, "appendFormat:", CFSTR("\n%@"), *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i));
          else
            v126 = (void *)objc_msgSend(v16, "mutableCopy");
          if (!v125)
          {
            -[UIActivity _subjectForActivityItem:](self, "_subjectForActivityItem:", v16);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v167, 16);
      }
      while (v13);
    }
    else
    {
      v125 = 0;
      v126 = 0;
    }
    if (MessageLibrary_sOnce != -1)
      dispatch_once(&MessageLibrary_sOnce, &__block_literal_global_285);
    if (objc_msgSend(v126, "length"))
      goto LABEL_33;
    -[objc_class sharedConnection](getMCProfileConnectionClass_0(), "sharedConnection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    getMCFeatureAccountModificationAllowed();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "effectiveBoolValueForSetting:", v27) == 2;

    if (v28
      || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ACCOUNTS_AND_PASSWORDS&path=ADD_ACCOUNT")), v29 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), v30 = (void *)objc_claimAutoreleasedReturnValue(), v31 = objc_msgSend(v30, "openSensitiveURL:withOptions:", v29, 0), v30, v29, (v31 & 1) == 0))
    {
LABEL_33:
      v132 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v132, "setScheme:", CFSTR("mailto"));
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      if (v125)
      {
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("subject"), v125);
        objc_msgSend(v129, "addObject:", v32);

      }
      if (v126)
      {
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("body"), v126);
        objc_msgSend(v129, "addObject:", v33);

      }
      objc_msgSend(v132, "setQueryItems:", v129);
      objc_msgSend(v132, "URL");
      v120 = (id)objc_claimAutoreleasedReturnValue();
      if (v120)
      {
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "openURL:options:completionHandler:", v120, MEMORY[0x1E0C9AA70], 0);

      }
LABEL_185:

    }
LABEL_187:

  }
}

void __43__UIMailActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *inUTI;

  inUTI = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E0CA5BF8])
    && !UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E0CA5B90]))
  {
    v8 = (__CFString *)UTTypeCopyDescription(inUTI);
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(_QWORD *)(v10 + 24);
    *(_QWORD *)(v10 + 24) = v11 + 1;
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%ld"), v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (__CFString *)UTTypeCopyPreferredTagWithClass(inUTI, (CFStringRef)*MEMORY[0x1E0CA5A88]);
    if (v13)
    {
      objc_msgSend(v12, "stringByAppendingPathExtension:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    if (-[__CFString isEqualToString:](inUTI, "isEqualToString:", *MEMORY[0x1E0CA5C20]))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
      if (v15)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", inUTI);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 168), "addAttachmentData:mimeType:fileName:", v7, inUTI, v12);
    *a4 = 1;

  }
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__UIMailActivity__prepareWithActivityItems_completion___block_invoke;
  v8[3] = &unk_1E4001810;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[UIActivity _loadItemProvidersFromActivityItems:completion:](self, "_loadItemProvidersFromActivityItems:completion:", a3, v8);

}

uint64_t __55__UIMailActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareWithActivityItems:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setRecipients:(id)a3
{
  -[NSString setToRecipients:](self->_autosaveIdentifier, "setToRecipients:", a3);
}

- (void)setSessionID:(id)a3
{
  -[NSString setShareSheetSessionID:](self->_autosaveIdentifier, "setShareSheetSessionID:", a3);
}

- (id)activityViewController
{
  return self->_autosaveIdentifier;
}

- (BOOL)_managesOwnPresentation
{
  BOOL result;

  if (self->_managesOwnPresentationChecked)
    return _managesOwnPresentation_managesOwnPresentation != 0;
  result = -[objc_class _canSendMailInNewScene](getMFMailComposeViewControllerClass(), "_canSendMailInNewScene");
  _managesOwnPresentation_managesOwnPresentation = result;
  self->_managesOwnPresentationChecked = 1;
  return result;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  UIMailActivity *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v10 = -[UIMailActivity _managesOwnPresentation](self, "_managesOwnPresentation");
  if (v10)
  {
    -[UIMailActivity mailComposeViewController](self, "mailComposeViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__UIMailActivity__presentActivityOnViewController_animated_completion___block_invoke;
    v13[3] = &unk_1E4001838;
    v14 = v8;
    v15 = self;
    v17 = a4;
    v16 = v9;
    objc_msgSend(v11, "_presentComposeInNewWindowWithCompletion:", v13);

  }
  return v10;
}

void __71__UIMailActivity__presentActivityOnViewController_animated_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  void *v4;
  void *v5;

  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __71__UIMailActivity__presentActivityOnViewController_animated_completion___block_invoke_cold_1(v3);

    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "mailComposeViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v5, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 127) = 1;
  }
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  _BOOL4 v10;
  _BOOL8 v11;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = -[UIMailActivity _managesOwnPresentation](self, "_managesOwnPresentation");
  if (v10)
  {
    if (!v8)
    {
      if (!*(&self->_managesOwnPresentationChecked + 2))
      {
        v9[2](v9);
        v8 = 0;
        goto LABEL_9;
      }
      -[UIMailActivity mailComposeViewController](self, "mailComposeViewController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = *(&self->_managesOwnPresentationChecked + 2) && v6;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v11, v9);
  }
LABEL_9:

  return v10;
}

- (MFMailComposeViewController)mailComposeViewController
{
  return (MFMailComposeViewController *)self->_autosaveIdentifier;
}

- (void)setSubject:(id)a3
{
  NSString *v4;
  NSString *sourceApplicationBundleID;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  sourceApplicationBundleID = self->_sourceApplicationBundleID;
  self->_sourceApplicationBundleID = v4;

  -[NSString setSubject:](self->_autosaveIdentifier, "setSubject:", v6);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", (unint64_t)(a4 - 1) < 2);
}

- (void)_cleanup
{
  -[NSString setMailComposeDelegate:](self->_autosaveIdentifier, "setMailComposeDelegate:", 0);
  -[UIMailActivity setMailComposeViewController:](self, "setMailComposeViewController:", 0);
  *(&self->_managesOwnPresentationChecked + 2) = 0;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[UIMailActivity mailComposeViewController](self, "mailComposeViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__UIMailActivity_encodeRestorableStateWithCoder___block_invoke;
  v5[3] = &unk_1E4001860;
  v5[4] = self;
  objc_msgSend(v4, "autosaveWithHandler:", v5);

}

void __49__UIMailActivity_encodeRestorableStateWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  Class Class;
  id v5;

  v5 = a2;
  v3 = objc_opt_class();
  Class = object_getClass(v5);
  if (Class == (Class)v3 || -[objc_class isSubclassOfClass:](Class, "isSubclassOfClass:", v3))
    objc_msgSend(*(id *)(a1 + 32), "_saveDraft:", v5);

}

- (SFCollaborationItem)collaborationItem
{
  return *(SFCollaborationItem **)&self->_hasValidAccountForSending;
}

- (void)setCollaborationItem:(id)a3
{
  objc_storeStrong((id *)&self->_hasValidAccountForSending, a3);
}

- (BOOL)isContentManaged
{
  return (BOOL)self->_canSendMail;
}

- (void)setIsContentManaged:(BOOL)a3
{
  *(_BYTE *)&self->_canSendMail = a3;
}

- (NSString)sourceApplicationBundleID
{
  return (NSString *)self->_collaborationItem;
}

- (void)setSourceApplicationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)subject
{
  return self->_sourceApplicationBundleID;
}

- (BOOL)keyboardVisible
{
  return *((_BYTE *)&self->_canSendMail + 1);
}

- (void)setKeyboardVisible:(BOOL)a3
{
  *((_BYTE *)&self->_canSendMail + 1) = a3;
}

- (NSString)autosaveIdentifier
{
  return self->_subject;
}

- (void)setAutosaveIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (void)setMailComposeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_autosaveIdentifier, a3);
}

- (BOOL)hasAnyAccount
{
  return *((_BYTE *)&self->_canSendMail + 2);
}

- (void)setHasAnyAccount:(BOOL)a3
{
  *((_BYTE *)&self->_canSendMail + 2) = a3;
}

- (BOOL)hasValidAccountForSending
{
  return *((_BYTE *)&self->_canSendMail + 3);
}

- (void)setHasValidAccountForSending:(BOOL)a3
{
  *((_BYTE *)&self->_canSendMail + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
  objc_storeStrong((id *)&self->_collaborationItem, 0);
  objc_storeStrong((id *)&self->_hasValidAccountForSending, 0);
}

- (void)_saveDraft:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136446722;
  v4 = "-[UIMailActivity _saveDraft:]";
  v5 = 2114;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "%{public}s: Error trying to archive mail draft identifier %{public}@: %{public}@.", (uint8_t *)&v3, 0x20u);
}

- (void)canShareURLThroughMail:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v4 = *__error();
  v5 = 136315394;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "canShareURLThroughMail returning NO. Reason: Failed to issue sandbox extension for %s with error %d. ", (uint8_t *)&v5, 0x12u);
  OUTLINED_FUNCTION_1_1();
}

- (void)canShareURLThroughMail:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_19E419000, v2, v3, "canShareURLThroughMail returning NO. Reason: unknown url recieved %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)prepareWithActivityItems:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Mail Activity: couldn't get FPSandboxingURLWrapper for file URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)prepareWithActivityItems:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_19E419000, v2, v3, "Mail Activity: cloudSharingResult error:%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __71__UIMailActivity__presentActivityOnViewController_animated_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "Failed to present mail compose in new window. Presenting modally instead.", v1, 2u);
}

@end
