@implementation TITypologyRecordSetOriginalInput

- (TITypologyRecordSetOriginalInput)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordSetOriginalInput *v5;
  void *v6;
  uint64_t v7;
  NSString *originalInput;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TITypologyRecordSetOriginalInput;
  v5 = -[TITypologyRecord initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalInput"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    originalInput = v5->_originalInput;
    v5->_originalInput = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordSetOriginalInput;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalInput, CFSTR("originalInput"), v5.receiver, v5.super_class);

}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TITypologyRecordSetOriginalInput originalInput](self, "originalInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SET ORIGINAL INPUT: \"%@\"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)originalInput
{
  return self->_originalInput;
}

- (void)setOriginalInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalInput, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordSetOriginalInput:", self);
}

@end
