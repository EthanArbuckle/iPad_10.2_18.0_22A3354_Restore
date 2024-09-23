@implementation RKText

+ (id)defaultDataProvider
{
  if (defaultDataProvider_onceToken != -1)
    dispatch_once(&defaultDataProvider_onceToken, &__block_literal_global_5);
  return (id)defaultDataProvider_sDataProvider;
}

void __29__RKText_defaultDataProvider__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultDataProvider_sDataProvider;
  defaultDataProvider_sDataProvider = v0;

}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[7];
  _QWORD v29[7];
  _QWORD v30[15];
  _QWORD v31[17];

  v31[15] = *MEMORY[0x24BDAC8D0];
  v30[0] = CFSTR("None");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v27;
  v30[1] = CFSTR("DateTimeBegin");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v26;
  v30[2] = CFSTR("DateTimeEnd");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v25;
  v30[3] = CFSTR("DateTimeDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v24;
  v30[4] = CFSTR("LocationGeneral");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v23;
  v30[5] = CFSTR("LocationAddress");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v22;
  v30[6] = CFSTR("LocationPointOfInterest");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v2;
  v30[7] = CFSTR("LocationMeetingRoom");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v3;
  v30[8] = CFSTR("LocationSender");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v4;
  v30[9] = CFSTR("LocationRecipient");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v5;
  v30[10] = CFSTR("PolarityNone");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v6;
  v30[11] = CFSTR("PolarityProposal");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[11] = v7;
  v30[12] = CFSTR("PolarityConfirmation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[12] = v8;
  v30[13] = CFSTR("PolarityRejection");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[13] = v9;
  v30[14] = CFSTR("PolarityProposalSupplement");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[14] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 15);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)sAnnotationNames;
  sAnnotationNames = v11;

  v28[0] = CFSTR("None");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v13;
  v28[1] = CFSTR("Proposal");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v14;
  v28[2] = CFSTR("Confirmation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v15;
  v28[3] = CFSTR("Rejection");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v16;
  v28[4] = CFSTR("Ambiguous");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v17;
  v28[5] = CFSTR("ProposalSupplement");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v18;
  v28[6] = CFSTR("Undefined");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 7);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)sPolarityNames;
  sPolarityNames = v20;

}

+ (id)annotationNameFromType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)sAnnotationNames;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeysForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)annotationTypeFromName:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)sAnnotationNames, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

