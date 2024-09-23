@implementation UIMessageActivity

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
  return CFSTR("com.apple.MobileSMS");
}

- (void)dealloc
{
  objc_super v3;

  -[MFMessageComposeViewController setMessageComposeDelegate:](self->_messageComposeViewController, "setMessageComposeDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIMessageActivity;
  -[UIMessageActivity dealloc](&v3, sel_dealloc);
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.Message");
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Message[Activity]"), CFSTR("Messages"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char CanDisplayActivityForApplicationWithBundleID;
  NSObject *v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;
  NSObject *v32;
  const char *v33;
  id v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t k;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[5];
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIMessageActivity sourceApplicationBundleID](self, "sourceApplicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "applicationBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CanDisplayActivityForApplicationWithBundleID = _UIActivityCanDisplayActivityForApplicationWithBundleID((uint64_t)v9);

  if ((CanDisplayActivityForApplicationWithBundleID & 1) == 0)
  {
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v11, OS_LOG_TYPE_DEFAULT, "UIMessageActivity: Can't display activity", buf, 2u);
    }
    v31 = 0;
    goto LABEL_44;
  }
  -[objc_class sharedInstance](getIMSharedMessageSendingUtilitiesClass(), "sharedInstance");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject canSendText](v11, "canSendText") & 1) == 0)
  {
    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "UIMessageActivity: Can't send text", buf, 2u);
    }
    goto LABEL_42;
  }
  -[objc_class sharedConnection](getMCProfileConnectionClass_1(), "sharedConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject mayShareToMessagesForOriginatingAppBundleID:originatingAccountIsManaged:](v12, "mayShareToMessagesForOriginatingAppBundleID:originatingAccountIsManaged:", v7, -[UIMessageActivity isContentManaged](self, "isContentManaged")) & 1) == 0)
  {
    share_sheet_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v33 = "UIMessageActivity: Can't share to Messages";
LABEL_40:
      _os_log_impl(&dword_19E419000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
    }
LABEL_41:

LABEL_42:
    v31 = 0;
    goto LABEL_43;
  }
  v13 = -[NSObject isMMSEnabled](v11, "isMMSEnabled");
  v14 = -[NSObject isRichMessagingEnabled](v11, "isRichMessagingEnabled");
  v15 = -[NSObject isMessagingEnabled](v11, "isMessagingEnabled");
  if (v13)
    v16 = 18511;
  else
    v16 = 18437;
  if (v14)
    v17 = 202;
  else
    v17 = 0;
  if (v14)
    v18 = 0;
  else
    v18 = 128;
  v19 = 74;
  if (v15)
    v19 = 0;
  v59 = v19;
  v60 = v18;
  v20 = _UIActivityItemCountOfType(v4, 2);
  v21 = _UIActivityItemCountOfType(v4, 64);
  if ((-[NSObject canSendPhotos:videos:audioClips:](v11, "canSendPhotos:videos:audioClips:", v20, v21, _UIActivityItemCountOfType(v4, 4096)) & 1) == 0)
  {
    share_sheet_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v33 = "UIMessageActivity: Can't send content";
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  v22 = v16 | v17;
  v57 = v12;
  v58 = v7;
  if ((_UIActivityItemTypes() & 8) != 0)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v23 = v4;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v24)
    {
      v25 = v24;
      v55 = v16 | v17;
      v26 = *(_QWORD *)v76;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v76 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v28, "isFileURL"))
            {
              _UIActivityUTIForURL(v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = -[NSObject isSupportedAttachmentUTI:](v11, "isSupportedAttachmentUTI:", v29);

              if ((v30 & 1) != 0)
              {

                v12 = v57;
                v7 = v58;
                v22 = v55;
                goto LABEL_47;
              }
            }
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
        if (v25)
          continue;
        break;
      }

      v12 = v57;
      v22 = v55 & 0x48C7;
      v7 = v58;
    }
    else
    {

      v22 &= 0x48C7u;
    }
  }
