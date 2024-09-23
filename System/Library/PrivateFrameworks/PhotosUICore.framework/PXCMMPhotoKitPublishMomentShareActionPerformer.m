@implementation PXCMMPhotoKitPublishMomentShareActionPerformer

+ (void)budgetOverridePromptAlertKeysForConfiguration:(id)a3 messageKey:(id *)a4 actionKey:(id *)a5
{
  uint64_t v9;
  int v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outMessageKey"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outActionKey"));

LABEL_3:
  v9 = objc_msgSend(v23, "networkType");
  v10 = objc_msgSend(v23, "useWLAN");
  v11 = objc_msgSend(v23, "assetCount");
  if (v10)
    v12 = CFSTR("WLAN");
  else
    v12 = CFSTR("WIFI");
  v13 = CFSTR("Single");
  if (v11 > 1)
    v13 = CFSTR("Multiple");
  v14 = v13;
  v15 = v12;
  objc_msgSend(v23, "deviceModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXCMMBudgetOverridePromptMessage_%@_%@_%@"), v15, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == 2)
  {
    objc_msgSend(v17, "stringByAppendingString:", CFSTR("_Connected"));
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = CFSTR("PXCMMBudgetOverridePromptButtonTitle_OverrideOnWifi");
    v17 = (void *)v18;
  }
  else
  {
    v19 = CFSTR("PXCMMBudgetOverridePromptButtonTitle_Override");
  }
  v20 = objc_retainAutorelease(v17);
  *a4 = v20;
  *a5 = v19;

}

- (void)_requestPreviewImageForAsset:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  double v10;
  unint64_t v11;
  float v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v9, "setVersion:", 0);
  objc_msgSend(v9, "setSynchronous:", 0);
  objc_msgSend(v9, "setDeliveryMode:", 1);
  objc_msgSend(v9, "setResizeMode:", 1);
  objc_msgSend(v9, "setNetworkAccessAllowed:", 1);
  v10 = (double)(unint64_t)objc_msgSend(v7, "pixelWidth");
  v11 = objc_msgSend(v7, "pixelHeight");
  v12 = v10 * (double)v11;
  v13 = fminf(sqrtf(607500.0 / v12), 1.0);
  v14 = (double)v11 * v13;
  v15 = v10 * v13;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__PXCMMPhotoKitPublishMomentShareActionPerformer__requestPreviewImageForAsset_resultHandler___block_invoke;
  v19[3] = &unk_1E5147AB8;
  v20 = v8;
  v17 = v8;
  self->_previewRequestID = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v9, v19, v15, v14);

}

- (void)performUserInteractionTask
{
  if (+[PXSharingConfidentialityController confidentialityCheckRequired](PXSharingConfidentialityController, "confidentialityCheckRequired"))
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _presentInternalSharingAlert](self, "_presentInternalSharingAlert");
  }
  else
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _createMomentShare](self, "_createMomentShare");
  }
}

- (void)_presentInternalSharingAlert
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  _QWORD aBlock[4];
  id v39;
  id buf[2];

  -[PXCMMActionPerformer session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 246, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.session"), v24, v26);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 246, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.session"), v24);
  }

LABEL_3:
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PXSharingConfidentialityController confidentialWarningRequiredForShareableSelection:](PXSharingConfidentialityController, "confidentialWarningRequiredForShareableSelection:", v7))
  {
    v28 = v7;
    PLSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Presenting internal sharing alert", (uint8_t *)buf, 2u);
    }

    +[PXSharingConfidentialityController confidentialityWarningTitle](PXSharingConfidentialityController, "confidentialityWarningTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharingConfidentialityController confidentialFeatureWarningMessage](PXSharingConfidentialityController, "confidentialFeatureWarningMessage");
    v10 = objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(buf, self);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke;
    aBlock[3] = &unk_1E5148D30;
    objc_copyWeak(&v39, buf);
    v12 = _Block_copy(aBlock);
    v36[0] = v11;
    v36[1] = 3221225472;
    v36[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_181;
    v36[3] = &unk_1E5148D30;
    objc_copyWeak(&v37, buf);
    v13 = _Block_copy(v36);
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_185;
    v35[3] = &unk_1E5149198;
    v35[4] = self;
    v14 = (void (**)(_QWORD))_Block_copy(v35);
    v27 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3448];
    v33[0] = v11;
    v33[1] = 3221225472;
    v33[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_2;
    v33[3] = &unk_1E5142658;
    v17 = v12;
    v34 = v17;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v30, 0, v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v18);

    v19 = (void *)MEMORY[0x1E0DC3448];
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_3;
    v31[3] = &unk_1E5142658;
    v20 = v13;
    v32 = v20;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v29, 0, v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v21);

    if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v15))
      v14[2](v14);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(buf);

    v7 = v28;
  }
  else
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _createMomentShare](self, "_createMomentShare");
  }

}

- (void)_createMomentShare
{
  NSObject *v3;
  uint8_t v4[8];
  _QWORD v5[5];

  -[PXCMMPhotoKitPublishMomentShareActionPerformer _presentSharingProgressAlertController](self, "_presentSharingProgressAlertController");
  if (self->_progressAlertToken)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShare__block_invoke;
    v5[3] = &unk_1E5123190;
    v5[4] = self;
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _createMomentShareWithCompletionHandler:](self, "_createMomentShareWithCompletionHandler:", v5);
  }
  else
  {
    PLSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Publishing performer: Failed to present progress alert", v4, 2u);
    }

    -[PXCMMPhotoKitPublishMomentShareActionPerformer _finalizePublishWithSuccess:error:](self, "_finalizePublishWithSuccess:error:", 0, 0);
  }
}

