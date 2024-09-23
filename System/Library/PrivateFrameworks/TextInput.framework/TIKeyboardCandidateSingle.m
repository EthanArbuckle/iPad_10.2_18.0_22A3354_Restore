@implementation TIKeyboardCandidateSingle

- (NSString)candidate
{
  return self->_candidate;
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5
{
  return -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:extensionCandidate:](self, "initWithCandidate:forInput:rawInput:extensionCandidate:", a3, a4, a5, 0);
}

- (TIKeyboardCandidateSingle)initWithUnchangedInput:(id)a3
{
  return -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:](self, "initWithCandidate:forInput:rawInput:", a3, a3, 0);
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 extensionCandidate:(BOOL)a6
{
  return -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:extensionCandidate:sourceMask:learningFlagsMask:](self, "initWithCandidate:forInput:rawInput:extensionCandidate:sourceMask:learningFlagsMask:", a3, a4, a5, a6, 0, 0);
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 extensionCandidate:(BOOL)a6 sourceMask:(unsigned int)a7 learningFlagsMask:(unint64_t)a8
{
  uint64_t v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  TIKeyboardCandidateSingle *v17;
  TIKeyboardCandidateSingle *v18;
  objc_super v20;

  v9 = *(_QWORD *)&a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardCandidateSingle;
  v17 = -[TIKeyboardCandidate init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[TIKeyboardCandidateSingle setCandidate:](v17, "setCandidate:", v14);
    -[TIKeyboardCandidateSingle setInput:](v18, "setInput:", v15);
    -[TIKeyboardCandidateSingle setRawInput:](v18, "setRawInput:", v16);
    -[TIKeyboardCandidateSingle setApplicationKey:](v18, "setApplicationKey:", &stru_1E243B990);
    -[TIKeyboardCandidateSingle setApplicationBundleId:](v18, "setApplicationBundleId:", &stru_1E243B990);
    -[TIKeyboardCandidateSingle setAltDSID:](v18, "setAltDSID:", 0);
    -[TIKeyboardCandidateSingle setStickerIdentifier:](v18, "setStickerIdentifier:", 0);
    -[TIKeyboardCandidateSingle setExtensionCandidate:](v18, "setExtensionCandidate:", v10);
    -[TIKeyboardCandidate setSlotID:](v18, "setSlotID:", 0);
    -[TIKeyboardCandidate setSecureCandidateWidth:](v18, "setSecureCandidateWidth:", 0.0);
    -[TIKeyboardCandidate setSecureCandidateHash:](v18, "setSecureCandidateHash:", 0);
    -[TIKeyboardCandidate setCustomInfoType:](v18, "setCustomInfoType:", 0);
    -[TIKeyboardCandidate setTypingEngine:](v18, "setTypingEngine:", 0);
    -[TIKeyboardCandidateSingle setSourceMask:](v18, "setSourceMask:", v9);
    -[TIKeyboardCandidateSingle setLearningFlagsMask:](v18, "setLearningFlagsMask:", a8);
  }

  return v18;
}

- (void)setStickerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setSourceMask:(unsigned int)a3
{
  self->_sourceMask = a3;
}

- (void)setRawInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setLearningFlagsMask:(unint64_t)a3
{
  self->_learningFlagsMask = a3;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setExtensionCandidate:(BOOL)a3
{
  self->_extensionCandidate = a3;
}

- (void)setCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setApplicationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setApplicationBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_applicationBundleId, 0);
  objc_storeStrong((id *)&self->_applicationKey, 0);
  objc_storeStrong((id *)&self->_rawInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

- (NSNumber)learningFlags
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(self->_learningFlagsMask));
}

- (BOOL)isContinuousPathConversion
{
  return self->_continuousPathConversion;
}

