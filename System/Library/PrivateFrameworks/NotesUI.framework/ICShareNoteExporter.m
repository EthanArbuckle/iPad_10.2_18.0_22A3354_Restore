@implementation ICShareNoteExporter

- (NSURL)exportDirectory
{
  NSURL *exportDirectory;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSURL *v10;
  NSURL *v11;

  exportDirectory = self->_exportDirectory;
  if (!exportDirectory)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("export"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v9, 1);
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v11 = self->_exportDirectory;
    self->_exportDirectory = v10;

    exportDirectory = self->_exportDirectory;
  }
  return exportDirectory;
}

- (id)exportRTFDFileFromNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  id v28;
  ICShareNoteExporter *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICShareNoteExporter exportRTFDFileFromNote:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isSharable") & 1) == 0)
  {
    v10 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICShareNoteExporter exportRTFDFileFromNote:].cold.2(v10, v18, v19, v20, v21, v22, v23, v24);
LABEL_8:

    v9 = 0;
    goto LABEL_9;
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__38;
  v35 = __Block_byref_object_dispose__38;
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotManagedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke;
  v26[3] = &unk_1E5C1F0C0;
  v27 = v5;
  v8 = v7;
  v28 = v8;
  v29 = self;
  v30 = &v31;
  objc_msgSend(v8, "performBlockAndWait:", v26);
  v9 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
LABEL_9:

  return v9;
}

void __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v2 = (void *)MEMORY[0x1E0D63BB8];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "fileWrapperForNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "filenameFromTitle:", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("Note.rtfd");
    }
    objc_msgSend(*(id *)(a1 + 48), "exportDirectory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v25 = 0;
    v20 = objc_msgSend(v5, "writeToURL:options:originalContentsURL:error:", v19, 1, 0, &v25);
    v21 = v25;
    if ((v20 & 1) == 0)
    {
      v22 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke_cold_2(v21);

      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = 0;

    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke_cold_1(v6, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (void)cleanUpExportedFiles
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "exportDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Failed to remove export directory: %@, %@", (uint8_t *)&v6, 0x16u);

}

- (id)fileWrapperForNote:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "filterSubstringAttributes");
  objc_msgSend(v4, "setFilterSubstringAttributes:", 1);
  objc_msgSend(v3, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  objc_msgSend(v3, "filterAttachmentsInTextStorage:range:", v4, 0, v7);
  objc_msgSend(v4, "attributedSubstringFromRange:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilterSubstringAttributes:", v5);
  v9 = objc_msgSend(v8, "length");
  v16 = *MEMORY[0x1E0DC1118];
  v17[0] = *MEMORY[0x1E0DC1188];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "fileWrapperFromRange:documentAttributes:error:", 0, v9, v10, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  if (v12)
  {
    v13 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICShareNoteExporter fileWrapperForNote:].cold.1(v12);

  }
  return v11;
}

- (id)filenameFromTitle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!filenameFromTitle__invalidCharacters)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("/"), CFSTR(":"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)filenameFromTitle__invalidCharacters;
    filenameFromTitle__invalidCharacters = v4;

  }
  v6 = (void *)objc_msgSend(v3, "mutableCopy");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)filenameFromTitle__invalidCharacters;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11++), CFSTR(" "), 0, 0, objc_msgSend(v3, "length"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v12 = (void *)objc_msgSend(v6, "copy");
  if ((unint64_t)objc_msgSend(v12, "length") >= 0x100)
  {
    objc_msgSend(v12, "substringWithRange:", 0, 255);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");

    v12 = (void *)v14;
  }
  objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("rtfd"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setExportDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_exportDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportDirectory, 0);
}

- (void)exportRTFDFileFromNote:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Can't export without a note.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)exportRTFDFileFromNote:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Can't export a non-sharable note.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Can't export without a file wrapper.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v2, v3, "Error writing out file for note export: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_3();
}

- (void)fileWrapperForNote:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v2, v3, "Error creating file wrapper for note export: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_3();
}

@end
