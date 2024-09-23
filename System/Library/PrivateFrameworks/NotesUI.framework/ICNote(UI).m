@implementation ICNote(UI)

- (id)folderSystemImageName
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "folder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "systemImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D63B10], "defaultSystemImageName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)noteWillReleaseTextStorage
{
  id v2;

  objc_msgSend(a1, "textStorageWithoutCreating");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsZombie:", 1);
  objc_msgSend(a1, "discardCalculateDocumentController");

}

- (void)noteDidReplaceDocument
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "textStorageWithoutCreating");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "documentWithoutCreating");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v2)
    {
      objc_msgSend(v4, "document");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3 != v2)
        objc_msgSend(v4, "replaceWithDocument:", v2);
    }
  }

}

- (id)textStorage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "textContentStorageCreateIfNeeded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (ICTTTextContentStorage)textContentStorageCreateIfNeeded
{
  void *v2;
  ICTTTextContentStorage *v3;
  void *v4;
  ICTTTextStorage *v5;
  ICTTTextContentStorage *v6;
  void *v7;
  ICTTTextContentStorage *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "textContentStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[ICTTTextStorage initWithDocument:]([ICTTTextStorage alloc], "initWithDocument:", v4);
      -[ICTTTextStorage setDelegate:](v5, "setDelegate:", a1);
      v6 = [ICTTTextContentStorage alloc];
      objc_msgSend(a1, "outlineState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[ICTTTextContentStorage initWithTextStorage:outlineState:](v6, "initWithTextStorage:outlineState:", v5, v7);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "ICOutlineControllerCollapsedStateDidChange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel_outlineControllerCollapsedStateDidChange_, v10, 0);

      objc_msgSend(a1, "setReservedForTextContentStorage:", v8);
      v3 = v8;

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)textStorageWithoutCreating
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "textContentStorage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)textContentStorage
{
  void *v2;
  void *v3;

  objc_opt_class();
  objc_msgSend(a1, "reservedForTextContentStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)noteWillTurnIntoFault
{
  uint64_t result;

  result = objc_msgSend(a1, "shouldReleaseTextStorageWhenTurningIntoFault");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "setReservedForTextContentStorage:", 0);
    return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel_save, 0);
  }
  return result;
}

- (BOOL)shouldReleaseTextStorageWhenTurningIntoFault
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "documentWithoutCreating");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && !objc_msgSend(a1, "shouldReleaseDocumentWhenTurningIntoFault"))
    return 0;
  objc_msgSend(a1, "textStorageWithoutCreating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (ICInternalSettingsIsTextKit2Enabled())
    objc_msgSend(v3, "textLayoutManagers");
  else
    objc_msgSend(v3, "layoutManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v4 = v6 == 0;
  return v4;
}

- (uint64_t)updateThumbnailAttachmentIdentifier
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  objc_msgSend(a1, "thumbnailAttachmentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 || (objc_msgSend(a1, "isPasswordProtected") & 1) != 0)
  {

  }
  else if ((objc_msgSend(a1, "isDeletedOrInTrash") & 1) == 0)
  {
    objc_msgSend(a1, "attachments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsPassingTest:", &__block_literal_global_214);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__20;
      v17 = __Block_byref_object_dispose__20;
      v18 = 0;
      objc_msgSend(a1, "textStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");
      v9 = *MEMORY[0x1E0DC10F8];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __49__ICNote_UI__updateThumbnailAttachmentIdentifier__block_invoke_215;
      v12[3] = &unk_1E5C1F360;
      v12[4] = a1;
      v12[5] = &v13;
      objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v12);
      if (v14[5])
      {
        objc_msgSend(a1, "thumbnailAttachmentIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v14[5]);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(a1, "setThumbnailAttachmentIdentifier:", v14[5]);

          _Block_object_dispose(&v13, 8);
          return 1;
        }
      }

      _Block_object_dispose(&v13, 8);
    }
  }
  return 0;
}

- (void)updatePKDrawingsWithHandwritingRecognitionEnabled:()UI
{
  _QWORD v3[5];
  char v4;
  _QWORD v5[3];
  char v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__ICNote_UI__updatePKDrawingsWithHandwritingRecognitionEnabled___block_invoke;
  v3[3] = &unk_1E5C1F4C8;
  v4 = a3;
  v3[4] = v5;
  objc_msgSend(a1, "enumerateAttachmentsInOrderUsingBlock:", v3);
  _Block_object_dispose(v5, 8);
}

- (void)textStorage:()UI willProcessEditing:range:changeInLength:
{
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0CB37D0];
  v13 = a3;
  objc_msgSend(v12, "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("kICTTEditedRangeNotificationKey");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a5, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  v21[1] = CFSTR("kICTTChangeInLengthNotificationKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("kICTTEditedMaskNotificationKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("ICTTTextStorageWillProcessEditingNotification"), v13, v18);

  objc_msgSend(a1, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__ICNote_UI__textStorage_willProcessEditing_range_changeInLength___block_invoke;
  v20[3] = &unk_1E5C1D540;
  v20[4] = a1;
  objc_msgSend(v19, "performBlockAndWait:", v20);

}

- (void)textStorage:()UI didProcessEditing:range:changeInLength:
{
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v12 = a3;
  objc_msgSend(a1, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__ICNote_UI__textStorage_didProcessEditing_range_changeInLength___block_invoke;
  v15[3] = &unk_1E5C1F450;
  v15[4] = a1;
  v16 = v12;
  v17 = a5;
  v18 = a6;
  v19 = a4;
  v20 = a7;
  v14 = v12;
  objc_msgSend(v13, "performBlockAndWait:", v15);

}

- (void)setHandwritingRecognitionEnabled:()UI .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v3, v4, "Setting handwriting recognition %@ for %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (uint64_t)setHandwritingRecognitionEnabled:()UI
{
  uint64_t result;
  NSObject *v6;
  const void *v7;
  void *v8;

  result = objc_msgSend(a1, "isHandwritingRecognitionEnabled");
  if ((_DWORD)result != (_DWORD)a3)
  {
    v6 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICNote(UI) setHandwritingRecognitionEnabled:].cold.1(a3, a1);

    v7 = (const void *)kICHandwritingRecognitionEnabledKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, v7, v8, (void *)1);

    return objc_msgSend(a1, "updatePKDrawingsWithHandwritingRecognitionEnabled:", a3);
  }
  return result;
}

- (uint64_t)isHandwritingRecognitionEnabled
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)kICHandwritingRecognitionEnabledKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)filterAttachmentsInTextStorage:()UI range:
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[5];

  v8 = a3;
  objc_msgSend(a1, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke;
  v26[3] = &unk_1E5C1D540;
  v26[4] = a1;
  objc_msgSend(v9, "performBlockAndWait:", v26);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_opt_class();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginSkippingTimestampUpdates");

  v12 = *MEMORY[0x1E0DC10F8];
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_2;
  v19[3] = &unk_1E5C1F428;
  v19[4] = a1;
  v13 = v8;
  v20 = v13;
  v21 = &v22;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v12, a4, a5, 0, v19);
  objc_opt_class();
  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endSkippingTimestampUpdates");

  if (*((_BYTE *)v23 + 24))
  {
    v15 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ICNote(UI) filterAttachmentsInTextStorage:range:].cold.1(v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", *MEMORY[0x1E0D63790], a1);

  }
  objc_msgSend(a1, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_236;
  v18[3] = &unk_1E5C1D540;
  v18[4] = a1;
  objc_msgSend(v17, "performBlockAndWait:", v18);

  _Block_object_dispose(&v22, 8);
}

- (ICDocumentMergeController)documentMergeController
{
  ICDocumentMergeController *v2;
  ICDocumentMergeController *v3;

  objc_getAssociatedObject(a1, &documentMergeController_documentMergeControllerHandle);
  v2 = (ICDocumentMergeController *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(ICDocumentMergeController);
    objc_setAssociatedObject(a1, &documentMergeController_documentMergeControllerHandle, v2, (void *)1);
  }
  v3 = v2;

  return v3;
}