- (void)_createMomentShareWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  NSDate *v14;
  NSDate *initialStartDate;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  os_signpost_id_t v31;
  NSObject *v32;
  os_signpost_id_t v33;
  os_signpost_id_t v34;
  NSObject *v35;
  NSDate *v36;
  NSDate *previewRequestStartDate;
  uint64_t v38;
  id v39;
  id v40;
  __CFString *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  objc_class *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __CFString *v65;
  id v66;
  id v67;
  uint8_t buf[4];
  PXCMMPhotoKitPublishMomentShareActionPerformer *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXCMMActionPerformer session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 333, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.session"), v49);
LABEL_28:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 333, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.session"), v49, v51);

    goto LABEL_28;
  }
LABEL_3:
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "selectedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLSharingGetLog();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, self);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ActionPerformerMomentSharePublishSelection", " enableTelemetry=YES ", buf, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  initialStartDate = self->_initialStartDate;
  self->_initialStartDate = v14;

  objc_msgSend(v9, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v9;
  if (objc_msgSend(v10, "count"))
  {
    v17 = v10;
  }
  else
  {
    objc_msgSend(v16, "allItemIndexPaths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count") <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedIndexPaths.count > 0"));

    }
  }
  v55 = v16;
  objc_msgSend(v16, "photosDataSource");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v17;
  objc_msgSend(v53, "assetsAtIndexPaths:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v7;
  objc_msgSend(v7, "originalTitle");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "preventNilTitles");

    if (v21)
      v19 = &stru_1E5149688;
    else
      v19 = 0;
  }
  objc_msgSend(v6, "originatingMomentShare");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchPreviewAssetsForMomentShareCreationWithAssets:options:", v18, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    objc_msgSend(v18, "firstObject");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;

  -[PXCMMActionPerformer progress](self, "progress");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  PLSharingGetLog();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = os_signpost_id_make_with_pointer(v29, self);
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v29, OS_SIGNPOST_INTERVAL_END, v31, "ActionPerformerMomentSharePublishSelection", " enableTelemetry=YES ", buf, 2u);
    }
  }

  PLSharingGetLog();
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v33 = os_signpost_id_make_with_pointer(v32, self);
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v34 = v33;
    if (os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v34, "ActionPerformerMomentSharePublishPreview", " enableTelemetry=YES ", buf, 2u);
    }
  }

  PLSharingGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v36 = (NSDate *)objc_claimAutoreleasedReturnValue();
    previewRequestStartDate = self->_previewRequestStartDate;
    self->_previewRequestStartDate = v36;

    -[NSDate timeIntervalSinceDate:](v36, "timeIntervalSinceDate:", self->_initialStartDate);
    *(_DWORD *)buf = 138412546;
    v69 = self;
    v70 = 2048;
    v71 = v38;
    _os_log_impl(&dword_1A6789000, v35, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Did get assets to publish in %f seconds.", buf, 0x16u);
  }

  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke;
  v59[3] = &unk_1E5123208;
  v59[4] = self;
  v60 = v27;
  v61 = v23;
  v62 = v28;
  v63 = v6;
  v64 = v18;
  v65 = v19;
  v66 = v22;
  v67 = v57;
  v39 = v57;
  v40 = v22;
  v41 = v19;
  v42 = v18;
  v43 = v6;
  v44 = v28;
  v45 = v23;
  v46 = v27;
  -[PXCMMPhotoKitPublishMomentShareActionPerformer _requestPreviewImageForAsset:resultHandler:](self, "_requestPreviewImageForAsset:resultHandler:", v46, v59);

}

- (void)_creatingMomentShareDidCompleteWithMomentShare:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  _QWORD v13[5];
  id v14;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_momentShare, a3);
  -[PXCMMActionPerformer progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCancelled");

  if (v10)
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _performCleanupIfNeeded](self, "_performCleanupIfNeeded");
  }
  else if (v7)
  {
    if ((objc_msgSend(v7, "shouldPromptUserToIgnoreBudgets") & 1) != 0
      || (+[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "simulateShouldPromptUserToIgnoreBudgets"),
          v11,
          v12))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __103__PXCMMPhotoKitPublishMomentShareActionPerformer__creatingMomentShareDidCompleteWithMomentShare_error___block_invoke;
      v13[3] = &unk_1E5147B40;
      v13[4] = self;
      v14 = v7;
      -[PXCMMPhotoKitPublishMomentShareActionPerformer _presentBudgetOverridePromptForMomentShare:completionHandler:](self, "_presentBudgetOverridePromptForMomentShare:completionHandler:", v14, v13);

    }
    else
    {
      -[PXCMMPhotoKitPublishMomentShareActionPerformer _publishMomentShare:](self, "_publishMomentShare:", v7);
    }
  }
  else
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _finalizePublishWithSuccess:error:](self, "_finalizePublishWithSuccess:error:", 0, v8);
  }

}

- (void)_presentBudgetOverridePromptForMomentShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *progressAlertToken;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[4];
  id v21;
  PXCMMPhotoKitPublishMomentShareActionPerformer *v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Publishing performer: confirming whether or not to override budgets for moment share %@", buf, 0xCu);

  }
  progressAlertToken = self->_progressAlertToken;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5144238;
  v12 = v6;
  v21 = v12;
  v22 = self;
  v24 = progressAlertToken != 0;
  v13 = v7;
  v23 = v13;
  v14 = _Block_copy(aBlock);
  v15 = v14;
  if (progressAlertToken)
  {
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_progressAlertToken;
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_244;
    v18[3] = &unk_1E5148CE0;
    v18[4] = self;
    v19 = v15;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v17, v16, v18);

  }
  else
  {
    (*((void (**)(void *))v14 + 2))(v14);
  }

}

