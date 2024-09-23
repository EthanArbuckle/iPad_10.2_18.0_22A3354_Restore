@implementation TITypologyRecordReplacements

- (TITypologyRecordReplacements)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordReplacements *v5;
  void *v6;
  uint64_t v7;
  NSString *string;
  uint64_t v9;
  TIKeyboardLayout *keyLayout;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *candidates;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TITypologyRecordReplacements;
  v5 = -[TITypologyRecord initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    string = v5->_string;
    v5->_string = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyLayout"));
    v9 = objc_claimAutoreleasedReturnValue();
    keyLayout = v5->_keyLayout;
    v5->_keyLayout = (TIKeyboardLayout *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("candidates"));
    v14 = objc_claimAutoreleasedReturnValue();
    candidates = v5->_candidates;
    v5->_candidates = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordReplacements;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_string, CFSTR("string"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyLayout, CFSTR("keyLayout"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidates, CFSTR("candidates"));

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TITypologyRecordReplacements string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypologyRecordReplacements candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("REPLACEMENTS for \"%@\": %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (void)setKeyLayout:(id)a3
{
  objc_storeStrong((id *)&self->_keyLayout, a3);
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_candidates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_keyLayout, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordReplacements:", self);
}

@end