LABEL_47:
  if ((_UIActivityItemTypes() & 0x800) == 0)
    goto LABEL_77;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v35 = v4;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (!v36)
  {

    v22 &= ~0x800uLL;
    goto LABEL_77;
  }
  v37 = v36;
  v56 = v22;
  v38 = 0;
  v39 = *(_QWORD *)v72;
  v62 = v4;
  while (2)
  {
    for (j = 0; j != v37; ++j)
    {
      if (*(_QWORD *)v72 != v39)
        objc_enumerationMutation(v35);
      v41 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIActivity _dataTypeIdentifierForActivityItem:](self, "_dataTypeIdentifierForActivityItem:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject isSupportedAttachmentUTI:](v11, "isSupportedAttachmentUTI:", v42))
        {

          goto LABEL_75;
        }
        share_sheet_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v42;
          _os_log_impl(&dword_19E419000, v43, OS_LOG_TYPE_DEFAULT, "UIMessageActivity: Unsupported attachment type %@", buf, 0xCu);
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v41, "registeredTypeIdentifiers");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
        if (v44)
        {
          v45 = v44;
          v61 = v38;
          v46 = v35;
          v47 = *(_QWORD *)v68;
          while (2)
          {
            for (k = 0; k != v45; ++k)
            {
              if (*(_QWORD *)v68 != v47)
                objc_enumerationMutation(v42);
              if ((-[NSObject isSupportedAttachmentUTI:](v11, "isSupportedAttachmentUTI:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k)) & 1) != 0)
              {
                v38 = 1;
                v35 = v46;
                v4 = v62;
                goto LABEL_69;
              }
            }
            v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
            if (v45)
              continue;
            break;
          }
          v35 = v46;
          v4 = v62;
          v38 = v61;
        }
      }
LABEL_69:

    }
    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    if (v37)
      continue;
    break;
  }

  if ((v38 & 1) == 0)
  {
    v12 = v57;
    v22 = v56 & 0xFFFFFFFFFFFFF7FFLL;
    v7 = v58;
    goto LABEL_77;
  }
LABEL_75:
  v12 = v57;
  v7 = v58;
  v22 = v56;
LABEL_77:
  if ((_UIActivityItemTypes() & 0x4000) != 0)
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v49 = v4;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v64;
      while (2)
      {
        for (m = 0; m != v51; ++m)
        {
          if (*(_QWORD *)v64 != v52)
            objc_enumerationMutation(v49);
          v54 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(MEMORY[0x1E0D97420], "isSWYActivityItemProvider:", v54))
          {

            goto LABEL_89;
          }
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
        if (v51)
          continue;
        break;
      }

      v22 &= ~0x4000uLL;
LABEL_89:
      v12 = v57;
      v7 = v58;
    }
    else
    {

      v22 &= ~0x4000uLL;
    }
  }
  if ((_UIActivityItemTypes() & v22) == 0)
    goto LABEL_42;
  v31 = (_UIActivityItemTypes() & (v59 | v60)) == 0;
LABEL_43:

LABEL_44:
  return v31;
}

- (id)_backgroundPreheatBlock
{
  return &__block_literal_global_10;
}