- (id)checklistStyleAccessibilityDescriptionForRange:()UI
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v4 = a4;
  v5 = a3;
  v7 = a3 + a4;
  objc_msgSend(a1, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7 > v9)
    return 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (!v4)
  {
    objc_msgSend(a1, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v12, "paragraphRangeForRange:", v5, 0);
    v4 = v13;

  }
  objc_msgSend(a1, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D63928];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__ICNote_UI__checklistStyleAccessibilityDescriptionForRange___block_invoke;
  v19[3] = &unk_1E5C1F4A0;
  v19[4] = &v24;
  v19[5] = &v20;
  objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, v5, v4, 0, v19);

  if (*((_BYTE *)v21 + 24))
    v16 = CFSTR("Mixed");
  else
    v16 = CFSTR("On");
  if (*((_BYTE *)v25 + 24))
    v17 = v16;
  else
    v17 = CFSTR("Off");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v17, v17, 0, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v18;
}

- (id)attachmentFromObject:()UI createIfNecessary:
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  UIImage *v47;
  void *v48;
  void *v49;

  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isInlineAttachment:", v6))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v6, "attachment"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)v7;
    }
    else
    {
      if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EECADDB0))
      {
        objc_msgSend(a1, "inlineAttachmentWithICTTAttachment:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      v10 = 0;
      if (v8 || !a4)
        goto LABEL_34;
      v13 = v6;
      v14 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ICNote(UI) attachmentFromObject:createIfNecessary:].cold.3((uint64_t)v13, a1);

      objc_msgSend(v13, "attachmentIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        objc_msgSend(a1, "addInlineAttachmentWithIdentifier:", v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setNeedsInitialFetchFromCloud:", 1);
        objc_msgSend(v13, "attachmentUTI");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTypeUTI:", v16);

        objc_msgSend(v8, "typeUTI");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v18 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[ICNote(UI) attachmentFromObject:createIfNecessary:].cold.2((uint64_t)v13, a1);

          objc_msgSend(v8, "setTypeUTI:", *MEMORY[0x1E0D63870]);
        }
      }
      else
      {
        v22 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[ICNote(UI) attachmentFromObject:createIfNecessary:].cold.1((uint64_t)v13, a1);

        v8 = 0;
      }

    }
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_updateTextViewToPaperIfNecessary");
      v9 = v6;
      objc_msgSend(v9, "attachment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10 && a4)
      {
        objc_msgSend(a1, "attachmentFromSystemPaperAttachment:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_16;
    }
    objc_opt_class();
    ICDynamicCast();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "ic_isSystemTextAttachment");

    if (v20)
    {
      v21 = v6;
      goto LABEL_44;
    }
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EECADDB0))
    {
      v9 = v6;
      objc_msgSend(v9, "attachmentIdentifier");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26
        && (v27 = (void *)v26,
            objc_msgSend(v9, "attachmentUTI"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v28,
            v27,
            v28))
      {
        objc_msgSend(v9, "attachmentIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "attachmentWithIdentifier:", v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
LABEL_53:
          objc_msgSend(v9, "attachmentUTI");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTypeUTI:", v34);

          objc_msgSend(v10, "typeUTI");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0D636B0]);

          if (v36)
            objc_msgSend(a1, "_updateTextViewToPaperIfNecessary");
          objc_msgSend(v10, "typeUTI");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
            goto LABEL_16;
          objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTypeUTI:", v12);
          goto LABEL_9;
        }
        if (a4)
        {
          v30 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            -[ICNote(UI) attachmentFromObject:createIfNecessary:].cold.5();

          objc_msgSend(v9, "attachmentIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "addAttachmentWithIdentifier:", v31);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setModificationDate:", v32);

          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setCreationDate:", v33);

          objc_msgSend(v10, "setNeedsInitialFetchFromCloud:", 1);
          goto LABEL_53;
        }
      }
      else
      {
        v41 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[ICNote(UI) attachmentFromObject:createIfNecessary:].cold.4();

        objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 20);
      }

    }
    else if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !+[ICTextAttachment textAttachmentIsContent:](ICTextAttachment, "textAttachmentIsContent:", v6))
      {
        v8 = 0;
LABEL_33:
        v10 = 0;
        goto LABEL_34;
      }
      v9 = v6;
      objc_msgSend(v9, "fileType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqualToString:", *MEMORY[0x1E0D636B8]);

      if (v39)
      {
        objc_msgSend(v9, "contents");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "attachmentFromTableData:", v12);
        v40 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v9, "image");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v43 = (void *)MEMORY[0x1E0CEC3F8];
          objc_msgSend(v9, "image");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "typeWithIdentifier:", CGImageGetUTType((CGImageRef)objc_msgSend(v44, "ic_CGImage")));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "conformsToType:", *MEMORY[0x1E0CEC530]);

          if (v46)
          {
            objc_msgSend(v9, "image");
            v47 = (UIImage *)objc_claimAutoreleasedReturnValue();
            UIImageJPEGRepresentation(v47, 1.0);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", v48);
            objc_msgSend(v49, "setPreferredFilename:", CFSTR("Attachment.jpeg"));
            objc_msgSend(v9, "setFileWrapper:", v49);

          }
        }
        objc_msgSend(v9, "fileWrapper");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "attachmentFromLegacyAttachmentFileWrapper:", v12);
          v40 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "attachmentFromRemoteFileWrapper:", v12);
            v40 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 && !v12)
            {
              v10 = 0;
              goto LABEL_9;
            }
            objc_msgSend(a1, "attachmentFromStandardFileWrapper:", v12);
            v40 = objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v10 = (void *)v40;
      goto LABEL_9;
    }
    v21 = 0;
    goto LABEL_44;
  }
  v9 = v6;
  objc_msgSend(v9, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || !a4)
    goto LABEL_16;
  objc_msgSend(a1, "attachmentFromInlineDrawingAttachment:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v10, "attachmentModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setHandwritingRecognitionEnabled:", objc_msgSend(a1, "isHandwritingRecognitionEnabled"));
LABEL_9:

LABEL_16:
  v8 = 0;
LABEL_34:
  if (v8)
    v23 = v8;
  else
    v23 = v10;
  v21 = v23;
  objc_msgSend(v21, "note");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24 != a1)
    objc_msgSend(v21, "setNote:", a1);
  if (v8)
  {
    objc_msgSend(a1, "addInlineAttachmentsObject:", v8);
  }
  else if (v10)
  {
    objc_msgSend(a1, "addAttachmentsObject:", v10);
  }

LABEL_44:
  return v21;
}

- (uint64_t)isFastSyncSessionActive
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)kICIsFastSyncSessionActive);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIsFastSyncSessionActive:()UI
{
  NSObject *v5;
  const void *v6;
  void *v7;

  if (objc_msgSend(a1, "isFastSyncSessionActive") != (_DWORD)a3)
  {
    v5 = os_log_create("com.apple.notes", "RealtimeCollaboration");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICNote(UI) setIsFastSyncSessionActive:].cold.1(a3, a1);

    v6 = (const void *)kICIsFastSyncSessionActive;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, v6, v7, (void *)3);

  }
}

- (uint64_t)noteDidClearDecryptedData
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(a1, "textStorageWithoutCreating");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "styler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "textStorageWithoutCreating");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setNote:", 0);
  }
  return objc_msgSend(a1, "setReservedForTextContentStorage:", 0);
}

- (void)noteWillMergeDocumentWithUserInfo:()UI
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a1, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("BeforeMergeTimestamp"));
  objc_msgSend(a1, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "savedSelectionWithSelectionAffinity:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("SavedSelections"));
  objc_msgSend(a1, "notifyTextViewsNoteWillMerge");

}

- (id)rangesModifiedAfterTimestamp:()UI inTextStorage:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mergeableString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__ICNote_UI__rangesModifiedAfterTimestamp_inTextStorage___block_invoke;
  v13[3] = &unk_1E5C1F1F0;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateHighlightableRangesModifiedAfter:includingAttributes:usingBlock:", v7, 1, v13);

  v11 = (void *)objc_msgSend(v10, "copy");
  return v11;
}

- (void)noteDidMergeNoteDocumentWithUserInfo:()UI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SavedSelections"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "restoreSelection:", v19);

  objc_msgSend(a1, "notifyTextViewsNoteDidMerge");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BeforeMergeTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rangesModifiedAfterTimestamp:inTextStorage:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_opt_class();
    objc_msgSend(a1, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "styler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "authorHighlightsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "ic_range");
    v16 = v15;
    objc_msgSend(a1, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__ICNote_UI__noteDidMergeNoteDocumentWithUserInfo___block_invoke;
    v20[3] = &unk_1E5C1F218;
    v21 = v8;
    v22 = v11;
    v23 = a1;
    v18 = v11;
    objc_msgSend(v12, "performHighlightUpdatesForRange:inTextStorage:updates:", v14, v16, v17, v20);

  }
  objc_msgSend(a1, "announceAccessibilitySelectionChangedByMergeWithSavedSelections:beforeMergeTimestamp:", v19, v6);
  objc_msgSend(a1, "applyOutlineState");

}