+ (id)polarityNameFromType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)sPolarityNames;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeysForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)polarityTypeFromName:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)sPolarityNames, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (RKText)init
{
  -[RKText doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (RKText)initWithString:(id)a3 andLanguageIdentifier:(id)a4
{
  return -[RKText initWithString:andLanguageIdentifier:trainingWeight:trainVerbatim:](self, "initWithString:andLanguageIdentifier:trainingWeight:trainVerbatim:", a3, a4, 0, 1.0);
}

- (RKText)initWithString:(id)a3 andLanguageIdentifier:(id)a4 trainingWeight:(double)a5 trainVerbatim:(BOOL)a6
{
  id v11;
  id v12;
  RKText *v13;
  RKText *v14;
  uint64_t v15;
  NSString *languageID;
  uint64_t v17;
  NSMutableArray *annotations;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)RKText;
  v13 = -[RKText init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_string, a3);
    +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    languageID = v14->_languageID;
    v14->_languageID = (NSString *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    annotations = v14->_annotations;
    v14->_annotations = (NSMutableArray *)v17;

    v14->_trainingWeight = a5;
    v14->_trainVerbatim = a6;
  }

  return v14;
}

- (void)annotateRange:(_NSRange)a3 type:(unint64_t)a4
{
  -[RKText annotateRange:type:machineGenerated:](self, "annotateRange:type:machineGenerated:", a3.location, a3.length, a4, 0);
}

- (void)annotateRange:(_NSRange)a3 type:(unint64_t)a4 machineGenerated:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  void *v10;
  NSUInteger v11;
  NSRange v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  RKTextAnnotation *v24;
  NSRange v25;
  NSRange v26;
  NSRange v27;
  NSRange v28;
  NSRange v29;
  NSRange v30;
  NSRange v31;
  NSRange v32;
  NSRange v33;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  -[RKText string](self, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  v25.location = 0;
  v25.length = v11;
  v32.location = location;
  v32.length = length;
  if (!NSIntersectionRange(v25, v32).length)
  {
    v16 = (void *)MEMORY[0x24BDBCE88];
    v17 = *MEMORY[0x24BDBCB78];
    v28.location = location;
    v28.length = length;
    NSStringFromRange(v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29.location = 0;
    v29.length = v11;
    NSStringFromRange(v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", v17, CFSTR("Annotation range %@ does not intersect text range %@"), v15, v18);
LABEL_8:

    goto LABEL_9;
  }
  v26.location = 0;
  v26.length = v11;
  v33.location = location;
  v33.length = length;
  v12 = NSUnionRange(v26, v33);
  if (v12.location || v12.length != v11)
  {
    v19 = (void *)MEMORY[0x24BDBCE88];
    v20 = *MEMORY[0x24BDBCB78];
    v30.location = location;
    v30.length = length;
    NSStringFromRange(v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31.location = 0;
    v31.length = v11;
    NSStringFromRange(v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise:format:", v20, CFSTR("Annotation range %@ is not fully contained by text range %@"), v15, v18);
    goto LABEL_8;
  }
  if (length)
    goto LABEL_10;
  v13 = (void *)MEMORY[0x24BDBCE88];
  v14 = *MEMORY[0x24BDBCB78];
  v27.location = location;
  v27.length = 0;
  NSStringFromRange(v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "raise:format:", v14, CFSTR("Annotation range %@ is empty"), v15);
LABEL_9:

LABEL_10:
  v24 = -[RKTextAnnotation initWithRange:andType:machineGenerated:]([RKTextAnnotation alloc], "initWithRange:andType:machineGenerated:", location, length, a4, v5);
  -[RKText annotations](self, "annotations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "containsObject:", v24);

  if ((v22 & 1) == 0)
  {
    -[RKText annotations](self, "annotations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v24);

    -[RKText setProcessedText:](self, "setProcessedText:", 0);
  }

}

- (void)enumerateAnnotationsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void (**v7)(id, uint64_t, uint64_t, uint64_t, char *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  NSRange v24;
  NSRange v25;

  length = a3.length;
  location = a3.location;
  v23 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, uint64_t, uint64_t, uint64_t, char *))a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[RKText annotations](self, "annotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
      v24.location = objc_msgSend(v13, "range");
      v25.location = location;
      v25.length = length;
      if (NSIntersectionRange(v24, v25).length)
      {
        v17 = 0;
        v14 = objc_msgSend(v13, "type");
        v15 = objc_msgSend(v13, "range");
        v7[2](v7, v14, v15, v16, &v17);
        if (v17)
          break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)cleanupData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFLocale *v7;
  __CFString *v8;
  void *v9;
  __CFStringTokenizer *v10;
  CFRange CurrentTokenRange;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  _QWORD v38[6];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[6];
  CFRange v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  CFRange v49;

  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 1;
  -[RKText annotations](self, "annotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __21__RKText_cleanupData__block_invoke;
  v44[3] = &unk_24C6AF5E8;
  v44[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v44);

  v5 = (void *)MEMORY[0x24BDBCEA0];
  -[RKText languageID](self, "languageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeWithLocaleIdentifier:", v6);
  v7 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();

  -[RKText string](self, "string");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[RKText string](self, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49.length = objc_msgSend(v9, "length");
  v49.location = 0;
  v10 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, v49, 4uLL, v7);

  while (*((_BYTE *)v46 + 24))
  {
    if (!CFStringTokenizerAdvanceToNextToken(v10))
      break;
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v10);
    -[RKText annotations](self, "annotations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v4;
    v42[1] = 3221225472;
    v42[2] = __21__RKText_cleanupData__block_invoke_2;
    v42[3] = &unk_24C6AF610;
    v43 = CurrentTokenRange;
    v42[4] = self;
    v42[5] = &v45;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v42);

  }
  if (v10)
    CFRelease(v10);
  if (cleanupData_onceToken2 != -1)
    dispatch_once(&cleanupData_onceToken2, &__block_literal_global_114);
  -[RKText languageID](self, "languageID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)cleanupData_sDateTimeRegEx;
    -[RKText languageID](self, "languageID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      if ((unint64_t)objc_msgSend((id)cleanupData_sDateTimeRegEx, "count") >= 2)
        objc_msgSend((id)cleanupData_sDateTimeRegEx, "removeAllObjects");
      v17 = objc_alloc_init(MEMORY[0x24BDD1500]);
      v18 = (void *)MEMORY[0x24BDBCEA0];
      -[RKText languageID](self, "languageID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localeWithLocaleIdentifier:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLocale:", v20);

      objc_msgSend(v17, "standaloneWeekdaySymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("|"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("\\b(%@)\\b"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v24, 1, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)cleanupData_sDateTimeRegEx;
      -[RKText languageID](self, "languageID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v27);

    }
    v28 = (void *)cleanupData_sDateTimeRegEx;
    -[RKText languageID](self, "languageID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKText string](self, "string");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKText string](self, "string");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v4;
    v41[1] = 3221225472;
    v41[2] = __21__RKText_cleanupData__block_invoke_4;
    v41[3] = &unk_24C6AF658;
    v41[4] = self;
    objc_msgSend(v30, "enumerateMatchesInString:options:range:usingBlock:", v31, 0, 0, objc_msgSend(v32, "length"), v41);

  }
  -[RKText annotations](self, "annotations");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v4;
  v40[1] = 3221225472;
  v40[2] = __21__RKText_cleanupData__block_invoke_5;
  v40[3] = &unk_24C6AF5E8;
  v40[4] = self;
  objc_msgSend(v33, "enumerateObjectsWithOptions:usingBlock:", 2, v40);

  -[RKText annotations](self, "annotations");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __21__RKText_cleanupData__block_invoke_7;
  v39[3] = &unk_24C6AF5E8;
  v39[4] = self;
  objc_msgSend(v34, "enumerateObjectsWithOptions:usingBlock:", 2, v39);

  -[RKText annotations](self, "annotations");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __21__RKText_cleanupData__block_invoke_9;
  v38[3] = &unk_24C6AF6D0;
  v38[4] = self;
  v38[5] = &v45;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v38);

  v36 = *((_BYTE *)v46 + 24);
  _Block_object_dispose(&v45, 8);
  return v36;
}

void __21__RKText_cleanupData__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;

  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v19, "range");
  v8 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v5, 0, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invertedSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v19, "range");
  v14 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v11, 4, v12, v13);
  v16 = v15;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 > v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "taggedText");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("Error: Empty annotation range '%s'\n", (const char *)objc_msgSend(v18, "UTF8String"));

  }
  else if (objc_msgSend(v19, "range") != v8 || v17 != v16 - v8 + v14)
  {
    objc_msgSend(v19, "setRange:", v8, v16 - v8 + v14);
  }

}

void __21__RKText_cleanupData__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  if ((unint64_t)objc_msgSend(v11, "range") > *(_QWORD *)(a1 + 48)
    && (unint64_t)objc_msgSend(v11, "range") < *(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 48)
    || (v6 = objc_msgSend(v11, "range"), (unint64_t)(v6 + v7) > *(_QWORD *)(a1 + 48))
    && (v8 = objc_msgSend(v11, "range"), (unint64_t)(v8 + v9) < *(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 32), "taggedText");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("Error: Invalid annotation range splits word '%s'\n", (const char *)objc_msgSend(v10, "UTF8String"));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __21__RKText_cleanupData__block_invoke_3()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cleanupData_sDateTimeRegEx;
  cleanupData_sDateTimeRegEx = v0;

}

uint64_t __21__RKText_cleanupData__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "range");
  return objc_msgSend(v2, "annotateRange:type:machineGenerated:", v3, v4, 1, 1);
}

