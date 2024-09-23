@implementation TIMecabraCandidate

- (TIMecabraCandidate)initWithSurface:(id)a3 input:(id)a4 mecabraCandidatePointerValue:(id)a5
{
  return -[TIMecabraCandidate initWithCandidate:forInput:mecabraCandidatePointerValue:withFlags:](self, "initWithCandidate:forInput:mecabraCandidatePointerValue:withFlags:", a3, a4, a5, 0);
}

- (TIMecabraCandidate)initWithResponseKitString:(id)a3 responseKitCategory:(id)a4 mecabraCandidatePointerValue:(id)a5
{
  id v8;
  TIMecabraCandidate *v9;
  uint64_t v10;
  NSString *responseKitCategory;

  v8 = a4;
  v9 = -[TIMecabraCandidate initWithCandidate:forInput:mecabraCandidatePointerValue:withFlags:](self, "initWithCandidate:forInput:mecabraCandidatePointerValue:withFlags:", a3, &stru_1E243B990, a5, 64);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    responseKitCategory = v9->_responseKitCategory;
    v9->_responseKitCategory = (NSString *)v10;

  }
  return v9;
}

- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 mecabraCandidatePointerValue:(id)a5 withFlags:(unsigned __int16)a6
{
  return -[TIMecabraCandidate initWithCandidate:forInput:mecabraCandidatePointerValue:withFlags:deleteCount:cursorMovement:](self, "initWithCandidate:forInput:mecabraCandidatePointerValue:withFlags:deleteCount:cursorMovement:", a3, a4, a5, a6, 0, 0);
}

- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 latinCandidate:(id)a5 mecabraCandidatePointerValue:(id)a6 withFlags:(unsigned __int16)a7
{
  return -[TIMecabraCandidate initWithCandidate:forInput:latinCandidate:mecabraCandidatePointerValue:withFlags:deleteCount:cursorMovement:](self, "initWithCandidate:forInput:latinCandidate:mecabraCandidatePointerValue:withFlags:deleteCount:cursorMovement:", a3, a4, a5, a6, a7, 0, 0);
}

- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 mecabraCandidatePointerValue:(id)a5 withFlags:(unsigned __int16)a6 deleteCount:(unint64_t)a7 cursorMovement:(int64_t)a8
{
  return -[TIMecabraCandidate initWithCandidate:forInput:latinCandidate:mecabraCandidatePointerValue:withFlags:deleteCount:cursorMovement:](self, "initWithCandidate:forInput:latinCandidate:mecabraCandidatePointerValue:withFlags:deleteCount:cursorMovement:", a3, a4, 0, a5, a6, a7, a8);
}

- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 latinCandidate:(id)a5 mecabraCandidatePointerValue:(id)a6 withFlags:(unsigned __int16)a7 deleteCount:(unint64_t)a8 cursorMovement:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  TIMecabraCandidate *v19;
  uint64_t v20;
  NSString *candidate;
  void *v22;
  uint64_t v23;
  NSString *input;
  NSString *rawInput;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v27.receiver = self;
  v27.super_class = (Class)TIMecabraCandidate;
  v19 = -[TIKeyboardCandidate init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    candidate = v19->_candidate;
    v19->_candidate = (NSString *)v20;

    if (v17)
      v22 = (void *)objc_msgSend(v17, "copy");
    else
      v22 = 0;
    objc_storeStrong((id *)&v19->_latinCandidate, v22);
    if (v17)

    v23 = objc_msgSend(v16, "copy");
    input = v19->_input;
    v19->_input = (NSString *)v23;

    rawInput = v19->_rawInput;
    v19->_rawInput = 0;

    objc_storeStrong((id *)&v19->_mecabraCandidatePointerValue, a6);
    v19->_extensionCandidate = a7 & 1;
    v19->_emojiCandidate = (a7 & 2) != 0;
    v19->_isForShortcutConversion = (a7 & 4) != 0;
    v19->_isAutocorrection = (a7 & 8) != 0;
    v19->_OTAWordListCandidate = (a7 & 0x10) != 0;
    v19->_regionalCandidate = (a7 & 0x20) != 0;
    v19->_responseKitCandidate = (a7 & 0x40) != 0;
    v19->_bilingualCandidate = (a7 & 0x80) != 0;
    v19->_asIsCandidate = HIBYTE(a7) & 1;
    v19->_partialCandidate = (a7 & 0x200) != 0;
    v19->_wubixingConvertedByPinyin = (a7 & 0x400) != 0;
    v19->_prefixMatched = (a7 & 0x800) != 0;
    v19->_singlePhrase = (a7 & 0x1000) != 0;
    v19->_deleteCount = a8;
    v19->_cursorMovement = a9;
    -[TIKeyboardCandidate setTypingEngine:](v19, "setTypingEngine:", 5);
  }

  return v19;
}