- (ICCollaborationColorManager)collaborationColorManager
{
  void *v2;
  ICCollaborationColorManager *v3;

  objc_opt_class();
  objc_msgSend(a1, "reservedForCollaborationColorManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = (ICCollaborationColorManager *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v3 = objc_alloc_init(ICCollaborationColorManager);
    objc_msgSend(a1, "setReservedForCollaborationColorManager:", v3);
  }
  return v3;
}

- (uint64_t)ic_hasLightBackground
{
  char v2;

  v2 = objc_msgSend(MEMORY[0x1E0DC3E88], "ic_alwaysShowLightContent");
  if ((objc_msgSend(a1, "prefersLightBackground") & 1) != 0 || (v2 & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0D641E0], "deviceIsVision");
}

- (uint64_t)hasMentionForParticipant:()UI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v4, "ic_userRecordNameInNote:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BB0], "allUserRecordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__ICNote_UI__hasMentionForParticipant___block_invoke;
  v15[3] = &unk_1E5C1F240;
  v11 = v5;
  v16 = v11;
  v12 = v6;
  v17 = v12;
  v18 = &v19;
  objc_msgSend(v7, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v8, 0, v10, 0, v15);

  v13 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)formatExpressionsInAttributedString:()UI range:textStorageOffset:skipStaleExpressions:
{
  id v12;
  id v13;

  v12 = a3;
  objc_msgSend(a1, "calculateDocumentController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v12, a4, a5, a6, a7);

}

- (void)outlineControllerCollapsedStateDidChange:()UI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textStorageWithoutCreating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(a1, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__ICNote_UI__outlineControllerCollapsedStateDidChange___block_invoke;
    v13[3] = &unk_1E5C1D540;
    v13[4] = a1;
    objc_msgSend(v11, "performBlockAndWait:", v13);

  }
}

- (ICCalculateDocumentController)calculateDocumentController
{
  void *v2;
  uint64_t v3;
  ICCalculateDocumentController *v4;
  ICCalculateDocumentController *v5;

  if (ICInternalSettingsIsMathEnabled()
    && (objc_msgSend(a1, "managedObjectContext"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "concurrencyType"),
        v2,
        v3 == 2))
  {
    objc_getAssociatedObject(a1, &calculateDocumentControllerHandle);
    v4 = (ICCalculateDocumentController *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = -[ICCalculateDocumentController initWithNote:]([ICCalculateDocumentController alloc], "initWithNote:", a1);
      objc_setAssociatedObject(a1, &calculateDocumentControllerHandle, v4, (void *)1);
    }
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)discardCalculateDocumentController
{
  objc_setAssociatedObject(a1, &calculateDocumentControllerHandle, 0, (void *)1);
}

- (id)calculatePreviewBehaviorUserDefaultsKey
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_calculatePreviewBehavior);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@--%@"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)calculatePreviewBehavior
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calculatePreviewBehaviorUserDefaultsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "integerForKey:", v3);

  return v4;
}

- (void)setCalculatePreviewBehavior:()UI
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calculatePreviewBehaviorUserDefaultsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", a3, v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICNoteDidChangeCalculatePreviewBehavior"), a1);

}

- (BOOL)isCalculateMathEnabled
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "deviceManagementRestrictionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isMathPaperSolvingAllowed"))
  {
    objc_msgSend(a1, "deviceManagementRestrictionsManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isKeyboardMathSolvingAllowed"))
      v4 = objc_msgSend(a1, "calculatePreviewBehavior") != 1;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)primaryWritingDirection
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "textStorage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "layoutWritingDirection");
  else
    v3 = -1;

  return v3;
}

- (id)noteActivityItemsForSharingWithNoteExporter:()UI
{
  void *v3;
  ICNoteTopoTextActivityItemSource *v4;
  ICNoteStringActivityItemSource *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  ICNoteHTMLActivityItemSource *v12;
  ICNoteRTFDActivityItemSource *v13;
  void *v14;
  ICNoteTopoTextActivityItemSource *v16;
  ICNoteStringActivityItemSource *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  id location;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICNoteTopoTextActivityItemSource initWithNote:]([ICNoteTopoTextActivityItemSource alloc], "initWithNote:", a1);
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v16 = v4;
  objc_initWeak(&location, a1);
  v5 = [ICNoteStringActivityItemSource alloc];
  objc_msgSend(a1, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__ICNote_UI__noteActivityItemsForSharingWithNoteExporter___block_invoke;
  v24[3] = &unk_1E5C1F268;
  objc_copyWeak(&v25, &location);
  v24[4] = a1;
  v17 = -[ICNoteStringActivityItemSource initWithTitle:attributedStringCreator:](v5, "initWithTitle:attributedStringCreator:", v6, v24);

  if (v17)
    objc_msgSend(v3, "addObject:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "attachmentActivityItemsForSharing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v11 = -[ICFilterAttachmentActivityItemSource initAttachmentItem:]([ICFilterAttachmentActivityItemSource alloc], "initAttachmentItem:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        if (v11)
          objc_msgSend(v3, "addObject:", v11);
        else
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "filterAttachmentActivityItemSource", "-[ICNote(UI) noteActivityItemsForSharingWithNoteExporter:]", 1, 0, CFSTR("Failed to create filter attachment activity item source"));

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v8);
  }

  v12 = -[ICNoteHTMLActivityItemSource initWithNote:]([ICNoteHTMLActivityItemSource alloc], "initWithNote:", a1);
  objc_msgSend(v3, "addObject:", v12);
  if (v18)
  {
    v13 = -[ICNoteRTFDActivityItemSource initWithNote:noteExporter:]([ICNoteRTFDActivityItemSource alloc], "initWithNote:noteExporter:", a1, v18);
    objc_msgSend(v3, "addObject:", v13);

  }
  v14 = (void *)objc_msgSend(v3, "copy");

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v14;
}