- (void)_budgetOverridePromptForMomentShare:(id)a3 completedWithOutcome:(BOOL)a4 error:(id)a5
{
  int v6;
  id v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  PXCMMPhotoKitPublishMomentShareActionPerformer *v17;
  _QWORD v18[4];
  id v19;
  char v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a5)
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _finalizePublishWithSuccess:error:](self, "_finalizePublishWithSuccess:error:", 0, a5);
  }
  else if (objc_msgSend(v8, "shouldIgnoreBudgets") == v6)
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _publishMomentShare:](self, "_publishMomentShare:", v9);
  }
  else
  {
    PLSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      objc_msgSend(v9, "localIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Publishing performer: Will change moment share shouldIgnoreBudget to %@: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke;
    v18[3] = &unk_1E5144398;
    v19 = v9;
    v20 = v6;
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke_2;
    v15[3] = &unk_1E5147B40;
    v16 = v19;
    v17 = self;
    objc_msgSend(v13, "performChanges:completionHandler:", v18, v15);

  }
}

- (void)_presentSharingProgressAlertController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *progressAlertToken;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  -[PXCMMActionPerformer progress](self, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke;
  v15[3] = &unk_1E5149198;
  v15[4] = self;
  objc_msgSend(v3, "setCancellationHandler:", v15);
  PXLocalizedStringFromTable(CFSTR("PXCMMSharingProgressTitle"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PXActionPerformer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentationEnvironmentForActionPerformer:", self);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke_3;
  v13[3] = &unk_1E5149198;
  v14 = v3;
  v10 = v3;
  PXSharedLibraryPresentProgressAlertWithPresentationEnvironment(v5, v8, v13);
  v11 = objc_claimAutoreleasedReturnValue();
  progressAlertToken = self->_progressAlertToken;
  self->_progressAlertToken = v11;

}

- (void)_publishMomentShare:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXCMMActionPerformer progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCancelled");

  if (v6)
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _performCleanupIfNeeded](self, "_performCleanupIfNeeded");
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare___block_invoke;
    v7[3] = &unk_1E513F750;
    v7[4] = self;
    v8 = v4;
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _publishMomentShare:completionHandler:](self, "_publishMomentShare:completionHandler:", v8, v7);

  }
}

- (void)_publishMomentShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  os_signpost_id_t v23;
  os_signpost_id_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[5];
  id v30;
  void (**v31)(id, void *, _QWORD);
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "simulateMomentShareCreationError");

  +[PXSharingSettings sharedInstance](PXSharingSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "simulateError");

  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fakeMomentShareURL");

  if (v13)
  {
    objc_msgSend(v6, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PXURLForCMMShare(0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v15, 0);
    goto LABEL_21;
  }
  if ((v9 | v11) == 1)
  {
    +[PXSharingSettings sharedInstance](PXSharingSettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "simulateUserCloudNotAuthenticated");

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = CFSTR("CloudPhotoLibraryErrorDomain");
      v20 = CFSTR("Simulated \"user needs to verify iCloud Terms and Conditions\" error, for debugging.");
      v21 = 1006;
    }
    else
    {
      if (v11)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v19 = CFSTR("PXSharingSettingsErrorDomain");
        v20 = CFSTR("Simulated error, because PXSharingSettings.simulateError is YES");
      }
      else
      {
        if (!v9)
        {
          v27 = 0;
          goto LABEL_18;
        }
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v19 = CFSTR("PXCompleteMyMomentSettingsErrorDomain");
        v20 = CFSTR("Simulated error, because PXCompleteMyMomentSettings.simulateMomentShareCreationError is YES");
      }
      v21 = 0;
    }
    objc_msgSend(v18, "px_errorWithDomain:code:debugDescription:", v19, v21, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    PLSharingGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v27;
      _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_DEFAULT, "Publishing performer: Simulating an error due to internal settings: %{public}@", buf, 0xCu);
    }

    ((void (**)(id, void *, void *))v7)[2](v7, 0, v27);
    goto LABEL_21;
  }
  PLSharingGetLog();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_id_make_with_pointer(v22, self);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "ActionPerformerMomentSharePublishPublishing", " enableTelemetry=YES ", buf, 2u);
    }
  }

  PLSharingGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v26;
    _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_DEFAULT, "Publishing performer: Will publish moment share %@", buf, 0xCu);

  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __88__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare_completionHandler___block_invoke;
  v29[3] = &unk_1E5123258;
  v29[4] = self;
  v30 = v6;
  v31 = v7;
  objc_msgSend(v30, "publishMomentShareWithCompletionHandler:", v29);

LABEL_21:
}

- (void)_publishingMomentShare:(id)a3 didCompleteWithShareURL:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[PXCMMActionPerformer progress](self, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCancelled");

  if (v13)
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _performCleanupIfNeeded](self, "_performCleanupIfNeeded");
    goto LABEL_13;
  }
  if (!v10)
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _finalizePublishWithSuccess:error:](self, "_finalizePublishWithSuccess:error:", 0, v11);
    goto LABEL_13;
  }
  PLSharingGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "pl_redactedShareURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v15;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "Publishing performer: Publish Moment Share succeeded with URL: %{public}@ error: %@", buf, 0x16u);

  }
  -[PXCMMPublishActionPerformer setPublishedURL:](self, "setPublishedURL:", v10);
  -[PXCMMActionPerformer session](self, "session");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke;
  v27[3] = &unk_1E5123280;
  v28 = v10;
  v29 = v9;
  objc_msgSend(v17, "performChanges:", v27);

  -[PXCMMActionPerformer session](self, "session");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 695, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.session"), v23);
