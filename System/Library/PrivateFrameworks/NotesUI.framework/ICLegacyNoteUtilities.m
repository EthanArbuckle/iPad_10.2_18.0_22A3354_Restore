@implementation ICLegacyNoteUtilities

+ (id)temporaryTextStorageWithAttributedString:(id)a3 replicaID:(id)a4 styler:(id)a5
{
  id v7;
  id v8;
  id v9;
  ICTTTextStorage *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[ICTTTextStorage initWithData:replicaID:]([ICTTTextStorage alloc], "initWithData:replicaID:", 0, v8);

  -[ICTTTextStorage setStyler:](v10, "setStyler:", v7);
  -[ICTTTextStorage setConvertAttributes:](v10, "setConvertAttributes:", 1);
  -[ICTTTextStorage setWantsUndoCommands:](v10, "setWantsUndoCommands:", 0);
  -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v10, "replaceCharactersInRange:withAttributedString:", 0, -[ICTTTextStorage length](v10, "length"), v9);

  -[ICTTTextStorage fixupAfterEditing](v10, "fixupAfterEditing");
  -[ICTTTextStorage setConvertAttributes:](v10, "setConvertAttributes:", 0);
  -[ICTTTextStorage setStyler:](v10, "setStyler:", 0);
  return v10;
}

+ (void)importLegacyNote:(id)a3 temporaryTextStorage:(id)a4 toNote:(id)a5 attachmentPreviewGenerator:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke;
  v43[3] = &unk_1E5C1D9A8;
  v16 = v9;
  v44 = v16;
  v17 = v13;
  v45 = v17;
  objc_msgSend(v14, "performBlockAndWait:", v43);

  v18 = *MEMORY[0x1E0D63950];
  v19 = objc_msgSend(v10, "length");
  v39[0] = v15;
  v39[1] = 3221225472;
  v39[2] = __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2;
  v39[3] = &unk_1E5C232F8;
  v20 = v16;
  v40 = v20;
  v21 = v17;
  v41 = v21;
  v22 = v10;
  v42 = v22;
  objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v19, 0, v39);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v21, "allValues", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(MEMORY[0x1E0D63B78], "importLegacyAttachment:toNote:attachmentPreviewGenerator:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v27++), v11, v12);
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v25);
  }

  objc_msgSend(v11, "textStorage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWantsUndoCommands:", 0);

  objc_msgSend(v11, "textStorage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textStorage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "deleteCharactersInRange:", 0, objc_msgSend(v30, "length"));

  objc_msgSend(v11, "textStorage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "mergeableString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mergeableString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "mergeWithString:", v33);

  objc_msgSend(v11, "textStorage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWantsUndoCommands:", 1);

}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        ICCheckedProtocolCast();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "contentID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!legacyAttachmentIDMap[contentID]", "+[ICLegacyNoteUtilities importLegacyNote:temporaryTextStorage:toNote:attachmentPreviewGenerator:]_block_invoke", 1, 0, CFSTR("Duplicate contentID found %@, existing attachment will be overwritten"), v8);
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "contentID", "+[ICLegacyNoteUtilities importLegacyNote:temporaryTextStorage:toNote:attachmentPreviewGenerator:]_block_invoke", 1, 0, CFSTR("legacyAttachment.contentID is nil"));
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  char v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "fileWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "fileWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D63B78];
    objc_msgSend(v10, "cidURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentIDStringFromCIDURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__60;
    v32 = __Block_byref_object_dispose__60;
    v33 = 0;
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_96;
      v24[3] = &unk_1E5C1E190;
      v27 = &v28;
      v15 = v13;
      v25 = v15;
      v26 = *(id *)(a1 + 32);
      objc_msgSend(v14, "performBlockAndWait:", v24);

      v16 = v29[5];
      v17 = *(void **)(a1 + 40);
      if (v16)
      {
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v15);
      }
      else
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", v15);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v29[5];
        v29[5] = v20;

      }
      v18 = v25;
    }
    else
    {
      v18 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "cidURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2_cold_2(v19, (uint64_t)v34, v18);
      }

    }
    if (!v29[5])
    {
      v22 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2_cold_1((uint64_t)v13, v22, v23);

      objc_msgSend(*(id *)(a1 + 48), "deleteCharactersInRange:", a3, a4);
    }
    _Block_object_dispose(&v28, 8);

  }
}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_96(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D63B78];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentWithContentID:context:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (void)copyValuesFromLegacyNote:(id)a3 toNote:(id)a4 styler:(id)a5 attachmentPreviewGenerator:(id)a6
{
  id v10;
  id v11;
  id v12;
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
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  objc_msgSend(v25, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "legacyNote.managedObjectContext", "+[ICLegacyNoteUtilities copyValuesFromLegacyNote:toNote:styler:attachmentPreviewGenerator:]", 1, 0, CFSTR("Legacy note does not have valid object context %@"), v25);
  objc_msgSend(v25, "htmlString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D63BB8];
  objc_msgSend(MEMORY[0x1E0D63C30], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedStringFromHTMLString:readerDelegate:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "currentReplicaID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "temporaryTextStorageWithAttributedString:replicaID:styler:", v17, v18, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "creationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v10, "setCreationDate:", v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCreationDate:", v21);

  }
  objc_msgSend(v25, "modificationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v10, "setModificationDate:", v22);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setModificationDate:", v23);

  }
  objc_msgSend(v25, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v24);

  objc_msgSend(a1, "importLegacyNote:temporaryTextStorage:toNote:attachmentPreviewGenerator:", v25, v19, v10, v11);
}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, a3, "No legacy attachment for content ID %@", (uint8_t *)&v3);
}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a3, (uint64_t)a3, "Could not find a content ID string for CID URL %@", (uint8_t *)a2);

}

@end
