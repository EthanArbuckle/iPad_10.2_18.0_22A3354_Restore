@implementation RTITextOperations

+ (void)registerCustomInfoClasses:(id)a3 forType:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  +[RTIUtilities registerCustomInfoClasses:forType:forClass:](RTIUtilities, "registerCustomInfoClasses:forType:forClass:", v6, v5, objc_opt_class());

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  TIKeyboardOutput *keyboardOutput;
  TIKeyboardIntermediateText *intermediateText;
  RTIStyledIntermediateText *styledIntermediateText;
  NSString *textToAssert;
  void *v8;
  const char *editingActionSelector;
  void *v10;
  NSArray *multilingualLanguages;
  RTIInputSourceState *inputSourceState;
  NSDictionary *attributedPlaceholders;
  void *v14;
  void *v15;
  NSAttributedString *textCheckingAnnotatedString;
  void *v17;
  NSString *textCheckingAnnotationToRemove;
  NSString *customInfoType;
  NSSecureCoding *customInfo;
  NSMutableArray *fileHandles;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *attachmentDatas;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *imageGlyphs;
  NSUUID *targetSessionUUID;
  void *v29;
  id v30;

  v30 = a3;
  if ((objc_msgSend(v30, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  keyboardOutput = self->_keyboardOutput;
  if (keyboardOutput)
    objc_msgSend(v30, "encodeObject:forKey:", keyboardOutput, CFSTR("keyboardOutput"));
  intermediateText = self->_intermediateText;
  if (intermediateText)
    objc_msgSend(v30, "encodeObject:forKey:", intermediateText, CFSTR("intermediateText"));
  styledIntermediateText = self->_styledIntermediateText;
  if (styledIntermediateText)
    objc_msgSend(v30, "encodeObject:forKey:", styledIntermediateText, CFSTR("styledIntermediateText"));
  textToAssert = self->_textToAssert;
  if (textToAssert)
    objc_msgSend(v30, "encodeObject:forKey:", textToAssert, CFSTR("textToAssert"));
  if (self->_selectionRangeToAssert.location != 0x7FFFFFFFFFFFFFFFLL || self->_selectionRangeToAssert.length)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v8, CFSTR("selectionRangeToAssert"));

  }
  editingActionSelector = self->_editingActionSelector;
  if (editingActionSelector)
  {
    NSStringFromSelector(editingActionSelector);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v10, CFSTR("editingActionSelector"));

  }
  multilingualLanguages = self->_multilingualLanguages;
  if (multilingualLanguages)
    objc_msgSend(v30, "encodeObject:forKey:", multilingualLanguages, CFSTR("multilingualLanguages"));
  inputSourceState = self->_inputSourceState;
  if (inputSourceState)
    objc_msgSend(v30, "encodeObject:forKey:", inputSourceState, CFSTR("inputSourceState"));
  attributedPlaceholders = self->_attributedPlaceholders;
  if (attributedPlaceholders)
    objc_msgSend(v30, "encodeObject:forKey:", attributedPlaceholders, CFSTR("attributedPlaceholders"));
  if (self->_textCheckingAnnotationRange.location != 0x7FFFFFFFFFFFFFFFLL || self->_textCheckingAnnotationRange.length)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v14, CFSTR("textCheckingAnnotationRange"));

  }
  if (self->_textCheckingReplacementRange.location != 0x7FFFFFFFFFFFFFFFLL
    || self->_textCheckingReplacementRange.length)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v15, CFSTR("textCheckingReplacementRange"));

  }
  textCheckingAnnotatedString = self->_textCheckingAnnotatedString;
  if (textCheckingAnnotatedString)
    objc_msgSend(v30, "encodeObject:forKey:", textCheckingAnnotatedString, CFSTR("textCheckingAnnotatedString"));
  if (self->_textCheckingAnnotationRemovalRange.location != 0x7FFFFFFFFFFFFFFFLL
    || self->_textCheckingAnnotationRemovalRange.length)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeObject:forKey:", v17, CFSTR("textCheckingAnnotationRemovalRange"));

  }
  textCheckingAnnotationToRemove = self->_textCheckingAnnotationToRemove;
  if (textCheckingAnnotationToRemove)
    objc_msgSend(v30, "encodeObject:forKey:", textCheckingAnnotationToRemove, CFSTR("textCheckingAnnotationToRemove"));
  customInfoType = self->_customInfoType;
  if (customInfoType)
    objc_msgSend(v30, "encodeObject:forKey:", customInfoType, CFSTR("customInfoType"));
  customInfo = self->_customInfo;
  if (customInfo)
    objc_msgSend(v30, "encodeObject:forKey:", customInfo, CFSTR("customInfo"));
  fileHandles = self->_fileHandles;
  if (fileHandles)
  {
    if (self->_typeIdentifiers)
    {
      v22 = -[NSMutableArray count](fileHandles, "count");
      if (v22 == -[NSMutableArray count](self->_typeIdentifiers, "count"))
      {
        v23 = -[NSMutableArray count](self->_fileHandles, "count");
        if (v23 == -[NSMutableArray count](self->_imageUserInfos, "count"))
        {
          objc_msgSend(v30, "encodeObject:forKey:", self->_fileHandles, CFSTR("fileHandles"));
          objc_msgSend(v30, "encodeObject:forKey:", self->_typeIdentifiers, CFSTR("typeIdentifiers"));
          objc_msgSend(v30, "encodeObject:forKey:", self->_imageUserInfos, CFSTR("imgUserInfo"));
        }
      }
    }
  }
  attachmentDatas = self->_attachmentDatas;
  if (attachmentDatas)
  {
    if (self->_attachmentClasses)
    {
      if (self->_typeIdentifiers)
      {
        v25 = -[NSMutableArray count](attachmentDatas, "count");
        if (v25 == -[NSMutableArray count](self->_attachmentClasses, "count"))
        {
          v26 = -[NSMutableArray count](self->_attachmentClasses, "count");
          if (v26 == -[NSMutableArray count](self->_typeIdentifiers, "count"))
          {
            objc_msgSend(v30, "encodeObject:forKey:", self->_attachmentDatas, CFSTR("attachmentDatas"));
            objc_msgSend(v30, "encodeObject:forKey:", self->_attachmentClasses, CFSTR("attachmentClasses"));
            objc_msgSend(v30, "encodeObject:forKey:", self->_typeIdentifiers, CFSTR("typeIdentifiers"));
          }
        }
      }
    }
  }
  imageGlyphs = self->_imageGlyphs;
  if (imageGlyphs)
    objc_msgSend(v30, "encodeObject:forKey:", imageGlyphs, CFSTR("imageGlyphs"));
  targetSessionUUID = self->_targetSessionUUID;
  v29 = v30;
  if (targetSessionUUID)
  {
    objc_msgSend(v30, "encodeObject:forKey:", targetSessionUUID, CFSTR("targetSessionUUID"));
    v29 = v30;
  }
  objc_msgSend(v29, "encodeBool:forKey:", self->_isExplicitAutoFillInvocation, CFSTR("isExplicitAutoFillInvocation"));
  objc_msgSend(v30, "encodeBool:forKey:", self->_isAutoFillTextOperation, CFSTR("isAutoFillTextOperation"));

}

