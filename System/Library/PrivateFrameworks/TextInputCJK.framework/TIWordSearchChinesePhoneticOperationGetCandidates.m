@implementation TIWordSearchChinesePhoneticOperationGetCandidates

- (TIWordSearchChinesePhoneticOperationGetCandidates)initWithWordSearch:(id)a3 inputString:(id)a4 keyboardInput:(id)a5 segmentBreakIndex:(unint64_t)a6 disambiguationCandidates:(id)a7 unambiguousSyllableCount:(unint64_t)a8 selectedDisambiguationCandidateIndex:(unint64_t)a9 regenerateDisambiguationCandidates:(BOOL)a10 predictionEnabled:(BOOL)a11 reanalysisMode:(BOOL)a12 target:(id)a13 action:(SEL)a14 geometryModelData:(id)a15 hardwareKeyboardMode:(BOOL)a16 logger:(id)a17
{
  TIWordSearchChinesePhoneticOperationGetCandidates *v22;
  TIWordSearchChinesePhoneticOperationGetCandidates *v23;
  id v28;
  objc_super v29;

  v28 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TIWordSearchChinesePhoneticOperationGetCandidates;
  v22 = -[TIWordSearchOperationGetCandidates initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:hardwareKeyboardMode:logger:](&v29, sel_initWithWordSearch_inputString_keyboardInput_segmentBreakIndex_predictionEnabled_reanalysisMode_autocapitalizationType_target_action_geometryModelData_hardwareKeyboardMode_logger_, a3, a4, a5, a6, a11, a12, 0, a13, a14, a15, a16, a17);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_disambiguationCandidates, a7);
    v23->_unambiguousSyllableCount = a8;
    v23->_selectedDisambiguationCandidateIndex = a9;
    v23->_regenerateDisambiguationCandidates = a10;
    -[TIWordSearchOperationGetCandidates checkForCachedResults](v23, "checkForCachedResults");
  }

  return v23;
}

- (NSArray)disambiguationCandidates
{
  return self->_disambiguationCandidates;
}

- (unint64_t)selectedDisambiguationCandidateIndex
{
  return self->_selectedDisambiguationCandidateIndex;
}

- (unint64_t)unambiguousSyllableCount
{
  return self->_unambiguousSyllableCount;
}

- (unint64_t)disambiguatedSyllablesCount
{
  return self->_disambiguatedSyllablesCount;
}

- (BOOL)regenerateDisambiguationCandidates
{
  return self->_regenerateDisambiguationCandidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguationCandidates, 0);
}

@end