- (id)label
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIMecabraCandidate;
  -[TIKeyboardCandidate label](&v6, sel_label);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isFullwidthCandidate
{
  return -[NSString _containsFullwidthLettersAndNumbersOnly](self->_candidate, "_containsFullwidthLettersAndNumbersOnly");
}

- (unint64_t)deleteCount
{
  return self->_deleteCount;
}

- (BOOL)isContinuousPathConversion
{
  return self->_continuousPathConversion;
}

- (BOOL)isMecabraCandidate
{
  return 1;
}

- (unsigned)flags
{
  unsigned __int16 extensionCandidate;
  unsigned __int16 v3;
  _BOOL4 v4;
  unsigned __int16 v5;

  extensionCandidate = self->_extensionCandidate;
  if (self->_emojiCandidate)
    extensionCandidate |= 2u;
  if (self->_isForShortcutConversion)
    extensionCandidate |= 4u;
  if (self->_isAutocorrection)
    extensionCandidate |= 8u;
  if (self->_OTAWordListCandidate)
    extensionCandidate |= 0x10u;
  if (self->_regionalCandidate)
    extensionCandidate |= 0x20u;
  if (self->_responseKitCandidate)
    extensionCandidate |= 0x40u;
  if (self->_bilingualCandidate)
    extensionCandidate |= 0x80u;
  if (self->_asIsCandidate)
    extensionCandidate |= 0x100u;
  if (self->_partialCandidate)
    extensionCandidate |= 0x200u;
  if (self->_wubixingConvertedByPinyin)
    v3 = extensionCandidate | 0x400;
  else
    v3 = extensionCandidate;
  v4 = -[TIMecabraCandidate isPrefixMatched](self, "isPrefixMatched");
  v5 = v3 | 0x800;
  if (!v4)
    return v3;
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TIMecabraCandidate;
  v5 = -[TIKeyboardCandidate copyWithZone:](&v15, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_candidate, "copyWithZone:", a3);
    v7 = (void *)*((_QWORD *)v5 + 22);
    *((_QWORD *)v5 + 22) = v6;

    v8 = -[NSString copyWithZone:](self->_latinCandidate, "copyWithZone:", a3);
    v9 = (void *)*((_QWORD *)v5 + 23);
    *((_QWORD *)v5 + 23) = v8;

    v10 = -[NSString copyWithZone:](self->_input, "copyWithZone:", a3);
    v11 = (void *)*((_QWORD *)v5 + 24);
    *((_QWORD *)v5 + 24) = v10;

    v12 = -[NSString copyWithZone:](self->_rawInput, "copyWithZone:", a3);
    v13 = (void *)*((_QWORD *)v5 + 25);
    *((_QWORD *)v5 + 25) = v12;

    objc_storeStrong((id *)v5 + 26, self->_mecabraCandidatePointerValue);
    *((_BYTE *)v5 + 145) = self->_extensionCandidate;
    *((_BYTE *)v5 + 144) = self->_emojiCandidate;
    *((_BYTE *)v5 + 146) = self->_isForShortcutConversion;
    *((_BYTE *)v5 + 147) = self->_isAutocorrection;
    *((_BYTE *)v5 + 148) = self->_OTAWordListCandidate;
    *((_BYTE *)v5 + 149) = self->_regionalCandidate;
    *((_BYTE *)v5 + 151) = self->_bilingualCandidate;
    *((_BYTE *)v5 + 152) = self->_asIsCandidate;
    *((_BYTE *)v5 + 154) = self->_partialCandidate;
    *((_BYTE *)v5 + 155) = self->_wubixingConvertedByPinyin;
    *((_BYTE *)v5 + 156) = self->_prefixMatched;
    *((_QWORD *)v5 + 27) = self->_deleteCount;
    *((_QWORD *)v5 + 28) = self->_cursorMovement;
    *((_BYTE *)v5 + 153) = self->_continuousPathConversion;
    *((_BYTE *)v5 + 157) = self->_shouldAccept;
    *((_BYTE *)v5 + 159) = self->_shouldInsertSpaceAfterSelection;
    *((_DWORD *)v5 + 40) = self->_sourceMask;
    *((_BYTE *)v5 + 158) = self->_singlePhrase;
  }
  return v5;
}

