@implementation WBSAutoFillInternalFeedbackDiagnosticsData

- (WBSAutoFillInternalFeedbackDiagnosticsData)init
{
  WBSAutoFillInternalFeedbackDiagnosticsData *v2;
  void *v3;
  uint64_t v4;
  NSString *creationDateString;
  WBSAutoFillInternalFeedbackDiagnosticsData *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSAutoFillInternalFeedbackDiagnosticsData;
  v2 = -[WBSAutoFillInternalFeedbackDiagnosticsData init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_filenameFormattedString");
    v4 = objc_claimAutoreleasedReturnValue();
    creationDateString = v2->_creationDateString;
    v2->_creationDateString = (NSString *)v4;

    v6 = v2;
  }

  return v2;
}

- (id)writeTemporaryFileWithFormMetadata
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  WBSAutoFillInternalFeedbackDiagnosticsData *v40;
  NSArray *obj;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[WBSAutoFillInternalFeedbackDiagnosticsData formMetadata](self, "formMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = (void *)-[NSSet mutableCopy](self->_sensitiveValuesForRedaction, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  v50 = 0u;
  v40 = self;
  obj = self->_formMetadata;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        objc_msgSend(v13, "controls");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v47 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
              objc_msgSend(v19, "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                objc_msgSend(v19, "value");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v21);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
          }
          while (v16);
        }

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v10);
  }

  -[WBSAutoFillInternalFeedbackDiagnosticsData formMetadata](v40, "formMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __80__WBSAutoFillInternalFeedbackDiagnosticsData_writeTemporaryFileWithFormMetadata__block_invoke;
  v44[3] = &unk_1E4B29C70;
  v23 = v8;
  v45 = v23;
  objc_msgSend(v22, "safari_mapObjectsUsingBlock:", v44);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v24, 1, &v43);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v43;
  if (v25)
  {
    v27 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CB3940];
    -[NSURL host](v40->_url, "host");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("form-metadata-%@-%@.json"), v30, v40->_creationDateString);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28, "stringByAppendingPathComponent:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fileURLWithPath:isDirectory:", v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v26;
    LOBYTE(v28) = objc_msgSend(v25, "writeToURL:options:error:", v33, 0, &v42);
    v34 = v42;

    if ((v28 & 1) != 0)
    {
      v35 = v33;
    }
    else
    {
      v37 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        objc_msgSend(v34, "safari_privacyPreservingDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v39;
        _os_log_impl(&dword_1A3D90000, v38, OS_LOG_TYPE_DEFAULT, "Encountered error writing temporary file with form metadata: %{public}@", buf, 0xCu);

      }
      v35 = 0;
    }

  }
  else
  {
    v36 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[WBSAutoFillInternalFeedbackDiagnosticsData writeTemporaryFileWithFormMetadata].cold.1(v36, v26);
    v35 = 0;
    v34 = v26;
  }

  return v35;
}

id __80__WBSAutoFillInternalFeedbackDiagnosticsData_writeTemporaryFileWithFormMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "dictionaryRepresentationRedactingSensitiveValues:withKnownSensitiveValues:", 1, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_msgSend(v3, "type");
  WBSStringFromAutoFillFormType(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("AutoFillFormType"));

  return v5;
}

- (NSString)creationDateString
{
  return self->_creationDateString;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)formMetadata
{
  return self->_formMetadata;
}

- (void)setFormMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)sensitiveValuesForRedaction
{
  return self->_sensitiveValuesForRedaction;
}

- (void)setSensitiveValuesForRedaction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveValuesForRedaction, 0);
  objc_storeStrong((id *)&self->_formMetadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_creationDateString, 0);
}

- (void)writeTemporaryFileWithFormMetadata
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Encountered error generating JSON data with form metadata: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