- (RTITextOperations)initWithCoder:(id)a3
{
  id v4;
  RTITextOperations *v5;
  uint64_t v6;
  TIKeyboardOutput *keyboardOutput;
  TIKeyboardOutput *v8;
  TIKeyboardOutput *v9;
  uint64_t v10;
  TIKeyboardIntermediateText *intermediateText;
  uint64_t v12;
  RTIStyledIntermediateText *styledIntermediateText;
  void *v14;
  uint64_t v15;
  NSString *textToAssert;
  void *v17;
  void *v18;
  uint64_t v19;
  NSUInteger v20;
  void *v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *multilingualLanguages;
  uint64_t v28;
  RTIInputSourceState *inputSourceState;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSDictionary *attributedPlaceholders;
  void *v39;
  uint64_t v40;
  NSUInteger v41;
  void *v42;
  uint64_t v43;
  NSUInteger v44;
  uint64_t v45;
  NSAttributedString *textCheckingAnnotatedString;
  void *v47;
  uint64_t v48;
  NSUInteger v49;
  uint64_t v50;
  NSString *textCheckingAnnotationToRemove;
  uint64_t v52;
  NSString *customInfoType;
  NSString *v54;
  void *v55;
  uint64_t v56;
  NSSecureCoding *customInfo;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSMutableArray *fileHandles;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSMutableArray *typeIdentifiers;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSMutableArray *imageUserInfos;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSMutableArray *attachmentDatas;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NSMutableArray *attachmentClasses;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  NSMutableArray *imageGlyphs;
  uint64_t v100;
  NSUUID *targetSessionUUID;
  void *v103;
  void *v104;
  void *v105;
  NSString *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  Class (*v110)(uint64_t);
  void *v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v5 = -[RTITextOperations init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardOutput"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardOutput = v5->_keyboardOutput;
    v5->_keyboardOutput = (TIKeyboardOutput *)v6;

    if (!v5->_keyboardOutput)
    {
      v8 = (TIKeyboardOutput *)objc_alloc_init(MEMORY[0x1E0DBDC40]);
      v9 = v5->_keyboardOutput;
      v5->_keyboardOutput = v8;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intermediateText"));
    v10 = objc_claimAutoreleasedReturnValue();
    intermediateText = v5->_intermediateText;
    v5->_intermediateText = (TIKeyboardIntermediateText *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("styledIntermediateText"));
    v12 = objc_claimAutoreleasedReturnValue();
    styledIntermediateText = v5->_styledIntermediateText;
    v5->_styledIntermediateText = (RTIStyledIntermediateText *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textToAssert"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    textToAssert = v5->_textToAssert;
    v5->_textToAssert = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectionRangeToAssert"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = objc_msgSend(v17, "rangeValue");
    }
    else
    {
      v20 = 0;
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_selectionRangeToAssert.location = v19;
    v5->_selectionRangeToAssert.length = v20;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("editingActionSelector"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (NSString *)objc_msgSend(v21, "copy");

    if (v22)
      v5->_editingActionSelector = NSSelectorFromString(v22);
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("multilingualLanguages"));
    v26 = objc_claimAutoreleasedReturnValue();
    multilingualLanguages = v5->_multilingualLanguages;
    v5->_multilingualLanguages = (NSArray *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputSourceState"));
    v28 = objc_claimAutoreleasedReturnValue();
    inputSourceState = v5->_inputSourceState;
    v5->_inputSourceState = (RTIInputSourceState *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    v113 = 0;
    v114 = &v113;
    v115 = 0x2050000000;
    v34 = (void *)getNSTextAlternativesClass_softClass;
    v116 = getNSTextAlternativesClass_softClass;
    if (!getNSTextAlternativesClass_softClass)
    {
      v108 = MEMORY[0x1E0C809B0];
      v109 = 3221225472;
      v110 = __getNSTextAlternativesClass_block_invoke;
      v111 = &unk_1E35C2908;
      v112 = &v113;
      __getNSTextAlternativesClass_block_invoke((uint64_t)&v108);
      v34 = (void *)v114[3];
    }
    v107 = v18;
    v35 = objc_retainAutorelease(v34);
    _Block_object_dispose(&v113, 8);
    objc_msgSend(v30, "setWithObjects:", v31, v32, v33, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("attributedPlaceholders"));
    v37 = objc_claimAutoreleasedReturnValue();
    attributedPlaceholders = v5->_attributedPlaceholders;
    v5->_attributedPlaceholders = (NSDictionary *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textCheckingAnnotationRange"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v39;
    if (v39)
    {
      v40 = objc_msgSend(v39, "rangeValue");
    }
    else
    {
      v41 = 0;
      v40 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_textCheckingAnnotationRange.location = v40;
    v5->_textCheckingAnnotationRange.length = v41;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textCheckingReplacementRange"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v42;
    if (v42)
    {
      v43 = objc_msgSend(v42, "rangeValue");
    }
    else
    {
      v44 = 0;
      v43 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_textCheckingReplacementRange.location = v43;
    v5->_textCheckingReplacementRange.length = v44;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textCheckingAnnotatedString"));
    v45 = objc_claimAutoreleasedReturnValue();
    textCheckingAnnotatedString = v5->_textCheckingAnnotatedString;
    v5->_textCheckingAnnotatedString = (NSAttributedString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textCheckingAnnotationRemovalRange"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v47;
    if (v47)
    {
      v48 = objc_msgSend(v47, "rangeValue");
    }
    else
    {
      v49 = 0;
      v48 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_textCheckingAnnotationRemovalRange.location = v48;
    v5->_textCheckingAnnotationRemovalRange.length = v49;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textCheckingAnnotationToRemove"));
    v50 = objc_claimAutoreleasedReturnValue();
    textCheckingAnnotationToRemove = v5->_textCheckingAnnotationToRemove;
    v5->_textCheckingAnnotationToRemove = (NSString *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customInfoType"));
    v52 = objc_claimAutoreleasedReturnValue();
    customInfoType = v5->_customInfoType;
    v5->_customInfoType = (NSString *)v52;

    v54 = v5->_customInfoType;
    if (v54)
    {
      +[RTIUtilities customInfoClassesForType:forClass:](RTIUtilities, "customInfoClassesForType:forClass:", v54, objc_opt_class());
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v55, "count"))
      {
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v55, CFSTR("customInfo"));
        v56 = objc_claimAutoreleasedReturnValue();
        customInfo = v5->_customInfo;
        v5->_customInfo = (NSSecureCoding *)v56;

      }
    }
    v106 = v22;
    v58 = (void *)MEMORY[0x1E0C99E60];
    v59 = objc_opt_class();
    objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v60, CFSTR("fileHandles"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "mutableCopy");
    fileHandles = v5->_fileHandles;
    v5->_fileHandles = (NSMutableArray *)v62;

    v64 = (void *)MEMORY[0x1E0C99E60];
    v65 = objc_opt_class();
    objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v66, CFSTR("typeIdentifiers"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "mutableCopy");
    typeIdentifiers = v5->_typeIdentifiers;
    v5->_typeIdentifiers = (NSMutableArray *)v68;

    v70 = (void *)MEMORY[0x1E0C99E60];
    v71 = objc_opt_class();
    v72 = objc_opt_class();
    v73 = objc_opt_class();
    v74 = objc_opt_class();
    objc_msgSend(v70, "setWithObjects:", v71, v72, v73, v74, objc_opt_class(), 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v75, CFSTR("imgUserInfo"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "mutableCopy");
    imageUserInfos = v5->_imageUserInfos;
    v5->_imageUserInfos = (NSMutableArray *)v77;

    v79 = (void *)MEMORY[0x1E0C99E60];
    v80 = objc_opt_class();
    objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v81, CFSTR("attachmentDatas"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "mutableCopy");
    attachmentDatas = v5->_attachmentDatas;
    v5->_attachmentDatas = (NSMutableArray *)v83;

    v85 = (void *)MEMORY[0x1E0C99E60];
    v86 = objc_opt_class();
    objc_msgSend(v85, "setWithObjects:", v86, objc_opt_class(), 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v87, CFSTR("attachmentClasses"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "mutableCopy");
    attachmentClasses = v5->_attachmentClasses;
    v5->_attachmentClasses = (NSMutableArray *)v89;

    v91 = (void *)MEMORY[0x1E0C99E60];
    v92 = objc_opt_class();
    v113 = 0;
    v114 = &v113;
    v115 = 0x2050000000;
    v93 = (void *)getNSAdaptiveImageGlyphClass_softClass;
    v116 = getNSAdaptiveImageGlyphClass_softClass;
    if (!getNSAdaptiveImageGlyphClass_softClass)
    {
      v108 = MEMORY[0x1E0C809B0];
      v109 = 3221225472;
      v110 = __getNSAdaptiveImageGlyphClass_block_invoke;
      v111 = &unk_1E35C2908;
      v112 = &v113;
      __getNSAdaptiveImageGlyphClass_block_invoke((uint64_t)&v108);
      v93 = (void *)v114[3];
    }
    v94 = objc_retainAutorelease(v93);
    _Block_object_dispose(&v113, 8);
    v95 = objc_opt_class();
    objc_msgSend(v91, "setWithObjects:", v92, v94, v95, objc_opt_class(), 0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v96, CFSTR("imageGlyphs"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v97, "mutableCopy");
    imageGlyphs = v5->_imageGlyphs;
    v5->_imageGlyphs = (NSMutableArray *)v98;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetSessionUUID"));
    v100 = objc_claimAutoreleasedReturnValue();
    targetSessionUUID = v5->_targetSessionUUID;
    v5->_targetSessionUUID = (NSUUID *)v100;

    v5->_isExplicitAutoFillInvocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isExplicitAutoFillInvocation"));
    v5->_isAutoFillTextOperation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutoFillTextOperation"));

  }
  return v5;
}

- (RTITextOperations)init
{
  return -[RTITextOperations initWithTargetSessionUUID:](self, "initWithTargetSessionUUID:", 0);
}

- (RTITextOperations)initWithTargetSessionUUID:(id)a3
{
  id v5;
  char *v6;
  id v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTITextOperations;
  v6 = -[RTITextOperations init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DBDC40]);
    v8 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v7;

    *(_OWORD *)(v6 + 168) = xmmword_1991C7CB0;
    *(_OWORD *)(v6 + 184) = xmmword_1991C7CB0;
    *(_OWORD *)(v6 + 200) = xmmword_1991C7CB0;
    *(_OWORD *)(v6 + 216) = xmmword_1991C7CB0;
    objc_storeStrong((id *)v6 + 19, a3);
  }

  return (RTITextOperations *)v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  const __CFString *v51;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[RTITextOperations keyboardOutput](self, "keyboardOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; keyboardOutput = %@"), v4);

  -[RTITextOperations intermediateText](self, "intermediateText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RTITextOperations intermediateText](self, "intermediateText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; intermediateText = %@"), v6);

  }
  -[RTITextOperations styledIntermediateText](self, "styledIntermediateText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTITextOperations styledIntermediateText](self, "styledIntermediateText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; styledIntermediateText = %@"), v8);

  }
  -[RTITextOperations textToAssert](self, "textToAssert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RTITextOperations textToAssert](self, "textToAssert");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textToAssert = %@"), v10);

  }
  if (-[RTITextOperations selectionRangeToAssert](self, "selectionRangeToAssert") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)MEMORY[0x1E0CB3B18];
    v12 = -[RTITextOperations selectionRangeToAssert](self, "selectionRangeToAssert");
    objc_msgSend(v11, "valueWithRange:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; selectionRangeToAssert = %@"), v14);

  }
  if (-[RTITextOperations editingActionSelector](self, "editingActionSelector"))
  {
    NSStringFromSelector(-[RTITextOperations editingActionSelector](self, "editingActionSelector"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; editingActionSelector = %@"), v15);

  }
  -[RTITextOperations multilingualLanguages](self, "multilingualLanguages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[RTITextOperations multilingualLanguages](self, "multilingualLanguages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; multilingualLanguages = %@"), v17);

  }
  -[RTITextOperations inputSourceState](self, "inputSourceState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[RTITextOperations inputSourceState](self, "inputSourceState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; inputSourceState = %@"), v19);

  }
  if (-[RTITextOperations textCheckingAnnotationRange](self, "textCheckingAnnotationRange") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = (void *)MEMORY[0x1E0CB3B18];
    v21 = -[RTITextOperations textCheckingAnnotationRange](self, "textCheckingAnnotationRange");
    objc_msgSend(v20, "valueWithRange:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textCheckingAnnotationRange = %@"), v23);

  }
  if (-[RTITextOperations textCheckingReplacementRange](self, "textCheckingReplacementRange") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = (void *)MEMORY[0x1E0CB3B18];
    v25 = -[RTITextOperations textCheckingReplacementRange](self, "textCheckingReplacementRange");
    objc_msgSend(v24, "valueWithRange:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textCheckingReplacementRange = %@"), v27);

  }
  -[RTITextOperations textCheckingAnnotatedString](self, "textCheckingAnnotatedString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[RTITextOperations textCheckingAnnotatedString](self, "textCheckingAnnotatedString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textCheckingAnnotatedString = %p"), v29);

  }
  if (-[RTITextOperations textCheckingAnnotationRemovalRange](self, "textCheckingAnnotationRemovalRange") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = (void *)MEMORY[0x1E0CB3B18];
    v31 = -[RTITextOperations textCheckingAnnotationRemovalRange](self, "textCheckingAnnotationRemovalRange");
    objc_msgSend(v30, "valueWithRange:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textCheckingAnnotationRemovalRange = %@"), v33);

  }
  -[RTITextOperations textCheckingAnnotationToRemove](self, "textCheckingAnnotationToRemove");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[RTITextOperations textCheckingAnnotationToRemove](self, "textCheckingAnnotationToRemove");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textCheckingAnnotationToRemove = %@"), v35);

  }
  -[RTITextOperations customInfoType](self, "customInfoType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[RTITextOperations customInfoType](self, "customInfoType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; customInfoType = %@"), v37);

  }
  -[RTITextOperations customInfo](self, "customInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[RTITextOperations customInfo](self, "customInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; customInfo = %@"), v39);

  }
  -[RTITextOperations fileHandles](self, "fileHandles");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "count"))
  {
    -[RTITextOperations typeIdentifiers](self, "typeIdentifiers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (!v42)
      goto LABEL_33;
    -[RTITextOperations typeIdentifiers](self, "typeIdentifiers");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; fileHandles with types = %@"), v40);
  }

LABEL_33:
  -[RTITextOperations attachmentDatas](self, "attachmentDatas");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v43, "count"))
  {
    -[RTITextOperations attachmentClasses](self, "attachmentClasses");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");

    if (!v45)
      goto LABEL_37;
    -[RTITextOperations attachmentClasses](self, "attachmentClasses");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textAttachments = %@"), v43);
  }