LABEL_16:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_descriptionForAssertionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitPublishMomentShareActionPerformer.m"), 695, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.session"), v23, v25);

    goto LABEL_16;
  }
LABEL_8:
  objc_msgSend(v19, "suggestion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke_2;
    v26[3] = &unk_1E5148B78;
    v26[4] = self;
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _acceptSuggestion:completionHandler:](self, "_acceptSuggestion:completionHandler:", v20, v26);
  }
  else
  {
    -[PXCMMPhotoKitPublishMomentShareActionPerformer _finalizePublishWithSuccess:error:](self, "_finalizePublishWithSuccess:error:", 1, 0);
  }

LABEL_13:
}

- (void)_acceptSuggestion:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Publishing performer: Will mark suggestion as accepted: %@", buf, 0xCu);
  }

  objc_msgSend(v5, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__PXCMMPhotoKitPublishMomentShareActionPerformer__acceptSuggestion_completionHandler___block_invoke;
  v15[3] = &unk_1E5149198;
  v16 = v5;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __86__PXCMMPhotoKitPublishMomentShareActionPerformer__acceptSuggestion_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5148348;
  v13 = v16;
  v14 = v6;
  v10 = v6;
  v11 = v16;
  objc_msgSend(v8, "performChanges:completionHandler:", v15, v12);

}

- (void)_finalizePublishWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *progressAlertToken;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  uint8_t buf[16];

  v6 = a4;
  if (!self->_didFinalize)
    goto LABEL_5;
  PXAssertGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Calling publishing _finalizePublishWithSuccess when already called before", buf, 2u);
  }

  if (!self->_didFinalize)
  {
LABEL_5:
    self->_didFinalize = 1;
    if (!a3)
      -[PXCMMPhotoKitPublishMomentShareActionPerformer _performCleanupIfNeeded](self, "_performCleanupIfNeeded");
    if (self->_progressAlertToken)
    {
      -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      progressAlertToken = self->_progressAlertToken;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke;
      v13[3] = &unk_1E51473C0;
      v13[4] = self;
      v15 = a3;
      v14 = v6;
      PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(progressAlertToken, v8, v13);

    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke_3;
      v10[3] = &unk_1E51473C0;
      v10[4] = self;
      v12 = a3;
      v11 = v6;
      -[PXCMMPhotoKitPublishMomentShareActionPerformer _presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler:](self, "_presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler:", v10);

    }
  }

}

- (void)_presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  PHMomentShare *momentShare;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD);
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD);
  void *v29;
  NSObject *v30;
  PXCMMPhotoKitPublishMomentShareActionPerformer *v31;
  void (**v32)(_QWORD);
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  momentShare = self->_momentShare;
  objc_msgSend(MEMORY[0x1E0D719C0], "sharedBundleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openBundleAtLibraryURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "indicatorFileCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isUserPause") & 1) != 0)
  {
    v11 = 0;
    if (!momentShare)
      goto LABEL_11;
  }
  else
  {
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "simulateCPLAlertOnPublish");

    v11 = v13 ^ 1;
    if (!momentShare)
    {
LABEL_11:
      v4[2](v4);
      goto LABEL_12;
    }
  }
  if ((v11 & 1) != 0)
    goto LABEL_11;
  PXLocalizedStringFromTable(CFSTR("PXCMMUploadingPausedAlertTitle"), CFSTR("PhotosUICore"));
  v14 = objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCMMUploadingPausedUserInteractionMessage"), CFSTR("PhotosUICore"));
  v15 = objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCMMUploadingPausedResumeButtonTitle"), CFSTR("PhotosUICore"));
  v31 = self;
  v16 = v9;
  v17 = objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCMMUploadingPausedUploadLaterButtonTitle"), CFSTR("PhotosUICore"));
  v18 = v10;
  v19 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v15;
  v35 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0DC3448];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __121__PXCMMPhotoKitPublishMomentShareActionPerformer__presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler___block_invoke;
  v38[3] = &unk_1E5142658;
  v32 = v4;
  v22 = v4;
  v23 = (void *)v19;
  v10 = v18;
  v24 = v22;
  v39 = v22;
  v33 = (void *)v17;
  v25 = v17;
  v9 = v16;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v25, 0, v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v26);

  v27 = (void *)MEMORY[0x1E0DC3448];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __121__PXCMMPhotoKitPublishMomentShareActionPerformer__presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler___block_invoke_2;
  v36[3] = &unk_1E5142658;
  v28 = (void (**)(_QWORD))v24;
  v37 = v28;
  objc_msgSend(v27, "actionWithTitle:style:handler:", v23, 0, v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v29);

  if (!-[PXActionPerformer presentViewController:](v31, "presentViewController:", v20))
  {
    PLSharingGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = CFSTR("YES");
      _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, "Failed to present CPL uploading status alert after publishing: isUserPaused:%@", buf, 0xCu);
    }

    v28[2](v28);
  }

  v4 = v32;
LABEL_12:

}

- (void)_handleSharingProgressCancellation
{
  void *v3;
  void *v4;
  NSObject *progressAlertToken;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", self->_thumbnailRequestID);

  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageRequest:", self->_previewRequestID);

  progressAlertToken = self->_progressAlertToken;
  self->_progressAlertToken = 0;

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1001, CFSTR("Action Performer was cancelled"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCMMPhotoKitPublishMomentShareActionPerformer _finalizePublishWithSuccess:error:](self, "_finalizePublishWithSuccess:error:", 0, v6);

}