- (ICAirDropNoteActivityItemSource)airDropActivityItemSource
{
  ICAirDropNoteActivityItemSource *v2;
  void *v3;
  ICAirDropNoteActivityItemSource *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, val);
  v2 = [ICAirDropNoteActivityItemSource alloc];
  objc_msgSend(val, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__ICNote_UI__airDropActivityItemSource__block_invoke;
  v6[3] = &unk_1E5C1F290;
  objc_copyWeak(&v7, &location);
  v4 = -[ICAirDropNoteActivityItemSource initWithTitle:airDropDocumentCreator:](v2, "initWithTitle:airDropDocumentCreator:", v3, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)attachmentActivityItemsForSharing
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachmentActivityItemsForSharingForRange:", 0, objc_msgSend(v2, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attachmentActivityItemsForSharingForRange:()UI
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__ICNote_UI__attachmentActivityItemsForSharingForRange___block_invoke;
  v11[3] = &unk_1E5C1F2B8;
  v13 = a3;
  v14 = a4;
  v12 = v7;
  v8 = v7;
  objc_msgSend(a1, "enumerateAttachmentsInOrderUsingBlock:", v11);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

+ (id)newNoteWithAttributedString:()UI inFolder:error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ICTextController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v7 = a3;
  v8 = a4;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((folder) != nil)", "+[ICNote(UI) newNoteWithAttributedString:inFolder:error:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "folder");
  v9 = (void *)objc_msgSend(MEMORY[0x1E0D63BB8], "newEmptyNoteInFolder:", v8);
  if (objc_msgSend(v9, "appendAttributedString:options:error:", v7, 3, a5))
  {
    objc_msgSend(v9, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "styler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v12 = (ICTextController *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(ICTextController);
      objc_msgSend(v9, "textStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setStyler:", v12);

    }
    objc_msgSend(v9, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "beginEditing");

    objc_msgSend(v9, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "paragraphRangeForRange:", 0, 0);
    v19 = v18;

    objc_msgSend(v9, "textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = -[ICTextController paragraphStyleForRange:inTextView:inTextStorage:](v12, "paragraphStyleForRange:inTextView:inTextStorage:", v17, v19, 0, v20);

    v21 = +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle");
    if ((_DWORD)v16 == 3)
    {
      v22 = v21;
      if ((_DWORD)v21 != 3)
      {
        objc_msgSend(v9, "textStorage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTextController setTextStyle:range:inTextStorage:inTextView:](v12, "setTextStyle:range:inTextStorage:inTextView:", v22, v17, v19, v23, 0);

      }
    }
    objc_msgSend(v9, "textStorage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "endEditing");

    objc_msgSend(v9, "textStorage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fixupAfterEditing");

    objc_msgSend(v9, "textStorage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "styler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27 != v11)
    {
      objc_msgSend(v9, "textStorage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setStyler:", v11);

    }
    objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Created note from string"));
    v29 = v9;

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (id)newNoteWithString:()UI inFolder:error:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((folder) != nil)", "+[ICNote(UI) newNoteWithString:inFolder:error:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "folder");
  v9 = (void *)objc_msgSend(MEMORY[0x1E0D63BB8], "newEmptyNoteInFolder:", v8);
  objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Created note from string"));
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x1E0D63928]);

  v12 = objc_msgSend(v7, "paragraphRangeForRange:", 0, 0);
  v14 = v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
  objc_msgSend(v15, "setAttributes:range:", v10, v12, v14);
  v16 = objc_msgSend(v9, "appendAttributedString:error:", v15, a5);
  v17 = 0;
  if (v16)
    v17 = v9;

  return v17;
}

- (uint64_t)appendAttributedString:()UI error:
{
  return objc_msgSend(a1, "appendAttributedString:options:error:", a3, 0, a4);
}

- (uint64_t)appendAttributedString:()UI options:error:
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  ICTextController *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ICTextController *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "allowsNewTextLength:", objc_msgSend(v8, "length") + objc_msgSend(v9, "length"));

  if ((v10 & 1) != 0)
  {
    objc_msgSend(a1, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "styler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = 0;
    }
    else
    {
      v13 = objc_alloc_init(ICTextController);
      objc_msgSend(a1, "textStorage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setStyler:", v13);

    }
    objc_msgSend(a1, "textStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __51__ICNote_UI__appendAttributedString_options_error___block_invoke;
    v28[3] = &unk_1E5C1D9A8;
    v28[4] = a1;
    v29 = v8;
    objc_msgSend(v18, "editWithAttributeOptions:usingBlock:", a4, v28);

    objc_msgSend(a1, "textStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fixupAfterEditing");

    if (v13)
    {
      objc_msgSend(a1, "textStorage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "styler");
      v21 = (ICTextController *)objc_claimAutoreleasedReturnValue();

      if (v21 == v13)
      {
        objc_msgSend(a1, "textStorage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setStyler:", 0);

      }
    }
    objc_msgSend(a1, "updateModificationDateAndChangeCount");
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v16 = objc_msgSend(v23, "save:", &v27);
    v24 = v27;

    if ((v16 & 1) == 0)
    {
      if (a5)
      {
        *a5 = objc_retainAutorelease(v24);
      }
      else
      {
        v25 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[ICNote(UI) appendAttributedString:options:error:].cold.1();

      }
    }

    goto LABEL_18;
  }
  if (a5)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D63F58];
    v30 = *MEMORY[0x1E0D63F70];
    v31[0] = CFSTR("Note length exceeded.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v13 = (ICTextController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 204, v13);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (id)attributedStringForUTI:()UI inRange:
{
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  ICTextController *v13;
  id v14;
  void *v15;
  void *v16;
  ICTextController *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = objc_msgSend(v8, "conformsToType:", *MEMORY[0x1E0CEC590]);
  objc_msgSend(a1, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((v9 & 1) != 0)
    {
      v12 = 0;
      v13 = 0;
    }
    else
    {
      objc_msgSend(v10, "styler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      ICDynamicCast();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        v17 = v15;
      else
        v17 = objc_alloc_init(ICTextController);
      v13 = v17;

      objc_msgSend(v11, "setStyler:", v13);
      -[ICTTTextController styleText:inRange:fixModelAttributes:](v13, "styleText:inRange:fixModelAttributes:", v11, a4, a5, 0);
    }
    objc_msgSend(v8, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredAttributedStringForUTI:range:", v18, a4, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v11, "styler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 != v12)
        objc_msgSend(v11, "setStyler:", v12);
    }
    v14 = v19;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)preventLockReason
{
  void *v2;
  int v3;

  objc_msgSend(a1, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canPasswordProtectNotes");

  if (!v3)
    return 6;
  if ((objc_msgSend(a1, "isSystemPaper") & 1) != 0)
    return 4;
  if ((objc_msgSend(a1, "isSharedViaICloud") & 1) != 0)
    return 5;
  if ((objc_msgSend(a1, "hasTags") & 1) != 0)
    return 3;
  if (objc_msgSend(a1, "containsAttachmentsUnsupportedInPasswordProtection"))
    return 2;
  return 0;
}

+ (id)duplicateNote:()UI isPasswordProtected:removeOriginalNote:
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v8 = a3;
  objc_msgSend(v8, "folder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:", v8, v9, a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ICNote(UI) duplicateNote:isPasswordProtected:removeOriginalNote:].cold.1(v8);

    v10 = 0;
  }

  return v10;
}

+ (NSObject)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = os_log_create("com.apple.notes", "Move");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "shortLoggingDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortLoggingDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138413570;
    v43 = v12;
    v44 = 2112;
    v45 = v13;
    v46 = 2112;
    v47 = v14;
    v48 = 2112;
    v50 = 2080;
    v49 = v15;
    v51 = "+[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:]";
    v52 = 1024;
    v53 = 746;
    _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "Duplicating note… {originalNote: %@, folder: %@, isPasswordProtected: %@, removingOriginalNote: %@}%s:%d", (uint8_t *)&v42, 0x3Au);

  }
  if ((_DWORD)a5 && objc_msgSend(v9, "preventLockReason"))
  {
    v16 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:].cold.5(v9);
    v17 = 0;
    v18 = v16;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0C978A8];
  objc_msgSend(v9, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", v20, v21, 0, &__block_literal_global_24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "beginBlockingDeauthentication");

  objc_msgSend(v9, "persistPendingChangesRecursively");
  objc_msgSend(v9, "mergeUnappliedEncryptedRecordRecursively");
  objc_msgSend(v9, "managedObjectContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "refreshAllObjects");

  v16 = objc_msgSend(MEMORY[0x1E0D63BB8], "newEmptyNoteInFolder:", v10);
  if (!(_DWORD)a5)
  {
    if ((objc_msgSend(v9, "copyValuesToNote:", v16) & 1) != 0)
      goto LABEL_16;
LABEL_27:
    v39 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:].cold.4();
    goto LABEL_31;
  }
  v24 = objc_msgSend(v9, "isPasswordProtected");
  -[NSObject setIsPasswordProtected:](v16, "setIsPasswordProtected:", 1);
  if ((v24 & 1) != 0)
  {
    -[NSObject cryptoStrategy](v16, "cryptoStrategy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "initializeCryptoPropertiesFromObject:", v9);

  }
  else
  {
    -[NSObject initializeCryptoProperties](v16, "initializeCryptoProperties");
  }
  if ((objc_msgSend(v9, "copyValuesToNote:", v16) & 1) == 0)
    goto LABEL_27;
  -[NSObject setSnippet:](v16, "setSnippet:", 0);
LABEL_16:
  -[NSObject noteData](v16, "noteData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNeedsToBeSaved:", 1);

  -[NSObject noteData](v16, "noteData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "saveNoteDataIfNeeded");

  if ((v28 & 1) == 0)
  {
    v39 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:].cold.3();
LABEL_31:

    objc_msgSend(MEMORY[0x1E0D63BB8], "deleteNote:", v16);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "removeObserver:", v18);

    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "endBlockingDeauthentication");
LABEL_32:

    v17 = 0;
    goto LABEL_33;
  }
  -[NSObject updateChangeCountWithReason:](v16, "updateChangeCountWithReason:", CFSTR("Duplicated note"));
  if (-[NSObject wantsUserSpecificRecord](v16, "wantsUserSpecificRecord"))
    -[NSObject updateUserSpecificChangeCountWithReason:](v16, "updateUserSpecificChangeCountWithReason:", CFSTR("Duplicated note"));
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "endBlockingDeauthentication");

  if ((_DWORD)a6)
  {
    if (objc_msgSend(v9, "isPasswordProtected"))
    {
      objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setCachedMainKey:forObject:", 0, v9);

    }
    objc_msgSend(MEMORY[0x1E0D63B40], "changeLinkDestinationFromNote:toNote:", v9, v16);
    objc_msgSend(v9, "markForDeletion");
    objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Duplicated note"));
    objc_msgSend(MEMORY[0x1E0D63BB8], "redactNote:", v9);
    objc_msgSend(MEMORY[0x1E0D63BB8], "deleteNote:", v9);
    objc_msgSend(v9, "account");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trashFolder");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFolder:", v32);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFolderModificationDate:", v33);

    objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Duplicated note"));
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "removeObserver:", v18);

  objc_msgSend(v9, "managedObjectContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "ic_saveWithLogDescription:", CFSTR("Duplicated note"));

  v37 = os_log_create("com.apple.notes", "Move");
  v38 = v37;
  if ((v36 & 1) == 0)
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:].cold.2();

    goto LABEL_32;
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:].cold.1();

  v16 = v16;
  v17 = v16;