void __44__UIMessageActivity__backgroundPreheatBlock__block_invoke()
{
  void *v0;
  id v1;
  _QWORD block[4];
  id v3;

  -[objc_class sharedInstance](getIMSharedMessageSendingUtilitiesClass(), "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__UIMessageActivity__backgroundPreheatBlock__block_invoke_2;
  block[3] = &unk_1E4001608;
  v3 = v0;
  v1 = v0;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __44__UIMessageActivity__backgroundPreheatBlock__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canSendText");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "isMMSEnabled");
  return result;
}

+ (void)_preheatAsyncIfNeeded
{
  unsigned __int8 v2;
  NSObject *v4;
  _QWORD block[5];

  v2 = atomic_load(__shouldPreheatMessageActivity);
  if ((v2 & 1) != 0)
  {
    dispatch_get_global_queue(33, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__UIMessageActivity__preheatAsyncIfNeeded__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v4, block);

  }
}

void __42__UIMessageActivity__preheatAsyncIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  unsigned __int8 v3;
  Class MFMessageComposeViewControllerClass;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  unsigned __int8 v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "Starting Message activity preheating", buf, 2u);
  }

  v3 = atomic_load(__shouldPreheatMessageActivity);
  if ((v3 & 1) != 0)
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 32));

    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PreheatMessageActivity", "framework=MessageUI", v23, 2u);
    }

    MFMessageComposeViewControllerClass = getMFMessageComposeViewControllerClass();
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));

    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v8, OS_SIGNPOST_INTERVAL_END, v10, "PreheatMessageActivity", (const char *)&unk_19E4D535F, v22, 2u);
    }

  }
  else
  {
    MFMessageComposeViewControllerClass = 0;
  }
  v11 = atomic_load(__shouldPreheatMessageActivity);
  if ((v11 & 1) != 0)
  {
    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_make_with_pointer(v13, *(const void **)(a1 + 32));

    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)v21 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PreheatMessageActivity", "framework=ChatKit", v21, 2u);
    }

    -[objc_class _preloadDependencies](MFMessageComposeViewControllerClass, "_preloadDependencies");
    share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_make_with_pointer(v16, *(const void **)(a1 + 32));

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PreheatMessageActivity", (const char *)&unk_19E4D535F, v20, 2u);
    }

  }
  atomic_store(0, __shouldPreheatMessageActivity);
  share_sheet_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_19E419000, v18, OS_LOG_TYPE_DEFAULT, "Finished Message activity preheating", v19, 2u);
  }

}

- (void)setSessionID:(id)a3
{
  -[MFMessageComposeViewController setShareSheetSessionID:](self->_messageComposeViewController, "setShareSheetSessionID:", a3);
}

- (void)setRecipients:(id)a3
{
  -[MFMessageComposeViewController setRecipients:](self->_messageComposeViewController, "setRecipients:", a3);
}

