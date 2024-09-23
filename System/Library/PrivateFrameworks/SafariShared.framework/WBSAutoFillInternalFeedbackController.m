@implementation WBSAutoFillInternalFeedbackController

+ (NSString)titleText
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)informativeText
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)isRegressionOptionText
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)knownWorkingBuildPlaceholderText
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)titleForFeedbackCategory:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      _WBSLocalizedString();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (id)titleForFeedbackDetailType:(id)a3
{
  return titleForFeedbackDetailType(a3, 1);
}

+ (id)placeholderForFeedbackDetailType:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedFormPurpose"))|| objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedExpectedAutoFillInformationTypes"))|| objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedFormPurpose"))|| objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedUnexpectedAutoFillInformationTypes"))|| objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFillingFailedUnfilledFieldsExpectingFilling"))
    || objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataIncorrectFields"))|| objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataExpectedFilledData"))|| objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatIncorrectFields"))|| objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatExpectedFormat")))
  {
    _WBSLocalizedString();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E4B40D18;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillOtherIssue")) & 1) == 0
      && !objc_msgSend(v3, "isEqualToString:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillMultipleIssues")))
    {
      v4 = CFSTR("unknown detail type placeholder");
    }
  }

  return v4;
}

+ (id)titleForAttachmentsType:(unint64_t)a3
{
  if (a3 <= 1)
  {
    _WBSLocalizedString();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (WBSAutoFillInternalFeedbackController)initWithDiagnosticsData:(id)a3
{
  id v5;
  WBSAutoFillInternalFeedbackController *result;
  WBSAutoFillInternalFeedbackController *v7;
  WBSAutoFillInternalFeedbackController *v8;
  uint64_t v9;
  NSMutableDictionary *detailResponses;
  WBSAutoFillInternalFeedbackController *v11;
  objc_super v12;

  v5 = a3;
  result = (WBSAutoFillInternalFeedbackController *)objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall");
  if ((result & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)WBSAutoFillInternalFeedbackController;
    v7 = -[WBSAutoFillInternalFeedbackController init](&v12, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_diagnosticsData, a3);
      v8->_selectedFeedbackCategory = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = objc_claimAutoreleasedReturnValue();
      detailResponses = v8->_detailResponses;
      v8->_detailResponses = (NSMutableDictionary *)v9;

      v8->_selectedAttachmentsType = 1;
      v11 = v8;
    }

    return v8;
  }
  else
  {
    __break(0xC471u);
  }
  return result;
}

- (NSOrderedSet)detailTypesForSelectedFeedbackCategory
{
  void *v2;
  void *v4;
  void *v5;
  const __CFString **v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  switch(self->_selectedFeedbackCategory)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
      return (NSOrderedSet *)(id)objc_claimAutoreleasedReturnValue();
    case 1uLL:
      v4 = (void *)MEMORY[0x1E0C99E40];
      v18 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedFormPurpose");
      v19 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedExpectedAutoFillInformationTypes");
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v18;
      goto LABEL_8;
    case 2uLL:
      v4 = (void *)MEMORY[0x1E0C99E40];
      v16 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedFormPurpose");
      v17 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedUnexpectedAutoFillInformationTypes");
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v16;
      goto LABEL_8;
    case 3uLL:
      v4 = (void *)MEMORY[0x1E0C99E40];
      v15 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFillingFailedUnfilledFieldsExpectingFilling");
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v15;
      goto LABEL_11;
    case 4uLL:
      v4 = (void *)MEMORY[0x1E0C99E40];
      v13 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataIncorrectFields");
      v14 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataExpectedFilledData");
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v13;
      goto LABEL_8;
    case 5uLL:
      v4 = (void *)MEMORY[0x1E0C99E40];
      v11 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatIncorrectFields");
      v12 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatExpectedFormat");
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v11;
LABEL_8:
      v7 = 2;
      goto LABEL_12;
    case 6uLL:
      v4 = (void *)MEMORY[0x1E0C99E40];
      v10 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillOtherIssue");
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v10;
      goto LABEL_11;
    case 7uLL:
      v4 = (void *)MEMORY[0x1E0C99E40];
      v9 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillMultipleIssues");
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v9;
LABEL_11:
      v7 = 1;
LABEL_12:
      objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "orderedSetWithArray:", v8);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return (NSOrderedSet *)v2;
  }
  return (NSOrderedSet *)v2;
}