void __21__RKText_cleanupData__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a2;
  if (objc_msgSend(v6, "type") == 11)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    objc_msgSend(*(id *)(a1 + 32), "annotations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __21__RKText_cleanupData__block_invoke_6;
    v10[3] = &unk_24C6AF680;
    v8 = v6;
    v11 = v8;
    v12 = &v14;
    v13 = a4;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    if (!*((_BYTE *)v15 + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "taggedText");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("Warning: Proposal annotation does not contain any date information '%s'\n", (const char *)objc_msgSend(v9, "UTF8String"));

      objc_msgSend(v8, "setType:", 14);
    }

    _Block_object_dispose(&v14, 8);
  }

}

void __21__RKText_cleanupData__block_invoke_6(uint64_t a1, void *a2)
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _BYTE *v7;
  id v8;
  NSRange v9;
  NSRange v10;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "range");
  v5 = v4;
  v10.location = objc_msgSend(v8, "range");
  v10.length = v6;
  v9.location = v3;
  v9.length = v5;
  if (NSIntersectionRange(v9, v10).length
    && (objc_msgSend(v8, "type") == 1 || objc_msgSend(v8, "type") == 2 || objc_msgSend(v8, "type") == 3))
  {
    v7 = *(_BYTE **)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *v7 = 1;
  }

}

