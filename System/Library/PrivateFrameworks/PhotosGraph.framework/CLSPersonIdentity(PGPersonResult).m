@implementation CLSPersonIdentity(PGPersonResult)

- (id)keywordDescription
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;

  objc_msgSend(a1, "fullName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "contactIdentifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), CFSTR("CLSPersonIdentity"), v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), CFSTR("CLSPersonIdentity"), v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)suggestedContactIdentifier
{
  return 0;
}

- (uint64_t)compareToPerson:()PGPersonResult
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = objc_msgSend((id)objc_opt_class(), "type");
  v1 = objc_msgSend((id)objc_opt_class(), "type");
  v2 = 1;
  if (v0)
    v2 = -1;
  if (v0 == v1)
    return 0;
  else
    return v2;
}

- (uint64_t)isVerified
{
  return 1;
}

- (BOOL)isInferredChild
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  _BOOL8 v5;

  objc_msgSend(a1, "birthdayDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", v1);
    v4 = v3;

    v5 = v4 < 410248800.0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (uint64_t)type
{
  return 2;
}

@end
