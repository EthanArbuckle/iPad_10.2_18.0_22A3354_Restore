@implementation PXMemoriesInlineProblemReporter

- (PXMemoriesInlineProblemReporter)initWithMemory:(id)a3 features:(id)a4
{
  id v7;
  id v8;
  PXMemoriesInlineProblemReporter *v9;
  PXMemoriesInlineProblemReporter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXMemoriesInlineProblemReporter;
  v9 = -[PXMemoriesInlineProblemReporter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    objc_storeStrong((id *)&v10->_features, a4);
  }

  return v10;
}

- (id)feedbackMailViewController
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(getMFMailComposeViewControllerClass_279730(), "canSendMail") & 1) != 0)
  {
    v3 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_279730());
    objc_msgSend(v3, "setSubject:", CFSTR("Memories living-on feedback"));
    objc_msgSend(v3, "setToRecipients:", &unk_1E53EAB60);
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = objc_claimAutoreleasedReturnValue();
    -[PXMemoriesInlineProblemReporter _headerText](self, "_headerText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject appendString:](v4, "appendString:", v5);

    -[PXMemoriesInlineProblemReporter _reportStringForFeatures](self, "_reportStringForFeatures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject appendString:](v4, "appendString:", v6);

    -[PXMemoriesInlineProblemReporter _infoText](self, "_infoText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject appendFormat:](v4, "appendFormat:", CFSTR("\n\n%@\n"), v7);

    -[PXMemoriesInlineProblemReporter memory](self, "memory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:](PXMemoriesRelatedDiagnosticsHelper, "getSummaryFromProviderItem:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 200, 0, &v35);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v35;
      if (v10)
      {
        objc_msgSend(v3, "addAttachmentData:mimeType:fileName:", v10, CFSTR("application/x-plist"), CFSTR("results.plist"));
        goto LABEL_12;
      }
    }
    else
    {
      v11 = 0;
    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Cannot attach results.plist: %@."), v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject appendFormat:](v4, "appendFormat:", CFSTR("%@\n\n"), v10);
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v10;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "ERROR: %@", buf, 0xCu);
    }

LABEL_12:
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "urlForApplicationDataFolderIdentifier:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("Graph.plist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_27:
      -[PXMemoriesInlineProblemReporter _disclaimerText](self, "_disclaimerText");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject appendFormat:](v4, "appendFormat:", CFSTR("\n\n%@\n"), v29);

      objc_msgSend(v3, "setMessageBody:isHTML:", v4, 0);
      goto LABEL_28;
    }
    v31 = v9;
    v34 = v11;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v17, 0, &v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v34;

    if (v18 && !v19)
    {
      objc_msgSend(v17, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addAttachmentData:mimeType:fileName:", v18, CFSTR("application/octet-stream"), v20);
      v11 = 0;
LABEL_26:

      v9 = v31;
      goto LABEL_27;
    }

    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v21, "exportGraphForPurpose:error:", CFSTR("default"), &v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v33;

    if (v20 && !v11)
    {
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v20, 0, &v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v32;

      if (v22 && !v11)
      {
        objc_msgSend(v17, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addAttachmentData:mimeType:fileName:", v22, CFSTR("application/octet-stream"), v23);

        objc_msgSend(v22, "writeToURL:atomically:", v17, 1);
        v11 = 0;
        v18 = v22;
        goto LABEL_26;
      }
      v18 = v22;
    }
    if (v11)
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("Cannot attach graph: \"%@\"), v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v26;
      -[NSObject appendFormat:](v4, "appendFormat:", CFSTR("%@\n\n"), v26);
      PLUIGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v27;
        _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_ERROR, "ERROR: %@", buf, 0xCu);
      }

    }
    goto LABEL_26;
  }
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Looks like email is not setup on this system.", buf, 2u);
  }
  v3 = 0;
LABEL_28:

  return v3;
}

- (id)_reportStringForFeatures
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXMemoriesInlineProblemReporter features](self, "features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "localizedTypeStringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedTitle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("- %@: %@\n"), v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_infoText
{
  return CFSTR("\n\nThank you for feedback.");
}

- (id)_disclaimerText
{
  return (id)objc_msgSend(CFSTR("I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the metadata (\"time\", \"location\", \"people\", …) that I am providing with this bug report, for the purpose of improving Photos Memories capabilities. Apple may not use the metadata in any other fashion than as provided herein. Please do not provide any metadata of images that contain third parties or for which you do not have sufficient rights.\n\n\t\t\tI represent that the metadata are original to and/or owned by me and that I have the rights necessary to grant to Apple the rights provided herein. I release Apple, its agents, employees, licensees and assigns from any and all claims I may have now or in the future for invasion of privacy, right of publicity, trademark infringement, copyright infringement, defamation or any other cause of action arising out of the use or reproduction of the metadata.\n\n\t\t\tI have read and fully understand the foregoing and hereby acknowledge my agreement to its terms.\n"), "uppercaseString");
}

- (id)_headerText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[PXMemoriesInlineProblemReporter memory](self, "memory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "localizedSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" – %@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please identify which of the values you think are incorrect for the Memory \"%@\".\n\t\t\tWhat meaning or mood would you have picked?\n\n"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)setMemory:(id)a3
{
  objc_storeStrong((id *)&self->_memory, a3);
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

@end