LABEL_37:
  -[RTITextOperations imageGlyphs](self, "imageGlyphs");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "count");

  if (v47)
  {
    -[RTITextOperations imageGlyphs](self, "imageGlyphs");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; %lu adaptiveImageGlyphs"), objc_msgSend(v48, "count"));

  }
  -[RTITextOperations targetSessionUUID](self, "targetSessionUUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; targetSessionUUID = %@"), v49);

  if (-[RTITextOperations isExplicitAutoFillInvocation](self, "isExplicitAutoFillInvocation"))
    v50 = CFSTR("YES");
  else
    v50 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("; isExplicitAutoFillInvocation = %@"), v50);
  if (-[RTITextOperations isAutoFillTextOperation](self, "isAutoFillTextOperation"))
    v51 = CFSTR("YES");
  else
    v51 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("; isAutoFillTextOperation = %@"), v51);
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  RTITextOperations *v4;
  RTITextOperations *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  _BOOL4 v125;
  _BOOL4 v126;

  v4 = (RTITextOperations *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTITextOperations keyboardOutput](self, "keyboardOutput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations keyboardOutput](v5, "keyboardOutput");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[RTITextOperations keyboardOutput](self, "keyboardOutput");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations keyboardOutput](v5, "keyboardOutput");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_21;
      }
      -[RTITextOperations intermediateText](self, "intermediateText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations intermediateText](v5, "intermediateText");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[RTITextOperations intermediateText](self, "intermediateText");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations intermediateText](v5, "intermediateText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
          goto LABEL_21;
      }
      -[RTITextOperations styledIntermediateText](self, "styledIntermediateText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations styledIntermediateText](v5, "styledIntermediateText");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {

      }
      else
      {
        v21 = (void *)v20;
        -[RTITextOperations styledIntermediateText](self, "styledIntermediateText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations styledIntermediateText](v5, "styledIntermediateText");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqual:", v23);

        if (!v24)
          goto LABEL_21;
      }
      v25 = (void *)MEMORY[0x1E0CB3940];
      -[RTITextOperations textToAssert](self, "textToAssert");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations textToAssert](v5, "textToAssert");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v25, "_string:matchesString:", v26, v27);

      if (!v12)
        goto LABEL_22;
      v28 = -[RTITextOperations selectionRangeToAssert](self, "selectionRangeToAssert");
      v30 = v29;
      LOBYTE(v12) = 0;
      if (v28 != -[RTITextOperations selectionRangeToAssert](v5, "selectionRangeToAssert") || v30 != v31)
        goto LABEL_22;
      v32 = -[RTITextOperations editingActionSelector](self, "editingActionSelector");
      if (v32 != -[RTITextOperations editingActionSelector](v5, "editingActionSelector"))
        goto LABEL_21;
      -[RTITextOperations multilingualLanguages](self, "multilingualLanguages");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations multilingualLanguages](v5, "multilingualLanguages");
      v35 = objc_claimAutoreleasedReturnValue();
      if (v34 == (void *)v35)
      {

      }
      else
      {
        v36 = (void *)v35;
        -[RTITextOperations multilingualLanguages](self, "multilingualLanguages");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations multilingualLanguages](v5, "multilingualLanguages");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isEqualToArray:", v38);

        if (!v39)
          goto LABEL_21;
      }
      -[RTITextOperations inputSourceState](self, "inputSourceState");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations inputSourceState](v5, "inputSourceState");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v40 == (void *)v41)
      {

      }
      else
      {
        v42 = (void *)v41;
        -[RTITextOperations inputSourceState](self, "inputSourceState");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations inputSourceState](v5, "inputSourceState");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "isEqual:", v44);

        if (!v45)
          goto LABEL_21;
      }
      v46 = -[RTITextOperations textCheckingAnnotationRange](self, "textCheckingAnnotationRange");
      v48 = v47;
      LOBYTE(v12) = 0;
      if (v46 != -[RTITextOperations textCheckingAnnotationRange](v5, "textCheckingAnnotationRange"))
        goto LABEL_22;
      if (v48 != v49)
        goto LABEL_22;
      v50 = -[RTITextOperations textCheckingReplacementRange](self, "textCheckingReplacementRange");
      v52 = v51;
      LOBYTE(v12) = 0;
      if (v50 != -[RTITextOperations textCheckingReplacementRange](v5, "textCheckingReplacementRange") || v52 != v53)
        goto LABEL_22;
      -[RTITextOperations textCheckingAnnotatedString](self, "textCheckingAnnotatedString");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations textCheckingAnnotatedString](v5, "textCheckingAnnotatedString");
      v55 = objc_claimAutoreleasedReturnValue();
      if (v54 == (void *)v55)
      {

      }
      else
      {
        v56 = (void *)v55;
        -[RTITextOperations textCheckingAnnotatedString](self, "textCheckingAnnotatedString");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations textCheckingAnnotatedString](v5, "textCheckingAnnotatedString");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v57, "isEqual:", v58);

        if (!v59)
          goto LABEL_21;
      }
      v60 = -[RTITextOperations textCheckingAnnotationRemovalRange](self, "textCheckingAnnotationRemovalRange");
      v62 = v61;
      LOBYTE(v12) = 0;
      if (v60 != -[RTITextOperations textCheckingAnnotationRemovalRange](v5, "textCheckingAnnotationRemovalRange")
        || v62 != v63)
      {
        goto LABEL_22;
      }
      -[RTITextOperations textCheckingAnnotationToRemove](self, "textCheckingAnnotationToRemove");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations textCheckingAnnotationToRemove](v5, "textCheckingAnnotationToRemove");
      v65 = objc_claimAutoreleasedReturnValue();
      if (v64 == (void *)v65)
      {

      }
      else
      {
        v66 = (void *)v65;
        -[RTITextOperations textCheckingAnnotationToRemove](self, "textCheckingAnnotationToRemove");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations textCheckingAnnotationToRemove](v5, "textCheckingAnnotationToRemove");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v67, "isEqual:", v68);

        if (!v69)
          goto LABEL_21;
      }
      -[RTITextOperations customInfoType](self, "customInfoType");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations customInfoType](v5, "customInfoType");
      v71 = objc_claimAutoreleasedReturnValue();
      if (v70 == (void *)v71)
      {

      }
      else
      {
        v72 = (void *)v71;
        -[RTITextOperations customInfoType](self, "customInfoType");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations customInfoType](v5, "customInfoType");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v73, "isEqual:", v74);

        if (!v75)
          goto LABEL_21;
      }
      -[RTITextOperations customInfo](self, "customInfo");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations customInfo](v5, "customInfo");
      v77 = objc_claimAutoreleasedReturnValue();
      if (v76 == (void *)v77)
      {

      }
      else
      {
        v78 = (void *)v77;
        -[RTITextOperations customInfo](self, "customInfo");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations customInfo](v5, "customInfo");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v79, "isEqual:", v80);

        if (!v81)
          goto LABEL_21;
      }
      -[RTITextOperations fileHandles](self, "fileHandles");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations fileHandles](v5, "fileHandles");
      v83 = objc_claimAutoreleasedReturnValue();
      if (v82 == (void *)v83)
      {

      }
      else
      {
        v84 = (void *)v83;
        -[RTITextOperations fileHandles](self, "fileHandles");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v85, "count");
        -[RTITextOperations fileHandles](v5, "fileHandles");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "count");

        if (v86 != v88)
          goto LABEL_21;
      }
      -[RTITextOperations typeIdentifiers](self, "typeIdentifiers");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations typeIdentifiers](v5, "typeIdentifiers");
      v90 = objc_claimAutoreleasedReturnValue();
      if (v89 == (void *)v90)
      {

      }
      else
      {
        v91 = (void *)v90;
        -[RTITextOperations typeIdentifiers](self, "typeIdentifiers");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations typeIdentifiers](v5, "typeIdentifiers");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v92, "isEqualToArray:", v93);

        if (!v94)
          goto LABEL_21;
      }
      -[RTITextOperations imageUserInfos](self, "imageUserInfos");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations imageUserInfos](v5, "imageUserInfos");
      v96 = objc_claimAutoreleasedReturnValue();
      if (v95 == (void *)v96)
      {

      }
      else
      {
        v97 = (void *)v96;
        -[RTITextOperations imageUserInfos](self, "imageUserInfos");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations imageUserInfos](v5, "imageUserInfos");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v98, "isEqualToArray:", v99);

        if (!v100)
          goto LABEL_21;
      }
      -[RTITextOperations attachmentDatas](self, "attachmentDatas");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations attachmentDatas](v5, "attachmentDatas");
      v102 = objc_claimAutoreleasedReturnValue();
      if (v101 == (void *)v102)
      {

      }
      else
      {
        v103 = (void *)v102;
        -[RTITextOperations attachmentDatas](self, "attachmentDatas");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations attachmentDatas](v5, "attachmentDatas");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend(v104, "isEqualToArray:", v105);

        if (!v106)
          goto LABEL_21;
      }
      -[RTITextOperations attachmentClasses](self, "attachmentClasses");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations attachmentClasses](v5, "attachmentClasses");
      v108 = objc_claimAutoreleasedReturnValue();
      if (v107 == (void *)v108)
      {

      }
      else
      {
        v109 = (void *)v108;
        -[RTITextOperations attachmentClasses](self, "attachmentClasses");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations attachmentClasses](v5, "attachmentClasses");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = objc_msgSend(v110, "isEqualToArray:", v111);

        if (!v112)
          goto LABEL_21;
      }
      -[RTITextOperations imageGlyphs](self, "imageGlyphs");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations imageGlyphs](v5, "imageGlyphs");
      v114 = objc_claimAutoreleasedReturnValue();
      if (v113 == (void *)v114)
      {

      }
      else
      {
        v115 = (void *)v114;
        -[RTITextOperations imageGlyphs](self, "imageGlyphs");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations imageGlyphs](v5, "imageGlyphs");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v116, "isEqualToArray:", v117);

        if (!v118)
          goto LABEL_21;
      }
      -[RTITextOperations targetSessionUUID](self, "targetSessionUUID");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations targetSessionUUID](v5, "targetSessionUUID");
      v120 = objc_claimAutoreleasedReturnValue();
      if (v119 == (void *)v120)
      {

      }
      else
      {
        v121 = (void *)v120;
        -[RTITextOperations targetSessionUUID](self, "targetSessionUUID");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextOperations targetSessionUUID](v5, "targetSessionUUID");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = objc_msgSend(v122, "isEqual:", v123);

        if (!v124)
          goto LABEL_21;
      }
      v125 = -[RTITextOperations isExplicitAutoFillInvocation](self, "isExplicitAutoFillInvocation");
      if (v125 == -[RTITextOperations isExplicitAutoFillInvocation](v5, "isExplicitAutoFillInvocation"))
      {
        v126 = -[RTITextOperations isAutoFillTextOperation](self, "isAutoFillTextOperation");
        v12 = v126 ^ -[RTITextOperations isAutoFillTextOperation](v5, "isAutoFillTextOperation") ^ 1;
        goto LABEL_22;
      }