- (void)_performCleanupIfNeeded
{
  PHMomentShare *momentShare;
  PHMomentShare *v4;

  momentShare = self->_momentShare;
  if (momentShare)
  {
    PXExpungeMomentShare(momentShare, 0);
    v4 = self->_momentShare;
    self->_momentShare = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedDate, 0);
  objc_storeStrong((id *)&self->_publishStartDate, 0);
  objc_storeStrong((id *)&self->_creationRequestStartDate, 0);
  objc_storeStrong((id *)&self->_previewRequestStartDate, 0);
  objc_storeStrong((id *)&self->_initialStartDate, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_progressAlertToken, 0);
}

void __121__PXCMMPhotoKitPublishMomentShareActionPerformer__presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F8]), "initWithPhotoLibraryURL:", v5);
  objc_msgSend(v2, "assetsdClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudInternalClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudPhotoLibraryPauseState:reason:", 0, 3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __121__PXCMMPhotoKitPublishMomentShareActionPerformer__presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke_2;
  v5[3] = &unk_1E51473C0;
  v4 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 48);
  v7 = v4;
  objc_msgSend(v6, "_presentAlertControllerForCurrentCPLStateIfNeededWithCompletionHandler:", v5);

}

uint64_t __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __84__PXCMMPhotoKitPublishMomentShareActionPerformer__finalizePublishWithSuccess_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __86__PXCMMPhotoKitPublishMomentShareActionPerformer__acceptSuggestion_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "markAccepted");

}

void __86__PXCMMPhotoKitPublishMomentShareActionPerformer__acceptSuggestion_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v8;
      v9 = "Publishing performer: Did mark suggestion as accepted: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v5;
    v9 = "Publishing performer: Failed to mark suggestion as accepted: %@, error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v5, v14);
}

void __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setShareURL:", v3);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShareUUID:", v5);

}

void __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __103__PXCMMPhotoKitPublishMomentShareActionPerformer__publishingMomentShare_didCompleteWithShareURL_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalizePublishWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __88__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  PLSharingGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      LOWORD(v33) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v9, "ActionPerformerMomentSharePublishPublishing", " enableTelemetry=YES ", (uint8_t *)&v33, 2u);
    }
  }

  PLSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 168);
      *(_QWORD *)(v14 + 168) = v13;

      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
      v33 = 138412546;
      v34 = v12;
      v35 = 2048;
      v36 = v16;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Did publish moment share in %f seconds.", (uint8_t *)&v33, 0x16u);
    }

    PLSharingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412290;
      v34 = (uint64_t)v18;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "=== Publishing summary of moment share: %@ ===", (uint8_t *)&v33, 0xCu);

    }
    PLSharingGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(*(id *)(a1 + 40), "assetCount");
      v33 = 134217984;
      v34 = v20;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "> Number of assets: %lu", (uint8_t *)&v33, 0xCu);
    }

    PLSharingGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
      v33 = 134217984;
      v34 = v22;
      _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, "> 1. Preparing selection: %f", (uint8_t *)&v33, 0xCu);
    }

    PLSharingGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
      v33 = 134217984;
      v34 = v24;
      _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEFAULT, "> 2. Previews: %f", (uint8_t *)&v33, 0xCu);
    }

    PLSharingGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
      v33 = 134217984;
      v34 = v26;
      _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_DEFAULT, "> 3. Creation: %f", (uint8_t *)&v33, 0xCu);
    }

    PLSharingGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
      v33 = 134217984;
      v34 = v28;
      _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_DEFAULT, "> 4. Publishing: %f", (uint8_t *)&v33, 0xCu);
    }

    PLSharingGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(a1 + 40);
      v33 = 138412290;
      v34 = v30;
      _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v33, 0xCu);
    }

    PLSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412290;
      v34 = (uint64_t)v31;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "=== Publishing summary of moment share: %@ ===", (uint8_t *)&v33, 0xCu);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v32 = *(_QWORD *)(a1 + 40);
    v33 = 138412546;
    v34 = (uint64_t)v5;
    v35 = 2112;
    v36 = v32;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Publish completed without a share URL (error: %@). Cleaning up moment share %@", (uint8_t *)&v33, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __70__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v9 = *(id *)(a1 + 40);
  v10 = v6;
  v7 = v6;
  v8 = v5;
  px_dispatch_on_main_queue();

}

uint64_t __70__PXCMMPhotoKitPublishMomentShareActionPerformer__publishMomentShare___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishingMomentShare:didCompleteWithShareURL:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke()
{
  return px_dispatch_on_main_queue();
}

uint64_t __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __88__PXCMMPhotoKitPublishMomentShareActionPerformer__presentSharingProgressAlertController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSharingProgressCancellation");
}

void __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1688], "changeRequestForMomentShare:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldIgnoreBudgets:", *(unsigned __int8 *)(a1 + 40));

}

void __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v5 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __113__PXCMMPhotoKitPublishMomentShareActionPerformer__budgetOverridePromptForMomentShare_completedWithOutcome_error___block_invoke_3(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 56);
  PLSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Publishing performer: Did change moment share shouldIgnoreBudget: %@", (uint8_t *)&v9, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 40), "_publishMomentShare:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Publishing performer: Failed to change moment share shouldIgnoreBudget: %@ with error %@", (uint8_t *)&v9, 0x16u);

    }
    return objc_msgSend(*(id *)(a1 + 40), "_finalizePublishWithSuccess:error:", 0, *(_QWORD *)(a1 + 48));
  }
}