- (NSString)attachmentDetailsText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSAutoFillInternalFeedbackController diagnosticsData](self, "diagnosticsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)canContinueInTapToRadar
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[5];

  if (!self->_selectedFeedbackCategory)
    return 0;
  -[WBSAutoFillInternalFeedbackController detailTypesForSelectedFeedbackCategory](self, "detailTypesForSelectedFeedbackCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__WBSAutoFillInternalFeedbackController_canContinueInTapToRadar__block_invoke;
  v7[3] = &unk_1E4B29B98;
  v7[4] = self;
  v5 = objc_msgSend(v4, "safari_allObjectsPassTest:", v7);

  return v5;
}

BOOL __64__WBSAutoFillInternalFeedbackController_canContinueInTapToRadar__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)_radarTitleComponentForDetails
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *detailResponses;
  const __CFString *v8;
  NSMutableDictionary *v9;
  const __CFString *v10;

  switch(self->_selectedFeedbackCategory)
  {
    case 1uLL:
      v2 = (void *)MEMORY[0x1E0CB3940];
      -[NSMutableDictionary objectForKeyedSubscript:](self->_detailResponses, "objectForKeyedSubscript:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillNotOfferedExpectedAutoFillInformationTypes"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringWithFormat:", CFSTR("Expected: %@"), v3);
      goto LABEL_9;
    case 2uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      -[NSMutableDictionary objectForKeyedSubscript:](self->_detailResponses, "objectForKeyedSubscript:", CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillIncorrectlyOfferedUnexpectedAutoFillInformationTypes"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Unexpected: %@"), v3);
      goto LABEL_9;
    case 3uLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      detailResponses = self->_detailResponses;
      v8 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFillingFailedUnfilledFieldsExpectingFilling");
      goto LABEL_8;
    case 4uLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      detailResponses = self->_detailResponses;
      v8 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectDataIncorrectFields");
      goto LABEL_8;
    case 5uLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      detailResponses = self->_detailResponses;
      v8 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillFilledIncorrectFormatIncorrectFields");
LABEL_8:
      -[NSMutableDictionary objectForKeyedSubscript:](detailResponses, "objectForKeyedSubscript:", v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Fields: %@"), v3);
LABEL_9:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v4;
    case 6uLL:
      v9 = self->_detailResponses;
      v10 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillOtherIssue");
      goto LABEL_12;
    case 7uLL:
      v9 = self->_detailResponses;
      v10 = CFSTR("WBSAutoFillInternalFeedbackDetailTypeAutoFillMultipleIssues");
LABEL_12:
      -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = &stru_1E4B40D18;
      break;
  }
  return v4;
}