- (TIMecabraCandidate)initWithCoder:(id)a3
{
  id v4;
  TIMecabraCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *candidate;
  void *v9;
  uint64_t v10;
  NSString *latinCandidate;
  void *v12;
  uint64_t v13;
  NSString *input;
  void *v15;
  uint64_t v16;
  NSString *rawInput;
  uint64_t v18;
  NSNumber *mecabraCandidatePointerValue;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TIMecabraCandidate;
  v5 = -[TIKeyboardCandidate initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latinCandidate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    latinCandidate = v5->_latinCandidate;
    v5->_latinCandidate = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    input = v5->_input;
    v5->_input = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawInput"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    rawInput = v5->_rawInput;
    v5->_rawInput = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mecabraCandidatePointerValue"));
    v18 = objc_claimAutoreleasedReturnValue();
    mecabraCandidatePointerValue = v5->_mecabraCandidatePointerValue;
    v5->_mecabraCandidatePointerValue = (NSNumber *)v18;

    v5->_extensionCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("extensionCandidate"));
    v5->_emojiCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("emojiCandidate"));
    v5->_isForShortcutConversion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isForShortcutConversion"));
    v5->_isAutocorrection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutocorrection"));
    v5->_OTAWordListCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OTAWordListCandidate"));
    v5->_regionalCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("regionalCandidate"));
    v5->_bilingualCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bilingualCandidate"));
    v5->_asIsCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("asIsCandidate"));
    v5->_partialCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("partialCandidate"));
    v5->_wubixingConvertedByPinyin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wubixingConvertedByPinyin"));
    v5->_prefixMatched = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefixMatched"));
    v5->_deleteCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deleteCount"));
    v5->_cursorMovement = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cursorMovement"));
    v5->_continuousPathConversion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("continuousPathConversion"));
    v5->_shouldAccept = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAccept"));
    v5->_sourceMask = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceMask"));
    v5->_singlePhrase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("singlePhrase"));
    v5->_shouldInsertSpaceAfterSelection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldInsertSpaceAfterSelection"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *candidate;
  NSString *latinCandidate;
  NSString *input;
  NSString *rawInput;
  NSNumber *mecabraCandidatePointerValue;
  unint64_t deleteCount;
  int64_t cursorMovement;
  uint64_t sourceMask;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIMecabraCandidate;
  -[TIKeyboardCandidate encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  candidate = self->_candidate;
  if (candidate)
    objc_msgSend(v4, "encodeObject:forKey:", candidate, CFSTR("candidate"));
  latinCandidate = self->_latinCandidate;
  if (latinCandidate)
    objc_msgSend(v4, "encodeObject:forKey:", latinCandidate, CFSTR("latinCandidate"));
  input = self->_input;
  if (input)
    objc_msgSend(v4, "encodeObject:forKey:", input, CFSTR("input"));
  rawInput = self->_rawInput;
  if (rawInput)
    objc_msgSend(v4, "encodeObject:forKey:", rawInput, CFSTR("rawInput"));
  mecabraCandidatePointerValue = self->_mecabraCandidatePointerValue;
  if (mecabraCandidatePointerValue)
    objc_msgSend(v4, "encodeObject:forKey:", mecabraCandidatePointerValue, CFSTR("mecabraCandidatePointerValue"));
  if (self->_extensionCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("extensionCandidate"));
  if (self->_emojiCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("emojiCandidate"));
  if (self->_isForShortcutConversion)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("isForShortcutConversion"));
  if (self->_isAutocorrection)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("isAutocorrection"));
  if (self->_OTAWordListCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("OTAWordListCandidate"));
  if (self->_regionalCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("regionalCandidate"));
  if (self->_bilingualCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("bilingualCandidate"));
  if (self->_asIsCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("asIsCandidate"));
  if (self->_partialCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("partialCandidate"));
  if (self->_wubixingConvertedByPinyin)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("wubixingConvertedByPinyin"));
  if (self->_prefixMatched)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("prefixMatched"));
  deleteCount = self->_deleteCount;
  if (deleteCount)
    objc_msgSend(v4, "encodeInteger:forKey:", deleteCount, CFSTR("deleteCount"));
  cursorMovement = self->_cursorMovement;
  if (cursorMovement)
    objc_msgSend(v4, "encodeInteger:forKey:", cursorMovement, CFSTR("cursorMovement"));
  if (self->_continuousPathConversion)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("continuousPathConversion"));
  if (self->_shouldAccept)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("shouldAccept"));
  sourceMask = self->_sourceMask;
  if ((_DWORD)sourceMask)
    objc_msgSend(v4, "encodeInteger:forKey:", sourceMask, CFSTR("sourceMask"));
  if (self->_singlePhrase)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("singlePhrase"));
  if (self->_shouldInsertSpaceAfterSelection)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("shouldInsertSpaceAfterSelection"));

}