void __21__RKText_cleanupData__block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __21__RKText_cleanupData__block_invoke_8;
  v9[3] = &unk_24C6AF6A8;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v12 = a3;
  v8 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __21__RKText_cleanupData__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  BOOL v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSRange v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSRange v19;
  NSRange v20;

  v7 = a2;
  if (*(_QWORD *)(a1 + 48) != a3)
  {
    v18 = v7;
    v8 = objc_msgSend(*(id *)(a1 + 32), "type");
    v9 = v8 == objc_msgSend(v18, "type");
    v7 = v18;
    if (v9)
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "range");
      v12 = v11;
      v20.location = objc_msgSend(v18, "range");
      v20.length = v13;
      v19.location = v10;
      v19.length = v12;
      v14 = NSUnionRange(v19, v20);
      v9 = v14.location == objc_msgSend(v18, "range");
      v7 = v18;
      if (v9 && v14.length == v15)
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "machineGenerated") & 1) == 0
          && (objc_msgSend(v18, "machineGenerated") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "taggedText");
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          printf("Warning: Redundant nested annotation ranges '%s'\n", (const char *)objc_msgSend(v16, "UTF8String"));

        }
        objc_msgSend(*(id *)(a1 + 40), "annotations");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectAtIndex:", *(_QWORD *)(a1 + 48));

        *a4 = 1;
        v7 = v18;
      }
    }
  }

}

void __21__RKText_cleanupData__block_invoke_9(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  BOOL v19;
  BOOL v20;
  id v21;
  id v22;
  NSRange v23;
  NSRange v24;

  v22 = a2;
  while (1)
  {
    ++a3;
    objc_msgSend(*(id *)(a1 + 32), "annotations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (a3 >= v8)
      break;
    v9 = objc_msgSend(v22, "range");
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 32), "annotations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "range");
    v16 = v15;

    v23.location = v9;
    v23.length = v11;
    v24.location = v14;
    v24.length = v16;
    if (NSIntersectionRange(v23, v24).length)
    {
      v17 = v9 + v11;
      v18 = v14 + v16;
      v19 = v9 >= v14 || v17 >= v18;
      if (!v19 || (v14 < v9 ? (v20 = v18 >= v17) : (v20 = 1), !v20))
      {
        objc_msgSend(*(id *)(a1 + 32), "taggedText");
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("Error: Invalid staggered annotation ranges '%s'\n", (const char *)objc_msgSend(v21, "UTF8String"));

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        *a4 = 1;
        break;
      }
    }
  }

}

- (id)subTextWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  RKText *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  RKText *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSRange v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  NSRange v26;
  NSRange v27;

  length = a3.length;
  location = a3.location;
  v25 = *MEMORY[0x24BDAC8D0];
  v6 = [RKText alloc];
  -[RKText string](self, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringWithRange:", location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKText languageID](self, "languageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKText trainingWeight](self, "trainingWeight");
  v11 = -[RKText initWithString:andLanguageIdentifier:trainingWeight:trainVerbatim:](v6, "initWithString:andLanguageIdentifier:trainingWeight:trainVerbatim:", v8, v9, -[RKText trainVerbatim](self, "trainVerbatim"), v10);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[RKText annotations](self, "annotations", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v26.location = objc_msgSend(v17, "range");
        v27.location = location;
        v27.length = length;
        v18 = NSIntersectionRange(v26, v27);
        if (v18.length)
          -[RKText annotateRange:type:](v11, "annotateRange:type:", v18.location - location, v18.length, objc_msgSend(v17, "type"));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  return v11;
}

- (id)subTextsByPolarity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKText annotations](self, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("type >= %lu"), 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)MEMORY[0x24BDD1968];
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v12), "range");
        objc_msgSend(v13, "valueWithRange:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __28__RKText_subTextsByPolarity__block_invoke;
  v31[3] = &unk_24C6AEDD0;
  v17 = v4;
  v32 = v17;
  objc_msgSend(v17, "enumerateObjectsWithOptions:usingBlock:", 2, v31);
  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_134);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "rangeValue");
        -[RKText subTextWithRange:](self, "subTextWithRange:", v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v25);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v20);
  }

  return v3;
}