- (void)prepareWithActivityItems:(id)a3
{
  MFMessageComposeViewController *v4;
  MFMessageComposeViewController *messageComposeViewController;
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  UIMessageActivity *v12;
  MFMessageComposeViewController *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MFMessageComposeViewController *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  MFMessageComposeViewController *v44;
  id v45;
  void *v46;
  MFMessageComposeViewController *v47;
  uint64_t v48;
  id *p_isa;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  int v58;
  UIImage *v59;
  UIImage *v60;
  UIImage *v61;
  CFStringRef v62;
  CFStringRef v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  _BOOL4 v69;
  void *v70;
  const __CFString *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  UIImage *v78;
  CGImageSource *v79;
  CGImageSource *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  const __CFString *inTagClass;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  UIMessageActivity *v101;
  char v102;
  uint64_t v103;
  int v104;
  id v105;
  id obj;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint8_t v121[128];
  uint8_t buf[4];
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  void *v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v92 = a3;
  atomic_store(0, __shouldPreheatMessageActivity);
  v4 = (MFMessageComposeViewController *)objc_alloc_init(getMFMessageComposeViewControllerClass());
  messageComposeViewController = self->_messageComposeViewController;
  self->_messageComposeViewController = v4;

  -[MFMessageComposeViewController setMessageComposeDelegate:](self->_messageComposeViewController, "setMessageComposeDelegate:", self);
  -[UIMessageActivity collaborationItem](self, "collaborationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 0;
  v98 = v6;
  if (!-[UIMessageActivity isCollaborative](self, "isCollaborative"))
  {
    if (objc_msgSend(v6, "type"))
    {
      objc_msgSend(v6, "itemProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "supportsMessagesSendCopyRepresentation"))
        v8 = (unint64_t)objc_msgSend(v92, "count") > 1;
      else
        v8 = 0;

      objc_msgSend(v6, "itemProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "supportsMessagesSendCopyRepresentation") ^ 1;

    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
  }
  v101 = self;
  if (v6)
    v11 = v7;
  else
    v11 = 1;
  v102 = v11 | v8;
  if (((v11 | v8) & 1) == 0)
  {
    v12 = self;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = self->_messageComposeViewController;
      share_sheet_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "itemProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shareOptions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "metadata");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIMessageActivity isCollaborative](v101, "isCollaborative");
        NSStringFromBOOL();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v123 = v15;
        v124 = 2112;
        v125 = v16;
        v126 = 2112;
        v127 = v17;
        v128 = 2112;
        v129 = v18;
        _os_log_impl(&dword_19E419000, v14, OS_LOG_TYPE_DEFAULT, "insertCollaborationItemProvider:%@ collaborationShareOptions:%@ collaborationMetadata:%@ isCollaboration:%@", buf, 0x2Au);

      }
      objc_msgSend(v98, "itemProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "shareOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "metadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageComposeViewController insertCollaborationItemProvider:collaborationShareOptions:collaborationMetadata:isCollaboration:](v13, "insertCollaborationItemProvider:collaborationShareOptions:collaborationMetadata:isCollaboration:", v19, v20, v21, -[UIMessageActivity isCollaborative](v101, "isCollaborative"));

    }
    else
    {
      share_sheet_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "itemProvider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "options");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "metadata");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIMessageActivity isCollaborative](v101, "isCollaborative");
        NSStringFromBOOL();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v123 = v23;
        v124 = 2112;
        v125 = v24;
        v126 = 2112;
        v127 = v25;
        v128 = 2112;
        v129 = v26;
        _os_log_impl(&dword_19E419000, v22, OS_LOG_TYPE_DEFAULT, "insertCollaborationItemProvider:%@ collaborationOptions:%@ collaborationMetadata:%@ isCollaboration:%@", buf, 0x2Au);

        v12 = v101;
      }

      v27 = v12->_messageComposeViewController;
      objc_msgSend(v98, "itemProvider");
      v13 = (MFMessageComposeViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "options");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "metadata");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageComposeViewController insertCollaborationItemProvider:collaborationOptions:collaborationMetadata:isCollaboration:](v27, "insertCollaborationItemProvider:collaborationOptions:collaborationMetadata:isCollaboration:", v13, v19, v20, -[UIMessageActivity isCollaborative](v12, "isCollaborative"));
    }

  }
  _UIActivityItemsGetStringsAndURLs(v92, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_opt_new();
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v28;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
  v31 = 0x1E0C99000uLL;
  v96 = v29;
  if (v30)
  {
    v32 = v30;
    v33 = *(_QWORD *)v116;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v116 != v33)
          objc_enumerationMutation(obj);
        v35 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * v34);
        objc_msgSend(*(id *)(v31 + 3736), "URLWithString:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (!v36)
          goto LABEL_30;
        objc_msgSend(v36, "scheme");
        v38 = objc_claimAutoreleasedReturnValue();
        if (!v38)
          goto LABEL_30;
        v39 = (void *)v38;
        objc_msgSend(v37, "host");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40 || (objc_msgSend(v37, "isFileURL") & 1) != 0)
        {

LABEL_30:
          objc_msgSend(v29, "addObject:", v35);
          goto LABEL_31;
        }
        -[LPLinkMetadata originalURL](v101->_linkMetadata, "originalURL");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "isEqual:", v41))
        {

          v29 = v96;
        }
        else
        {
          -[LPLinkMetadata URL](v101->_linkMetadata, "URL");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend(v37, "isEqual:", v42);

          v29 = v96;
          v31 = 0x1E0C99000;
          if (!v104)
            goto LABEL_30;
        }
        v43 = objc_alloc_init(getLPSharingMetadataWrapperClass());
        objc_msgSend(v43, "setHasFetchedSubresources:", 1);
        objc_msgSend(v43, "setMetadata:", v101->_linkMetadata);
        v44 = v101->_messageComposeViewController;
        v45 = v37;
        objc_msgSend(v43, "dataRepresentation");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v44;
        v31 = 0x1E0C99000;
        -[MFMessageComposeViewController addRichLinkData:withWebpageURL:](v47, "addRichLinkData:withWebpageURL:", v46, v45);

