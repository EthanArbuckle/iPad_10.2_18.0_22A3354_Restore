@implementation PXFeedbackTapToRadarUtilities

+ (id)attachmentURLForDiagnosticDictionaries:(id)a3 descriptionName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarUtilities.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("diagnosticDictionaries.count > 0"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-Summary.txt"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        PLPrettyPrintPList();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v13, "appendString:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

  v27 = 0;
  v20 = objc_msgSend(v13, "writeToURL:atomically:encoding:error:", v12, 1, 4, &v27);
  v21 = v27;
  v22 = v12;
  if ((v20 & 1) == 0)
  {
    PLUIGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v8;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "%@ failed to save tap-to-radar info, error: %@", buf, 0x16u);
    }

    v22 = 0;
  }
  v24 = v22;

  return v24;
}

+ (NSString)summaryDescription
{
  return (NSString *)CFSTR("— Summary —\nRecap the problem title and/or include more descriptive summary information.\n\n— Steps to reproduce —\n0. What device and what build\n1. Setup or prep work\n2. Include explicit and accurate steps to reproduce. Do not include extraneous or irrelevant steps.\n\n— Observed results —\nDescribe the results you observed and how they differed from what you expected. Please also indicate the timestamp from when you encountered the issue.\n\n— Regression information —\nDoes it reproduce on a public iOS release? If so, please provide the iOS version.\nDoes it reproduce on a previous internal build? If so, please provide the build number.\n\n\n---CMM - Compose Recipient List Tap-To-Radar---\n");
}

+ (id)internalReleaseAgreement
{
  return CFSTR("I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the images that I am providing with this bug report (“Images”), for the purpose of improving the machine vision capabilities of Apple products. Apple may not use the Images in any other fashion than as provided herein.  Please do not provide any images that contain third parties or for which you do not have sufficient rights.\n\nI represent that the Images are original to and/or owned by me and that I have the rights necessary to grant to Apple the rights provided herein.  I release Apple, its agents, employees, licensees and assigns from any and all claims I may have now or in the future for invasion of privacy, right of publicity, trademark infringement, copyright infringement, defamation or any other cause of action arising out of the use or reproduction of the Images.\n\nI have read and fully understand the foregoing and hereby acknowledge my agreement to its terms.");
}

+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 classification:(id)a5 componentID:(id)a6 componentName:(id)a7 componentVersion:(id)a8 keyword:(id)a9 attachmentURLs:(id)a10 includeSysDiagnose:(BOOL)a11 completionHandler:(id)a12
{
  uint64_t v12;

  BYTE1(v12) = 1;
  LOBYTE(v12) = a11;
  objc_msgSend(a1, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", a3, a4, a5, a6, a7, a8, a9, 0, a10, v12, 0, a12);
}

+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 classification:(id)a5 componentID:(id)a6 componentName:(id)a7 componentVersion:(id)a8 keyword:(id)a9 screenshotURLs:(id)a10 attachmentURLs:(id)a11 includeSysDiagnose:(BOOL)a12 includeInternalRelease:(BOOL)a13 additionalExtensionIdentifiers:(id)a14 completionHandler:(id)a15
{
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  id v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v20 = a4;
  v61 = a5;
  v21 = a6;
  v62 = a7;
  v60 = a8;
  v59 = a9;
  v58 = a10;
  v22 = a11;
  v57 = a14;
  v55 = a15;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v77 = v62;
    v78 = 2112;
    v79 = v63;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Tap-to-Radar initiated for component: %@, title: %@", buf, 0x16u);
  }
  objc_msgSend((id)objc_opt_class(), "_tempDirectoryURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v71 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(getDEUtilsClass(), "copyPath:toDestinationDir:zipped:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i), v23, 0);
        objc_msgSend(v29, "path");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend(v64, "addObject:", v30);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v26);
  }
  v54 = v24;

  objc_msgSend(v64, "componentsJoinedByString:", CFSTR(","));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v20;
  v33 = v32;
  if (a13)
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v32);
    objc_msgSend((id)objc_opt_class(), "internalReleaseAgreement");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendFormat:", CFSTR("\n\n— Photos Release Agreement —\n%@"), v34);

  }
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v63, CFSTR("Title"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v61, CFSTR("Classification"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", CFSTR("Not Applicable"), CFSTR("Reproducibility"));
  if (!a12)
    objc_msgSend(v35, "setObject:forKeyedSubscript:", CFSTR("0"), CFSTR("AutoDiagnostics"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v21, CFSTR("ComponentID"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v62, CFSTR("ComponentName"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v60, CFSTR("ComponentVersion"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, CFSTR("Description"));
  if (objc_msgSend(v31, "length"))
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v31, CFSTR("Attachments"));
  if (v59)
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v59, CFSTR("Keywords"));
  v56 = v21;
  if (objc_msgSend(v57, "count"))
  {
    objc_msgSend(v57, "componentsJoinedByString:", CFSTR(","));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, CFSTR("ExtensionIdentifiers"));

  }
  v53 = v31;
  if (objc_msgSend(v58, "count"))
  {
    objc_msgSend(v58, "valueForKey:", CFSTR("path"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "componentsJoinedByString:", CFSTR(","));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, CFSTR("Screenshot"));

  }
  v52 = v33;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v40 = v35;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v67 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
        v46 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v40, "objectForKeyedSubscript:", v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "queryItemWithName:value:", v45, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v48);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v42);
  }

  objc_msgSend(v51, "setQueryItems:", v39);
  objc_msgSend(v51, "URL");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v55;
  v50 = v65;
  px_dispatch_on_main_queue();

}

+ (id)alertControllerWithPrivacyTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarUtilities.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3448];
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__PXFeedbackTapToRadarUtilities_alertControllerWithPrivacyTitle_message_completion___block_invoke;
  v24[3] = &unk_1E5142658;
  v15 = v11;
  v25 = v15;
  objc_msgSend(v13, "actionWithTitle:style:handler:", CFSTR("Agree"), 0, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v16);

  v17 = (void *)MEMORY[0x1E0DC3448];
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __84__PXFeedbackTapToRadarUtilities_alertControllerWithPrivacyTitle_message_completion___block_invoke_2;
  v22[3] = &unk_1E5142658;
  v23 = v15;
  v18 = v15;
  objc_msgSend(v17, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v19);

  return v12;
}

+ (id)alertControllerWithInternalReleaseAgreementAndCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "internalReleaseAgreement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXFeedbackTapToRadarUtilities alertControllerWithPrivacyTitle:message:completion:](PXFeedbackTapToRadarUtilities, "alertControllerWithPrivacyTitle:message:completion:", CFSTR("Photo Release Agreement"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)presentTermsAndConditionsForUIViewController:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  +[PXFeedbackTapToRadarUtilities alertControllerWithInternalReleaseAgreementAndCompletion:](PXFeedbackTapToRadarUtilities, "alertControllerWithInternalReleaseAgreementAndCompletion:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

+ (id)captureScreenshot
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  UIImage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;
  CGSize v25;

  v24 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarUtilities.m"), 254, CFSTR("expected main thread"));

  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "frame");
  v25.width = v6;
  v25.height = v7;
  UIGraphicsBeginImageContextWithOptions(v25, 1, 0.0);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  UIImagePNGRepresentation(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("Photos-Tap-To-Radar-Screenshot.png"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = objc_msgSend(v9, "writeToURL:options:error:", v12, 1, &v19);
  v14 = v19;
  if ((v13 & 1) == 0)
  {
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Failed to write screenshot to file %@ with error %@", buf, 0x16u);

    }
    v12 = 0;
  }

  return v12;
}

+ (NSString)defaultTitlePrefix
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("AP"), &stru_1E5149688);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MGCopyAnswer();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@: "), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (id)imageFileURLForAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  UIImage *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint8_t buf[8];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarUtilities.m"), 286, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarUtilities.m"), 286, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v21);
  }

LABEL_3:
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("asset-%@.png"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v12, "setDeliveryMode:", 1);
  objc_msgSend(v12, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v12, "setSynchronous:", 1);
  objc_msgSend(v12, "setVersion:", 0);
  objc_msgSend(v12, "setResizeMode:", 1);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__189195;
  v30 = __Block_byref_object_dispose__189196;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __54__PXFeedbackTapToRadarUtilities_imageFileURLForAsset___block_invoke;
  v25[3] = &unk_1E51445D8;
  v25[4] = &v26;
  objc_msgSend(v13, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, 0, v12, v25, 1024.0, 1024.0);

  v14 = (UIImage *)v27[5];
  if (!v14)
  {
    PLUIGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      goto LABEL_9;
    }