- (BOOL)isEqual:(id)a3
{
  TIMecabraCandidate *v4;
  TIMecabraCandidate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  objc_super v17;

  v4 = (TIMecabraCandidate *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TIMecabraCandidate mecabraCandidatePointerValue](v5, "mecabraCandidatePointerValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIMecabraCandidate mecabraCandidatePointerValue](self, "mecabraCandidatePointerValue");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[TIMecabraCandidate mecabraCandidatePointerValue](v5, "mecabraCandidatePointerValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIMecabraCandidate mecabraCandidatePointerValue](self, "mecabraCandidatePointerValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_12;
      }
      v13 = -[TIMecabraCandidate isContinuousPathConversion](v5, "isContinuousPathConversion");
      if (v13 == -[TIMecabraCandidate isContinuousPathConversion](self, "isContinuousPathConversion"))
      {
        v14 = -[TIMecabraCandidate shouldAccept](v5, "shouldAccept");
        if (v14 == -[TIMecabraCandidate shouldAccept](self, "shouldAccept"))
        {
          v15 = -[TIMecabraCandidate shouldInsertSpaceAfterSelection](v5, "shouldInsertSpaceAfterSelection");
          if (v15 == -[TIMecabraCandidate shouldInsertSpaceAfterSelection](self, "shouldInsertSpaceAfterSelection"))
          {
            v17.receiver = self;
            v17.super_class = (Class)TIMecabraCandidate;
            v12 = -[TIKeyboardCandidate isEqual:](&v17, sel_isEqual_, v5);
            goto LABEL_13;
          }
        }
      }
LABEL_12:
      v12 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v12 = 0;
  }
LABEL_14:

  return v12;
}