LABEL_33:

  return v17;
}

+ (void)redactNote:()UI
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  CGColorSpace *DeviceRGB;
  double v24;
  size_t v25;
  double v26;
  CGContext *v27;
  CGColor *v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGImage *Image;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  char v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  void *v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[4];
  uint64_t v71;
  CGFloat components[5];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "mergeableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ic_range");
  objc_msgSend(v4, "replaceCharactersInRange:withString:", v6, v7, &stru_1E5C2F8C0);

  objc_msgSend(v3, "setTitle:", 0);
  objc_msgSend(v3, "setSnippet:", 0);
  objc_msgSend(v3, "setReplicaIDToUserIDDictData:", 0);
  objc_msgSend(v3, "setReplicaIDToNotesVersionData:", 0);
  objc_msgSend(v3, "setActivityEventsData:", 0);
  objc_msgSend(v3, "setOutlineStateData:", 0);
  v54 = v3;
  objc_msgSend(v3, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v9;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v57)
  {
    v56 = *(_QWORD *)v67;
    v60 = (void *)*MEMORY[0x1E0CEC580];
    *(_QWORD *)&v10 = 138412802;
    v53 = v10;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v67 != v56)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v12, "mergeableData", v53);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99D50]);
          objc_msgSend(v12, "setMergeableData:", v14);

        }
        objc_msgSend(v12, "setTitle:", 0);
        objc_msgSend(v12, "setHandwritingSummary:", 0);
        objc_msgSend(v12, "setImageClassificationSummary:", 0);
        objc_msgSend(v12, "setOcrSummary:", 0);
        objc_msgSend(v12, "previewImages");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copy");

        if (v16)
        {
          v58 = v16;
          v59 = i;
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v63 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                objc_msgSend(v22, "invalidateOrientedImage");
                DeviceRGB = CGColorSpaceCreateDeviceRGB();
                objc_msgSend(v22, "width");
                v25 = (unint64_t)v24;
                objc_msgSend(v22, "height");
                v27 = CGBitmapContextCreate(0, v25, (unint64_t)v26, 8uLL, 0, DeviceRGB, 2u);
                *(_OWORD *)components = xmmword_1ACA58440;
                *(_OWORD *)&components[2] = unk_1ACA58450;
                v28 = CGColorCreate(DeviceRGB, components);
                CGContextSetFillColorWithColor(v27, v28);
                CGColorRelease(v28);
                CGColorSpaceRelease(DeviceRGB);
                objc_msgSend(v22, "width");
                v30 = v29;
                objc_msgSend(v22, "height");
                v76.size.height = v31;
                v76.origin.x = 0.0;
                v76.origin.y = 0.0;
                v76.size.width = v30;
                CGContextFillRect(v27, v76);
                Image = CGBitmapContextCreateImage(v27);
                objc_msgSend(v60, "identifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                ICDataFromCGImage();
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                CGImageRelease(Image);
                CGContextRelease(v27);
                objc_msgSend(v22, "width");
                v36 = v35;
                objc_msgSend(v22, "height");
                v38 = v37;
                objc_msgSend(v22, "scale");
                if ((objc_msgSend(v22, "setImageData:withSize:scale:appearanceType:", v34, 0, v36, v38, v39) & 1) != 0)
                {
                  objc_msgSend(v12, "updateChangeCountWithReason:", CFSTR("Redacted note"));
                }
                else
                {
                  v40 = os_log_create("com.apple.notes", "PreviewGeneration");
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                    +[ICNote(UI) redactNote:].cold.1(v70, v12, &v71, v40);

                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
            }
            while (v19);
          }

          v16 = v58;
          i = v59;
        }
        objc_msgSend(v12, "media");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          objc_msgSend(v12, "media");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "hasFile");

          if (v43)
          {
            objc_msgSend(v12, "media");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_alloc_init(MEMORY[0x1E0C99D50]);
            v61 = 0;
            v46 = objc_msgSend(v44, "writeData:error:", v45, &v61);
            v47 = v61;

            if ((v46 & 1) == 0)
            {
              v48 = os_log_create("com.apple.notes", "Media");
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v12, "media");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "identifier");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "identifier");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(components[0]) = v53;
                *(_QWORD *)((char *)components + 4) = v50;
                WORD2(components[1]) = 2112;
                *(_QWORD *)((char *)&components[1] + 6) = v51;
                HIWORD(components[2]) = 2112;
                *(_QWORD *)&components[3] = v47;
                _os_log_error_impl(&dword_1AC7A1000, v48, OS_LOG_TYPE_ERROR, "Error redacting media %@ for note %@ error: %@", (uint8_t *)components, 0x20u);

              }
            }

          }
        }

      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v57);
  }

  objc_msgSend(v54, "managedObjectContext");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setShouldPerformSecureOperation:", 1);

}

- (void)redactAuthorAttributionsToCurrentUser
{
  void *v2;
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EED29D70;
  objc_msgSendSuper2(&v3, sel_redactAuthorAttributionsToCurrentUser);
  objc_msgSend(a1, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "redactAuthorAttributionsToCurrentUser");

}

- (void)_updateTextViewToPaperIfNecessary
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "textStorage", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "textViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (+[ICSystemPaperTextAttachment isEnabled](ICSystemPaperTextAttachment, "isEnabled")
          && (objc_msgSend(v7, "isPaperEnabled") & 1) == 0)
        {
          objc_msgSend(v7, "setPaperEnabled:", 1);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)attachmentFromInlineDrawingAttachment:()UI
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = *MEMORY[0x1E0D63680];
  v5 = a3;
  objc_msgSend(a1, "addAttachmentWithUTI:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "mergeWithMergeableData:", v8);
  objc_msgSend(v6, "updateChangeCountWithReason:", CFSTR("Created attachment from inline drawing"));
  return v6;
}

- (id)attachmentFromSystemPaperAttachment:()UI
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EECC4AF8))
  {
    objc_msgSend(v4, "_paperIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addSystemPaperAttachmentWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateChangeCountWithReason:", CFSTR("Created attachment from System Paper"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)attachmentFromStandardFileWrapper:()UI
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "addAttachmentWithFileWrapper:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateChangeCountWithReason:", CFSTR("Created attachment from file wrapper"));
  objc_msgSend(v1, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateChangeCountWithReason:", CFSTR("Created attachment from file wrapper"));

  return v1;
}

- (id)attachmentFromLegacyAttachmentFileWrapper:()UI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(v4, "attachmentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentWithIdentifier:context:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICNote(UI) attachmentFromLegacyAttachmentFileWrapper:].cold.1(v4);

  }
  return v8;
}

- (id)attachmentFromRemoteFileWrapper:()UI
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "remoteURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addAttachmentWithRemoteFileURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63C40], "sharedDownloader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadRemoteFileForAttachment:", v5);

  objc_msgSend(v5, "updateChangeCountWithReason:", CFSTR("Created attachment from remote file wrapper"));
  return v5;
}

- (uint64_t)thumbnailImageWithMinSize:()UI scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:
{
  return objc_msgSend(a1, "thumbnailImageWithMinSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:attachment:", 0);
}