LABEL_10:

    v11 = 0;
    goto LABEL_11;
  }
  UIImagePNGRepresentation(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "writeToURL:atomically:", v11, 1);

  if ((v16 & 1) == 0)
  {
    PLUIGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
LABEL_9:
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Failed to save asset original image", buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
  _Block_object_dispose(&v26, 8);

  return v11;
}

+ (id)thumbnailFileURLForAsset:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  NSObject *v27;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarUtilities.m"), 318, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v31, v33);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarUtilities.m"), 318, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v31);
  }

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:includeDerivatives:", v5, 1);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
      if (objc_msgSend(v11, "type") == 102)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v8)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    objc_msgSend(v11, "privateFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_15;
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("thumbnailAsset-%@.%@"), v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "fileExistsAtPath:", v18);

    if (v21)
    {
      v22 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v25 = objc_msgSend(v24, "copyItemAtURL:toURL:error:", v12, v19, &v34);
      v26 = v34;

      if (v25)
      {
        v22 = v19;
      }
      else
      {
        v22 = v12;
        PLUIGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v26;
          _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "Failed to copy asset thumbnail to new location with error: %@", buf, 0xCu);
        }

      }
    }

  }
  else
  {
LABEL_11:

LABEL_15:
    PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v23;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Failed to find asset thumbnail for asset: %@", buf, 0xCu);

    }
    v12 = 0;
    v22 = 0;
  }

  return v22;
}

+ (NSString)defaultDescription
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v2, "appendString:", CFSTR("— Summary —\n"));
  objc_msgSend(v2, "appendString:", CFSTR("Recap the problem title and/or include more descriptive summary information.\n\n"));
  objc_msgSend(v2, "appendString:", CFSTR("— Logging instructions —\n"));
  objc_msgSend(v2, "appendString:", CFSTR("* For UI issues, please include a screenshot and/or screen recording\n"));
  objc_msgSend(v2, "appendString:", CFSTR("* For all other issues, verify that Photos Diagnostics are being captured for this Radar.\n\n"));
  objc_msgSend(v2, "appendString:", CFSTR("— Steps to reproduce —\n"));
  objc_msgSend(v2, "appendString:", CFSTR("0. What device and what build\n"));
  objc_msgSend(v2, "appendString:", CFSTR("1. Setup or prep work\n"));
  objc_msgSend(v2, "appendString:", CFSTR("2. Include explicit and accurate steps to reproduce. Do not include extraneous or irrelevant steps.\n\n"));
  objc_msgSend(v2, "appendString:", CFSTR("— Observed results —\n"));
  objc_msgSend(v2, "appendString:", CFSTR("Describe the results you observed and how they differed from what you expected. Please also indicate the timestamp from when you encountered the issue.\n\n"));
  objc_msgSend(v2, "appendString:", CFSTR("— Regression information —\n"));
  objc_msgSend(v2, "appendString:", CFSTR("Does it reproduce on a public OS release? If so, please provide the OS version.\n"));
  objc_msgSend(v2, "appendString:", CFSTR("Does it reproduce on a previous internal build? If so, please provide the build number.\n\n\n"));
  return (NSString *)v2;
}

+ (id)_tempDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("photosradarfeedback"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v3);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  LOBYTE(v7) = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v15);
  v10 = v15;

  if ((v7 & 1) != 0)
  {
    v11 = v8;
  }
  else
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Failed to create directory at path: %@", buf, 0xCu);

    }
    v11 = 0;
  }

  return v11;
}

+ (id)detailedDebugDescriptionFileForAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarUtilities.m"), 397, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v20, v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarUtilities.m"), 397, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v20);
  }

LABEL_3:
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Asset-Details-Debug-%@.log"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailedDebugDescriptionInLibrary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  LOBYTE(v13) = objc_msgSend(v14, "writeToURL:atomically:encoding:error:", v11, 1, 4, &v23);
  v15 = v23;
  if ((v13 & 1) == 0)
  {
    PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v11;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Failed to save asset details debug file at path: %@, error: %@", buf, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

void __54__PXFeedbackTapToRadarUtilities_imageFileURLForAsset___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __84__PXFeedbackTapToRadarUtilities_alertControllerWithPrivacyTitle_message_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__PXFeedbackTapToRadarUtilities_alertControllerWithPrivacyTitle_message_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __251__PXFeedbackTapToRadarUtilities_fileRadarWithTitle_description_classification_componentID_componentName_componentVersion_keyword_screenshotURLs_attachmentURLs_includeSysDiagnose_includeInternalRelease_additionalExtensionIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70], *(_QWORD *)(a1 + 40));

}

@end
