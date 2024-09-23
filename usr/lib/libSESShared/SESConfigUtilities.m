@implementation SESConfigUtilities

+ (float)getVersion:(id)a3 error:(id *)a4
{
  id v5;
  float v6;
  float v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(v5, "floatValue");
  v7 = v6;
  if (a4 && v6 == 0.0)
  {
    SESDefaultLogObject();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v8, SESErrorDomain, 1, CFSTR("Invalid version from string %@"), v9, v10, v11, (uint64_t)v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)validateKey:(id)a3 expectedClass:(Class)a4 dictionary:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    SESDefaultLogObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v9, SESErrorDomain, 4, CFSTR("Missing key %@"), v10, v11, v12, (uint64_t)v6);
LABEL_6:
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SESDefaultLogObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v9, SESErrorDomain, 1, CFSTR("Wrong class for key %@"), v13, v14, v15, (uint64_t)v6);
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

@end