- (id)thumbnailImageWithMinSize:()UI scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:attachment:
{
  id v12;
  _QWORD v14[14];
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__20;
  v20 = __Block_byref_object_dispose__20;
  v21 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __140__ICNote_UI__thumbnailImageWithMinSize_scale_appearanceType_requireAppearance_imageScaling_showAsFileIcon_isMovie_movieDuration_attachment___block_invoke;
  v14[3] = &unk_1E5C1F388;
  v14[4] = &v16;
  *(double *)&v14[5] = a2;
  *(double *)&v14[6] = a3;
  *(double *)&v14[7] = a4;
  v15 = a7;
  v14[8] = a6;
  v14[9] = a8;
  v14[10] = a9;
  v14[11] = a10;
  v14[12] = a11;
  v14[13] = a12;
  objc_msgSend(a1, "enumerateAttachmentsInOrderUsingBlock:", v14);
  v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

+ (id)thumbnailImageForAttachment:()UI minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:
{
  int v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v14 = 0;
  v9 = objc_msgSend(a3, "thumbnailImage:minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:", &v14, a9);
  v10 = v14;
  v11 = v10;
  if (!v9)
    v10 = 0;
  v12 = v10;

  return v12;
}

- (void)fetchThumbnailImageWithMinSize:()UI scale:cache:appearanceInfo:cacheKey:processingBlock:completionBlock:
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  char v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t *v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  objc_msgSend(a1, "thumbnailAttachmentIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(a1, "attachmentWithIdentifier:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "attachmentModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "showThumbnailInNoteList");

    if (v26)
    {
      objc_msgSend(v24, "attachmentModel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "genericListThumbnailCreator");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v24, "fetchThumbnailImageWithMinSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:", v19, v18, v20, v21, v22, v28, a2, a3, a4, 0);
      *((_BYTE *)v42 + 24) = v29;

    }
    else
    {
      objc_msgSend(a1, "setThumbnailAttachmentIdentifier:", 0);
    }

  }
  if (!*((_BYTE *)v42 + 24) && (objc_msgSend(a1, "isPasswordProtected") & 1) == 0)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __113__ICNote_UI__fetchThumbnailImageWithMinSize_scale_cache_appearanceInfo_cacheKey_processingBlock_completionBlock___block_invoke;
    v30[3] = &unk_1E5C1F3B0;
    v37 = &v41;
    v38 = a2;
    v39 = a3;
    v40 = a4;
    v31 = v19;
    v32 = v18;
    v33 = v20;
    v35 = v21;
    v36 = v22;
    v34 = a1;
    objc_msgSend(a1, "enumerateAttachmentsInOrderUsingBlock:", v30);

  }
  _Block_object_dispose(&v41, 8);

}

- (void)noteDidApplyAttachmentViewTypeToAllAttachments
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  unint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unsigned int v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  const char *v37;
  __int128 v38;

  objc_msgSend(a1, "textStorage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v1, "wantsUndoCommands");
  v29 = v1;
  objc_msgSend(v1, "setWantsUndoCommands:", 0);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3010000000;
  v37 = "";
  v38 = xmmword_1ACA582A0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "length");
  v5 = *MEMORY[0x1E0DC10F8];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __60__ICNote_UI__noteDidApplyAttachmentViewTypeToAllAttachments__block_invoke;
  v30[3] = &unk_1E5C1F3D8;
  v6 = v2;
  v31 = v6;
  v7 = v3;
  v32 = v7;
  v33 = &v34;
  objc_msgSend(v29, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v30);
  objc_msgSend(v29, "beginEditing");
  if (objc_msgSend(a1, "attachmentViewType") == 1 && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    for (i = 0; i < objc_msgSend(v7, "count", v25) - 1; ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", i + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "supportsMultipleThumbnailsOnSameLine"))
      {
        v11 = objc_opt_class();
        if (v11 == objc_opt_class())
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "rangeValue");
          v15 = v14;

          objc_msgSend(v7, "objectAtIndexedSubscript:", i + 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "rangeValue");

          if (v17 - (v13 + v15) == 1)
          {
            objc_msgSend(v29, "string");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v13 - v26 + v15;
            objc_msgSend(v18, "substringWithRange:", v19, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "componentsSeparatedByCharactersInSet:", v25);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (v22 == 2)
            {
              objc_msgSend(v29, "replaceCharactersInRange:withString:", v19, 1, &stru_1E5C2F8C0);
              ++v26;
            }
          }
        }
      }

    }
    v35[5] -= v26;

  }
  objc_msgSend(v29, "edited:range:changeInLength:", 1, v35[4], v35[5], 0);
  objc_msgSend(v29, "endEditing");
  objc_msgSend(v29, "setWantsUndoCommands:", v27);
  objc_msgSend(a1, "noteData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNeedsToBeSaved:", 1);

  objc_msgSend(a1, "noteData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "saveNoteDataIfNeeded");

  _Block_object_dispose(&v34, 8);
}

- (uint64_t)copyValuesToNote:()UI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v31;
  id v32;

  v4 = a3;
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshObject:mergeChanges:", v4, 1);

  objc_msgSend(a1, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCreationDate:", v6);

  objc_msgSend(a1, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModificationDate:", v7);

  objc_msgSend(a1, "snippet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSnippet:", v8);

  objc_msgSend(a1, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v9);

  objc_msgSend(v4, "setAttachmentViewType:", objc_msgSend(a1, "attachmentViewType"));
  objc_msgSend(v4, "setPaperStyleType:", objc_msgSend(a1, "paperStyleType"));
  objc_msgSend(v4, "setIsPinned:", objc_msgSend(a1, "isPinned"));
  objc_msgSend(v4, "setPreferredBackgroundType:", objc_msgSend(a1, "preferredBackgroundType"));
  objc_msgSend(a1, "replicaIDToUserIDDictData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReplicaIDToUserIDDictData:", v10);

  objc_msgSend(a1, "replicaIDToNotesVersionData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReplicaIDToNotesVersionData:", v11);

  objc_msgSend(a1, "activityEventsData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivityEventsData:", v12);

  objc_msgSend(a1, "outlineStateData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutlineStateData:", v13);

  objc_msgSend(v4, "setIsSystemPaper:", objc_msgSend(a1, "isSystemPaper"));
  objc_msgSend(a1, "hostApplicationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHostApplicationIdentifier:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D63AC8]);
  objc_msgSend(a1, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithObjectIdentifier:forPasteboard:", v16, 0);

  objc_msgSend(a1, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mergeableString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attributedString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v20, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, v17, v21, &v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v32;

  objc_msgSend(a1, "noteData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "data");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && !v22)
  {
    v26 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ICNote(UI) copyValuesToNote:].cold.1(a1);
LABEL_11:
    v29 = 0;
    v27 = v26;
    v28 = v23;
    goto LABEL_12;
  }
  if (!v22)
  {
    v26 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ICNote(UI) copyValuesToNote:].cold.2();
    goto LABEL_11;
  }
  v31 = v23;
  objc_msgSend(MEMORY[0x1E0CB3498], "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:error:", v22, v17, v4, &v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v31;

  if (v27)
  {
    objc_msgSend(v4, "textStorage");
    v26 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject wantsUndoCommands](v26, "wantsUndoCommands"))
    {
      -[NSObject setWantsUndoCommands:](v26, "setWantsUndoCommands:", 0);
      -[NSObject replaceCharactersInRange:withAttributedString:](v26, "replaceCharactersInRange:withAttributedString:", 0, -[NSObject length](v26, "length"), v27);
      v29 = 1;
      -[NSObject setWantsUndoCommands:](v26, "setWantsUndoCommands:", 1);
    }
    else
    {
      -[NSObject replaceCharactersInRange:withAttributedString:](v26, "replaceCharactersInRange:withAttributedString:", 0, -[NSObject length](v26, "length"), v27);
      v29 = 1;
    }
  }
  else
  {
    if (!v28)
    {
      v29 = 0;
      goto LABEL_13;
    }
    v26 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ICNote(UI) copyValuesToNote:].cold.3(v28);

    v29 = 0;
  }
LABEL_12:

LABEL_13:
  objc_msgSend(v17, "deleteDataFiles");

  return v29;
}

- (void)save
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v2, v3, "Cannot save %@ because mergeable string has error %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)saveOutlineState
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "outlineState");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D63BE8]);
  objc_msgSend(a1, "textContentStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outlineController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collapsedUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithCollapsedUUIDs:", v5);

  if (objc_msgSend(v9, "mergeWithState:", v6))
  {
    objc_msgSend(v9, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setOutlineStateData:", v7);

    objc_msgSend(a1, "updateUserSpecificChangeCountWithReason:", CFSTR("Updated outline state"));
    objc_msgSend(a1, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_saveWithLogDescription:", CFSTR("Updated outline state"));

  }
}

- (void)applyOutlineState
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "outlineState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collapsedUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textContentStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outlineController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollapsedUUIDs:", v2);

}