void __28__RKText_subTextsByPolarity__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  void *v14;
  id v15;
  NSRange v16;
  NSRange v17;
  NSRange v18;
  NSRange v19;

  v15 = a2;
  if (a3)
  {
    v5 = 0;
    while (1)
    {
      v6 = objc_msgSend(v15, "rangeValue");
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "rangeValue");
      v12 = v11;

      v16.location = v6;
      v16.length = v8;
      v18.location = v10;
      v18.length = v12;
      if (NSIntersectionRange(v16, v18).length)
        break;
      if (a3 == ++v5)
        goto LABEL_7;
    }
    v17.location = v6;
    v17.length = v8;
    v19.location = v10;
    v19.length = v12;
    v13 = NSUnionRange(v17, v19);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v13.location, v13.length);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v14, v5);

    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", a3);
  }
LABEL_7:

}

uint64_t __28__RKText_subTextsByPolarity__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "rangeValue");
  if (v6 >= objc_msgSend(v5, "rangeValue"))
  {
    v8 = objc_msgSend(v4, "rangeValue");
    v7 = v8 > objc_msgSend(v5, "rangeValue");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (unint64_t)annotatedPolarity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  -[RKText annotations](self, "annotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("type >= %lu"), 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") == 1
      && (objc_msgSend(v5, "objectAtIndexedSubscript:", 0),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "unsignedIntegerValue"),
          v6,
          (unint64_t)(v7 - 10) <= 4))
    {
      v8 = qword_20D3E9100[v7 - 10];
    }
    else
    {
      v8 = 4;
    }
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (id)taggedText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  __CFString *v40;
  void *v41;
  void *v42;
  id obj;
  RKText *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = self;
  -[RKText annotations](self, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __20__RKText_taggedText__block_invoke;
  v50[3] = &unk_24C6AF5E8;
  v6 = v4;
  v51 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v50);

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_155);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_15;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v47;
  do
  {
    v11 = 0;
    v12 = v9;
    do
    {
      if (*(_QWORD *)v47 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v11);
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("location"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v14, "unsignedIntegerValue");

      -[RKText string](v45, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "substringWithRange:", v12, v9 - v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "stringByEscapingXMLEntities");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "appendString:", v17);
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v18, "isEqualToString:", CFSTR("open"));

      if ((_DWORD)v15)
      {
        v19 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@>"), v20);
      }
      else
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("close"));

        if (!v22)
          goto LABEL_11;
        v23 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("</%@>"), v20);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v24);

LABEL_11:
      ++v11;
      v12 = v9;
    }
    while (v8 != v11);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  }
  while (v8);
