@implementation UIAlertController(CPL)

+ (id)px_deleteITunesContentAlertWithAssetCount:()CPL includesPhotos:includesVideos:actionHandler:cancelHandler:
{
  id v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  BOOL v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v11 = a6;
  v12 = a7;
  v13 = CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_TITLE_VIDEOS");
  if (a4)
    v13 = CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_TITLE_PHOTOS_VIDEOS");
  v14 = CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_MESSAGE_FORMAT_VIDEOS");
  if (a4)
    v14 = CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_MESSAGE_FORMAT_PHOTOS_VIDEOS");
  v15 = CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_DELETE_PHOTOS_VIDEOS");
  if (!a4)
    v15 = CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_DELETE_VIDEOS");
  v16 = a5 == 0;
  if (a5)
    v17 = (__CFString *)v13;
  else
    v17 = CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_TITLE_PHOTOS");
  if (a5)
    v18 = (__CFString *)v14;
  else
    v18 = CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_MESSAGE_FORMAT_PHOTOS");
  if (v16)
    v19 = CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_DELETE_PHOTOS");
  else
    v19 = (__CFString *)v15;
  PXLocalizedStringFromTable(v17, CFSTR("PhotosUICore"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v18, CFSTR("PhotosUICore"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v19, CFSTR("PhotosUICore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("ICLOUDPHOTOS_DELETE_NONICP_CONTENT_CANCEL"), CFSTR("PhotosUICore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithValidatedFormat(v33, CFSTR("%d"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v32, v22, 1, a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = (void *)MEMORY[0x1E0DC3448];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __126__UIAlertController_CPL__px_deleteITunesContentAlertWithAssetCount_includesPhotos_includesVideos_actionHandler_cancelHandler___block_invoke;
  v36[3] = &unk_1E5142658;
  v37 = v12;
  v26 = v12;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v21, 1, v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v27);

  v28 = (void *)MEMORY[0x1E0DC3448];
  v34[0] = v24;
  v34[1] = 3221225472;
  v34[2] = __126__UIAlertController_CPL__px_deleteITunesContentAlertWithAssetCount_includesPhotos_includesVideos_actionHandler_cancelHandler___block_invoke_2;
  v34[3] = &unk_1E5142658;
  v35 = v11;
  v29 = v11;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v20, 0, v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v30);

  return v23;
}

+ (id)px_alertForCPLEnableError:()CPL actionHandler:cancelHandler:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v44 = v7;
  switch(objc_msgSend(v7, "code"))
  {
    case 6:
      PXLocalizedStringFromTable(CFSTR("ICLOUDPHOTOS_RAMP_DISABLED_TITLE"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("ICLOUDPHOTOS_RAMP_DISABLED_MESSAGE");
      goto LABEL_6;
    case 7:
      objc_msgSend(v7, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D71D18]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D71D10]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedLongLongValue");

      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v13, "availableBytes");
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "model");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 >= 0x100000)
      {
        objc_msgSend(CFSTR("ICLOUD_PHOTOS_QUOTA_INSUFFICIENT_MESSAGE_FORMAT_"), "stringByAppendingString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        PXLocalizedStringFromTable(v21, CFSTR("PhotosUICore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v18, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        PXStringWithValidatedFormat();
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(CFSTR("ICLOUD_PHOTOS_QUOTA_EXHAUSTED_MESSAGE_FORMAT_"), "stringByAppendingString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        PXLocalizedStringFromTable(v21, CFSTR("PhotosUICore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        PXStringWithValidatedFormat();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }

      PXLocalizedStringFromTable(CFSTR("ICLOUD_PHOTOS_QUOTA_INSUFFICIENT_TITLE"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("ICLOUD_PHOTOS_CANCEL"), CFSTR("PhotosUICore"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("ICLOUD_PHOTOS_VIEW_OPTIONS"), CFSTR("PhotosUICore"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 9:
      PXLocalizedStringFromTable(CFSTR("ICLOUDPHOTOS_NO_ACCOUNT"), CFSTR("PhotosUICore"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("ICLOUDPHOTOS_OK"), CFSTR("PhotosUICore"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v10 = 0;
      goto LABEL_14;
    case 11:
      v26 = MGGetBoolAnswer();
      v27 = CFSTR("ICLOUDPHOTOS_NO_CONNECTION_MESSAGE");
      if (v26)
        v27 = CFSTR("ICLOUDPHOTOS_NO_CONNECTION_MESSAGE_WLAN");
      v28 = v27;
      PXLocalizedStringFromTable(CFSTR("ICLOUDPHOTOS_NO_CONNECTION_TITLE"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(v28, CFSTR("PhotosUICore"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    default:
      PXLocalizedStringFromTable(CFSTR("ICLOUDPHOTOS_ENABLE_ERROR_TITLE"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("ICLOUDPHOTOS_ENABLE_ERROR_MESSAGE");
LABEL_6:
      PXLocalizedStringFromTable(v11, CFSTR("PhotosUICore"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      PXLocalizedStringFromTable(CFSTR("ICLOUDPHOTOS_OK"), CFSTR("PhotosUICore"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
LABEL_14:
      v29 = v8;
      PLUIGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v44, "domain");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        PLCPLErrorDebugDescription();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PXDebugDescriptionForError();
        v33 = v9;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v31;
        v52 = 2114;
        v53 = v32;
        v54 = 2112;
        v55 = v34;
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEFAULT, "Will present alert for iCPL enablement error: <%{public}@:%{public}@, %@>", buf, 0x20u);

        v9 = v33;
      }

      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v23, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0DC3448];
      v37 = MEMORY[0x1E0C809B0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __80__UIAlertController_CPL__px_alertForCPLEnableError_actionHandler_cancelHandler___block_invoke;
      v48[3] = &unk_1E5142658;
      v38 = v9;
      v49 = v38;
      objc_msgSend(v36, "actionWithTitle:style:handler:", v24, 1, v48);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addAction:", v39);

      if (v25)
      {
        v40 = (void *)MEMORY[0x1E0DC3448];
        v45[0] = v37;
        v45[1] = 3221225472;
        v45[2] = __80__UIAlertController_CPL__px_alertForCPLEnableError_actionHandler_cancelHandler___block_invoke_187;
        v45[3] = &unk_1E5138AE0;
        v46 = v25;
        v47 = v29;
        objc_msgSend(v40, "actionWithTitle:style:handler:", v46, 0, v45);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addAction:", v41);

      }
      return v35;
  }
}

@end