LABEL_21:
      LOBYTE(v12) = 0;
LABEL_22:

      goto LABEL_23;
    }
    LOBYTE(v12) = 0;
  }
LABEL_23:

  return v12;
}

+ (id)customInfoDictionary
{
  if (customInfoDictionary_onceToken_0 != -1)
    dispatch_once(&customInfoDictionary_onceToken_0, &__block_literal_global_4);
  return (id)customInfoDictionary_customInfoDictionary_0;
}

void __41__RTITextOperations_customInfoDictionary__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)customInfoDictionary_customInfoDictionary_0;
  customInfoDictionary_customInfoDictionary_0 = (uint64_t)v0;

}

+ (void)unregisterCustomInfoType:(id)a3
{
  id v3;

  v3 = a3;
  +[RTIUtilities unregisterCustomInfoType:forClass:](RTIUtilities, "unregisterCustomInfoType:forClass:", v3, objc_opt_class());

}

- (void)insertText:(id)a3 replacementRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[RTITextOperations setSelectionRangeToAssert:](self, "setSelectionRangeToAssert:", location, length);
  -[RTITextOperations keyboardOutput](self, "keyboardOutput");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertText:", v7);

}

- (void)_createAttributedPlaceholdersIfNecessary
{
  NSDictionary *v3;
  NSDictionary *attributedPlaceholders;

  if (!self->_attributedPlaceholders)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    attributedPlaceholders = self->_attributedPlaceholders;
    self->_attributedPlaceholders = v3;

  }
}