- (void)setLearningFlags:(id)a3
{
  self->_learningFlagsMask = objc_msgSend(a3, "unsignedIntValue");
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3
{
  return -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:](self, "initWithCandidate:forInput:rawInput:", a3, 0, 0);
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4
{
  return -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:](self, "initWithCandidate:forInput:rawInput:", a3, a4, 0);
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 sourceMask:(unsigned int)a6
{
  return -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:extensionCandidate:sourceMask:learningFlagsMask:](self, "initWithCandidate:forInput:rawInput:extensionCandidate:sourceMask:learningFlagsMask:", a3, a4, a5, 0, *(_QWORD *)&a6, 0);
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 learningFlagsMask:(unint64_t)a6
{
  return -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:extensionCandidate:sourceMask:learningFlagsMask:](self, "initWithCandidate:forInput:rawInput:extensionCandidate:sourceMask:learningFlagsMask:", a3, a4, a5, 0, 0, a6);
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 sourceMask:(unsigned int)a6 learningFlagsMask:(unint64_t)a7
{
  return -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:extensionCandidate:sourceMask:learningFlagsMask:](self, "initWithCandidate:forInput:rawInput:extensionCandidate:sourceMask:learningFlagsMask:", a3, a4, a5, 0, *(_QWORD *)&a6, a7);
}

- (TIKeyboardCandidateSingle)initWithUnchangedInput:(id)a3 learningFlagsMask:(unint64_t)a4
{
  return -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:learningFlagsMask:](self, "initWithCandidate:forInput:rawInput:learningFlagsMask:", a3, a3, 0, a4);
}

- (TIKeyboardCandidateSingle)initWithResponseCandidate:(id)a3
{
  TIKeyboardCandidateSingle *result;

  result = -[TIKeyboardCandidateSingle initWithCandidate:forInput:rawInput:](self, "initWithCandidate:forInput:rawInput:", a3, &stru_1E243B990, 0);
  result->super._responseKitCandidate = 1;
  return result;
}

- (BOOL)isAutocorrectionIgnoringCaseAndSupplementalItemPrefix
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[TIKeyboardCandidateSingle candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TIKeyboardCandidateSingle candidate](self, "candidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidate inputWithoutSupplementalItemPrefix](self, "inputWithoutSupplementalItemPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "caseInsensitiveCompare:", v5) != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAutocorrectionIgnoringCaseAndDiacriticsAndSupplementalItemPrefix
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  -[TIKeyboardCandidateSingle candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TIKeyboardCandidateSingle candidate](self, "candidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "_stringByReplacingCharacter:withCharacter:", 8217, 39);
    -[TIKeyboardCandidate inputWithoutSupplementalItemPrefix](self, "inputWithoutSupplementalItemPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "compare:options:", objc_msgSend(v6, "_stringByReplacingCharacter:withCharacter:", 8217, 39), 129);

    v8 = v7 != 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardCandidateSingle;
  v5 = -[TIKeyboardCandidate copyWithZone:](&v21, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_candidate, "copyWithZone:", a3);
    v7 = (void *)v5[19];
    v5[19] = v6;

    v8 = -[NSString copyWithZone:](self->_input, "copyWithZone:", a3);
    v9 = (void *)v5[20];
    v5[20] = v8;

    v10 = -[NSString copyWithZone:](self->_rawInput, "copyWithZone:", a3);
    v11 = (void *)v5[21];
    v5[21] = v10;

    v12 = -[NSString copyWithZone:](self->_applicationKey, "copyWithZone:", a3);
    v13 = (void *)v5[22];
    v5[22] = v12;

    v14 = -[NSString copyWithZone:](self->_applicationBundleId, "copyWithZone:", a3);
    v15 = (void *)v5[23];
    v5[23] = v14;

    v16 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
    v17 = (void *)v5[24];
    v5[24] = v16;

    v18 = -[NSUUID copyWithZone:](self->_stickerIdentifier, "copyWithZone:", a3);
    v19 = (void *)v5[25];
    v5[25] = v18;

    *((_BYTE *)v5 + 144) = self->_extensionCandidate;
    v5[26] = self->_cursorMovement;
    v5[27] = self->_learningFlagsMask;
    *((_DWORD *)v5 + 37) = self->_sourceMask;
    *((_BYTE *)v5 + 145) = self->_continuousPathConversion;
    *((_BYTE *)v5 + 146) = self->_shouldAccept;
  }
  return v5;
}

