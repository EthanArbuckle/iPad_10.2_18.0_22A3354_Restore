@implementation TIZephyrCandidate

- (void)setContinuousPathConversion:(BOOL)a3
{
  int v3;

  self->_continuousPathConversion = a3;
  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_usageTrackingMask = self->_usageTrackingMask & 0xFFF7FFFF | v3;
}

- (NSString)label
{
  NSString *label;
  objc_super v4;

  label = self->_label;
  if (label)
    return label;
  v4.receiver = self;
  v4.super_class = (Class)TIZephyrCandidate;
  -[TIKeyboardCandidate label](&v4, sel_label);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  label = self->_label;
  self->_label = v4;

}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 wordOriginFeedbackID:(unint64_t)a5
{
  return -[TIZephyrCandidate initWithCandidate:forInput:rawInput:wordOriginFeedbackID:](self, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:", a3, a4, 0, a5);
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6
{
  return -[TIZephyrCandidate initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:](self, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", a3, a4, a5, a6, 0, 0);
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[TIZephyrCandidate initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:secureContentCandidate:proactiveTrigger:proactivePredictedItem:](self, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:secureContentCandidate:proactiveTrigger:proactivePredictedItem:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8, v9, 0, 0);
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8 learningFlagsMask:(unint64_t)a9
{
  TIZephyrCandidate *v11;
  TIZephyrCandidate *v12;
  TIProactiveTrigger *proactiveTrigger;
  _ICPredictedItem *proactivePredictedItem;
  NSString *responseKitCategory;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TIZephyrCandidate;
  v11 = -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:sourceMask:learningFlagsMask:](&v17, sel_initWithCandidate_forInput_rawInput_sourceMask_learningFlagsMask_, a3, a4, a5, *(_QWORD *)&a8, a9);
  v12 = v11;
  if (v11)
  {
    v11->_wordOriginFeedbackID = a6;
    v11->_usageTrackingMask = a7;
    v11->_isSecureContentCandidate = 0;
    proactiveTrigger = v11->_proactiveTrigger;
    v11->_proactiveTrigger = 0;

    proactivePredictedItem = v12->_proactivePredictedItem;
    v12->_proactivePredictedItem = 0;

    responseKitCategory = v12->_responseKitCategory;
    v12->_responseKitCategory = 0;

    v12->_dynamicUsageCount = -1;
    v12->_dynamicPenaltyCount = -1;
  }
  return v12;
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8 secureContentCandidate:(BOOL)a9 proactiveTrigger:(id)a10 proactivePredictedItem:(id)a11 responseKitCategory:(id)a12
{
  uint64_t v12;
  id v18;
  TIZephyrCandidate *v19;
  TIZephyrCandidate *v20;
  id v23;
  id v24;
  objc_super v25;

  v12 = *(_QWORD *)&a8;
  v24 = a10;
  v23 = a11;
  v18 = a12;
  v25.receiver = self;
  v25.super_class = (Class)TIZephyrCandidate;
  v19 = -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:sourceMask:](&v25, sel_initWithCandidate_forInput_rawInput_sourceMask_, a3, a4, a5, v12);
  v20 = v19;
  if (v19)
  {
    v19->_wordOriginFeedbackID = a6;
    v19->_usageTrackingMask = a7;
    v19->_isSecureContentCandidate = a9;
    objc_storeStrong((id *)&v19->_proactiveTrigger, a10);
    objc_storeStrong((id *)&v20->_proactivePredictedItem, a11);
    objc_storeStrong((id *)&v20->_responseKitCategory, a12);
    v20->_dynamicUsageCount = -1;
    v20->_dynamicPenaltyCount = -1;
  }

  return v20;
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8 secureContentCandidate:(BOOL)a9 proactiveTrigger:(id)a10 proactivePredictedItem:(id)a11
{
  uint64_t v12;

  LOBYTE(v12) = a9;
  return -[TIZephyrCandidate initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:secureContentCandidate:proactiveTrigger:proactivePredictedItem:responseKitCategory:](self, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:secureContentCandidate:proactiveTrigger:proactivePredictedItem:responseKitCategory:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8, v12, a10, a11, 0);
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 responseKitCategory:(id)a4
{
  id v7;
  TIZephyrCandidate *v8;
  TIZephyrCandidate *v9;
  TIProactiveTrigger *proactiveTrigger;
  _ICPredictedItem *proactivePredictedItem;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TIZephyrCandidate;
  v8 = -[TIKeyboardCandidateSingle initWithResponseCandidate:](&v13, sel_initWithResponseCandidate_, a3);
  v9 = v8;
  if (v8)
  {
    v8->_wordOriginFeedbackID = 0;
    v8->_usageTrackingMask = 0;
    v8->_isSecureContentCandidate = 0;
    proactiveTrigger = v8->_proactiveTrigger;
    v8->_proactiveTrigger = 0;

    proactivePredictedItem = v9->_proactivePredictedItem;
    v9->_proactivePredictedItem = 0;

    objc_storeStrong((id *)&v9->_responseKitCategory, a4);
  }

  return v9;
}

- (unint64_t)wordOriginFeedbackID
{
  return self->_wordOriginFeedbackID;
}

- (BOOL)isAutocorrection
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[TIKeyboardCandidateSingle candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TIKeyboardCandidateSingle candidate](self, "candidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateSingle input](self, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TIZephyrCandidate;
  v5 = -[TIKeyboardCandidateSingle copyWithZone:](&v18, sel_copyWithZone_);
  v6 = v5;
  if (v5)
  {
    v5[31] = self->_wordOriginFeedbackID;
    *((_DWORD *)v5 + 58) = self->_usageTrackingMask;
    *((_BYTE *)v5 + 224) = self->_isFromPhraseDictionary;
    *((_BYTE *)v5 + 225) = self->_isFromTextChecker;
    v7 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
    v8 = (void *)v6[38];
    v6[38] = v7;

    v9 = -[TIProactiveTrigger copyWithZone:](self->_proactiveTrigger, "copyWithZone:", a3);
    v10 = (void *)v6[32];
    v6[32] = v9;

    v11 = -[NSString copyWithZone:](self->_responseKitCategory, "copyWithZone:", a3);
    v12 = (void *)v6[33];
    v6[33] = v11;

    v13 = -[NSString copyWithZone:](self->_fromBundleId, "copyWithZone:", a3);
    v14 = (void *)v6[34];
    v6[34] = v13;

    v6[35] = self->_ageForConnectionsMetrics;
    objc_msgSend(v6, "setContinuousPathConversion:", self->_continuousPathConversion);
    v6[36] = *(_QWORD *)&self->_excessPathRatio;
    *((_BYTE *)v6 + 228) = self->_shouldAccept;
    *((_BYTE *)v6 + 229) = self->_shouldInsertSpaceAfterSelection;
    v15 = -[_ICPredictedItem copyWithZone:](self->_proactivePredictedItem, "copyWithZone:", a3);
    v16 = (void *)v6[37];
    v6[37] = v15;

    *((_BYTE *)v6 + 230) = self->_toucanInlineCompletionCandidate;
  }
  return v6;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 label:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  -[TIKeyboardCandidateSingle candidateByReplacingWithCandidate:input:](self, "candidateByReplacingWithCandidate:input:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLabel:", v8);

  return v9;
}

- (TIZephyrCandidate)initWithCoder:(id)a3
{
  id v4;
  TIZephyrCandidate *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSString *responseKitCategory;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIZephyrCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_wordOriginFeedbackID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wordOriginFeedbackID"));
    v5->_usageTrackingMask = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("usageTrackingMask"));
    v5->_isFromPhraseDictionary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFromPhraseDictionary"));
    v5->_isFromTextChecker = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFromTextChecker"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseKitCategory"));
    v8 = objc_claimAutoreleasedReturnValue();
    responseKitCategory = v5->_responseKitCategory;
    v5->_responseKitCategory = (NSString *)v8;

    -[TIZephyrCandidate setContinuousPathConversion:](v5, "setContinuousPathConversion:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("continuousPathConversion")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pathLengthDelta"));
    v5->_excessPathRatio = v10;
    v5->_shouldAccept = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAccept"));
    v5->_shouldInsertSpaceAfterSelection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldInsertSpaceAfterSelection"));
    v5->_toucanInlineCompletionCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("toucanInlineCompletionCandidate"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t wordOriginFeedbackID;
  uint64_t usageTrackingMask;
  NSString *label;
  NSString *responseKitCategory;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIZephyrCandidate;
  -[TIKeyboardCandidateSingle encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  wordOriginFeedbackID = self->_wordOriginFeedbackID;
  if (wordOriginFeedbackID)
    objc_msgSend(v4, "encodeInteger:forKey:", wordOriginFeedbackID, CFSTR("wordOriginFeedbackID"));
  usageTrackingMask = self->_usageTrackingMask;
  if ((_DWORD)usageTrackingMask)
    objc_msgSend(v4, "encodeInteger:forKey:", usageTrackingMask, CFSTR("usageTrackingMask"));
  if (self->_isFromPhraseDictionary)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("isFromPhraseDictionary"));
  if (self->_isFromTextChecker)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("isFromTextChecker"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "encodeObject:forKey:", label, CFSTR("label"));
  responseKitCategory = self->_responseKitCategory;
  if (responseKitCategory)
    objc_msgSend(v4, "encodeObject:forKey:", responseKitCategory, CFSTR("responseKitCategory"));
  if (self->_continuousPathConversion)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("continuousPathConversion"));
  if (self->_shouldAccept)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("shouldAccept"));
  if (self->_shouldInsertSpaceAfterSelection)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("shouldInsertSpaceAfterSelection"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pathLengthDelta"), self->_excessPathRatio);
  if (self->_toucanInlineCompletionCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("toucanInlineCompletionCandidate"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TIKeyboardCandidateSingle input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateSingle candidate](self, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TIKeyboardCandidateSingle isExtensionCandidate](self, "isExtensionCandidate");
  autoCorrectionTypeAsString(-[TIZephyrCandidate usageTrackingMask](self, "usageTrackingMask"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  candidateSourceAsString(-[TIKeyboardCandidateSingle sourceMask](self, "sourceMask"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)TIZephyrCandidate;
  v10 = -[TIZephyrCandidate class](&v15, sel_class);
  v14.receiver = self;
  v14.super_class = (Class)TIZephyrCandidate;
  -[TIKeyboardCandidateSingle description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p '%@' -> '%@' (extension: %d) UTM=%@, SM=%@> <%@: %@>"), v4, self, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (TIZephyrCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TIZephyrCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *label;
  NSString *v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIZephyrCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCandidateResultSetCoder:](&v12, sel_initWithCandidateResultSetCoder_, v4);
  if (v5)
  {
    v5->_wordOriginFeedbackID = objc_msgSend(v4, "decodeUInt64");
    v5->_usageTrackingMask = objc_msgSend(v4, "decodeUInt32");
    v5->_isFromPhraseDictionary = objc_msgSend(v4, "decodeBool");
    v5->_isFromTextChecker = objc_msgSend(v4, "decodeBool");
    objc_msgSend(v4, "decodeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v7;

    if (!-[NSString length](v5->_label, "length"))
    {
      v9 = v5->_label;
      v5->_label = 0;

    }
    -[TIZephyrCandidate setContinuousPathConversion:](v5, "setContinuousPathConversion:", objc_msgSend(v4, "decodeBool"));
    objc_msgSend(v4, "decodeDouble");
    v5->_excessPathRatio = v10;
    v5->_shouldAccept = objc_msgSend(v4, "decodeBool");
    v5->_shouldInsertSpaceAfterSelection = objc_msgSend(v4, "decodeBool");
    v5->_toucanInlineCompletionCandidate = objc_msgSend(v4, "decodeBool");
  }

  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  const __CFString *label;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIZephyrCandidate;
  v4 = a3;
  -[TIKeyboardCandidateSingle encodeWithCandidateResultSetCoder:](&v6, sel_encodeWithCandidateResultSetCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:", -[TIZephyrCandidate wordOriginFeedbackID](self, "wordOriginFeedbackID", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeUInt32:", self->_usageTrackingMask);
  objc_msgSend(v4, "encodeBool:", -[TIZephyrCandidate isFromPhraseDictionary](self, "isFromPhraseDictionary"));
  objc_msgSend(v4, "encodeBool:", -[TIZephyrCandidate isFromTextChecker](self, "isFromTextChecker"));
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = &stru_1E243B990;
  objc_msgSend(v4, "encodeString:", label);
  objc_msgSend(v4, "encodeBool:", self->_continuousPathConversion);
  objc_msgSend(v4, "encodeDouble:", self->_excessPathRatio);
  objc_msgSend(v4, "encodeBool:", self->_shouldAccept);
  objc_msgSend(v4, "encodeBool:", self->_shouldInsertSpaceAfterSelection);
  objc_msgSend(v4, "encodeBool:", self->_toucanInlineCompletionCandidate);

}

- (unsigned)usageTrackingMask
{
  return self->_usageTrackingMask;
}

- (BOOL)isFromPhraseDictionary
{
  return self->_isFromPhraseDictionary;
}

- (void)setIsFromPhraseDictionary:(BOOL)a3
{
  self->_isFromPhraseDictionary = a3;
}

- (BOOL)isFromTextChecker
{
  return self->_isFromTextChecker;
}

- (void)setIsFromTextChecker:(BOOL)a3
{
  self->_isFromTextChecker = a3;
}

- (BOOL)isSecureContentCandidate
{
  return self->_isSecureContentCandidate;
}

- (id)proactiveTrigger
{
  return self->_proactiveTrigger;
}

- (id)responseKitCategory
{
  return self->_responseKitCategory;
}

- (NSString)fromBundleId
{
  return self->_fromBundleId;
}

- (void)setFromBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (unint64_t)ageForConnectionsMetrics
{
  return self->_ageForConnectionsMetrics;
}

- (void)setAgeForConnectionsMetrics:(unint64_t)a3
{
  self->_ageForConnectionsMetrics = a3;
}

- (BOOL)isContinuousPathConversion
{
  return self->_continuousPathConversion;
}

- (double)excessPathRatio
{
  return self->_excessPathRatio;
}

- (void)setExcessPathRatio:(double)a3
{
  self->_excessPathRatio = a3;
}

- (_ICPredictedItem)proactivePredictedItem
{
  return self->_proactivePredictedItem;
}

- (void)setProactivePredictedItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)shouldAccept
{
  return self->_shouldAccept;
}

- (void)setShouldAccept:(BOOL)a3
{
  self->_shouldAccept = a3;
}

- (BOOL)shouldInsertSpaceAfterSelection
{
  return self->_shouldInsertSpaceAfterSelection;
}

- (void)setShouldInsertSpaceAfterSelection:(BOOL)a3
{
  self->_shouldInsertSpaceAfterSelection = a3;
}

- (BOOL)isToucanInlineCompletionCandidate
{
  return self->_toucanInlineCompletionCandidate;
}

- (void)setToucanInlineCompletionCandidate:(BOOL)a3
{
  self->_toucanInlineCompletionCandidate = a3;
}

- (NSNumber)staticLinguisticLikelihood
{
  return self->_staticLinguisticLikelihood;
}

- (void)setStaticLinguisticLikelihood:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (double)geometryScore
{
  return self->_geometryScore;
}

- (void)setGeometryScore:(double)a3
{
  self->_geometryScore = a3;
}

- (double)wordScore
{
  return self->_wordScore;
}

- (void)setWordScore:(double)a3
{
  self->_wordScore = a3;
}

- (int)dynamicUsageCount
{
  return self->_dynamicUsageCount;
}

- (void)setDynamicUsageCount:(int)a3
{
  self->_dynamicUsageCount = a3;
}

- (int)dynamicPenaltyCount
{
  return self->_dynamicPenaltyCount;
}

- (void)setDynamicPenaltyCount:(int)a3
{
  self->_dynamicPenaltyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticLinguisticLikelihood, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_proactivePredictedItem, 0);
  objc_storeStrong((id *)&self->_fromBundleId, 0);
  objc_storeStrong((id *)&self->_responseKitCategory, 0);
  objc_storeStrong((id *)&self->_proactiveTrigger, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)type
{
  return 5;
}

@end