LABEL_31:
        ++v34;
      }
      while (v32 != v34);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
      v32 = v48;
    }
    while (v48);
  }

  objc_msgSend(v29, "componentsJoinedByString:", CFSTR(" "));
  p_isa = (id *)&v101->super.super.isa;
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageComposeViewController setBody:](v101->_messageComposeViewController, "setBody:");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  _UIActivityItemsGetAttachments(v92);
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v105 = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v111, v120, 16);
  v52 = v98;
  if (!v51)
    goto LABEL_87;
  v53 = v51;
  v54 = *(_QWORD *)v112;
  v94 = *MEMORY[0x1E0CA5BA8];
  v93 = *MEMORY[0x1E0CA5C10];
  inTagClass = (const __CFString *)*MEMORY[0x1E0CA5A88];
  v103 = *MEMORY[0x1E0CA5C20];
  v100 = 1;
  v99 = v50;
  do
  {
    for (i = 0; i != v53; ++i)
    {
      if (*(_QWORD *)v112 != v54)
        objc_enumerationMutation(v105);
      v56 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((v102 & 1) == 0)
        {
          if (!objc_msgSend(v52, "type")
            || (objc_msgSend(v52, "itemProvider"),
                v57 = (void *)objc_claimAutoreleasedReturnValue(),
                v58 = objc_msgSend(v57, "supportsMessagesSendCopyRepresentation"),
                v57,
                v58))
          {
            share_sheet_log();
            v59 = (UIImage *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v59->super, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19E419000, &v59->super, OS_LOG_TYPE_DEFAULT, "not providing file URL as attachment because we already provided a collaboration item with a file.", buf, 2u);
            }
            goto LABEL_84;
          }
        }
        objc_msgSend(p_isa, "_attachmentNameForActivityItem:", v56);
        v59 = (UIImage *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa[19], "addAttachmentURL:withAlternateFilename:", v56, v59);
        _UIActivityUTIForURL(v56);
        v60 = (UIImage *)objc_claimAutoreleasedReturnValue();
        if (!-[UIImage isEqualToString:](v60, "isEqualToString:", v103))
        {
          v77 = v50;
          v78 = v60;
          goto LABEL_82;
        }
        v64 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v56, "path");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "stringWithContentsOfFile:encoding:error:", v65, 4, 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
          objc_msgSend(v97, "addObject:", v66);

        v50 = v99;
LABEL_83:

        goto LABEL_84;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(p_isa, "_dataTypeIdentifierForActivityItem:", v56);
        v59 = (UIImage *)objc_claimAutoreleasedReturnValue();
        if (v59)
          goto LABEL_51;
        v79 = CGImageSourceCreateWithData((CFDataRef)v56, 0);
        if (v79)
        {
          v80 = v79;
          CGImageSourceGetType(v79);
          v59 = (UIImage *)objc_claimAutoreleasedReturnValue();
          CFRelease(v80);
          if (!v59)
            goto LABEL_84;
LABEL_51:
          objc_msgSend(p_isa, "_attachmentNameForActivityItem:", v56);
          v60 = (UIImage *)objc_claimAutoreleasedReturnValue();
          if (!-[UIImage length](v60, "length"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attachment-%ld"), v100);
            v61 = (UIImage *)objc_claimAutoreleasedReturnValue();

            v62 = UTTypeCopyPreferredTagWithClass((CFStringRef)v59, inTagClass);
            if (v62)
            {
              v63 = v62;
              -[UIImage stringByAppendingPathExtension:](v61, "stringByAppendingPathExtension:", v62);
              v60 = (UIImage *)objc_claimAutoreleasedReturnValue();

              CFRelease(v63);
              ++v100;
            }
            else
            {
              ++v100;
              v60 = v61;
            }
            v52 = v98;
            v50 = v99;
          }
          objc_msgSend(p_isa[19], "addAttachmentData:typeIdentifier:filename:", v56, v59, v60);
          if (-[UIImage isEqualToString:](v59, "isEqualToString:", v103))
          {
            v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v56, 4);
            if (v81)
              objc_msgSend(v97, "addObject:", v81);

            goto LABEL_83;
          }
          v77 = v50;
          v78 = v59;
LABEL_82:
          objc_msgSend(v77, "addObject:", v78);
          goto LABEL_83;
        }
        v59 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v59 = v56;
        -[UIImage size](v59, "size");
        v69 = v68 < 512.0 && v67 <= 512.0;
        objc_msgSend(p_isa, "_attachmentNameForActivityItem:", v59);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v70, "length"))
        {
          v71 = CFSTR("jpg");
          if (v69)
            v71 = CFSTR("png");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image-%ld.%@"), v100, v71);
          v72 = objc_claimAutoreleasedReturnValue();

          ++v100;
          p_isa = (id *)&v101->super.super.isa;
          v70 = (void *)v72;
        }
        if (v69)
        {
          UIImagePNGRepresentation(v59);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = p_isa[19];
          v75 = v73;
          v76 = v93;
        }
        else
        {
          UIImageJPEGRepresentation(v59, 0.8);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = p_isa[19];
          v75 = v73;
          v76 = v94;
        }
        objc_msgSend(v74, "addAttachmentData:typeIdentifier:filename:", v75, v76, v70);
        objc_msgSend(v50, "addObject:", v76);

        v52 = v98;
      }
