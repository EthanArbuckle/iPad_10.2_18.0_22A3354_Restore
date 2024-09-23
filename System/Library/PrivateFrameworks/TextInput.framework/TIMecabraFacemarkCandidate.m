@implementation TIMecabraFacemarkCandidate

- (TIMecabraFacemarkCandidate)initWithCandidate:(id)a3 category:(id)a4 input:(id)a5 mecabraCandidatePointerValue:(id)a6
{
  id v10;
  TIMecabraFacemarkCandidate *v11;
  TIMecabraFacemarkCandidate *v12;
  objc_super v14;

  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIMecabraFacemarkCandidate;
  v11 = -[TIMecabraCandidate initWithSurface:input:mecabraCandidatePointerValue:](&v14, sel_initWithSurface_input_mecabraCandidatePointerValue_, a3, a5, a6);
  v12 = v11;
  if (v11)
    -[TIMecabraFacemarkCandidate setCategory:](v11, "setCategory:", v10);

  return v12;
}

- (BOOL)isFacemarkCandidate
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIMecabraFacemarkCandidate;
  v5 = -[TIMecabraCandidate copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
    v7 = (void *)v5[30];
    v5[30] = v6;

  }
  return v5;
}

- (TIMecabraFacemarkCandidate)initWithCoder:(id)a3
{
  id v4;
  TIMecabraFacemarkCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *category;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIMecabraFacemarkCandidate;
  v5 = -[TIMecabraCandidate initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    category = v5->_category;
    v5->_category = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *category;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TIMecabraFacemarkCandidate;
  -[TIMecabraCandidate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  category = self->_category;
  if (category)
    objc_msgSend(v4, "encodeObject:forKey:", category, CFSTR("category"));

}

- (BOOL)isEqual:(id)a3
{
  TIMecabraFacemarkCandidate *v4;
  TIMecabraFacemarkCandidate *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  objc_super v11;

  v4 = (TIMecabraFacemarkCandidate *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TIMecabraFacemarkCandidate category](v5, "category");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIMecabraFacemarkCandidate category](self, "category");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        v11.receiver = self;
        v11.super_class = (Class)TIMecabraFacemarkCandidate;
        v9 = -[TIMecabraCandidate isEqual:](&v11, sel_isEqual_, v5);
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TIMecabraCandidate input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraCandidate candidate](self, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraFacemarkCandidate category](self, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p '%@' -> '%@' (%@)"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TIMecabraFacemarkCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TIMecabraFacemarkCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *category;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIMecabraFacemarkCandidate;
  v5 = -[TIMecabraCandidate initWithCandidateResultSetCoder:](&v10, sel_initWithCandidateResultSetCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    category = v5->_category;
    v5->_category = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIMecabraFacemarkCandidate;
  v4 = a3;
  -[TIMecabraCandidate encodeWithCandidateResultSetCoder:](&v6, sel_encodeWithCandidateResultSetCoder_, v4);
  -[TIMecabraFacemarkCandidate category](self, "category", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v5);

}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)candidateWithCandidate:(id)a3 category:(id)a4 input:(id)a5 mecabraCandidatePointerValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidate:category:input:mecabraCandidatePointerValue:", v13, v12, v11, v10);

  return v14;
}

+ (int)type
{
  return 8;
}

@end