- (NSMutableDictionary)mutableAttributedPlaceholders
{
  return (NSMutableDictionary *)self->_attributedPlaceholders;
}

- (void)insertAttributedText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("NSTextAlternatives");
  v11[1] = CFSTR("NSTextAnimation");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTIUtilities _codableAttributedString:validAttributes:](RTIUtilities, "_codableAttributedString:validAttributes:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTITextOperations _createAttributedPlaceholdersIfNecessary](self, "_createAttributedPlaceholdersIfNecessary");
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTITextOperations mutableAttributedPlaceholders](self, "mutableAttributedPlaceholders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v7, v8);

  -[RTITextOperations keyboardOutput](self, "keyboardOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertText:", v8);

}

- (void)insertAttributedText:(id)a3 replacementRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[RTITextOperations setSelectionRangeToAssert:](self, "setSelectionRangeToAssert:", location, length);
  -[RTITextOperations insertAttributedText:](self, "insertAttributedText:", v7);

}

- (NSAttributedString)attributedInsertionText
{
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *attributedPlaceholders;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  if (!self->_attributedPlaceholders)
    return (NSAttributedString *)0;
  -[RTITextOperations keyboardOutput](self, "keyboardOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertionText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);
  attributedPlaceholders = self->_attributedPlaceholders;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__RTITextOperations_attributedInsertionText__block_invoke;
  v12[3] = &unk_1E35C2DE8;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](attributedPlaceholders, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return (NSAttributedString *)v10;
}

void __44__RTITextOperations_attributedInsertionText__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "rangeOfString:", a2);
  v9 = v8;
  +[RTIUtilities _decodableAttributedString:](RTIUtilities, "_decodableAttributedString:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", v7, v9, v10);
}

