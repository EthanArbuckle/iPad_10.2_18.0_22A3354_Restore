@implementation TILiveConversionCandidate

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TILiveConversionCandidate;
  v5 = -[TIMecabraCandidate copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_candidate, "copyWithZone:", a3);
    v7 = (void *)v5[30];
    v5[30] = v6;

    *((_BYTE *)v5 + 248) = self->_inlineCandidate;
    *((_BYTE *)v5 + 249) = self->_partialCandidate;
  }
  return v5;
}

- (TILiveConversionCandidate)initWithCoder:(id)a3
{
  id v4;
  TILiveConversionCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *candidate;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TILiveConversionCandidate;
  v5 = -[TIMecabraCandidate initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidate-liveconversion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    v5->_inlineCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inlinecandidate-liveconversion"));
    v5->_partialCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("partialcandidate-liveconversion"));
  }

  return v5;
}

- (id)label
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TILiveConversionCandidate;
  -[TIMecabraCandidate candidate](&v3, sel_candidate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *candidate;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TILiveConversionCandidate;
  -[TIMecabraCandidate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  candidate = self->_candidate;
  if (candidate)
    objc_msgSend(v4, "encodeObject:forKey:", candidate, CFSTR("candidate-liveconversion"));
  if (self->_inlineCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("inlinecandidate-liveconversion"));
  if (self->_partialCandidate)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("partialcandidate-liveconversion"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v12.receiver = self,
        v12.super_class = (Class)TILiveConversionCandidate,
        -[TIMecabraCandidate isEqual:](&v12, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[TILiveConversionCandidate label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[TILiveConversionCandidate candidate](self, "candidate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "candidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TILiveConversionCandidate;
  v3 = 257 * -[TIKeyboardCandidate hash](&v5, sel_hash);
  return -[NSString hash](self->_candidate, "hash") + v3;
}

- (TILiveConversionCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TILiveConversionCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *candidate;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TILiveConversionCandidate;
  v5 = -[TIMecabraCandidate initWithCandidateResultSetCoder:](&v10, sel_initWithCandidateResultSetCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    v5->_inlineCandidate = objc_msgSend(v4, "decodeBool");
    v5->_partialCandidate = objc_msgSend(v4, "decodeBool");
  }

  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TILiveConversionCandidate;
  v4 = a3;
  -[TIMecabraCandidate encodeWithCandidateResultSetCoder:](&v5, sel_encodeWithCandidateResultSetCoder_, v4);
  objc_msgSend(v4, "encodeString:", self->_candidate, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:", self->_inlineCandidate);
  objc_msgSend(v4, "encodeBool:", self->_partialCandidate);

}

- (id)candidate
{
  return self->_candidate;
}

- (BOOL)isInlineCandidate
{
  return self->_inlineCandidate;
}

- (void)setInlineCandidate:(BOOL)a3
{
  self->_inlineCandidate = a3;
}

- (BOOL)isPartialCandidate
{
  return self->_partialCandidate;
}

- (void)setPartialCandidate:(BOOL)a3
{
  self->_partialCandidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidate, 0);
}

+ (int)type
{
  return 10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TILiveConversionCandidate)initWithSurface:(id)a3 input:(id)a4 candidate:(id)a5 mecabraCandidatePointerValue:(id)a6
{
  id v11;
  TILiveConversionCandidate *v12;
  TILiveConversionCandidate *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TILiveConversionCandidate;
  v12 = -[TIMecabraCandidate initWithSurface:input:mecabraCandidatePointerValue:](&v15, sel_initWithSurface_input_mecabraCandidatePointerValue_, a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_candidate, a5);

  return v13;
}

@end
