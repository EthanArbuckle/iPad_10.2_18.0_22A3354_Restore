@implementation REMChangeToken

- (int64_t)compareToken:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("Abstract method called -[%@ %@]"), v8, v9);

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:", 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  uint64_t v6;
  REMChangeToken *v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (REMChangeToken *)a3;
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("Abstract method called -[%@ %@]"), v8, v9);

  return self == v7;
}

+ (BOOL)supportsSecureCoding
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Abstract method called -[%@ %@]"), v5, v6);

  return 0;
}

- (REMChangeToken)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = objc_opt_class();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("Abstract method called -[%@ %@]"), v7, v8);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Abstract method called -[%@ %@]"), v6, v7);

}

@end