void __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  PXPublishMomentShareBudgetOverridePromptConfiguration *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[8];
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  char v26;
  id v27;
  id v28[2];

  +[PXNetworkStatusMonitor sharedInstance](PXNetworkStatusMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bestAvailableNetworkType");

  v4 = MGGetBoolAnswer();
  +[PXLocalization currentDeviceCanonicalModel](PXLocalization, "currentDeviceCanonicalModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPublishMomentShareBudgetOverridePromptConfiguration initWithUseWLAN:networkType:assetCount:deviceModel:]([PXPublishMomentShareBudgetOverridePromptConfiguration alloc], "initWithUseWLAN:networkType:assetCount:deviceModel:", v4, v3, objc_msgSend(*(id *)(a1 + 32), "assetCount"), v20);
  v28[0] = 0;
  v27 = 0;
  objc_msgSend((id)objc_opt_class(), "budgetOverridePromptAlertKeysForConfiguration:messageKey:actionKey:", v5, v28, &v27);
  v6 = v28[0];
  v7 = v27;
  PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3448];
  v24[2] = __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_2;
  v24[3] = &unk_1E5123230;
  v26 = *(_BYTE *)(a1 + 56);
  v12 = *(void **)(a1 + 48);
  v24[4] = *(_QWORD *)(a1 + 40);
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v25 = v12;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v9, 0, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_239;
  v22[3] = &unk_1E5142658;
  v23 = *(id *)(a1 + 48);
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v17);

  LODWORD(v17) = objc_msgSend(*(id *)(a1 + 40), "presentViewController:", v10);
  PLSharingGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((_DWORD)v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "Presenting budget override prompt...", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Publishing performer: Failed to present budget override prompt", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1002, CFSTR("Failed to present budget override prompt"));
    v19 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_244(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Budget override prompt outcome: SHOULD ignore budgets", buf, 2u);
  }

  if (*(_BYTE *)(a1 + 48)
    && (objc_msgSend(*(id *)(a1 + 32), "_presentSharingProgressAlertController"),
        !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104)))
  {
    PLSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Publishing performer: Failed to re-present progress alert", v5, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1002, CFSTR("Failed to re-present progress alert"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __111__PXCMMPhotoKitPublishMomentShareActionPerformer__presentBudgetOverridePromptForMomentShare_completionHandler___block_invoke_239(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Budget override prompt outcome: Upload canceled", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1001, CFSTR("Cancelled upload at budget override prompt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __103__PXCMMPhotoKitPublishMomentShareActionPerformer__creatingMomentShareDidCompleteWithMomentShare_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_budgetOverridePromptForMomentShare:completedWithOutcome:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

void __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  CGImage *v13;
  double v14;
  uint64_t v15;
  CFNumberRef v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __CFData *v21;
  const __CFDictionary *v22;
  uint64_t v23;
  unint64_t v24;
  __CFData *v25;
  __CFData *v26;
  CGImageDestination *v27;
  CGImageDestination *v28;
  _BOOL4 v29;
  __CFData *v30;
  NSObject *v31;
  double x;
  double y;
  double width;
  double height;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  os_signpost_id_t v54;
  os_signpost_id_t v55;
  NSObject *v56;
  os_signpost_id_t v57;
  os_signpost_id_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  id v79;
  void *v80;
  id v81;
  id obj;
  _QWORD v84[4];
  id v85;
  id v86;
  uint64_t v87;
  id v88;
  _QWORD *v89;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  _QWORD *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  double valuePtr;
  uint64_t v102;
  uint64_t v103;
  _BYTE v104[128];
  void *values[2];
  __int128 v106;
  __int128 v107;
  _QWORD buf[4];
  __int128 v109;
  uint64_t v110;
  CGSize v111;
  CGRect v112;

  v110 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v79 = a3;
  v80 = v4;
  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      LODWORD(buf[0]) = 138412546;
      *(_QWORD *)((char *)buf + 4) = v7;
      WORD2(buf[1]) = 2112;
      *(_QWORD *)((char *)&buf[1] + 6) = v4;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Received preview image %@", (uint8_t *)buf, 0x16u);
    }

    v8 = *(void **)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    v10 = v80;
    v11 = v8;
    v81 = objc_alloc_init(MEMORY[0x1E0CD1690]);
    v102 = 0x408C200000000000;
    v12 = objc_retainAutorelease(v10);
    v13 = (CGImage *)objc_msgSend(v12, "CGImage");
    if (v13)
    {
      v109 = 0u;
      memset(buf, 0, sizeof(buf));
      v106 = 0u;
      v107 = 0u;
      *(_OWORD *)values = 0u;
      DCIM_scaleFromPLImage();
      v15 = 0;
      if (v14 != 1.0 && v14 > 0.001)
      {
        valuePtr = v14 * 72.0;
        v16 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
        v17 = *MEMORY[0x1E0CBCA00];
        values[0] = v16;
        v18 = *MEMORY[0x1E0CBC9F8];
        buf[0] = v17;
        buf[1] = v18;
        values[1] = (void *)CFRetain(v16);
        v15 = 2;
      }
      v103 = 0x3FE6666666666666;
      buf[v15] = *MEMORY[0x1E0CBC780];
      values[v15] = CFNumberCreate(0, kCFNumberDoubleType, &v103);
      buf[v15 | 1] = *MEMORY[0x1E0CBC7A0];
      values[v15 | 1] = (void *)CFRetain((CFTypeRef)*MEMORY[0x1E0C9AE50]);
      buf[v15 + 2] = *MEMORY[0x1E0CBC778];
      values[v15 + 2] = CFNumberCreate(0, kCFNumberDoubleType, &v102);
      LODWORD(valuePtr) = 0;
      v19 = v15 + 3;
      switch(objc_msgSend(v12, "imageOrientation"))
      {
        case 0:
          v20 = 1;
          goto LABEL_21;
        case 1:
          v20 = 3;
          goto LABEL_21;
        case 2:
          v20 = 8;
          goto LABEL_21;
        case 3:
          v20 = 6;
          goto LABEL_21;
        case 4:
          v20 = 2;
          goto LABEL_21;
        case 5:
          v20 = 4;
          goto LABEL_21;
        case 6:
          v20 = 5;
          goto LABEL_21;
        case 7:
          v20 = 7;
LABEL_21:
          LODWORD(valuePtr) = v20;
          break;
        default:
          break;
      }
      buf[v19] = *MEMORY[0x1E0CBCFF0];
      values[v19] = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      v22 = CFDictionaryCreate(0, (const void **)buf, (const void **)values, v15 | 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v23 = v15 + 3;
      do
      {
        CFRelease(values[v23]);
        v24 = v23-- + 1;
      }
      while (v24 > 1);
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v25 = (__CFData *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25 && (v27 = CGImageDestinationCreateWithData(v25, CFSTR("public.jpeg"), 1uLL, 0), (v28 = v27) != 0))
      {
        CGImageDestinationAddImage(v27, v13, v22);
        v29 = CGImageDestinationFinalize(v28);
        CFRelease(v28);
        CFRelease(v22);
        if (v29)
          v30 = v26;
        else
          v30 = 0;
      }
      else
      {
        CFRelease(v22);
        v30 = 0;
      }
      v21 = v30;

      if (v21 && -[__CFData length](v21, "length") && (unint64_t)-[__CFData length](v21, "length") >> 12 <= 0x7C)
      {
        buf[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
        v31 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setPreviewImageData:", v31);
LABEL_36:

        objc_msgSend(v81, "setKeyAsset:", v9);
        objc_msgSend(v9, "originalFaceAreaRect");
        x = v112.origin.x;
        y = v112.origin.y;
        width = v112.size.width;
        height = v112.size.height;
        if (CGRectIsEmpty(v112))
        {
          objc_msgSend(v9, "preferredCropRect");
          x = v36;
          y = v37;
          width = v38;
          height = v39;
        }
        objc_msgSend(v81, "setCropRect:", x, y, width, height, v79);
        PXMap();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setCuratedAssetIdentifiers:", v40);

        objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", (uint64_t)(float)((float)objc_msgSend(*(id *)(a1 + 56), "completedUnitCount")+ (float)((float)objc_msgSend(*(id *)(a1 + 56), "totalUnitCount") * 0.25)));
        PLSharingGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = *(_QWORD *)(a1 + 32);
          v43 = (void *)MEMORY[0x1E0CB34E8];
          objc_msgSend(v81, "previewImageData");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "firstObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringFromByteCount:countStyle:", objc_msgSend(v45, "length"), 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "px_pixelSize");
          NSStringFromCGSize(v111);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf[0]) = 138412802;
          *(_QWORD *)((char *)buf + 4) = v42;
          WORD2(buf[1]) = 2112;
          *(_QWORD *)((char *)&buf[1] + 6) = v46;
          HIWORD(buf[2]) = 2112;
          buf[3] = v47;
          _os_log_impl(&dword_1A6789000, v41, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Preview file size is : %@ for size: %@", (uint8_t *)buf, 0x20u);

        }
        PLSharingGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = v50;

          objc_msgSend(v50, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
          LODWORD(buf[0]) = 138412546;
          *(_QWORD *)((char *)buf + 4) = v49;
          WORD2(buf[1]) = 2048;
          *(_QWORD *)((char *)&buf[1] + 6) = v52;
          _os_log_impl(&dword_1A6789000, v48, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Did get preview data in %f seconds.", (uint8_t *)buf, 0x16u);
        }

        PLSharingGetLog();
        v53 = (id)objc_claimAutoreleasedReturnValue();
        v54 = os_signpost_id_make_with_pointer(v53, *(const void **)(a1 + 32));
        if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v55 = v54;
          if (os_signpost_enabled(v53))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v53, OS_SIGNPOST_INTERVAL_END, v55, "ActionPerformerMomentSharePublishPreview", " enableTelemetry=YES ", (uint8_t *)buf, 2u);
          }
        }

        PLSharingGetLog();
        v56 = (id)objc_claimAutoreleasedReturnValue();
        v57 = os_signpost_id_make_with_pointer(v56, *(const void **)(a1 + 32));
        if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v58 = v57;
          if (os_signpost_enabled(v56))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v58, "ActionPerformerMomentSharePublishCreation", " enableTelemetry=YES ", (uint8_t *)buf, 2u);
          }
        }

        buf[0] = 0;
        buf[1] = buf;
        buf[2] = 0x3032000000;
        buf[3] = __Block_byref_object_copy__82692;
        *(_QWORD *)&v109 = __Block_byref_object_dispose__82693;
        *((_QWORD *)&v109 + 1) = 0;
        objc_msgSend(*(id *)(a1 + 64), "preparationOptionsPerAsset");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        obj = *(id *)(a1 + 72);
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
        if (v61)
        {
          v62 = *(_QWORD *)v98;
          do
          {
            for (i = 0; i != v61; ++i)
            {
              if (*(_QWORD *)v98 != v62)
                objc_enumerationMutation(obj);
              v64 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
              objc_msgSend(v64, "uuid");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectForKeyedSubscript:", v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v66, "publishAsOriginal"))
              {
                objc_msgSend(MEMORY[0x1E0CD13E0], "adjustmentBakeInOptionsForPublishingOriginals");
                v67 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CD13F0], "metadataCopyOptionsForPublishingOriginals");
                v68 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v67 = objc_alloc_init(MEMORY[0x1E0CD13E0]);
                v68 = objc_alloc_init(MEMORY[0x1E0CD13F0]);
                +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "setShouldBakeInIfLivePhotoPlaybackDisabled:", objc_msgSend(v69, "shouldBakeInIfLivePhotoPlaybackDisabled"));
                objc_msgSend(v67, "setShouldBakeInIfLivePhotoMuted:", objc_msgSend(v69, "shouldBakeInIfLivePhotoMuted"));
                objc_msgSend(v67, "setShouldBakeInIfAdjustedByThirdParty:", objc_msgSend(v69, "shouldBakeInIfAdjustedByThirdParty"));
                objc_msgSend(v67, "setShouldBakeInIfCropped:", objc_msgSend(v69, "shouldBakeInIfCropped"));
                objc_msgSend(v67, "setShouldBakeInIfTimelineTrimmed:", objc_msgSend(v69, "shouldBakeInIfTimelineTrimmed"));
                objc_msgSend(v67, "setShouldBakeInIfPortraitDepthEffectEnabled:", objc_msgSend(v69, "shouldBakeInIfPortraitDepthEffectEnabled"));
                objc_msgSend(v67, "setShouldBakeInIfContainsPenultimateResources:", objc_msgSend(v69, "shouldBakeInIfContainsPenultimateResources"));
                objc_msgSend(v67, "setFlattenLivePhotoToStillIfNeeded:", objc_msgSend(v66, "publishLivePhotoAsStill"));
                objc_msgSend(v68, "setShouldCopyTitleDescriptionAndKeywords:", 0);
                objc_msgSend(v68, "setShouldCopySpatialOverCaptureResources:", 0);
                objc_msgSend(v68, "setShouldCopyLocationData:", objc_msgSend(v66, "removeLocationData") ^ 1);

              }
              v70 = objc_alloc_init(MEMORY[0x1E0CD13F8]);
              objc_msgSend(v70, "setAdjustmentBakeInOptions:", v67);
              objc_msgSend(v70, "setMetadataCopyOptions:", v68);
              objc_msgSend(v64, "uuid");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setObject:forKeyedSubscript:", v70, v71);

            }
            v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
          }
          while (v61);
        }

        objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = MEMORY[0x1E0C809B0];
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke_205;
        v90[3] = &unk_1E51231B8;
        v91 = *(id *)(a1 + 80);
        v92 = *(id *)(a1 + 72);
        v74 = v60;
        v93 = v74;
        v75 = v81;
        v94 = v75;
        v95 = *(id *)(a1 + 88);
        v96 = buf;
        v84[0] = v73;
        v84[1] = 3221225472;
        v84[2] = __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke_2;
        v84[3] = &unk_1E51231E0;
        v76 = v72;
        v85 = v76;
        v89 = buf;
        v77 = *(id *)(a1 + 56);
        v78 = *(_QWORD *)(a1 + 32);
        v86 = v77;
        v87 = v78;
        v88 = *(id *)(a1 + 96);
        objc_msgSend(v76, "performChanges:completionHandler:", v90, v84);

        _Block_object_dispose(buf, 8);
        goto LABEL_59;
      }
    }
    else
    {

      v21 = 0;
    }
    PLSharingGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v21;
      _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "Publishing performer: previewImageData missing or too big: %@", (uint8_t *)buf, 0xCu);
    }
    goto LABEL_36;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf[0]) = 138412290;
    *(_QWORD *)((char *)buf + 4) = v79;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Preview image data request failed with error: %@", (uint8_t *)buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
