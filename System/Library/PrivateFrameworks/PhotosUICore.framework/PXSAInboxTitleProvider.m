@implementation PXSAInboxTitleProvider

+ (OS_dispatch_queue)workQueue
{
  if (workQueue_onceToken != -1)
    dispatch_once(&workQueue_onceToken, &__block_literal_global_63137);
  return (OS_dispatch_queue *)(id)workQueue_workQueue;
}

+ (NSDictionary)defaultTitleAttributes
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSDictionary *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (!defaultTitleAttributes_cachedContentSize)
    goto LABEL_4;
  v4 = (id)defaultTitleAttributes_cachedContentSize;
  if (v4 == v3)
  {

    goto LABEL_6;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "isEqualToString:", v3);

  if ((v6 & 1) == 0)
  {
LABEL_4:
    v13[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B08], 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v13[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)defaultTitleAttributes_attributes;
    defaultTitleAttributes_attributes = v9;

    objc_storeStrong((id *)&defaultTitleAttributes_cachedContentSize, v3);
  }
LABEL_6:
  v11 = (NSDictionary *)(id)defaultTitleAttributes_attributes;

  return v11;
}

+ (NSDictionary)emphasizedTitleAttributes
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSDictionary *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (!emphasizedTitleAttributes_cachedContentSize)
    goto LABEL_4;
  v4 = (id)emphasizedTitleAttributes_cachedContentSize;
  if (v4 == v3)
  {

    goto LABEL_6;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "isEqualToString:", v3);

  if ((v6 & 1) == 0)
  {
LABEL_4:
    v13[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B08], 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v13[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)emphasizedTitleAttributes_attributes;
    emphasizedTitleAttributes_attributes = v9;

    objc_storeStrong((id *)&emphasizedTitleAttributes_cachedContentSize, v3);
  }
LABEL_6:
  v11 = (NSDictionary *)(id)emphasizedTitleAttributes_attributes;

  return v11;
}

+ (NSDictionary)supportingTextAttributes
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSDictionary *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (!supportingTextAttributes_cachedContentSize)
    goto LABEL_4;
  v4 = (id)supportingTextAttributes_cachedContentSize;
  if (v4 == v3)
  {

    goto LABEL_6;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "isEqualToString:", v3);

  if ((v6 & 1) == 0)
  {
LABEL_4:
    v13[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B08], 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v13[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)supportingTextAttributes_attributes;
    supportingTextAttributes_attributes = v9;

    objc_storeStrong((id *)&supportingTextAttributes_cachedContentSize, v3);
  }
LABEL_6:
  v11 = (NSDictionary *)(id)supportingTextAttributes_attributes;

  return v11;
}

+ (NSDictionary)defaultSubtitleAttributes
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSDictionary *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (!defaultSubtitleAttributes_cachedContentSize)
    goto LABEL_4;
  v4 = (id)defaultSubtitleAttributes_cachedContentSize;
  if (v4 == v3)
  {

    goto LABEL_6;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "isEqualToString:", v3);

  if ((v6 & 1) == 0)
  {
LABEL_4:
    v13[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AA0], 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v13[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)defaultSubtitleAttributes_attributes;
    defaultSubtitleAttributes_attributes = v9;

    objc_storeStrong((id *)&defaultSubtitleAttributes_cachedContentSize, v3);
  }
LABEL_6:
  v11 = (NSDictionary *)(id)defaultSubtitleAttributes_attributes;

  return v11;
}