- (uint64_t)saveAfterDelay
{
  int v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel_save, 0);
  v2 = objc_msgSend(a1, "isFastSyncSessionActive");
  v3 = 0.1;
  if (!v2)
    v3 = 2.0;
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:", sel_save, 0, v3);
}

- (uint64_t)updateModificationDateAndChangeCount
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  if ((ICInternalSettingsGetBundleBoolSettingValue() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setModificationDate:", v2);

    if (objc_msgSend(a1, "isSharedViaICloud"))
    {
      objc_msgSend(a1, "modificationDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "lastViewedModificationDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "ic_isLaterThanDate:", v4);

      if (v5)
      {
        objc_msgSend(a1, "modificationDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setLastViewedModificationDate:", v6);

        objc_msgSend(a1, "setNeedsToSaveLastViewedTimestamp:", 1);
        objc_msgSend(a1, "updateUserSpecificChangeCountWithReason:", CFSTR("Updated modification date"));
      }
    }
  }
  v7 = (void *)MEMORY[0x1E0D63BB8];
  objc_msgSend(a1, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDidShowExceededStorageQuotaAlert:forNoteWithIdentifier:", 0, v8);

  return objc_msgSend(a1, "updateChangeCountWithReason:", CFSTR("Updated modification date"));
}

- (uint64_t)updateModificationDateAndChangeCountAndSaveAfterDelay
{
  objc_msgSend(a1, "updateModificationDateAndChangeCount");
  return objc_msgSend(a1, "saveAfterDelay");
}

- (uint64_t)updateModificationDateAndChangeCountAndSaveImmediately
{
  objc_msgSend(a1, "updateModificationDateAndChangeCount");
  return objc_msgSend(a1, "save");
}

- (uint64_t)isDrawingStroke
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)kICIsDrawingStrokeKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIsDrawingStroke:()UI
{
  const void *v5;
  id v6;

  if (objc_msgSend(a1, "isDrawingStroke") != (_DWORD)a3)
  {
    v5 = (const void *)kICIsDrawingStrokeKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, v5, v6, (void *)1);

  }
}

- (void)createMissingAttachmentsInTextStorage
{
  void *v2;
  id v3;

  objc_msgSend(a1, "textStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filterAttachmentsInTextStorage:range:", v3, 0, objc_msgSend(v2, "length"));

}

- (void)textStorageWillChange:()UI
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(a1, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__ICNote_UI__textStorageWillChange___block_invoke;
  v3[3] = &unk_1E5C1D540;
  v3[4] = a1;
  objc_msgSend(v2, "performBlockAndWait:", v3);

}

- (void)textStorageDidChange:()UI
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(a1, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__ICNote_UI__textStorageDidChange___block_invoke;
  v3[3] = &unk_1E5C1D540;
  v3[4] = a1;
  objc_msgSend(v2, "performBlockAndWait:", v3);

}

- (void)markBlockAndInlineAttachmentsForDeletion:()UI inAttributedString:
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  char v10;

  v6 = *MEMORY[0x1E0DC10F8];
  v7 = a4;
  v8 = objc_msgSend(v7, "length");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke;
  v9[3] = &unk_1E5C1F478;
  v9[4] = a1;
  v10 = a3;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v8, 0, v9);

}

- (void)notifyTextViewsNoteWillMerge
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "textStorage", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        ICProtocolCast();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "textStorage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textStorageWillPerformMerge:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)notifyTextViewsNoteDidMerge
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "textStorage", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        ICProtocolCast();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "textStorage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textStorageDidPerformMerge:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)announceAccessibilitySelectionChangedByMergeWithSavedSelections:()UI beforeMergeTimestamp:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && ICAccessibilityNeedsAccessibilityElements())
  {
    if (objc_msgSend(v16, "count") != 2)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "savedSelections.count == 2", "-[ICNote(UI) announceAccessibilitySelectionChangedByMergeWithSavedSelections:beforeMergeTimestamp:]", 1, 0, CFSTR("Expected 2 arrays from -savedSelectionWithSelectionAffinity:"));
    if (objc_msgSend(v16, "count") == 2)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "count");
      if (v9 != objc_msgSend(v8, "count"))
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "textViews.count == selections.count", "-[ICNote(UI) announceAccessibilitySelectionChangedByMergeWithSavedSelections:beforeMergeTimestamp:]", 1, 0, CFSTR("Expected same count for textViews and selections"));
      v10 = objc_msgSend(v7, "count");
      if (v10 == objc_msgSend(v8, "count"))
      {
        objc_msgSend(a1, "textStorage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mergeableString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "count"))
        {
          v13 = 0;
          do
          {
            objc_opt_class();
            objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            ICCheckedDynamicCast();
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v12, "selection:wasModifiedAfter:", v15, v6))
              objc_msgSend(a1, "announceAccessibilitySelectionChangedByMerge");

            ++v13;
          }
          while (v13 < objc_msgSend(v7, "count"));
        }

      }
    }
  }

}

- (void)announceAccessibilitySelectionChangedByMerge
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id obj;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v2;
  if (!announceAccessibilitySelectionChangedByMerge_lastAnnouncementDate
    || (objc_msgSend(v2, "timeIntervalSinceDate:"), v3 = obj, v4 > 1.0))
  {
    objc_msgSend(a1, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "isFirstResponder");
    objc_msgSend(v7, "selectedRange");
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0D64218];
      v11 = CFSTR("Selection changed by remote edit");
    }
    else
    {
      if (!v8)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v10 = (void *)MEMORY[0x1E0D64218];
      v11 = CFSTR("Insertion point changed by remote edit");
    }
    objc_msgSend(v10, "localizedFrameworkStringForKey:value:table:allowSiri:", v11, v11, 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    objc_storeStrong((id *)&announceAccessibilitySelectionChangedByMerge_lastAnnouncementDate, obj);

    v3 = obj;
  }

}

- (ICCalculateAccessibilityController)calculateAccessibilityController
{
  ICCalculateAccessibilityController *v2;

  if (ICInternalSettingsIsMathEnabled())
  {
    objc_getAssociatedObject(a1, &calculateAccessibilityControllerHandle);
    v2 = (ICCalculateAccessibilityController *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v2 = -[ICCalculateAccessibilityController initWithNote:]([ICCalculateAccessibilityController alloc], "initWithNote:", a1);
      objc_setAssociatedObject(a1, &calculateAccessibilityControllerHandle, v2, (void *)1);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)selectedInk
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "selectedInkIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedInkColorString");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = 0;
  if (v2 && v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ic_colorFromString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CD11A8], "inkWithIdentifier:color:weight:", v2, v6, -1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_DEFAULT, "Could not create ink color from serialized color string: %@", (uint8_t *)&v9, 0xCu);
      }

      v5 = 0;
    }

  }
  return v5;
}

- (void)setSelectedInk:()UI
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSelectedInkIdentifier:", v5);

  objc_msgSend(v4, "color");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ic_colorString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSelectedInkColorString:", v6);

}