LABEL_15:

  -[RKText string](v45, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "substringFromIndex:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "stringByEscapingXMLEntities");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendString:", v27);
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "componentsJoinedByString:", CFSTR("<br/>"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "mutableCopy");

  v32 = (void *)MEMORY[0x24BDD17C8];
  -[RKText languageID](v45, "languageID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)MEMORY[0x24BDD17C8];
    -[RKText languageID](v45, "languageID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR(" lang=\"%@\"), v29);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = &stru_24C6B9E08;
  }
  -[RKText trainingWeight](v45, "trainingWeight");
  v37 = v36;
  if (v36 == 1.0)
  {
    v40 = &stru_24C6B9E08;
  }
  else
  {
    v38 = (void *)MEMORY[0x24BDD17C8];
    -[RKText trainingWeight](v45, "trainingWeight");
    objc_msgSend(v38, "stringWithFormat:", CFSTR(" weight=\"%d\"), (int)v39);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v32, "stringWithFormat:", CFSTR("<T%@%@>%@</T>"), v35, v40, v31);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "mutableCopy");

  if (v37 != 1.0)
  if (v33)
  {

  }
  return v42;
}

void __20__RKText_taggedText__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[8];

  v22[6] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RKText annotationNameFromType:](RKText, "annotationNameFromType:", objc_msgSend(v6, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "range"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend(v6, "range");
  v13 = v12;

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11 + v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 32);
  v21[0] = CFSTR("index");
  v21[1] = CFSTR("name");
  v22[0] = v7;
  v22[1] = v8;
  v21[2] = CFSTR("type");
  v21[3] = CFSTR("location");
  v22[2] = CFSTR("open");
  v22[3] = v9;
  v21[4] = CFSTR("openLocation");
  v21[5] = CFSTR("closeLocation");
  v22[4] = v9;
  v22[5] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  v17 = *(void **)(a1 + 32);
  v19[0] = CFSTR("index");
  v19[1] = CFSTR("name");
  v20[0] = v7;
  v20[1] = v8;
  v19[2] = CFSTR("type");
  v19[3] = CFSTR("location");
  v20[2] = CFSTR("close");
  v20[3] = v14;
  v19[4] = CFSTR("openLocation");
  v19[5] = CFSTR("closeLocation");
  v20[4] = v9;
  v20[5] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

}

uint64_t __20__RKText_taggedText__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  unint64_t v41;
  void *v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v7 < v9)
    goto LABEL_2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  if (v12 > v14)
  {
LABEL_4:
    v10 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("close")) & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("open"));

    if ((v18 & 1) != 0)
      goto LABEL_2;
  }
  else
  {

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("open")) & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("close"));

    if ((v21 & 1) != 0)
      goto LABEL_4;
  }
  else
  {

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("open"));

  if (v23)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("closeLocation"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntegerValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("closeLocation"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntegerValue");

    if (v25 <= v27)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("closeLocation"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "unsignedIntegerValue");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("closeLocation"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "unsignedIntegerValue");

      if (v29 < v31)
        goto LABEL_4;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "unsignedIntegerValue");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("index"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "unsignedIntegerValue");

      if (v33 >= v35)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "unsignedIntegerValue");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("index"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v37 > objc_msgSend(v38, "unsignedIntegerValue");
LABEL_23:

        v10 = v39;
        goto LABEL_5;
      }
    }
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openLocation"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "unsignedIntegerValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("openLocation"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "unsignedIntegerValue");

    if (v41 <= v43)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openLocation"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "unsignedIntegerValue");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("openLocation"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "unsignedIntegerValue");

      if (v45 < v47)
        goto LABEL_4;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "unsignedIntegerValue");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("index"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "unsignedIntegerValue");

      if (v49 <= v51)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v36, "unsignedIntegerValue");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("index"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v52 < objc_msgSend(v38, "unsignedIntegerValue");
        goto LABEL_23;
      }
    }
  }
LABEL_2:
  v10 = -1;
LABEL_5:

  return v10;
}

- (id)lsmText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  RKText *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[3];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[RKText processedText](self, "processedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    v38 = 0u;
    -[RKText annotations](self, "annotations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v39 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "type");
          if (v10 <= 9 && ((1 << v10) & 0x3EE) != 0)
            objc_msgSend(v4, "addObject:", v9);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v6);
    }

    objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_171);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__1;
    v36[4] = __Block_byref_object_dispose__1;
    v37 = 0;
    v13 = objc_alloc(MEMORY[0x24BDD1638]);
    v15 = *MEMORY[0x24BDD0F78];
    v42[0] = *MEMORY[0x24BDD0F88];
    v14 = v42[0];
    v42[1] = v15;
    v42[2] = *MEMORY[0x24BDD0F60];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithTagSchemes:options:", v16, 16);

    -[RKText string](self, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setString:", v18);

    objc_msgSend(v17, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __17__RKText_lsmText__block_invoke_174;
    v30[3] = &unk_24C6AF7C0;
    v21 = v17;
    v31 = v21;
    v22 = v4;
    v32 = v22;
    v35 = v36;
    v23 = v12;
    v33 = v23;
    v34 = self;
    objc_msgSend(v21, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v20, v14, 16, v30);

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF != ''"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsJoinedByString:", &stru_24C6B9E08);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "componentsSeparatedByString:", CFSTR(" "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "filteredArrayUsingPredicate:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(" "));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKText setProcessedText:](self, "setProcessedText:", v28);

    _Block_object_dispose(v36, 8);
  }
  -[RKText processedText](self, "processedText");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __17__RKText_lsmText__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "range");
  if (v6 >= objc_msgSend(v5, "range"))
  {
    v8 = objc_msgSend(v4, "range");
    v7 = v8 > objc_msgSend(v5, "range");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __17__RKText_lsmText__block_invoke_174(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  int v40;
  char v41;
  char v42;
  void *v43;
  void *v44;
  _QWORD v45[7];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[5];

  v52[3] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringWithRange:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "tagAtIndex:scheme:tokenRange:sentenceRange:", a3, *MEMORY[0x24BDD0F78], 0, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tagAtIndex:scheme:tokenRange:sentenceRange:", a3, *MEMORY[0x24BDD0F60], 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invertedSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "rangeOfCharacterFromSet:", v13) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v44 = v9;
      v14 = v11;
      v15 = v7;
      v16 = (void *)*MEMORY[0x24BDD0EF0];
      v17 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD0EF0]);

      if ((v17 & 1) != 0)
      {
        v7 = v15;
        v11 = v14;
        v9 = v44;
        goto LABEL_8;
      }
      v12 = v10;
      v10 = v16;
      v7 = v15;
      v11 = v14;
      v9 = v44;
    }
    else
    {

    }
  }
