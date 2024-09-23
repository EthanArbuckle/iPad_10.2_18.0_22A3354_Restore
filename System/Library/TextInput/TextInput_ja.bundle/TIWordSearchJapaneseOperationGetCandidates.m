@implementation TIWordSearchJapaneseOperationGetCandidates

- (TIWordSearchJapaneseOperationGetCandidates)initWithWordSearch:(id)a3 inputString:(id)a4 keyboardInput:(id)a5 contextString:(id)a6 segmentBreakIndex:(unint64_t)a7 predictionEnabled:(BOOL)a8 reanalysisMode:(BOOL)a9 autocapitalizationType:(unint64_t)a10 target:(id)a11 action:(SEL)a12 geometryModelData:(id)a13 flickUsed:(BOOL)a14 phraseBoundarySet:(BOOL)a15 hardwareKeyboardMode:(BOOL)a16 logger:(id)a17
{
  id v22;
  TIWordSearchJapaneseOperationGetCandidates *v23;
  uint64_t v24;
  NSString *contextString;
  _BOOL4 v28;
  objc_super v29;

  v28 = a8;
  v22 = a6;
  v29.receiver = self;
  v29.super_class = (Class)TIWordSearchJapaneseOperationGetCandidates;
  v23 = -[TIWordSearchOperationGetCandidates initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:hardwareKeyboardMode:logger:](&v29, sel_initWithWordSearch_inputString_keyboardInput_segmentBreakIndex_predictionEnabled_reanalysisMode_autocapitalizationType_target_action_geometryModelData_hardwareKeyboardMode_logger_, a3, a4, a5, a7, v28, a9, 0, a11, a12, a13, a16, a17);
  if (v23)
  {
    v24 = objc_msgSend(v22, "copy");
    contextString = v23->_contextString;
    v23->_contextString = (NSString *)v24;

    v23->_flickUsed = a14;
    v23->_phraseBoundarySet = a15;
  }

  return v23;
}

- (id)results
{
  objc_super v4;

  -[TIWordSearchJapaneseOperationGetCandidates checkForCachedResultsIfNeeded](self, "checkForCachedResultsIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)TIWordSearchJapaneseOperationGetCandidates;
  -[TIWordSearchOperationGetCandidates results](&v4, sel_results);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)checkForCachedResultsIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[TIWordSearchOperationGetCandidates wordSearch](self, "wordSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidatesCacheKeyForOperation:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[TIWordSearchJapaneseOperationGetCandidates previousCacheKey](self, "previousCacheKey");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[TIWordSearchJapaneseOperationGetCandidates previousCacheKey](self, "previousCacheKey"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v8, "isEqualToString:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    -[TIWordSearchOperationGetCandidates checkForCachedResults](self, "checkForCachedResults");
    -[TIWordSearchJapaneseOperationGetCandidates setPreviousCacheKey:](self, "setPreviousCacheKey:", v8);
  }

}

- (BOOL)flickUsed
{
  return self->_flickUsed;
}

- (void)setFlickUsed:(BOOL)a3
{
  self->_flickUsed = a3;
}

- (NSString)contextString
{
  return self->_contextString;
}

- (BOOL)phraseBoundarySet
{
  return self->_phraseBoundarySet;
}

- (void)setPhraseBoundarySet:(BOOL)a3
{
  self->_phraseBoundarySet = a3;
}

- (BOOL)allowIncompleteRomaji
{
  return self->_allowIncompleteRomaji;
}

- (void)setAllowIncompleteRomaji:(BOOL)a3
{
  self->_allowIncompleteRomaji = a3;
}

- (BOOL)referenceMode
{
  return self->_referenceMode;
}

- (void)setReferenceMode:(BOOL)a3
{
  self->_referenceMode = a3;
}

- (BOOL)singlePhrase
{
  return self->_singlePhrase;
}

- (void)setSinglePhrase:(BOOL)a3
{
  self->_singlePhrase = a3;
}

- (NSString)previousCacheKey
{
  return self->_previousCacheKey;
}

- (void)setPreviousCacheKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousCacheKey, 0);
  objc_storeStrong((id *)&self->_contextString, 0);
}

@end