- (id)firstAttachmentInTextStorage
{
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__20;
  v8 = __Block_byref_object_dispose__20;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__ICNote_UI__firstAttachmentInTextStorage__block_invoke;
  v3[3] = &unk_1E5C1F400;
  v3[4] = &v4;
  objc_msgSend(a1, "enumerateAttachmentsInOrderUsingBlock:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)addHashtagToNoteBodyIfMissing:()UI
{
  return objc_msgSend(a1, "addHashtagToNoteBody:onlyIfMissing:", a3, 1);
}

- (id)addHashtagToNoteBody:()UI onlyIfMissing:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a3;
  if ((objc_msgSend(a1, "isNewNoteWithHashtagsInsertedIntoBody") & 1) == 0)
    objc_msgSend(a1, "setIsNewNoteWithHashtagsInsertedIntoBody:", objc_msgSend(a1, "isEmpty"));
  if (!a4
    || (objc_msgSend(v6, "standardizedContent"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "anyVisibleInstanceOfHashtag:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v9 = (void *)MEMORY[0x1E0D63B40];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "newHashtagAttachmentWithIdentifier:forHashtag:note:parentAttachment:", v11, v6, a1, 0);

    v30 = 0;
    v31 = &v30;
    v32 = 0x3010000000;
    v34 = 0;
    v35 = 0;
    v33 = "";
    objc_msgSend(a1, "textStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v12, "length");
    v35 = 0;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    objc_msgSend(a1, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "ic_range");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __49__ICNote_UI__addHashtagToNoteBody_onlyIfMissing___block_invoke;
    v25[3] = &unk_1E5C1F4F0;
    v25[4] = a1;
    v25[5] = &v30;
    v25[6] = &v26;
    objc_msgSend(v13, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v14, v16, v17, 0, v25);

    +[ICInlineTextAttachment textAttachmentWithAttachment:](ICInlineTextAttachment, "textAttachmentWithAttachment:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    if (*((_BYTE *)v27 + 24))
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n\n"));
    else
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v19, "appendAttributedString:", v20);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendAttributedString:", v21);

    objc_msgSend(a1, "textStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "replaceCharactersInRange:withAttributedString:", v31[4], v31[5], v19);

    objc_msgSend(a1, "textStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fixupAfterEditing");

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
  }

  return v8;
}

- (BOOL)removeHashtag:()UI
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  _BOOL8 v32;
  char v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(a1, "visibleInlineAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (!v6)
    goto LABEL_17;
  v7 = v6;
  v35 = 0;
  v8 = *(_QWORD *)v46;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v46 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "attachmentType");
      objc_msgSend(v10, "tokenContentIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "standardizedContent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v11 == 1 && v14 != 0)
      {
        objc_msgSend(v10, "parentAttachment");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v4, "displayText");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "ic_withHashtagPrefix");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "parentAttachment");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "attachmentModel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "replaceChildInlineAttachment:withText:", v10, v18);

          objc_msgSend(v36, "addObject:", v10);
        }
        else
        {
          objc_msgSend(v36, "addObject:", v10);
          v35 = 1;
        }
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  }
  while (v7);

  if ((v35 & 1) != 0)
  {
    objc_msgSend(a1, "textStorage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    objc_msgSend(a1, "textStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "beginEditing");

    objc_msgSend(a1, "textStorage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "managedObjectContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __28__ICNote_UI__removeHashtag___block_invoke;
    v41[3] = &unk_1E5C1F518;
    v42 = v4;
    v43 = a1;
    v44 = v36;
    objc_msgSend(v24, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v25, 0, v22, 0, v41);

    objc_msgSend(a1, "textStorage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "endEditing");

    v5 = v42;
LABEL_17:

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v27 = v36;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(MEMORY[0x1E0D63B40], "deleteAttachment:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v29);
  }

  if (objc_msgSend(a1, "isEmpty"))
    objc_msgSend(MEMORY[0x1E0D63BB8], "deleteEmptyNote:", a1);
  v32 = objc_msgSend(v27, "count") != 0;

  return v32;
}

+ (void)removeUsageOfHashtag:()UI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D63BB8];
  objc_msgSend(v3, "standardizedContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notesContainingHashtagWithStandarizedContent:context:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        objc_opt_class();
        objc_msgSend(v4, "objectWithID:", v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "removeHashtag:", v3);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (uint64_t)isHashtagRowAtRange:()UI outRangeForAppending:outIndex:forHashtagAttachment:outHashtagCount:
{
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  const char *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v14 = a7;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0x7FFFFFFFFFFFFFFFLL;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3010000000;
  v34 = "";
  v35 = xmmword_1ACA582A0;
  objc_msgSend(a1, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __101__ICNote_UI__isHashtagRowAtRange_outRangeForAppending_outIndex_forHashtagAttachment_outHashtagCount___block_invoke;
  v25[3] = &unk_1E5C1F540;
  v27 = &v44;
  v28 = &v31;
  v29 = &v36;
  v17 = v14;
  v26 = v17;
  v30 = &v40;
  objc_msgSend(v15, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v16, a3, a4, 0, v25);

  if (!*((_BYTE *)v45 + 24))
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_attachmentCharacterString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addCharactersInString:", v19);

  objc_msgSend(v18, "invert");
  objc_msgSend(a1, "textStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "substringWithRange:", a3, a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "rangeOfCharacterFromSet:", v18) != 0x7FFFFFFFFFFFFFFFLL)
    *((_BYTE *)v45 + 24) = 0;

  if (*((_BYTE *)v45 + 24))
  {
    if (a5)
    {
      *a5 = v32[5] + v32[4];
      a5[1] = 0;
    }
    if (a8)
      *a8 = v37[3];
    if (a6)
      *a6 = v41[3];
    v23 = 1;
  }
  else
  {
LABEL_12:
    v23 = 0;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v23;
}

+ (uint64_t)defaultNavigationBarIcon
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("NavigationBarIcons/Note"));
}

+ (uint64_t)lockedNavigationBarIcon
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("NavigationBarIcons/LockedNote"));
}

- (id)navigationBarIconWithSize:()UI
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (objc_msgSend(a1, "isPasswordProtected"))
  {
    objc_msgSend((id)objc_opt_class(), "lockedNavigationBarIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[ICThumbnailConfiguration initForNoteNavigationBarIconWithNote:preferredSize:]([ICThumbnailConfiguration alloc], "initForNoteNavigationBarIconWithNote:preferredSize:", a1, a2, a3);
    +[ICThumbnailService sharedThumbnailService](ICThumbnailService, "sharedThumbnailService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "thumbnailWithConfiguration:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultNavigationBarIcon");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v12;

  }
  return v6;
}

- (uint64_t)ic_lineCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "attributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  objc_msgSend(a1, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (uint64_t)ic_wordCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "attributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  objc_msgSend(a1, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_compactMap:", &__block_literal_global_288);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (uint64_t)ic_characterCountIncludingSpaces:()UI
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
    return 0;
  objc_msgSend(a1, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v10 = objc_msgSend(v9, "length");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_stringByReplacingCharactersInSet:withString:", v11, &stru_1E5C2F8C0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "length");

  }
  return v10;
}

- (id)searchableItemViewAttributeSet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(a1, "attachments");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewImages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "previewImageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64E90], "makeNoteSearchResultViewWithNote:attachmentURL:", a1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)setIsFastSyncSessionActive:()UI .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "ic_loggingIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v3, v4, "Setting isFastSyncSessionActive (%@) for note: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)appendAttributedString:()UI options:error:.cold.1()
{
  os_log_t v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[ICNote(UI) appendAttributedString:options:error:]";
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_1AC7A1000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to append attributed string: %@", (uint8_t *)&v1, 0x16u);
}

+ (void)duplicateNote:()UI isPasswordProtected:removeOriginalNote:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v2, v3, "Cannot duplicate note without folder {originalNote: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v3, v4, "Saved after duplicating note {originalNote: %@, duplicatedNote: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v3, v4, "Failed to save after duplicating note {originalNote: %@, duplicatedNote: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v3, v4, "Failed to save note data — deleting duplicated note {originalNote: %@, duplicatedNote: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v3, v4, "Failed to copy note values — deleting duplicated note {originalNote: %@, duplicatedNote: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.5(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preventLockReason");
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v3, v4, "Cannot password-protect note {originalNote: %@, reason: %@}", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

+ (void)redactNote:()UI .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1AC7A1000, a4, OS_LOG_TYPE_ERROR, "Error redacting preview images for attachment %@", a1, 0xCu);

}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v3, v4, "Found an inline attachment (%@) in text of note (%@) that doesn't have an identifier", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v3, v4, "Found an inline attachment (%@) in text of note (%@) that doesn't have a typeUTI", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v3, v4, "Trying to get an inline attachment (%@) that we haven't downloaded yet for a note (%@). Creating a temporary one.", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "attachmentIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v3, v4, "Trying to get an attachment (%@) without an identifier or type for a note (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.5()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "attachmentIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v3, v4, "Trying to get an attachment (%@) that we haven't downloaded yet for a note (%@). Creating a temporary one.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)attachmentFromLegacyAttachmentFileWrapper:()UI .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "attachmentIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v2, v3, "Found a legacy attachment file wrapper for an attachment that hasn't been imported yet: %@'", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)copyValuesToNote:()UI .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v2, v3, "Cannot copy data from note that has non-nil data %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)copyValuesToNote:()UI .cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v2, v3, "Failed to archive source note (%@): %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)copyValuesToNote:()UI .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v2, v3, "Error copying values to note %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)filterAttachmentsInTextStorage:()UI range:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "Attachments exceeded", v1, 2u);
}

@end