- (void)insertImageWithFileHandle:(id)a3 typeIdentifier:(id)a4
{
  -[RTITextOperations insertImageWithFileHandle:typeIdentifier:imageUserInfo:](self, "insertImageWithFileHandle:typeIdentifier:imageUserInfo:", a3, a4, 0);
}

- (void)insertImageWithFileHandle:(id)a3 typeIdentifier:(id)a4 imageUserInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if (!self->_fileHandles)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTITextOperations setFileHandles:](self, "setFileHandles:", v10);

  }
  if (!self->_typeIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTITextOperations setTypeIdentifiers:](self, "setTypeIdentifiers:", v11);

  }
  if (!self->_imageUserInfos)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTITextOperations setImageUserInfos:](self, "setImageUserInfos:", v12);

  }
  -[RTITextOperations fileHandles](self, "fileHandles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    goto LABEL_10;
  -[RTITextOperations typeIdentifiers](self, "typeIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {

LABEL_10:
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Not supporting >1 FileHandle insertion at this time."), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise");

    goto LABEL_12;
  }
  -[RTITextOperations imageUserInfos](self, "imageUserInfos");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
    goto LABEL_11;
LABEL_12:
  -[NSMutableArray addObject:](self->_fileHandles, "addObject:", v18);
  -[NSMutableArray addObject:](self->_typeIdentifiers, "addObject:", v8);
  if (!v9)
    v9 = (id)MEMORY[0x1E0C9AA70];
  -[NSMutableArray addObject:](self->_imageUserInfos, "addObject:", v9);

}

