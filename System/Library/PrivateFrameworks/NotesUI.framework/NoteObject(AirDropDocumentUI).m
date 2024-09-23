@implementation NoteObject(AirDropDocumentUI)

+ (id)noteByImportingLegacyNoteFromWebArchive:()AirDropDocumentUI withContent:context:styler:attachmentPreviewGenerator:
{
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
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v34 = a4;
  v12 = a5;
  v36 = a6;
  v37 = a7;
  v35 = v12;
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D63B10];
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "defaultFolderInContext:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (id)objc_msgSend(MEMORY[0x1E0D63BB8], "newEmptyNoteInFolder:", v17);
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Note"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("NoteBody"), v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setBody:", v21);
  objc_msgSend(MEMORY[0x1E0D629F0], "generateGUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setGuid:", v22);

  v23 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(v38, "setCreationDate:", v23);
  objc_msgSend(v38, "setModificationDate:", v23);
  objc_msgSend(a1, "importLegacyNoteFromWebArchive:withContent:intoLegacyNote:context:", v33, v34, v19, v35);
  +[ICLegacyNoteUtilities copyValuesFromLegacyNote:toNote:styler:attachmentPreviewGenerator:](ICLegacyNoteUtilities, "copyValuesFromLegacyNote:toNote:styler:attachmentPreviewGenerator:", v19, v38, v36, v37);
  objc_msgSend(v19, "folder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0D641A0];
    objc_msgSend(v19, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!legacyNote.folder", "+[NoteObject(AirDropDocumentUI) noteByImportingLegacyNoteFromWebArchive:withContent:context:styler:attachmentPreviewGenerator:]", 1, 0, CFSTR("Temporary legacyNote should not have a folder %@"), v26);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v19, "attachments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v27);
        objc_opt_class();
        ICCheckedDynamicCast();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v13, "deleteObject:", v31);

      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v28);
  }

  objc_msgSend(v13, "deleteObject:", v19);
  objc_msgSend(v13, "deleteObject:", v21);

  return v38;
}

+ (void)importLegacyNoteFromWebArchive:()AirDropDocumentUI withContent:intoLegacyNote:context:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v9 = a5;
  v10 = a6;
  v18 = v9;
  objc_msgSend(v9, "setContent:", a4);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v19, "subresources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(MEMORY[0x1E0D63B80], "createAttachmentFromWebResource:inContext:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v11, "addObject:", v16);
        else
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "attachmentObject", "+[NoteObject(AirDropDocumentUI) importLegacyNoteFromWebArchive:withContent:intoLegacyNote:context:]", 1, 0, CFSTR("Failed to create attachmentObject from resource"));

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
  objc_msgSend(v18, "addAttachments:", v17);

}

+ (uint64_t)newNoteForAirDropDocument:()AirDropDocumentUI context:styler:attachmentPreviewGenerator:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  ICCheckedDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "webArchiveFromLegacyNoteDocument");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v21 = v13;
    objc_msgSend(MEMORY[0x1E0D63B80], "contentStringFromWebArchive:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v14, "defaultStoreForNewNote");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "account");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(MEMORY[0x1E0D639D8], "canAirDropImportIntoAccount:context:", v18, v14) & 1) != 0)
      {
        objc_msgSend(v14, "newlyCreatedNoteFromDefaultStore");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "importLegacyNoteFromWebArchive:withContent:intoLegacyNote:context:", v15, v16, v19, v14);
      }
      else
      {
        objc_msgSend(a1, "noteByImportingLegacyNoteFromWebArchive:withContent:context:styler:attachmentPreviewGenerator:", v15, v16, v14, v12, v21);
        v19 = objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v19 = 0;
    }

    v13 = v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "webArchive", "+[NoteObject(AirDropDocumentUI) newNoteForAirDropDocument:context:styler:attachmentPreviewGenerator:]", 1, 0, CFSTR("Failed to get webArchive from AirDrop document %@"), v10);
    v19 = 0;
  }

  return v19;
}

@end