LABEL_84:

    }
    v53 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v111, v120, 16);
  }
  while (v53);
LABEL_87:
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v82 = v92;
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v108;
    while (2)
    {
      for (j = 0; j != v84; ++j)
      {
        if (*(_QWORD *)v108 != v85)
          objc_enumerationMutation(v82);
        -[UIActivity _subjectForActivityItem:](v101, "_subjectForActivityItem:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j));
        v87 = objc_claimAutoreleasedReturnValue();
        if (v87)
        {
          v88 = (void *)v87;
          p_isa = (id *)&v101->super.super.isa;
          -[MFMessageComposeViewController setSubject:](v101->_messageComposeViewController, "setSubject:", v87);

          goto LABEL_97;
        }
      }
      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
      p_isa = (id *)&v101->super.super.isa;
      if (v84)
        continue;
      break;
    }
  }
LABEL_97:

  _UIActivityItemsGetStrings(v82, 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
    objc_msgSend(v97, "addObjectsFromArray:", v89);
  if (objc_msgSend(v50, "count"))
    objc_msgSend(p_isa[19], "setUTITypes:", v50);
  _UIActivityItemsGetWebURLs(v82, 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v90, "count"))
    objc_msgSend(p_isa[19], "setContentURLs:", v90);
  if (objc_msgSend(v97, "count"))
    objc_msgSend(p_isa[19], "setContentText:", v97);

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
  v8[2] = __58__UIMessageActivity__prepareWithActivityItems_completion___block_invoke;
  v8[3] = &unk_1E4001810;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[UIActivity _loadItemProvidersFromActivityItems:completion:](self, "_loadItemProvidersFromActivityItems:completion:", a3, v8);

}

uint64_t __58__UIMessageActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareWithActivityItems:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)activityViewController
{
  return self->_messageComposeViewController;
}

- (MFMessageComposeViewController)messageComposeViewController
{
  return self->_messageComposeViewController;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", a4 == 1);
}

- (void)_cleanup
{
  -[MFMessageComposeViewController setMessageComposeDelegate:](self->_messageComposeViewController, "setMessageComposeDelegate:", 0);
  -[UIMessageActivity setMessageComposeViewController:](self, "setMessageComposeViewController:", 0);
}

- (SFCollaborationItem)collaborationItem
{
  return self->_collaborationItem;
}

- (void)setCollaborationItem:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationItem, a3);
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (NSString)sourceApplicationBundleID
{
  return self->_sourceApplicationBundleID;
}

- (void)setSourceApplicationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (SFPeopleSuggestion)peopleSuggestion
{
  return self->_peopleSuggestion;
}

- (void)setPeopleSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_peopleSuggestion, a3);
}

- (void)setMessageComposeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_messageComposeViewController, a3);
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
  objc_storeStrong((id *)&self->_peopleSuggestion, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
  objc_storeStrong((id *)&self->_collaborationItem, 0);
}

@end