LABEL_8:
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  v51 = 0;
  v18 = *(void **)(a1 + 40);
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __17__RKText_lsmText__block_invoke_2;
  v45[3] = &unk_24C6AF798;
  v45[5] = a3;
  v45[6] = a4;
  v45[4] = &v46;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v45);
  v19 = (void *)v47[5];
  if (v19)
  {
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v22 = *(void **)(v20 + 40);
    v21 = (id *)(v20 + 40);
    if (v22 != v19)
    {
      objc_storeStrong(v21, v19);
      v23 = objc_msgSend((id)v47[5], "type");
      if ((unint64_t)(v23 - 1) >= 9)
        v24 = 0;
      else
        v24 = off_24C6AF7E0[v23 - 1];
      v26 = *(void **)(a1 + 48);
      v27 = (void *)MEMORY[0x24BDD17C8];
      -[__CFString uppercaseString](v24, "uppercaseString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR(" %@ "), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v29);
      goto LABEL_17;
    }
  }
  else
  {
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD0ED0]) & 1) != 0)
    {
      v25 = CFSTR("-");
    }
    else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0F50]))
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("?"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "invertedSet");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v31) == 0x7FFFFFFFFFFFFFFFLL;

      if (v32)
      {
        v25 = CFSTR(" QM ");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("¿"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "invertedSet");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v36) == 0x7FFFFFFFFFFFFFFFLL;

        if (v37)
          v25 = CFSTR(" IQM ");
        else
          v25 = CFSTR(" ");
      }
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0FA0]))
      {
        if ((objc_msgSend(*(id *)(a1 + 56), "trainVerbatim") & 1) != 0
          || !objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD0EF0]))
        {
          if ((objc_msgSend(*(id *)(a1 + 56), "trainVerbatim") & 1) != 0)
            goto LABEL_33;
          v38 = *MEMORY[0x24BDD0F38];
          v52[0] = *MEMORY[0x24BDD0F30];
          v52[1] = v38;
          v52[2] = *MEMORY[0x24BDD0F08];
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "containsObject:", v10);

          if (!v40)
          {
LABEL_33:
            v41 = objc_msgSend(*(id *)(a1 + 56), "trainVerbatim");
            if (v11)
              v42 = v41;
            else
              v42 = 1;
            v43 = *(void **)(a1 + 48);
            if ((v42 & 1) != 0)
              objc_msgSend(v9, "lowercaseString");
            else
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), v11);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addObject:", v28);
            goto LABEL_18;
          }
        }
        v33 = *(void **)(a1 + 48);
        v34 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v10, "uppercaseString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR(" %@ "), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v29);
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      v25 = CFSTR(" ");
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);
  }
LABEL_19:
  _Block_object_dispose(&v46, 8);

}

void __17__RKText_lsmText__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  NSUInteger v7;
  id v8;
  NSRange v9;

  v8 = a2;
  v9.location = objc_msgSend(v8, "range");
  v9.length = v7;
  if (NSIntersectionRange(*(NSRange *)(a1 + 40), v9).length)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)languageID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLanguageID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)trainingWeight
{
  return self->_trainingWeight;
}

- (void)setTrainingWeight:(double)a3
{
  self->_trainingWeight = a3;
}

- (BOOL)trainVerbatim
{
  return self->_trainVerbatim;
}

- (void)setTrainVerbatim:(BOOL)a3
{
  self->_trainVerbatim = a3;
}

- (NSMutableArray)annotations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAnnotations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)processedText
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProcessedText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedText, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