- (TIKeyboardCandidateSingle)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardCandidateSingle *v5;
  void *v6;
  uint64_t v7;
  NSString *candidate;
  void *v9;
  uint64_t v10;
  NSString *input;
  void *v12;
  uint64_t v13;
  NSString *rawInput;
  void *v15;
  uint64_t v16;
  NSString *applicationKey;
  void *v18;
  uint64_t v19;
  NSString *applicationBundleId;
  void *v21;
  uint64_t v22;
  NSString *altDSID;
  uint64_t v24;
  NSUUID *stickerIdentifier;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TIKeyboardCandidateSingle;
  v5 = -[TIKeyboardCandidate initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    input = v5->_input;
    v5->_input = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawInput"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    rawInput = v5->_rawInput;
    v5->_rawInput = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    applicationKey = v5->_applicationKey;
    v5->_applicationKey = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    applicationBundleId = v5->_applicationBundleId;
    v5->_applicationBundleId = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stickerIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    stickerIdentifier = v5->_stickerIdentifier;
    v5->_stickerIdentifier = (NSUUID *)v24;

    v5->_extensionCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("extensionCandidate"));
    v5->_cursorMovement = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cursorMovement"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("learningFlagsMask"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_learningFlagsMask = objc_msgSend(v26, "unsignedIntValue");

    v5->_sourceMask = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceMask"));
    v5->_continuousPathConversion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("continuousPathConversion"));
    v5->_shouldAccept = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAccept"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *applicationKey;
  NSString *applicationBundleId;
  NSString *altDSID;
  NSUUID *stickerIdentifier;
  NSString *input;
  NSString *rawInput;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardCandidateSingle;
  -[TIKeyboardCandidate encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  if (self->_candidate && !-[TIKeyboardCandidate slotID](self, "slotID"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_candidate, CFSTR("candidate"));
  applicationKey = self->_applicationKey;
  if (applicationKey)
    objc_msgSend(v4, "encodeObject:forKey:", applicationKey, CFSTR("applicationKey"));
  applicationBundleId = self->_applicationBundleId;
  if (applicationBundleId)
    objc_msgSend(v4, "encodeObject:forKey:", applicationBundleId, CFSTR("applicationBundleId"));
  altDSID = self->_altDSID;
  if (altDSID)
    objc_msgSend(v4, "encodeObject:forKey:", altDSID, CFSTR("altDSID"));
  stickerIdentifier = self->_stickerIdentifier;
  if (stickerIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", stickerIdentifier, CFSTR("stickerIdentifier"));
  input = self->_input;
  if (input)
    objc_msgSend(v4, "encodeObject:forKey:", input, CFSTR("input"));
  rawInput = self->_rawInput;
  if (rawInput)
    objc_msgSend(v4, "encodeObject:forKey:", rawInput, CFSTR("rawInput"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_extensionCandidate, CFSTR("extensionCandidate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_cursorMovement, CFSTR("cursorMovement"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_learningFlagsMask);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("learningFlagsMask"));

  objc_msgSend(v4, "encodeInteger:forKey:", self->_sourceMask, CFSTR("sourceMask"));
  if (self->_continuousPathConversion)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("continuousPathConversion"));
  if (self->_shouldAccept)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("shouldAccept"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardCandidateSingle candidate](self, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<TIKeyboardCandidateSingle: candidate %@, learningflagsMask %llu>"), v4, -[TIKeyboardCandidateSingle learningFlagsMask](self, "learningFlagsMask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)candidateByReplacingWithCandidate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[TIKeyboardCandidateSingle copy](self, "copy");
  objc_msgSend(v5, "setCandidate:", v4);

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
  -[TIKeyboardCandidateSingle rawInput](self, "rawInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateSingle candidateByReplacingWithCandidate:input:rawInput:](self, "candidateByReplacingWithCandidate:input:rawInput:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 rawInput:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)-[TIKeyboardCandidateSingle copy](self, "copy");
  objc_msgSend(v11, "setCandidate:", v10);

  objc_msgSend(v11, "setInput:", v9);
  objc_msgSend(v11, "setRawInput:", v8);

  objc_msgSend(v11, "setApplicationKey:", CFSTR("replacing"));
  objc_msgSend(v11, "setApplicationBundleId:", CFSTR("replacing"));
  objc_msgSend(v11, "setAltDSID:", CFSTR("replace"));
  objc_msgSend(v11, "setLearningFlagsMask:", 0);
  return v11;
}

- (id)candidateByReplacingWithSourceMask:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)-[TIKeyboardCandidateSingle copy](self, "copy");
  objc_msgSend(v4, "setSourceMask:", v3);
  return v4;
}

- (BOOL)isHideMyEmailType
{
  return -[TIKeyboardCandidate customInfoType](self, "customInfoType") == 1024;
}

- (BOOL)isStickerCandidate
{
  return -[TIKeyboardCandidate customInfoType](self, "customInfoType") == 4096;
}

- (TIKeyboardCandidateSingle)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TIKeyboardCandidateSingle *v5;
  TIKeyboardCandidateSingle *v6;
  void *v7;
  uint64_t v8;
  NSString *candidate;
  void *v10;
  uint64_t v11;
  NSString *input;
  void *v13;
  uint64_t v14;
  NSString *rawInput;
  NSString *v16;
  void *v17;
  uint64_t v18;
  NSString *applicationKey;
  void *v20;
  uint64_t v21;
  NSString *applicationBundleId;
  void *v23;
  uint64_t v24;
  NSString *altDSID;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TIKeyboardCandidateSingle;
  v5 = -[TIKeyboardCandidate initWithCandidateResultSetCoder:](&v27, sel_initWithCandidateResultSetCoder_, v4);
  v6 = v5;
  if (v5)
  {
    if (!-[TIKeyboardCandidate slotID](v5, "slotID"))
    {
      objc_msgSend(v4, "decodeString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      candidate = v6->_candidate;
      v6->_candidate = (NSString *)v8;

    }
    objc_msgSend(v4, "decodeString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    input = v6->_input;
    v6->_input = (NSString *)v11;

    objc_msgSend(v4, "decodeString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    rawInput = v6->_rawInput;
    v6->_rawInput = (NSString *)v14;

    if (!-[NSString length](v6->_rawInput, "length"))
    {
      v16 = v6->_rawInput;
      v6->_rawInput = 0;

    }
    objc_msgSend(v4, "decodeString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    applicationKey = v6->_applicationKey;
    v6->_applicationKey = (NSString *)v18;

    objc_msgSend(v4, "decodeString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    applicationBundleId = v6->_applicationBundleId;
    v6->_applicationBundleId = (NSString *)v21;

    objc_msgSend(v4, "decodeString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    altDSID = v6->_altDSID;
    v6->_altDSID = (NSString *)v24;

    v6->_extensionCandidate = objc_msgSend(v4, "decodeBool");
    v6->_cursorMovement = objc_msgSend(v4, "decodeUInt64");
    v6->_learningFlagsMask = objc_msgSend(v4, "decodeUInt64");
    v6->_sourceMask = objc_msgSend(v4, "decodeUInt32");
    v6->_continuousPathConversion = objc_msgSend(v4, "decodeBool");
    v6->_shouldAccept = objc_msgSend(v4, "decodeBool");
  }

  return v6;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardCandidateSingle;
  -[TIKeyboardCandidate encodeWithCandidateResultSetCoder:](&v11, sel_encodeWithCandidateResultSetCoder_, v4);
  if (!-[TIKeyboardCandidate slotID](self, "slotID"))
  {
    -[TIKeyboardCandidateSingle candidate](self, "candidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeString:", v5);

  }
  -[TIKeyboardCandidateSingle input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v6);

  -[TIKeyboardCandidateSingle rawInput](self, "rawInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v7);

  -[TIKeyboardCandidateSingle applicationKey](self, "applicationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v8);

  -[TIKeyboardCandidateSingle applicationBundleId](self, "applicationBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v9);

  -[TIKeyboardCandidateSingle altDSID](self, "altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v10);

  objc_msgSend(v4, "encodeBool:", -[TIKeyboardCandidateSingle isExtensionCandidate](self, "isExtensionCandidate"));
  objc_msgSend(v4, "encodeUInt64:", -[TIKeyboardCandidateSingle cursorMovement](self, "cursorMovement"));
  objc_msgSend(v4, "encodeUInt64:", -[TIKeyboardCandidateSingle learningFlagsMask](self, "learningFlagsMask"));
  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidateSingle sourceMask](self, "sourceMask"));
  objc_msgSend(v4, "encodeBool:", -[TIKeyboardCandidateSingle isContinuousPathConversion](self, "isContinuousPathConversion"));
  objc_msgSend(v4, "encodeBool:", -[TIKeyboardCandidateSingle shouldAccept](self, "shouldAccept"));

}

- (NSString)input
{
  return self->_input;
}

- (NSString)rawInput
{
  return self->_rawInput;
}

- (NSString)applicationKey
{
  return self->_applicationKey;
}

- (NSString)applicationBundleId
{
  return self->_applicationBundleId;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSUUID)stickerIdentifier
{
  return self->_stickerIdentifier;
}

- (BOOL)isExtensionCandidate
{
  return self->_extensionCandidate;
}

- (int64_t)cursorMovement
{
  return self->_cursorMovement;
}

- (void)setCursorMovement:(int64_t)a3
{
  self->_cursorMovement = a3;
}

- (unint64_t)learningFlagsMask
{
  return self->_learningFlagsMask;
}

- (unsigned)sourceMask
{
  return self->_sourceMask;
}

- (void)setContinuousPathConversion:(BOOL)a3
{
  self->_continuousPathConversion = a3;
}

- (BOOL)shouldAccept
{
  return self->_shouldAccept;
}

- (void)setShouldAccept:(BOOL)a3
{
  self->_shouldAccept = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 extensionCandidate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidate:forInput:rawInput:extensionCandidate:", v9, v8, 0, v5);

  return v10;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidate:forInput:rawInput:", v7, v6, 0);

  return v8;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 customInfoType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "candidateWithCandidate:forInput:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCustomInfoType:", a5);
  return v9;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 cursorMovement:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "candidateWithCandidate:forInput:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCursorMovement:", a5);
  return v9;
}

+ (id)candidateWithUnchangedInput:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUnchangedInput:", v4);

  return v5;
}

+ (id)candidateWithUnchangedInput:(id)a3 learningFlagsMask:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUnchangedInput:learningFlagsMask:", v6, a4);

  return v7;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 property:(unint64_t)a5
{
  id result;

  result = (id)objc_msgSend(a1, "candidateWithCandidate:forInput:", a3, a4);
  *((_QWORD *)result + 2) = a5;
  return result;
}

+ (id)secureCandidateForInput:(id)a3 slotID:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "candidateWithUnchangedInput:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSlotID:", v4);
  return v6;
}

+ (id)secureCandidateForInput:(id)a3 slotID:(unsigned int)a4 customInfoType:(unint64_t)a5
{
  uint64_t v6;
  id v7;
  void *v8;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "secureCandidateForInput:slotID:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCustomInfoType:", a5);
  return v8;
}

+ (id)secureCandidateForInput:(id)a3 slotID:(unsigned int)a4 customInfoType:(unint64_t)a5 applicationKey:(id)a6 applicationBundleId:(id)a7 altDSID:(id)a8
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v11 = *(_QWORD *)&a4;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a3;
  objc_msgSend((id)objc_opt_class(), "secureCandidateForInput:slotID:customInfoType:", v16, v11, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setApplicationKey:", v15);
  objc_msgSend(v17, "setApplicationBundleId:", v14);

  objc_msgSend(v17, "setAltDSID:", v13);
  return v17;
}

+ (id)secureCandidateWithCandidate:(id)a3 forInput:(id)a4 slotID:(unsigned int)a5 customInfoType:(unint64_t)a6 stickerIdentifier:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;

  v8 = *(_QWORD *)&a5;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "secureCandidateForInput:slotID:customInfoType:", v12, v8, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setCandidate:", v13);
  objc_msgSend(v14, "setStickerIdentifier:", v11);

  return v14;
}

+ (int)type
{
  return 1;
}

@end