LABEL_59:

}

void __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke_205(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0CD1688];
  v3 = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creationRequestForMomentShareWithTitle:publicPermission:creationDate:createMomentShareAssetsFromAssets:creationOptionsPerAsset:preview:originatingMomentShare:", v3, 2, v4, a1[5], a1[6], a1[7], a1[8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "placeholderForCreatedMomentShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[9] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __90__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShareWithCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CD13B8];
    v27[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAssetCollectionsWithLocalIdentifiers:options:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", (uint64_t)(float)((float)objc_msgSend(*(id *)(a1 + 40), "completedUnitCount")+ (float)((float)objc_msgSend(*(id *)(a1 + 40), "totalUnitCount") * 0.24)));
    PLSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v10, "localIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(void **)(v15 + 160);
      *(_QWORD *)(v15 + 160) = v14;

      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 152));
      v21 = 138412802;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2048;
      v26 = v17;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Publishing performer: %@ Did create moment share %@ in %f seconds.", (uint8_t *)&v21, 0x20u);

    }
  }
  else
  {
    v10 = 0;
  }
  PLSharingGetLog();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_make_with_pointer(v18, *(const void **)(a1 + 48));
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v20 = v19;
    if (os_signpost_enabled(v18))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_END, v20, "ActionPerformerMomentSharePublishCreation", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __68__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShare__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a2;
  v7 = a3;
  v5 = v7;
  v6 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __68__PXCMMPhotoKitPublishMomentShareActionPerformer__createMomentShare__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_creatingMomentShareDidCompleteWithMomentShare:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Accepted internal sharing alert", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createMomentShare");

}

void __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_181(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  uint8_t v5[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled internal sharing alert", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1001, CFSTR("Cancelled internal sharing alert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finalizePublishWithSuccess:error:", 0, v3);

}

void __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_185(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1002, CFSTR("Failed to present internal sharing alert"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finalizePublishWithSuccess:error:", 0, v2);

}

uint64_t __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PXCMMPhotoKitPublishMomentShareActionPerformer__presentInternalSharingAlert__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__PXCMMPhotoKitPublishMomentShareActionPerformer__requestPreviewImageForAsset_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *MEMORY[0x1E0CD1BE8];
  v6 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

@end