- (id)candidateByReplacingWithCandidate:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[TIMecabraCandidate copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[22];
  v5[22] = v6;

  return v5;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TIMecabraCandidate rawInput](self, "rawInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraCandidate candidateByReplacingWithCandidate:input:rawInput:](self, "candidateByReplacingWithCandidate:input:rawInput:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 rawInput:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (_QWORD *)-[TIMecabraCandidate copy](self, "copy");
  v12 = (void *)v11[22];
  v11[22] = v8;
  v13 = v8;

  v14 = (void *)v11[24];
  v11[24] = v9;
  v15 = v9;

  v16 = (void *)v11[25];
  v11[25] = v10;

  return v11;
}

- (id)candidateByReplacingWithSourceMask:(unsigned int)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)-[TIMecabraCandidate copy](self, "copy");
  v4[40] = a3;
  return v4;
}

- (TIMecabraCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TIMecabraCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *candidate;
  void *v9;
  uint64_t v10;
  NSString *latinCandidate;
  void *v12;
  uint64_t v13;
  NSString *input;
  void *v15;
  uint64_t v16;
  NSString *rawInput;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  NSNumber *mecabraCandidatePointerValue;
  __int16 v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TIMecabraCandidate;
  v5 = -[TIKeyboardCandidate initWithCandidateResultSetCoder:](&v24, sel_initWithCandidateResultSetCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    objc_msgSend(v4, "decodeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    latinCandidate = v5->_latinCandidate;
    v5->_latinCandidate = (NSString *)v10;

    objc_msgSend(v4, "decodeString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    input = v5->_input;
    v5->_input = (NSString *)v13;

    objc_msgSend(v4, "decodeString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    rawInput = v5->_rawInput;
    v5->_rawInput = (NSString *)v16;

    if (!-[NSString length](v5->_rawInput, "length"))
    {
      v18 = v5->_rawInput;
      v5->_rawInput = 0;

    }
    v19 = objc_msgSend(v4, "decodeUInt64");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    mecabraCandidatePointerValue = v5->_mecabraCandidatePointerValue;
    v5->_mecabraCandidatePointerValue = (NSNumber *)v20;

    v22 = objc_msgSend(v4, "decodeShort");
    v5->_extensionCandidate = v22 & 1;
    v5->_emojiCandidate = (v22 & 2) != 0;
    v5->_isForShortcutConversion = (v22 & 4) != 0;
    v5->_isAutocorrection = (v22 & 8) != 0;
    v5->_OTAWordListCandidate = (v22 & 0x10) != 0;
    v5->_regionalCandidate = (v22 & 0x20) != 0;
    v5->_responseKitCandidate = (v22 & 0x40) != 0;
    v5->_bilingualCandidate = (v22 & 0x80) != 0;
    v5->_asIsCandidate = HIBYTE(v22) & 1;
    v5->_partialCandidate = (v22 & 0x200) != 0;
    v5->_wubixingConvertedByPinyin = (v22 & 0x400) != 0;
    v5->_prefixMatched = (v22 & 0x800) != 0;
    v5->_deleteCount = objc_msgSend(v4, "decodeUInt32");
    v5->_cursorMovement = objc_msgSend(v4, "decodeUInt32");
    v5->_shouldAccept = objc_msgSend(v4, "decodeBool");
    v5->_sourceMask = objc_msgSend(v4, "decodeUInt32");
    v5->_shouldInsertSpaceAfterSelection = objc_msgSend(v4, "decodeBool");
  }

  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIMecabraCandidate;
  v4 = a3;
  -[TIKeyboardCandidate encodeWithCandidateResultSetCoder:](&v5, sel_encodeWithCandidateResultSetCoder_, v4);
  objc_msgSend(v4, "encodeString:", self->_candidate, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeString:", self->_latinCandidate);
  objc_msgSend(v4, "encodeString:", self->_input);
  objc_msgSend(v4, "encodeString:", self->_rawInput);
  objc_msgSend(v4, "encodeUInt64:", -[NSNumber unsignedLongLongValue](self->_mecabraCandidatePointerValue, "unsignedLongLongValue"));
  objc_msgSend(v4, "encodeShort:", -[TIMecabraCandidate flags](self, "flags"));
  objc_msgSend(v4, "encodeUInt32:", LODWORD(self->_deleteCount));
  objc_msgSend(v4, "encodeUInt32:", LODWORD(self->_cursorMovement));
  objc_msgSend(v4, "encodeBool:", self->_shouldAccept);
  objc_msgSend(v4, "encodeUInt32:", -[TIMecabraCandidate sourceMask](self, "sourceMask"));
  objc_msgSend(v4, "encodeBool:", self->_shouldInsertSpaceAfterSelection);

}

- (id)candidate
{
  return self->_candidate;
}

- (id)latinCandidate
{
  return self->_latinCandidate;
}

- (id)input
{
  return self->_input;
}

- (id)rawInput
{
  return self->_rawInput;
}

- (NSNumber)mecabraCandidatePointerValue
{
  return self->_mecabraCandidatePointerValue;
}

- (void)setMecabraCandidatePointerValue:(id)a3
{
  objc_storeStrong((id *)&self->_mecabraCandidatePointerValue, a3);
}

- (BOOL)isEmojiCandidate
{
  return self->_emojiCandidate;
}

- (BOOL)isExtensionCandidate
{
  return self->_extensionCandidate;
}

- (BOOL)isForShortcutConversion
{
  return self->_isForShortcutConversion;
}

- (BOOL)isAutocorrection
{
  return self->_isAutocorrection;
}

- (BOOL)isOTAWordListCandidate
{
  return self->_OTAWordListCandidate;
}

- (BOOL)isRegionalCandidate
{
  return self->_regionalCandidate;
}

- (int64_t)cursorMovement
{
  return self->_cursorMovement;
}

- (BOOL)isResponseKitCandidate
{
  return self->_responseKitCandidate;
}

- (id)responseKitCategory
{
  return self->_responseKitCategory;
}

- (BOOL)isBilingualCandidate
{
  return self->_bilingualCandidate;
}

- (BOOL)isAsIsCandidate
{
  return self->_asIsCandidate;
}

- (void)setContinuousPathConversion:(BOOL)a3
{
  self->_continuousPathConversion = a3;
}

- (BOOL)isPartialCandidate
{
  return self->_partialCandidate;
}

- (BOOL)isWubixingConvertedByPinyin
{
  return self->_wubixingConvertedByPinyin;
}

- (BOOL)isPrefixMatched
{
  return self->_prefixMatched;
}

- (BOOL)shouldAccept
{
  return self->_shouldAccept;
}

- (void)setShouldAccept:(BOOL)a3
{
  self->_shouldAccept = a3;
}

- (unsigned)sourceMask
{
  return self->_sourceMask;
}

- (void)setSourceMask:(unsigned int)a3
{
  self->_sourceMask = a3;
}

- (BOOL)singlePhrase
{
  return self->_singlePhrase;
}

- (BOOL)shouldInsertSpaceAfterSelection
{
  return self->_shouldInsertSpaceAfterSelection;
}

- (void)setShouldInsertSpaceAfterSelection:(BOOL)a3
{
  self->_shouldInsertSpaceAfterSelection = a3;
}

- (float)seq2seqScore
{
  return self->_seq2seqScore;
}

- (void)setSeq2seqScore:(float)a3
{
  self->_seq2seqScore = a3;
}

- (float)lmScore
{
  return self->_lmScore;
}

- (void)setLmScore:(float)a3
{
  self->_lmScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseKitCategory, 0);
  objc_storeStrong((id *)&self->_mecabraCandidatePointerValue, 0);
  objc_storeStrong((id *)&self->_rawInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_latinCandidate, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)type
{
  return 2;
}

@end
