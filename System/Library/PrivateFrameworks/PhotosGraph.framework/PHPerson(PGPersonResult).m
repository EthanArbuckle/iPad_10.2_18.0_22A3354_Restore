@implementation PHPerson(PGPersonResult)

- (id)keywordDescription
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "localIdentifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), CFSTR("PHPerson"), v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), CFSTR("PHPerson"), v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)suggestedContactIdentifier
{
  return 0;
}

- (uint64_t)compareToPerson:()PGPersonResult
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "type");
  if (v5 == objc_msgSend((id)objc_opt_class(), "type"))
  {
    v6 = v4;
    v7 = objc_msgSend(a1, "faceCount");
    v8 = objc_msgSend(v6, "faceCount");
    if (v7 <= v8)
    {
      if (v7 < v8)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(a1, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "compare:", v11);

      }
    }
    else
    {
      v9 = -1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (uint64_t)birthdayDate
{
  return 0;
}

- (uint64_t)isInferredChild
{
  return 0;
}

+ (uint64_t)type
{
  return 1;
}

@end
