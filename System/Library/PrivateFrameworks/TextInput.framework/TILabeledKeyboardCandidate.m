@implementation TILabeledKeyboardCandidate

- (TILabeledKeyboardCandidate)initWithCandidate:(id)a3 forInput:(id)a4 label:(id)a5
{
  return -[TILabeledKeyboardCandidate initWithCandidate:forInput:label:transliterationType:](self, "initWithCandidate:forInput:label:transliterationType:", a3, a4, a5, 0);
}

- (TILabeledKeyboardCandidate)initWithCandidate:(id)a3 forInput:(id)a4 label:(id)a5 transliterationType:(int64_t)a6
{
  id v11;
  TILabeledKeyboardCandidate *v12;
  TILabeledKeyboardCandidate *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TILabeledKeyboardCandidate;
  v12 = -[TIKeyboardCandidateSingle initWithCandidate:forInput:](&v15, sel_initWithCandidate_forInput_, a3, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_label, a5);
    v13->_transliterationType = a6;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TILabeledKeyboardCandidate;
  v4 = -[TIKeyboardCandidateSingle copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 30, self->_label);
    v5[28] = (id)self->_transliterationType;
  }
  return v5;
}

- (TILabeledKeyboardCandidate)initWithCoder:(id)a3
{
  id v4;
  TILabeledKeyboardCandidate *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TILabeledKeyboardCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_transliterationType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("transliterationType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *label;
  int64_t transliterationType;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TILabeledKeyboardCandidate;
  -[TIKeyboardCandidateSingle encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  label = self->_label;
  if (label)
    objc_msgSend(v4, "encodeObject:forKey:", label, CFSTR("label"));
  transliterationType = self->_transliterationType;
  if (transliterationType)
    objc_msgSend(v4, "encodeInt:forKey:", transliterationType, CFSTR("transliterationType"));

}

- (BOOL)isTransliterationCandidate
{
  return self->_transliterationType != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)TILabeledKeyboardCandidate;
    if (-[TIKeyboardCandidate isEqual:](&v8, sel_isEqual_, v5))
      v6 = self->_transliterationType == v5[28];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (TILabeledKeyboardCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TILabeledKeyboardCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *label;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TILabeledKeyboardCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCandidateResultSetCoder:](&v10, sel_initWithCandidateResultSetCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v7;

    v5->_transliterationType = objc_msgSend(v4, "decodeByte");
  }

  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  const __CFString *label;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TILabeledKeyboardCandidate;
  v4 = a3;
  -[TIKeyboardCandidateSingle encodeWithCandidateResultSetCoder:](&v6, sel_encodeWithCandidateResultSetCoder_, v4);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = &stru_1E243B990;
  objc_msgSend(v4, "encodeString:", label, v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeByte:", LOBYTE(self->_transliterationType));

}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)type
{
  return 11;
}

@end