- (NSURL)continueInTapToRadarURL
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WBSAutoFillInternalFeedbackController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  WBSAutoFillInternalFeedbackController *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  WBSInternalFeedbackRadar *v39;
  void *v40;
  WBSInternalFeedbackRadar *v41;
  void *v42;
  void *v43;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CFString *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (self->_regression)
  {
    if (-[NSString length](self->_knownWorkingBuild, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("REGRESSION(last worked in %@) "), self->_knownWorkingBuild);
      v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Marked as regression by filer as last working in %@."), self->_knownWorkingBuild);
      v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = CFSTR("REGRESSION ");
      v4 = CFSTR("Marked as regression by filer with no last known working version.");
    }
  }
  else
  {
    v4 = 0;
    v3 = &stru_1E4B40D18;
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = self->_selectedFeedbackCategory - 1;
  v46 = (__CFString *)v4;
  if (v6 > 6)
    v7 = CFSTR("No issue");
  else
    v7 = off_1E4B29BF8[v6];
  -[WBSAutoFillInternalFeedbackDiagnosticsData url](self->_diagnosticsData, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSAutoFillInternalFeedbackController _radarTitleComponentForDetails](self, "_radarTitleComponentForDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (__CFString *)v3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Safari AutoFill [in-app feedback]: %@%@ on %@ (%@)"), v3, v7, v9, v10);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v12 = self;
  -[WBSAutoFillInternalFeedbackController detailTypesForSelectedFeedbackCategory](self, "detailTypesForSelectedFeedbackCategory");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1E0CB3940];
        titleForFeedbackDetailType(v17, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR(" * %@"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v20);

        v21 = (void *)MEMORY[0x1E0CB3940];
        -[NSMutableDictionary objectForKeyedSubscript:](v12->_detailResponses, "objectForKeyedSubscript:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@\n"), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v23);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v14);
  }

  v24 = (void *)MEMORY[0x1E0CB3940];
  v25 = v12;
  -[WBSAutoFillInternalFeedbackDiagnosticsData url](v12->_diagnosticsData, "url");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("URL: %@\n"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v27);

  if (v46)
    objc_msgSend(v11, "addObject:", v46);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25->_selectedAttachmentsType == 1)
  {
    -[WBSAutoFillInternalFeedbackDiagnosticsData writeTemporaryFileWithFormMetadata](v25->_diagnosticsData, "writeTemporaryFileWithFormMetadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v28, "addObject:", v29);
      v30 = CFSTR("Form metadata attached.");
    }
    else
    {
      v30 = CFSTR("Safari was unable to attach form metadata for this issue.");
    }
    objc_msgSend(v11, "addObject:", v30);

  }
  v31 = (void *)MEMORY[0x1E0CB3940];
  -[WBSAutoFillInternalFeedbackDiagnosticsData creationDateString](v25->_diagnosticsData, "creationDateString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("Diagnostics collection was triggered at %@"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v33);

  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v25->_selectedFeedbackCategory - 1;
  if (v35 > 6)
    v36 = CFSTR("1723118");
  else
    v36 = off_1E4B29C30[v35];
  v53 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "mutableCopy");

  if (v25->_regression)
    objc_msgSend(v38, "addObject:", CFSTR("1804822"));
  v39 = [WBSInternalFeedbackRadar alloc];
  +[WBSInternalFeedbackRadarComponent safariAutoFill](WBSInternalFeedbackRadarComponent, "safariAutoFill");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[WBSInternalFeedbackRadar initWithComponent:title:descriptionTemplate:](v39, "initWithComponent:title:descriptionTemplate:", v40, v45, v34);

  -[WBSInternalFeedbackRadar setClassification:](v41, "setClassification:", CFSTR("Serious Bug"));
  -[WBSInternalFeedbackRadar setReproducibility:](v41, "setReproducibility:", CFSTR("Not Applicable"));
  -[WBSInternalFeedbackRadar setKeywords:](v41, "setKeywords:", v38);
  objc_msgSend(v28, "safari_mapObjectsUsingBlock:", &__block_literal_global_0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSInternalFeedbackRadar setAttachmentPaths:](v41, "setAttachmentPaths:", v42);

  -[WBSInternalFeedbackRadar continueInTapToRadarURL](v41, "continueInTapToRadarURL");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v43;
}

uint64_t __64__WBSAutoFillInternalFeedbackController_continueInTapToRadarURL__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "path");
}

- (id)responseForDetailType:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detailResponses, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)setResponse:(id)a3 forDetailType:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_detailResponses, "setObject:forKeyedSubscript:", v7, v6);

}

- (WBSAutoFillInternalFeedbackDiagnosticsData)diagnosticsData
{
  return self->_diagnosticsData;
}

- (unint64_t)selectedFeedbackCategory
{
  return self->_selectedFeedbackCategory;
}

- (void)setSelectedFeedbackCategory:(unint64_t)a3
{
  self->_selectedFeedbackCategory = a3;
}

- (BOOL)isRegression
{
  return self->_regression;
}

- (void)setRegression:(BOOL)a3
{
  self->_regression = a3;
}

- (NSString)knownWorkingBuild
{
  return self->_knownWorkingBuild;
}

- (void)setKnownWorkingBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)selectedAttachmentsType
{
  return self->_selectedAttachmentsType;
}

- (void)setSelectedAttachmentsType:(unint64_t)a3
{
  self->_selectedAttachmentsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownWorkingBuild, 0);
  objc_storeStrong((id *)&self->_diagnosticsData, 0);
  objc_storeStrong((id *)&self->_detailResponses, 0);
}

@end
