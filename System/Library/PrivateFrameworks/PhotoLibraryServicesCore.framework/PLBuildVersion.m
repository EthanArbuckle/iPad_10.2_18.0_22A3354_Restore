@implementation PLBuildVersion

- (PLBuildVersion)initWithString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v10;
  NSString *stringRepresentation;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *majorBuildLetterString;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  PLBuildVersion *v25;
  NSString *v26;
  NSString *minorBuildLetterString;
  PLBuildVersion *v28;
  objc_super v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5);
  v8 = v7;

  if (objc_msgSend(v4, "length"))
  {
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 == 1)
    {
      v30.receiver = self;
      v30.super_class = (Class)PLBuildVersion;
      self = -[PLBuildVersion init](&v30, sel_init);
      if (self)
      {
        v10 = (NSString *)objc_msgSend(v4, "copy");
        stringRepresentation = self->_stringRepresentation;
        self->_stringRepresentation = v10;

        objc_msgSend(v4, "substringToIndex:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        self->_majorBuildNumber = objc_msgSend(v12, "integerValue");

        objc_msgSend(v4, "substringWithRange:", v6, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (NSString *)objc_msgSend(v13, "copy");
        majorBuildLetterString = self->_majorBuildLetterString;
        self->_majorBuildLetterString = v14;

        v16 = v6 + 1;
        objc_msgSend(v4, "substringFromIndex:", v6 + 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "rangeOfCharacterFromSet:", v18);
        v21 = v20;

        if (v19 == 0x7FFFFFFFFFFFFFFFLL || v21 != 1)
        {
          if (v19 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v26 = (NSString *)objc_msgSend(&stru_1E376D3F8, "copy");
            minorBuildLetterString = self->_minorBuildLetterString;
            self->_minorBuildLetterString = v26;

            objc_msgSend(v4, "substringFromIndex:", v16);
            v25 = (PLBuildVersion *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
        else if (v19 == objc_msgSend(v17, "length") - 1)
        {
          objc_msgSend(v17, "substringWithRange:", v19, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (NSString *)objc_msgSend(v22, "copy");
          v24 = self->_minorBuildLetterString;
          self->_minorBuildLetterString = v23;

          objc_msgSend(v17, "substringToIndex:", v19);
          v25 = (PLBuildVersion *)objc_claimAutoreleasedReturnValue();
LABEL_14:
          v28 = v25;
          self->_minorBuildNumber = -[PLBuildVersion integerValue](v25, "integerValue");
LABEL_16:

          goto LABEL_17;
        }
        v28 = self;
        self = 0;
        goto LABEL_16;
      }
    }
  }
LABEL_17:

  return self;
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
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLHelper.m"), 2137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherBuildVersion"));

  }
  v8 = -[PLBuildVersion majorBuildNumber](self, "majorBuildNumber");
  v9 = objc_msgSend(v7, "majorBuildNumber");
  if (v8 < v9)
    v10 = -1;
  else
    v10 = v8 > v9;
  if (!v10)
  {
    if ((unint64_t)(a4 - 1) > 1)
      goto LABEL_18;
    -[PLBuildVersion majorBuildLetterString](self, "majorBuildLetterString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "majorBuildLetterString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "caseInsensitiveCompare:", v12);

    if (a4 == 2 && !v10)
    {
      v13 = -[PLBuildVersion minorBuildNumber](self, "minorBuildNumber");
      v14 = objc_msgSend(v7, "minorBuildNumber");
      v10 = v13 < v14 ? -1 : v13 > v14;
      if (!v10)
      {
        -[PLBuildVersion minorBuildLetterString](self, "minorBuildLetterString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {

LABEL_17:
          -[PLBuildVersion minorBuildLetterString](self, "minorBuildLetterString");
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
  PLBuildVersion *v7;
  int64_t v8;

  v6 = a3;
  v7 = -[PLBuildVersion initWithString:]([PLBuildVersion alloc], "initWithString:", v6);

  if (v7)
    v8 = -[PLBuildVersion compareBuildVersion:withPrecision:](self, "compareBuildVersion:withPrecision:", v7, a4);
  else
    v8 = 0;

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] = %ld %@ %ld, %@"), self->_stringRepresentation, self->_majorBuildNumber, self->_majorBuildLetterString, self->_minorBuildNumber, self->_minorBuildLetterString);
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

+ (id)currentBuildVersionString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)_CFCopySystemVersionDictionary();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