- (void)insertTextAttachment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    if (!self->_attachmentDatas)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations setAttachmentDatas:](self, "setAttachmentDatas:", v4);

    }
    if (!self->_attachmentClasses)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations setAttachmentClasses:](self, "setAttachmentClasses:", v5);

    }
    if (!self->_typeIdentifiers)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations setTypeIdentifiers:](self, "setTypeIdentifiers:", v6);

    }
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSMutableArray addObject:](self->_attachmentDatas, "addObject:", v9);
      -[NSMutableArray addObject:](self->_attachmentClasses, "addObject:", v8);
      -[NSMutableArray addObject:](self->_typeIdentifiers, "addObject:", v10);
    }

  }
}

- (void)insertAdaptiveImageGlyph:(id)a3
{
  id v4;
  NSMutableArray *imageGlyphs;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    imageGlyphs = self->_imageGlyphs;
    v7 = v4;
    if (!imageGlyphs)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextOperations setImageGlyphs:](self, "setImageGlyphs:", v6);

      imageGlyphs = self->_imageGlyphs;
    }
    -[NSMutableArray addObject:](imageGlyphs, "addObject:", v7);
    v4 = v7;
  }

}

- (void)enumerateImagesUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *fileHandles;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    fileHandles = self->_fileHandles;
    v7[1] = 3221225472;
    v7[2] = __47__RTITextOperations_enumerateImagesUsingBlock___block_invoke;
    v7[3] = &unk_1E35C2E10;
    v7[4] = self;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[NSMutableArray enumerateObjectsUsingBlock:](fileHandles, "enumerateObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

void __47__RTITextOperations_enumerateImagesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)enumerateImagesAndUserInfosUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *fileHandles;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    fileHandles = self->_fileHandles;
    v7[1] = 3221225472;
    v7[2] = __59__RTITextOperations_enumerateImagesAndUserInfosUsingBlock___block_invoke;
    v7[3] = &unk_1E35C2E10;
    v7[4] = self;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[NSMutableArray enumerateObjectsUsingBlock:](fileHandles, "enumerateObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

void __59__RTITextOperations_enumerateImagesAndUserInfosUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)enumerateTextAttachmentsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *attachmentDatas;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    attachmentDatas = self->_attachmentDatas;
    v7[1] = 3221225472;
    v7[2] = __56__RTITextOperations_enumerateTextAttachmentsUsingBlock___block_invoke;
    v7[3] = &unk_1E35C2E38;
    v7[4] = self;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[NSMutableArray enumerateObjectsUsingBlock:](attachmentDatas, "enumerateObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

void __56__RTITextOperations_enumerateTextAttachmentsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectAtIndexedSubscript:", a3);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("NSEmojiImageTextAttachment")))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v7 = (void *)getNSEmojiImageTextAttachmentClass_softClass;
    v15 = getNSEmojiImageTextAttachmentClass_softClass;
    if (!getNSEmojiImageTextAttachmentClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getNSEmojiImageTextAttachmentClass_block_invoke;
      v11[3] = &unk_1E35C2908;
      v11[4] = &v12;
      __getNSEmojiImageTextAttachmentClass_block_invoke((uint64_t)v11);
      v7 = (void *)v13[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v12, 8);
    v9 = (void *)objc_msgSend([v8 alloc], "initWithData:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(NSClassFromString(v6)), "initWithData:ofType:", v5, v10);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)enumerateAdaptiveImageGlyphsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *imageGlyphs;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    imageGlyphs = self->_imageGlyphs;
    v7[1] = 3221225472;
    v7[2] = __60__RTITextOperations_enumerateAdaptiveImageGlyphsUsingBlock___block_invoke;
    v7[3] = &unk_1E35C2E60;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[NSMutableArray enumerateObjectsUsingBlock:](imageGlyphs, "enumerateObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

uint64_t __60__RTITextOperations_enumerateAdaptiveImageGlyphsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setTextCheckingAnnotatedString:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *textCheckingAnnotatedString;

  +[RTIUtilities _attributedStringWithoutDefaultAttributes:](RTIUtilities, "_attributedStringWithoutDefaultAttributes:", a3);
  v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  textCheckingAnnotatedString = self->_textCheckingAnnotatedString;
  self->_textCheckingAnnotatedString = v4;

}

- (TIKeyboardOutput)keyboardOutput
{
  return self->_keyboardOutput;
}

- (TIKeyboardIntermediateText)intermediateText
{
  return self->_intermediateText;
}

- (void)setIntermediateText:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateText, a3);
}

- (RTIStyledIntermediateText)styledIntermediateText
{
  return self->_styledIntermediateText;
}

- (void)setStyledIntermediateText:(id)a3
{
  objc_storeStrong((id *)&self->_styledIntermediateText, a3);
}

- (NSDictionary)attributedPlaceholders
{
  return self->_attributedPlaceholders;
}

- (void)setAttributedPlaceholders:(id)a3
{
  objc_storeStrong((id *)&self->_attributedPlaceholders, a3);
}

- (NSAttributedString)textCheckingAnnotatedString
{
  return self->_textCheckingAnnotatedString;
}

- (NSMutableArray)fileHandles
{
  return self->_fileHandles;
}

- (void)setFileHandles:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandles, a3);
}

