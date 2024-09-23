@implementation WBSTranslationDiagnosticData

- (WBSTranslationDiagnosticData)init
{
  WBSTranslationDiagnosticData *v2;
  uint64_t v3;
  NSMutableArray *extractedParagraphs;
  uint64_t v5;
  NSMutableArray *translatedParagraphs;
  uint64_t v7;
  NSMutableArray *errors;
  NSString *URLString;
  WBSTranslationDiagnosticData *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WBSTranslationDiagnosticData;
  v2 = -[WBSTranslationDiagnosticData init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    extractedParagraphs = v2->_extractedParagraphs;
    v2->_extractedParagraphs = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    translatedParagraphs = v2->_translatedParagraphs;
    v2->_translatedParagraphs = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    errors = v2->_errors;
    v2->_errors = (NSMutableArray *)v7;

    URLString = v2->_URLString;
    v2->_URLString = (NSString *)&stru_1E5449658;

    v10 = v2;
  }

  return v2;
}

- (void)setURLString:(id)a3
{
  uint64_t v4;
  __CFString *v5;
  id v6;

  v4 = objc_msgSend(a3, "copy");
  v6 = (id)v4;
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = &stru_1E5449658;
  objc_storeStrong((id *)&self->_URLString, v5);

}

- (NSArray)extractedParagraphs
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_extractedParagraphs, "copy");
}

- (NSArray)translatedParagraphs
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_translatedParagraphs, "copy");
}

- (void)addExtractedParagraphs:(id)a3
{
  NSMutableArray *extractedParagraphs;
  id v4;

  extractedParagraphs = self->_extractedParagraphs;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_56);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](extractedParagraphs, "addObjectsFromArray:", v4);

}

uint64_t __55__WBSTranslationDiagnosticData_addExtractedParagraphs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_dictionaryRepresentation");
}

- (void)addTranslatedParagraph:(id)a3
{
  NSMutableArray *translatedParagraphs;
  id v4;

  translatedParagraphs = self->_translatedParagraphs;
  objc_msgSend(a3, "safari_dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray safari_addObjectUnlessNil:](translatedParagraphs, "safari_addObjectUnlessNil:", v4);

}

- (void)addError:(id)a3 forParagraphIdentifier:(id)a4
{
  NSMutableArray *errors;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  errors = self->_errors;
  v9[0] = CFSTR("paragraphIdentifier");
  v9[1] = CFSTR("error");
  v10[0] = a4;
  v6 = a4;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](errors, "addObject:", v8);

}

- (id)saveDiagnosticDataAsTemporaryFiles
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_URLString, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_URLString);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = &stru_1E5449658;
  if (v6)
    v7 = v6;
  v8 = v7;

  -[WBSTranslationDiagnosticData _destinationDirectory](self, "_destinationDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_extractedParagraphsAsJSON)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Translation-%@-Extracted.json"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTranslationDiagnosticData _createFileForContents:fileName:inDirectory:](self, "_createFileForContents:fileName:inDirectory:", self->_extractedParagraphsAsJSON, v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v11);

  }
  if (self->_translatedParagraphsAsJSON)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Translation-%@-Translated.json"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTranslationDiagnosticData _createFileForContents:fileName:inDirectory:](self, "_createFileForContents:fileName:inDirectory:", self->_translatedParagraphsAsJSON, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v13);

  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_URLString, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSMutableArray mutableCopy](self->_extractedParagraphs, "mutableCopy");
  v8 = (void *)v4[1];
  v4[1] = v7;

  v9 = -[NSMutableArray mutableCopy](self->_translatedParagraphs, "mutableCopy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = -[NSString copy](self->_extractedParagraphsAsJSON, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_translatedParagraphsAsJSON, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (id)_createFileForContents:(id)a3 fileName:(id)a4 inDirectory:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v19;

  v7 = (void *)MEMORY[0x1E0CB3620];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_web_pathWithUniqueFilenameForPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_msgSend(v14, "writeToFile:options:error:", v13, 1, &v19);
  v15 = v19;
  if (v15)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[WBSTranslationDiagnosticData _createFileForContents:fileName:inDirectory:].cold.1(v16, v15);
    v17 = 0;
  }
  else
  {
    v17 = v13;
  }

  return v17;
}

- (id)_destinationDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_webkit_createTemporaryDirectoryWithTemplatePrefix:", CFSTR("Translation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (NSArray)errors
{
  return &self->_errors->super;
}

- (NSString)extractedParagraphsAsJSON
{
  return self->_extractedParagraphsAsJSON;
}

- (void)setExtractedParagraphsAsJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)translatedParagraphsAsJSON
{
  return self->_translatedParagraphsAsJSON;
}

- (void)setTranslatedParagraphsAsJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)errorsAsJSON
{
  return self->_errorsAsJSON;
}

- (void)setErrorsAsJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsAsJSON, 0);
  objc_storeStrong((id *)&self->_translatedParagraphsAsJSON, 0);
  objc_storeStrong((id *)&self->_extractedParagraphsAsJSON, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_translatedParagraphs, 0);
  objc_storeStrong((id *)&self->_extractedParagraphs, 0);
}

- (void)_createFileForContents:(void *)a1 fileName:(void *)a2 inDirectory:.cold.1(void *a1, void *a2)
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
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Error writing diagnostic data to disk: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