+ (void)preloadResources
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PXSAInboxTitleProvider_preloadResources__block_invoke;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  v8[4] = a1;
  objc_msgSend(v3, "scheduleMainQueueTask:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __42__PXSAInboxTitleProvider_preloadResources__block_invoke_2;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v7[4] = a1;
  objc_msgSend(v3, "scheduleMainQueueTask:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __42__PXSAInboxTitleProvider_preloadResources__block_invoke_3;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = a1;
  objc_msgSend(v3, "scheduleMainQueueTask:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __42__PXSAInboxTitleProvider_preloadResources__block_invoke_4;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = a1;
  objc_msgSend(v3, "scheduleMainQueueTask:", v5);

}

void __42__PXSAInboxTitleProvider_preloadResources__block_invoke()
{
  objc_msgSend((id)objc_opt_class(), "defaultTitleAttributes");

}

void __42__PXSAInboxTitleProvider_preloadResources__block_invoke_2()
{
  objc_msgSend((id)objc_opt_class(), "emphasizedTitleAttributes");

}

void __42__PXSAInboxTitleProvider_preloadResources__block_invoke_3()
{
  objc_msgSend((id)objc_opt_class(), "supportingTextAttributes");

}

void __42__PXSAInboxTitleProvider_preloadResources__block_invoke_4()
{
  objc_msgSend((id)objc_opt_class(), "defaultSubtitleAttributes");

}

void __35__PXSAInboxTitleProvider_workQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.PXSAInboxTitleProvider-work", v2);
  v1 = (void *)workQueue_workQueue;
  workQueue_workQueue = (uint64_t)v0;

}

- (void)requestTitleAndSubtitleForModel:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSAInboxTitleProvider.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSAInboxTitleProvider.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("model"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)objc_opt_class(), "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PXSAInboxTitleProvider_requestTitleAndSubtitleForModel_completion___block_invoke;
  block[3] = &unk_1E5145688;
  block[4] = self;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (id)titleForModel:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  PXSAInboxTitleProvider *v8;
  id v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  switch(objc_msgSend(v4, "inboxModelType"))
  {
    case 0:
    case 3:
    case 6:
    case 9:
    case 10:
      PLUIGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        v12 = 134217984;
        v13 = objc_msgSend(v4, "inboxModelType");
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_FAULT, "Unsupported inbox model asked for title: %ld", (uint8_t *)&v12, 0xCu);
      }

      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E5149688);
      goto LABEL_12;
    case 1:
      -[PXSAInboxTitleProvider _titleForCommentWithSectionInfo:](self, "_titleForCommentWithSectionInfo:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2:
      -[PXSAInboxTitleProvider _titleForLikeWithSectionInfo:](self, "_titleForLikeWithSectionInfo:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4:
      v8 = self;
      v9 = v4;
      v10 = 1;
      goto LABEL_11;
    case 5:
      v8 = self;
      v9 = v4;
      v10 = 0;
LABEL_11:
      -[PXSAInboxTitleProvider _titleForInvitationResponseWithSectionInfo:accepted:](v8, "_titleForInvitationResponseWithSectionInfo:accepted:", v9, v10);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 7:
    case 8:
      -[PXSAInboxTitleProvider _titleForCoalescedWithSectionInfo:](self, "_titleForCoalescedWithSectionInfo:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v7 = (void *)v6;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)subtitleForModel:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXActivityUtilities textForDate:](PXActivityUtilities, "textForDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend((id)objc_opt_class(), "defaultSubtitleAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:attributes:", v4, v6);

  return v7;
}

- (id)_titleForCommentWithSectionInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "senderNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E5149688;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v3, "inboxModelTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend((id)objc_opt_class(), "defaultTitleAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "emphasizedTitleAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_localizedAttributedStringForCommentWithCommenterFullName:text:defaultTextAttributes:emphasizedTextAttributes:", v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_titleForLikeWithSectionInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint8_t buf[8];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;

  v3 = a3;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__63157;
  v35 = __Block_byref_object_dispose__63158;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__63157;
  v29 = __Block_byref_object_dispose__63158;
  v30 = 0;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__PXSAInboxTitleProvider__titleForLikeWithSectionInfo___block_invoke;
  v16[3] = &unk_1E511EF08;
  v5 = v3;
  v17 = v5;
  v18 = &v31;
  v19 = &v53;
  v20 = &v37;
  v21 = &v45;
  v22 = &v41;
  v23 = &v25;
  v24 = &v49;
  objc_msgSend(v4, "performBlockAndWait:", v16);

  objc_msgSend((id)objc_opt_class(), "supportingTextAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "emphasizedTitleAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultTitleAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v54[3];
  if (v9)
  {
    if (v9 > 1)
    {
      if (v50[3] > 1)
      {
        PLUIGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "Unable to title shared album activity with multiple assets and multiple people", buf, 2u);
        }
        v10 = 0;
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0CB3498];
        v12 = *((unsigned __int8 *)v38 + 24);
        objc_msgSend((id)v32[5], "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "px_localizedAttributedStringForLikesFromUser:orPersonFullName:photoCount:videoCount:streamName:defaultTextAttributes:emphasizedTextAttributes:italicizedTextAttributes:", v12 != 0, v13, v46[3], v42[3], v26[5], v6, v7, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if ((unint64_t)v50[3] < 4)
        objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForLikesFromUser:otherPeopleFullNames:isVideo:defaultTextAttributes:emphasizedTextAttributes:", *((unsigned __int8 *)v38 + 24), v32[5], v42[3] > 0, v6, v7);
      else
        objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForLikesWithLikerCount:isVideo:defaultTextAttributes:emphasizedTextAttributes:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v10;
}

- (id)_titleForCoalescedWithSectionInfo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;

  v3 = (void *)MEMORY[0x1E0C99E40];
  v4 = a3;
  objc_msgSend(v4, "senderNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = 0;
  objc_msgSend(v4, "getCommentCount:likeCount:", &v17, &v16);
  v7 = objc_msgSend(v4, "isMine");

  v9 = v16;
  v8 = v17;
  v10 = objc_msgSend(v6, "count");
  objc_msgSend((id)objc_opt_class(), "supportingTextAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "emphasizedTitleAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v8)
  {
    if (v10 < 4)
      objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForInboxCoalescedLikesAndCommentsFromUser:otherPeopleFullNames:defaultTextAttributes:emphasizedTextAttributes:", v7, v6, v11, v12);
    else
      objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForInboxCoalescedLikesAndCommentsWithCommenterCount:defaultTextAttributes:emphasizedTextAttributes:", v10, v11, v12);
  }
  else if (v10 < 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForInboxCoalescedCommentsFromUser:otherPeopleFullNames:defaultTextAttributes:emphasizedTextAttributes:", v7, v6, v11, v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForInboxCoalescedCommentsWithCommenterCount:defaultTextAttributes:emphasizedTextAttributes:", v10, v11, v12);
  }
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;

  return v14;
}

- (id)_titleForInvitationResponseWithSectionInfo:(id)a3 accepted:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a4;
  v5 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__63157;
  v30 = __Block_byref_object_dispose__63158;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__63157;
  v24 = __Block_byref_object_dispose__63158;
  v25 = 0;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__PXSAInboxTitleProvider__titleForInvitationResponseWithSectionInfo_accepted___block_invoke;
  v16[3] = &unk_1E51401A8;
  v7 = v5;
  v17 = v7;
  v18 = &v20;
  v19 = &v26;
  objc_msgSend(v6, "performBlockAndWait:", v16);

  v8 = (void *)MEMORY[0x1E0CB3498];
  v9 = v27[5];
  v10 = v21[5];
  objc_msgSend((id)objc_opt_class(), "supportingTextAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "emphasizedTitleAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultTitleAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:streamName:accepted:defaultTextAttributes:emphasizedTextAttributes:streamNameAttributes:", v9, v10, v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __78__PXSAInboxTitleProvider__titleForInvitationResponseWithSectionInfo_accepted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "sharedAlbum");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedTitle");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "invitationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inviteeDisplayNameIncludingEmail:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __55__PXSAInboxTitleProvider__titleForLikeWithSectionInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "likesForItemAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(*(id *)(a1 + 32), "senderNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "assetsCount");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v2, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = a1 + 64;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  v9 = (_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 72);
  v10 = a1 + 72;
  *(_QWORD *)(*(_QWORD *)(v11 + 8) + 24) = 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v2;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v17, "isMyComment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "BOOLValue");

        if (v19)
          *(_BYTE *)(*(_QWORD *)(v9[7] + 8) + 24) = 1;
        objc_msgSend(v17, "asset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 && (objc_msgSend(v8, "containsObject:", v20) & 1) == 0)
        {
          objc_msgSend(v8, "addObject:", v20);
          v21 = objc_msgSend(v20, "isVideo");
          v22 = v28;
          if (v21)
            v22 = v10;
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v22 + 8) + 24);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

  objc_msgSend(v8, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cloudShareAlbum");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedTitle");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(v9[10] + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

  *(_QWORD *)(*(_QWORD *)(v9[11] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(v9[5] + 8) + 40), "count")
                                                + *(unsigned __int8 *)(*(_QWORD *)(v9[7] + 8) + 24);

}

void __69__PXSAInboxTitleProvider_requestTitleAndSubtitleForModel_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "titleForModel:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subtitleForModel:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(id *)(a1 + 48);
  v6 = v2;
  v4 = v3;
  v5 = v2;
  px_dispatch_on_main_queue();

}

uint64_t __69__PXSAInboxTitleProvider_requestTitleAndSubtitleForModel_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