- (NSMutableArray)typeIdentifiers
{
  return self->_typeIdentifiers;
}

- (void)setTypeIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_typeIdentifiers, a3);
}

- (NSMutableArray)imageUserInfos
{
  return self->_imageUserInfos;
}

- (void)setImageUserInfos:(id)a3
{
  objc_storeStrong((id *)&self->_imageUserInfos, a3);
}

- (NSMutableArray)attachmentDatas
{
  return self->_attachmentDatas;
}

- (void)setAttachmentDatas:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentDatas, a3);
}

- (NSMutableArray)attachmentClasses
{
  return self->_attachmentClasses;
}

- (void)setAttachmentClasses:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentClasses, a3);
}

- (NSMutableArray)imageGlyphs
{
  return self->_imageGlyphs;
}

- (void)setImageGlyphs:(id)a3
{
  objc_storeStrong((id *)&self->_imageGlyphs, a3);
}

- (BOOL)isExplicitAutoFillInvocation
{
  return self->_isExplicitAutoFillInvocation;
}

- (void)setIsExplicitAutoFillInvocation:(BOOL)a3
{
  self->_isExplicitAutoFillInvocation = a3;
}

- (BOOL)isAutoFillTextOperation
{
  return self->_isAutoFillTextOperation;
}

- (void)setIsAutoFillTextOperation:(BOOL)a3
{
  self->_isAutoFillTextOperation = a3;
}

- (NSString)textToAssert
{
  return self->_textToAssert;
}

- (void)setTextToAssert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (_NSRange)selectionRangeToAssert
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selectionRangeToAssert.length;
  location = self->_selectionRangeToAssert.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSelectionRangeToAssert:(_NSRange)a3
{
  self->_selectionRangeToAssert = a3;
}

- (SEL)editingActionSelector
{
  return self->_editingActionSelector;
}

- (void)setEditingActionSelector:(SEL)a3
{
  self->_editingActionSelector = a3;
}

- (NSArray)multilingualLanguages
{
  return self->_multilingualLanguages;
}

- (void)setMultilingualLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_multilingualLanguages, a3);
}

- (RTIInputSourceState)inputSourceState
{
  return self->_inputSourceState;
}

- (void)setInputSourceState:(id)a3
{
  objc_storeStrong((id *)&self->_inputSourceState, a3);
}

- (NSString)customInfoType
{
  return self->_customInfoType;
}

- (void)setCustomInfoType:(id)a3
{
  objc_storeStrong((id *)&self->_customInfoType, a3);
}

- (NSSecureCoding)customInfo
{
  return self->_customInfo;
}

- (void)setCustomInfo:(id)a3
{
  objc_storeStrong((id *)&self->_customInfo, a3);
}

- (NSUUID)targetSessionUUID
{
  return self->_targetSessionUUID;
}

- (_NSRange)textCheckingAnnotationRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textCheckingAnnotationRange.length;
  location = self->_textCheckingAnnotationRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextCheckingAnnotationRange:(_NSRange)a3
{
  self->_textCheckingAnnotationRange = a3;
}

- (_NSRange)textCheckingReplacementRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textCheckingReplacementRange.length;
  location = self->_textCheckingReplacementRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextCheckingReplacementRange:(_NSRange)a3
{
  self->_textCheckingReplacementRange = a3;
}

- (_NSRange)textCheckingAnnotationRemovalRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textCheckingAnnotationRemovalRange.length;
  location = self->_textCheckingAnnotationRemovalRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextCheckingAnnotationRemovalRange:(_NSRange)a3
{
  self->_textCheckingAnnotationRemovalRange = a3;
}

- (NSString)textCheckingAnnotationToRemove
{
  return self->_textCheckingAnnotationToRemove;
}

- (void)setTextCheckingAnnotationToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCheckingAnnotationToRemove, 0);
  objc_storeStrong((id *)&self->_targetSessionUUID, 0);
  objc_storeStrong((id *)&self->_customInfo, 0);
  objc_storeStrong((id *)&self->_customInfoType, 0);
  objc_storeStrong((id *)&self->_inputSourceState, 0);
  objc_storeStrong((id *)&self->_multilingualLanguages, 0);
  objc_storeStrong((id *)&self->_textToAssert, 0);
  objc_storeStrong((id *)&self->_imageGlyphs, 0);
  objc_storeStrong((id *)&self->_attachmentClasses, 0);
  objc_storeStrong((id *)&self->_attachmentDatas, 0);
  objc_storeStrong((id *)&self->_imageUserInfos, 0);
  objc_storeStrong((id *)&self->_typeIdentifiers, 0);
  objc_storeStrong((id *)&self->_fileHandles, 0);
  objc_storeStrong((id *)&self->_textCheckingAnnotatedString, 0);
  objc_storeStrong((id *)&self->_attributedPlaceholders, 0);
  objc_storeStrong((id *)&self->_styledIntermediateText, 0);
  objc_storeStrong((id *)&self->_intermediateText, 0);
  objc_storeStrong((id *)&self->_keyboardOutput, 0);
}

@end
