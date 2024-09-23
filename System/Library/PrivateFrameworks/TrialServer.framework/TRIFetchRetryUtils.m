@implementation TRIFetchRetryUtils

+ (id)fetchRetryDateFromRetryAfterSeconds:(id)a3 isDeferral:(BOOL)a4 isRetryable:(BOOL)a5 isNonDiscretionary:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v9, "doubleValue");
    v13 = v11;
  }
  else if (v8)
  {
    v13 = (void *)MEMORY[0x1E0C99D68];
    v12 = 3600.0;
  }
  else
  {
    if (!v7)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v13 = (void *)MEMORY[0x1E0C99D68];
    if (v6)
      v12 = 300.0;
    else
      v12 = 1200.0;
  }
  objc_msgSend(v13, "dateWithTimeIntervalSinceNow:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v14;
}

@end
