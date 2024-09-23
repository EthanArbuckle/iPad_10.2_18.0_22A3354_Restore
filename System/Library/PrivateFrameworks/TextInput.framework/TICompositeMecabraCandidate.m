@implementation TICompositeMecabraCandidate

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TICompositeMecabraCandidate;
  v5 = -[TIMecabraCandidate copyWithZone:](&v11, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_remainderCandidateString, "copyWithZone:", a3);
    v7 = (void *)v5[30];
    v5[30] = v6;

    v8 = -[NSArray copyWithZone:](self->_autoconvertedCandidatePointerValues, "copyWithZone:", a3);
    v9 = (void *)v5[31];
    v5[31] = v8;

  }
  return v5;
}

- (TICompositeMecabraCandidate)initWithCoder:(id)a3
{
  id v4;
  TICompositeMecabraCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *remainderCandidateString;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *autoconvertedCandidatePointerValues;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TICompositeMecabraCandidate;
  v5 = -[TIMecabraCandidate initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remainderCandidateString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    remainderCandidateString = v5->_remainderCandidateString;
    v5->_remainderCandidateString = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("autoconvertedCandidatePointerValues"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    autoconvertedCandidatePointerValues = v5->_autoconvertedCandidatePointerValues;
    v5->_autoconvertedCandidatePointerValues = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *remainderCandidateString;
  NSArray *autoconvertedCandidatePointerValues;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TICompositeMecabraCandidate;
  -[TIMecabraCandidate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  remainderCandidateString = self->_remainderCandidateString;
  if (remainderCandidateString)
    objc_msgSend(v4, "encodeObject:forKey:", remainderCandidateString, CFSTR("remainderCandidateString"));
  autoconvertedCandidatePointerValues = self->_autoconvertedCandidatePointerValues;
  if (autoconvertedCandidatePointerValues)
    objc_msgSend(v4, "encodeObject:forKey:", autoconvertedCandidatePointerValues, CFSTR("autoconvertedCandidatePointerValues"));

}

- (TICompositeMecabraCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TICompositeMecabraCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *remainderCandidateString;
  void *v9;
  uint64_t v10;
  NSArray *autoconvertedCandidatePointerValues;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TICompositeMecabraCandidate;
  v5 = -[TIMecabraCandidate initWithCandidateResultSetCoder:](&v13, sel_initWithCandidateResultSetCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    remainderCandidateString = v5->_remainderCandidateString;
    v5->_remainderCandidateString = (NSString *)v7;

    objc_msgSend(v4, "decodePointerValueArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    autoconvertedCandidatePointerValues = v5->_autoconvertedCandidatePointerValues;
    v5->_autoconvertedCandidatePointerValues = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TICompositeMecabraCandidate;
  v4 = a3;
  -[TIMecabraCandidate encodeWithCandidateResultSetCoder:](&v7, sel_encodeWithCandidateResultSetCoder_, v4);
  -[TICompositeMecabraCandidate remainderCandidateString](self, "remainderCandidateString", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v5);

  -[TICompositeMecabraCandidate autoconvertedCandidatePointerValues](self, "autoconvertedCandidatePointerValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodePointerValueArray:", v6);

}

- (NSString)remainderCandidateString
{
  return self->_remainderCandidateString;
}

- (void)setRemainderCandidateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSArray)autoconvertedCandidatePointerValues
{
  return self->_autoconvertedCandidatePointerValues;
}

- (void)setAutoconvertedCandidatePointerValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoconvertedCandidatePointerValues, 0);
  objc_storeStrong((id *)&self->_remainderCandidateString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)type
{
  return 7;
}

@end
