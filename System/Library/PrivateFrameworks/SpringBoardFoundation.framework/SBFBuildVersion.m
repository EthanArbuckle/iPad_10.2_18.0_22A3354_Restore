@implementation SBFBuildVersion

- (SBFBuildVersion)initWithString:(id)a3
{
  id v4;
  SBFBuildVersion *v5;
  SBFBuildVersion *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SBFBuildVersion *v11;
  BOOL v12;
  uint64_t v13;
  NSString *stringRepresentation;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *majorBuildLetterString;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSString *v27;
  SBFBuildVersion *v28;
  uint64_t v29;
  NSString *minorBuildLetterString;
  SBFBuildVersion *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SBFBuildVersion;
  v5 = -[SBFBuildVersion init](&v33, sel_init);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v7);
    v10 = v9;

    v11 = 0;
    if (!objc_msgSend(v4, "length") || (v8 != 0x7FFFFFFFFFFFFFFFLL ? (v12 = v10 == 1) : (v12 = 0), !v12))
    {
      v20 = v6;
LABEL_19:

      goto LABEL_20;
    }
    v13 = objc_msgSend(v4, "copy");
    stringRepresentation = v6->_stringRepresentation;
    v6->_stringRepresentation = (NSString *)v13;

    objc_msgSend(v4, "substringToIndex:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_majorBuildNumber = objc_msgSend(v15, "integerValue");

    objc_msgSend(v4, "substringWithRange:", v8, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    majorBuildLetterString = v6->_majorBuildLetterString;
    v6->_majorBuildLetterString = (NSString *)v17;

    v19 = v8 + 1;
    objc_msgSend(v4, "substringFromIndex:", v8 + 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "rangeOfCharacterFromSet:", v21);
    v24 = v23;

    if (v22 == 0x7FFFFFFFFFFFFFFFLL || v24 != 1)
    {
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v29 = objc_msgSend(&stru_1E2010FC0, "copy");
        minorBuildLetterString = v6->_minorBuildLetterString;
        v6->_minorBuildLetterString = (NSString *)v29;

        objc_msgSend(v4, "substringFromIndex:", v19);
        v28 = (SBFBuildVersion *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else if (v22 == objc_msgSend(v20, "length") - 1)
    {
      objc_msgSend(v20, "substringWithRange:", v22, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      v27 = v6->_minorBuildLetterString;
      v6->_minorBuildLetterString = (NSString *)v26;

      objc_msgSend(v20, "substringToIndex:", v22);
      v28 = (SBFBuildVersion *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v31 = v28;
      v6->_minorBuildNumber = -[SBFBuildVersion integerValue](v28, "integerValue");
LABEL_18:

      v11 = v6;
      goto LABEL_19;
    }
    v31 = v6;
    v6 = 0;
    goto LABEL_18;
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SBFBuildVersion *v4;
  SBFBuildVersion *v5;
  int64_t majorBuildNumber;
  NSString *majorBuildLetterString;
  void *v8;
  NSString *minorBuildLetterString;
  void *v10;
  int64_t minorBuildNumber;
  BOOL v12;

  v4 = (SBFBuildVersion *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      majorBuildNumber = self->_majorBuildNumber;
      if (majorBuildNumber == -[SBFBuildVersion majorBuildNumber](v5, "majorBuildNumber"))
      {
        majorBuildLetterString = self->_majorBuildLetterString;
        -[SBFBuildVersion majorBuildLetterString](v5, "majorBuildLetterString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](majorBuildLetterString, "isEqualToString:", v8))
        {
          minorBuildLetterString = self->_minorBuildLetterString;
          -[SBFBuildVersion minorBuildLetterString](v5, "minorBuildLetterString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqualToString:](minorBuildLetterString, "isEqualToString:", v10))
          {
            minorBuildNumber = self->_minorBuildNumber;
            v12 = minorBuildNumber == -[SBFBuildVersion minorBuildNumber](v5, "minorBuildNumber");
          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_stringRepresentation);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_majorBuildNumber);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_majorBuildLetterString);
  v7 = (id)objc_msgSend(v3, "appendInteger:", self->_minorBuildNumber);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_minorBuildLetterString);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (int64_t)compareBuildVersion:(id)a3 withPrecision:(int64_t)a4
{
  id v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFUtilities.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherBuildVersion"));

  }
  v8 = -[SBFBuildVersion majorBuildNumber](self, "majorBuildNumber");
  v9 = objc_msgSend(v7, "majorBuildNumber");
  if (v8 < v9)
    v10 = -1;
  else
    v10 = v8 > v9;
  if (!v10)
  {
    if ((unint64_t)(a4 - 1) > 1)
      goto LABEL_18;
    -[SBFBuildVersion majorBuildLetterString](self, "majorBuildLetterString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "majorBuildLetterString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "caseInsensitiveCompare:", v12);

    if (a4 == 2 && !v10)
    {
      v13 = -[SBFBuildVersion minorBuildNumber](self, "minorBuildNumber");
      v14 = objc_msgSend(v7, "minorBuildNumber");
      v10 = v13 < v14 ? -1 : v13 > v14;
      if (!v10)
      {
        -[SBFBuildVersion minorBuildLetterString](self, "minorBuildLetterString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {

LABEL_17:
          -[SBFBuildVersion minorBuildLetterString](self, "minorBuildLetterString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "minorBuildLetterString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v17, "caseInsensitiveCompare:", v18);

          goto LABEL_19;
        }
        objc_msgSend(v7, "minorBuildLetterString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          goto LABEL_17;
LABEL_18:
        v10 = 0;
      }
    }
  }
LABEL_19:

  return v10;
}

- (int64_t)compareBuildVersionString:(id)a3 withPrecision:(int64_t)a4
{
  id v6;
  SBFBuildVersion *v7;
  int64_t v8;

  v6 = a3;
  v7 = -[SBFBuildVersion initWithString:]([SBFBuildVersion alloc], "initWithString:", v6);

  if (v7)
    v8 = -[SBFBuildVersion compareBuildVersion:withPrecision:](self, "compareBuildVersion:withPrecision:", v7, a4);
  else
    v8 = 0;

  return v8;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_stringRepresentation, 0);
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_majorBuildNumber, CFSTR("majorNumber"));
  objc_msgSend(v3, "appendString:withName:", self->_majorBuildLetterString, CFSTR("majorLetter"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_minorBuildNumber, CFSTR("minorNumber"));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_minorBuildLetterString, CFSTR("minorLetter"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (int64_t)majorBuildNumber
{
  return self->_majorBuildNumber;
}

- (NSString)majorBuildLetterString
{
  return self->_majorBuildLetterString;
}

- (int64_t)minorBuildNumber
{
  return self->_minorBuildNumber;
}

- (NSString)minorBuildLetterString
{
  return self->_minorBuildLetterString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_majorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

@end
