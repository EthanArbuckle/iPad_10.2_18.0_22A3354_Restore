@implementation USOASRAlternative

- (USOASRAlternative)initWithValue:(id)a3
{
  id v5;
  USOASRAlternative *v6;
  USOASRAlternative *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)USOASRAlternative;
  v6 = -[USOASRAlternative init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_value, a3);

  return v7;
}

- (USOASRAlternative)initWithValue:(id)a3 probability:(float)a4
{
  id v7;
  USOASRAlternative *v8;
  USOASRAlternative *v9;
  double v10;
  uint64_t v11;
  NSNumber *probability;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOASRAlternative;
  v8 = -[USOASRAlternative init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_value, a3);
    *(float *)&v10 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    probability = v9->_probability;
    v9->_probability = (NSNumber *)v11;

  }
  return v9;
}

- (USOASRAlternative)initWithCoder:(id)a3
{
  id v4;
  USOASRAlternative *v5;
  uint64_t v6;
  NSString *value;
  uint64_t v8;
  NSNumber *probability;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)USOASRAlternative;
  v5 = -[USOASRAlternative init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("probability"));
    v8 = objc_claimAutoreleasedReturnValue();
    probability = v5->_probability;
    v5->_probability = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[USOASRAlternative value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("value"));

  -[USOASRAlternative probability](self, "probability");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("probability"));

}

- (NSString)value
{
  return self->_value;
}

- (NSNumber)probability
{
  return self->_probability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
