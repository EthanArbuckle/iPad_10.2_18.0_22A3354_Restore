@implementation TIKeyboardCandidate

- (unint64_t)customInfoType
{
  return self->_customInfoType;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (void)setTypingEngine:(unsigned int)a3
{
  self->_typingEngine = a3;
}

- (void)setSlotID:(unsigned int)a3
{
  self->_slotID = a3;
}

- (void)setCustomInfoType:(unint64_t)a3
{
  self->_customInfoType = a3;
}

- (TIKeyboardCandidate)init
{
  TIKeyboardCandidate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardCandidate;
  result = -[TIKeyboardCandidate init](&v3, sel_init);
  if (result)
    result->_confidence = 3;
  return result;
}

- (BOOL)isSupplementalItemCandidate
{
  void *v2;
  BOOL v3;

  -[TIKeyboardCandidate supplementalItemIdentifiers](self, "supplementalItemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)supplementalItemIdentifiers
{
  return self->_supplementalItemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lexiconLocale, 0);
  objc_storeStrong((id *)&self->_staticLinguisticLikelihood, 0);
  objc_storeStrong((id *)&self->_smartReplySourceCandidate, 0);
  objc_storeStrong((id *)&self->_supplementalItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_latinCandidate, 0);
  objc_storeStrong((id *)&self->_responseKitCategory, 0);
  objc_storeStrong((id *)&self->_annotationText, 0);
  objc_storeStrong((id *)&self->_alternativeText, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_alternativeText, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v6;

    v8 = -[NSString copyWithZone:](self->_annotationText, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v8;

    *(_DWORD *)(v5 + 36) = self->_slotID;
    *(double *)(v5 + 64) = self->_secureCandidateWidth;
    *(_QWORD *)(v5 + 72) = self->_secureCandidateHash;
    *(_QWORD *)(v5 + 80) = self->_customInfoType;
    *(_QWORD *)(v5 + 88) = self->_indexForMetrics;
    *(_BYTE *)(v5 + 8) = self->_responseKitCandidate;
    v10 = -[NSString copyWithZone:](self->_responseKitCategory, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v10;

    v12 = -[NSArray copyWithZone:](self->_supplementalItemIdentifiers, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v12;

    *(_WORD *)(v5 + 32) = self->_supplementalItemPrefix;
    *(_DWORD *)(v5 + 44) = self->_typingEngine;
    *(_DWORD *)(v5 + 40) = self->_confidence;
    *(_QWORD *)(v5 + 16) = self->_candidateProperty;
    *(_BYTE *)(v5 + 29) = self->_isAlternativeInput;
    *(_BYTE *)(v5 + 30) = self->_shouldHintAtAlternativeInput;
    objc_storeStrong((id *)(v5 + 136), self->_lexiconLocale);
  }
  return (id)v5;
}

- (TIKeyboardCandidate)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardCandidate *v5;
  uint64_t v6;
  NSString *alternativeText;
  uint64_t v8;
  NSString *annotationText;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *responseKitCategory;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *supplementalItemIdentifiers;
  void *v23;
  void *v24;
  TIKeyboardCandidate *v25;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TIKeyboardCandidate;
  v5 = -[TIKeyboardCandidate init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternativeText"));
    v6 = objc_claimAutoreleasedReturnValue();
    alternativeText = v5->_alternativeText;
    v5->_alternativeText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("annotationText"));
    v8 = objc_claimAutoreleasedReturnValue();
    annotationText = v5->_annotationText;
    v5->_annotationText = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slotID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_slotID = objc_msgSend(v10, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureCandidateWidth"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v5->_secureCandidateWidth = v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureCandidateHash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_secureCandidateHash = objc_msgSend(v13, "unsignedLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customInfoType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_customInfoType = objc_msgSend(v14, "unsignedLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexForMetrics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_indexForMetrics = objc_msgSend(v15, "unsignedIntValue");

    v5->_responseKitCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("responseKitCandidate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseKitCategory"));
    v16 = objc_claimAutoreleasedReturnValue();
    responseKitCategory = v5->_responseKitCategory;
    v5->_responseKitCategory = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("supplementalItemIdentifiers"));
    v21 = objc_claimAutoreleasedReturnValue();
    supplementalItemIdentifiers = v5->_supplementalItemIdentifiers;
    v5->_supplementalItemIdentifiers = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supplementalItemPrefix"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supplementalItemPrefix = objc_msgSend(v23, "unsignedShortValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typingEngine"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_typingEngine = objc_msgSend(v24, "unsignedIntValue");

    v5->_confidence = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("candidateConfidence"));
    v5->_candidateProperty = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("candidateProperty"));
    v5->_isAlternativeInput = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAlternativeInput"));
    v5->_shouldHintAtAlternativeInput = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldHintAtAlternativeInput"));
    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *alternativeText;
  NSString *annotationText;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *responseKitCategory;
  NSArray *supplementalItemIdentifiers;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  alternativeText = self->_alternativeText;
  v16 = v4;
  if (alternativeText)
    objc_msgSend(v4, "encodeObject:forKey:", alternativeText, CFSTR("alternativeText"));
  annotationText = self->_annotationText;
  if (annotationText)
    objc_msgSend(v16, "encodeObject:forKey:", annotationText, CFSTR("annotationText"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_slotID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("slotID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secureCandidateWidth);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v8, CFSTR("secureCandidateWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_secureCandidateHash);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("secureCandidateHash"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_customInfoType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v10, CFSTR("customInfoType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_indexForMetrics);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("indexForMetrics"));

  objc_msgSend(v16, "encodeBool:forKey:", self->_responseKitCandidate, CFSTR("responseKitCandidate"));
  responseKitCategory = self->_responseKitCategory;
  if (responseKitCategory)
    objc_msgSend(v16, "encodeObject:forKey:", responseKitCategory, CFSTR("responseKitCategory"));
  supplementalItemIdentifiers = self->_supplementalItemIdentifiers;
  if (supplementalItemIdentifiers)
    objc_msgSend(v16, "encodeObject:forKey:", supplementalItemIdentifiers, CFSTR("supplementalItemIdentifiers"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_supplementalItemPrefix);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v14, CFSTR("supplementalItemPrefix"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_typingEngine);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("typingEngine"));

  objc_msgSend(v16, "encodeInt32:forKey:", self->_confidence, CFSTR("candidateConfidence"));
  objc_msgSend(v16, "encodeInt:forKey:", LODWORD(self->_candidateProperty), CFSTR("candidateProperty"));
  if (self->_isAlternativeInput)
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("isAlternativeInput"));
  if (self->_shouldHintAtAlternativeInput)
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("shouldHintAtAlternativeInput"));

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TIKeyboardCandidate input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidate candidate](self, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TIKeyboardCandidate isExtensionCandidate](self, "isExtensionCandidate");
  -[NSArray componentsJoinedByString:](self->_supplementalItemIdentifiers, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p '%@' -> '%@' (extension: %d), supplementalItemIDs: [%@]>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardCandidate input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidate candidate](self, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("'%@' -> '%@'"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)candidate
{
  return 0;
}

- (NSString)applicationKey
{
  return 0;
}

- (NSString)applicationBundleId
{
  return 0;
}

- (NSString)altDSID
{
  return 0;
}

- (NSUUID)stickerIdentifier
{
  return 0;
}

- (TIProactiveTrigger)proactiveTrigger
{
  return 0;
}

- (NSString)responseKitCategory
{
  return self->_responseKitCategory;
}

- (NSString)inputWithoutSupplementalItemPrefix
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[TIKeyboardCandidate input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  -[TIKeyboardCandidate input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (objc_msgSend(v5, "characterAtIndex:", 0) == self->_supplementalItemPrefix)
    {
      -[TIKeyboardCandidate input](self, "input");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "substringFromIndex:", 1);
      v8 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[TIKeyboardCandidate input](self, "input");
      v8 = objc_claimAutoreleasedReturnValue();
    }

    v6 = (void *)v8;
  }

  return (NSString *)v6;
}

- (BOOL)isAddress
{
  void *v2;
  void *v3;
  void *v4;

  -[TIKeyboardCandidate proactiveTrigger](self, "proactiveTrigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("field"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "containsString:", CFSTR("ADDRESS"));
  return (char)v2;
}

- (NSString)input
{
  return 0;
}

- (unint64_t)learningFlagsMask
{
  return 0;
}

- (NSString)rawInput
{
  return 0;
}

- (unint64_t)wordOriginFeedbackID
{
  return 0;
}

- (unint64_t)deleteCount
{
  return 0;
}

- (int64_t)cursorMovement
{
  return 0;
}

- (unsigned)sourceMask
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unsigned __int8 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  unsigned int v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  int v32;
  unint64_t v33;
  int v34;
  int v35;
  NSUInteger v36;
  objc_super v38;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    -[TIKeyboardCandidate candidate](self, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v8)
      goto LABEL_30;
    -[TIKeyboardCandidate input](self, "input");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "input");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_30;
    -[TIKeyboardCandidate alternativeText](self, "alternativeText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alternativeText");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 == (void *)v13)
    {

    }
    else
    {
      v14 = (void *)v13;
      -[TIKeyboardCandidate alternativeText](self, "alternativeText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alternativeText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (!v17)
        goto LABEL_30;
    }
    -[TIKeyboardCandidate annotationText](self, "annotationText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "annotationText");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[TIKeyboardCandidate annotationText](self, "annotationText");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "annotationText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if (!v24)
        goto LABEL_30;
    }
    v25 = -[TIKeyboardCandidate slotID](self, "slotID");
    if (v25 == objc_msgSend(v5, "slotID"))
    {
      -[TIKeyboardCandidate secureCandidateWidth](self, "secureCandidateWidth");
      v27 = v26;
      objc_msgSend(v5, "secureCandidateWidth");
      if (v27 == v28)
      {
        v29 = -[TIKeyboardCandidate secureCandidateHash](self, "secureCandidateHash");
        if (v29 == objc_msgSend(v5, "secureCandidateHash"))
        {
          v30 = -[TIKeyboardCandidate learningFlagsMask](self, "learningFlagsMask");
          if (v30 == objc_msgSend(v5, "learningFlagsMask"))
          {
            v31 = -[TIKeyboardCandidate isContinuousPathConversion](self, "isContinuousPathConversion");
            if (v31 == objc_msgSend(v5, "isContinuousPathConversion"))
            {
              v32 = -[TIKeyboardCandidate shouldAccept](self, "shouldAccept");
              if (v32 == objc_msgSend(v5, "shouldAccept"))
              {
                v33 = -[TIKeyboardCandidate customInfoType](self, "customInfoType");
                if (v33 == objc_msgSend(v5, "customInfoType"))
                {
                  v34 = -[TIKeyboardCandidate isResponseKitCandidate](self, "isResponseKitCandidate");
                  if (v34 == objc_msgSend(v5, "isResponseKitCandidate"))
                  {
                    v35 = -[TIKeyboardCandidate isTransliterationCandidate](self, "isTransliterationCandidate");
                    if (v35 == objc_msgSend(v5, "isTransliterationCandidate"))
                    {
                      v36 = -[NSArray count](self->_supplementalItemIdentifiers, "count");
                      if ((v36 == objc_msgSend(v5[14], "count")
                         || -[NSArray isEqualToArray:](self->_supplementalItemIdentifiers, "isEqualToArray:", v5[14]))
                        && self->_supplementalItemPrefix == *((unsigned __int16 *)v5 + 16)
                        && self->_typingEngine == *((_DWORD *)v5 + 11)
                        && self->_confidence == *((_DWORD *)v5 + 10)
                        && (id)self->_candidateProperty == v5[2]
                        && self->_isAlternativeInput == *((unsigned __int8 *)v5 + 29))
                      {
                        v18 = self->_shouldHintAtAlternativeInput == *((unsigned __int8 *)v5 + 30);
LABEL_31:

                        goto LABEL_32;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_30:
    v18 = 0;
    goto LABEL_31;
  }
  v38.receiver = self;
  v38.super_class = (Class)TIKeyboardCandidate;
  v18 = -[TIKeyboardCandidate isEqual:](&v38, sel_isEqual_, v4);
LABEL_32:

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[TIKeyboardCandidate candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TIKeyboardCandidate alternativeText](self, "alternativeText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 257 * objc_msgSend(v5, "hash");
  -[TIKeyboardCandidate annotationText](self, "annotationText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + v4 + 65537 * objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isForShortcutConversion
{
  return 0;
}

- (BOOL)isAutocorrection
{
  return 0;
}

- (BOOL)isContinuousPathConversion
{
  return 0;
}

- (BOOL)shouldAccept
{
  return 0;
}

- (BOOL)isNotAutocorrectedSinceTopCandidateVulgar
{
  return -[TIKeyboardCandidate learningFlagsMask](self, "learningFlagsMask") & 1;
}

- (BOOL)shouldInsertSpaceAfterSelection
{
  return 0;
}

- (BOOL)isExtensionCandidate
{
  return 0;
}

- (BOOL)isEmojiCandidate
{
  return 0;
}

- (BOOL)isStickerCandidate
{
  return 0;
}

- (BOOL)isCompletionCandidate
{
  void *v3;
  BOOL v4;

  -[TIKeyboardCandidate input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = -[TIKeyboardCandidate isInlineCompletionCandidate](self, "isInlineCompletionCandidate");
  else
    v4 = 1;

  return v4;
}

- (BOOL)isInlineCompletionCandidate
{
  return 0;
}

- (unsigned)usageTrackingMask
{
  return 0;
}

- (BOOL)isFullwidthCandidate
{
  return 0;
}

- (BOOL)isFacemarkCandidate
{
  return 0;
}

- (BOOL)isPunctuation
{
  void *v2;
  char v3;

  -[TIKeyboardCandidate label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_containsSymbolsAndPunctuationOnly");

  return v3;
}

- (BOOL)isPunctuationKeyCandidate
{
  _BOOL4 v3;

  v3 = -[TIKeyboardCandidate isPunctuation](self, "isPunctuation");
  if (v3)
    LOBYTE(v3) = -[TIKeyboardCandidate deleteCount](self, "deleteCount") != 0;
  return v3;
}

- (BOOL)isPunctuationCompletionCandidate
{
  _BOOL4 v3;

  v3 = -[TIKeyboardCandidate isPunctuation](self, "isPunctuation");
  if (v3)
    LOBYTE(v3) = -[TIKeyboardCandidate deleteCount](self, "deleteCount") == 0;
  return v3;
}

- (BOOL)isOTAWordListCandidate
{
  return 0;
}

- (BOOL)isRegionalCandidate
{
  return 0;
}

- (BOOL)isResponseKitCandidate
{
  return self->_responseKitCandidate;
}

- (BOOL)isBilingualCandidate
{
  return 0;
}

- (BOOL)isSecureContentCandidate
{
  return -[TIKeyboardCandidate slotID](self, "slotID") != 0;
}

- (BOOL)isTransliterationCandidate
{
  return 0;
}

- (BOOL)isPartialCandidate
{
  return 0;
}

- (BOOL)isInlineCandidate
{
  return 0;
}

- (BOOL)isMecabraCandidate
{
  return 0;
}

- (BOOL)isToucanInlineCompletionCandidate
{
  return 0;
}

- (NSNumber)staticLinguisticLikelihood
{
  return 0;
}

- (TIKeyboardCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TIKeyboardCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *alternativeText;
  void *v9;
  uint64_t v10;
  NSString *annotationText;
  double v12;
  void *v13;
  uint64_t v14;
  NSString *responseKitCategory;
  uint64_t v16;
  uint64_t v17;
  NSArray *v18;
  void *v19;
  NSArray *supplementalItemIdentifiers;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TIKeyboardCandidate;
  v5 = -[TIKeyboardCandidate init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeByte");
    objc_msgSend(v4, "decodeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    alternativeText = v5->_alternativeText;
    v5->_alternativeText = (NSString *)v7;

    objc_msgSend(v4, "decodeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    annotationText = v5->_annotationText;
    v5->_annotationText = (NSString *)v10;

    v5->_slotID = objc_msgSend(v4, "decodeUInt32");
    objc_msgSend(v4, "decodeDouble");
    v5->_secureCandidateWidth = v12;
    v5->_secureCandidateHash = objc_msgSend(v4, "decodeUInt64");
    v5->_customInfoType = objc_msgSend(v4, "decodeUInt64");
    v5->_indexForMetrics = objc_msgSend(v4, "decodeUInt32");
    v5->_responseKitCandidate = objc_msgSend(v4, "decodeBool");
    objc_msgSend(v4, "decodeString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    responseKitCategory = v5->_responseKitCategory;
    v5->_responseKitCategory = (NSString *)v14;

    v5->_supplementalItemPrefix = objc_msgSend(v4, "decodeShort");
    v5->_typingEngine = objc_msgSend(v4, "decodeUInt32");
    v5->_confidence = objc_msgSend(v4, "decodeUInt32");
    v16 = objc_msgSend(v4, "decodeUInt64");
    if (v16)
    {
      v17 = v16;
      v18 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v16);
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "decodeUInt64"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v18, "addObject:", v19);

        --v17;
      }
      while (v17);
      supplementalItemIdentifiers = v5->_supplementalItemIdentifiers;
      v5->_supplementalItemIdentifiers = v18;

    }
  }

  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeByte:", objc_msgSend((id)objc_opt_class(), "type"));
  -[TIKeyboardCandidate alternativeText](self, "alternativeText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v5);

  -[TIKeyboardCandidate annotationText](self, "annotationText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v6);

  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidate slotID](self, "slotID"));
  -[TIKeyboardCandidate secureCandidateWidth](self, "secureCandidateWidth");
  objc_msgSend(v4, "encodeDouble:");
  objc_msgSend(v4, "encodeUInt64:", -[TIKeyboardCandidate secureCandidateHash](self, "secureCandidateHash"));
  objc_msgSend(v4, "encodeUInt64:", -[TIKeyboardCandidate customInfoType](self, "customInfoType"));
  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidate indexForMetrics](self, "indexForMetrics"));
  objc_msgSend(v4, "encodeBool:", -[TIKeyboardCandidate isResponseKitCandidate](self, "isResponseKitCandidate"));
  -[TIKeyboardCandidate responseKitCategory](self, "responseKitCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v7);

  objc_msgSend(v4, "encodeShort:", self->_supplementalItemPrefix);
  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidate typingEngine](self, "typingEngine"));
  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidate confidence](self, "confidence"));
  objc_msgSend(v4, "encodeUInt64:", -[NSArray count](self->_supplementalItemIdentifiers, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_supplementalItemIdentifiers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v4, "encodeUInt64:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "unsignedLongLongValue", (_QWORD)v13));
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)candidateByReplacingWithCandidate:(id)a3
{
  return 0;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4
{
  return 0;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 rawInput:(id)a5
{
  return 0;
}

- (id)candidateByReplacingWithSourceMask:(unsigned int)a3
{
  return 0;
}

- (NSString)alternativeText
{
  return self->_alternativeText;
}

- (void)setAlternativeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)annotationText
{
  return self->_annotationText;
}

- (void)setAnnotationText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)secureCandidateWidth
{
  return self->_secureCandidateWidth;
}

- (void)setSecureCandidateWidth:(double)a3
{
  self->_secureCandidateWidth = a3;
}

- (unint64_t)secureCandidateHash
{
  return self->_secureCandidateHash;
}

- (void)setSecureCandidateHash:(unint64_t)a3
{
  self->_secureCandidateHash = a3;
}

- (unint64_t)indexForMetrics
{
  return self->_indexForMetrics;
}

- (void)setIndexForMetrics:(unint64_t)a3
{
  self->_indexForMetrics = a3;
}

- (NSString)latinCandidate
{
  return self->_latinCandidate;
}

- (BOOL)isMeCardCandidate
{
  return self->_isMeCardCandidate;
}

- (void)setIsMeCardCandidate:(BOOL)a3
{
  self->_isMeCardCandidate = a3;
}

- (BOOL)isSendCurrentLocation
{
  return self->_isSendCurrentLocation;
}

- (void)setIsSendCurrentLocation:(BOOL)a3
{
  self->_isSendCurrentLocation = a3;
}

- (void)setSupplementalItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unsigned)supplementalItemPrefix
{
  return self->_supplementalItemPrefix;
}

- (void)setSupplementalItemPrefix:(unsigned __int16)a3
{
  self->_supplementalItemPrefix = a3;
}

- (BOOL)isAsIsCandidate
{
  return self->_asIsCandidate;
}

- (BOOL)isWubixingConvertedByPinyin
{
  return self->_wubixingConvertedByPinyin;
}

- (BOOL)isPrefixMatched
{
  return self->_prefixMatched;
}

- (unint64_t)candidateProperty
{
  return self->_candidateProperty;
}

- (TIKeyboardCandidate)smartReplySourceCandidate
{
  return self->_smartReplySourceCandidate;
}

- (void)setSmartReplySourceCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_smartReplySourceCandidate, a3);
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int)a3
{
  self->_confidence = a3;
}

- (unsigned)typingEngine
{
  return self->_typingEngine;
}

- (void)setStaticLinguisticLikelihood:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isAlternativeInput
{
  return self->_isAlternativeInput;
}

- (void)setIsAlternativeInput:(BOOL)a3
{
  self->_isAlternativeInput = a3;
}

- (BOOL)shouldHintAtAlternativeInput
{
  return self->_shouldHintAtAlternativeInput;
}

- (void)setShouldHintAtAlternativeInput:(BOOL)a3
{
  self->_shouldHintAtAlternativeInput = a3;
}

- (NSString)lexiconLocale
{
  return self->_lexiconLocale;
}

- (void)setLexiconLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)type
{
  return 0;
}

@end
