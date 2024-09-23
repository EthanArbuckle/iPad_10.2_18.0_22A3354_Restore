@implementation SFSpeechSynthesisUtils

+ (BOOL)isInternalBuild
{
  return MGGetBoolAnswer();
}

+ (id)genderStringFromGender:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("undefined");
  if (a3 == 2)
    v3 = CFSTR("female");
  if (a3 == 1)
    return CFSTR("male");
  else
    return (id)v3;
}

+ (int64_t)genderFromString:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  int v8;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("male"), "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("female"), "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if (v8)
      v6 = 2;
    else
      v6 = 0;
  }

  return v6;
}

+ (id)footprintStringFromFootprint:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4)
    return CFSTR("undefined");
  else
    return off_24E246B80[a3 + 1];
}

+ (int64_t)footprintFromString:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("beta"), "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = -1;
  }
  else
  {
    objc_msgSend(CFSTR("compact"), "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(CFSTR("premium"), "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = 2;
      }
      else
      {
        objc_msgSend(CFSTR("premiumhigh"), "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "isEqualToString:", v11);

        if (v12)
          v6 = 3;
        else
          v6 = 0;
      }
    }
  }

  return v6;
}

+ (id)typeStringFromType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("undefined");
  else
    return off_24E246BA8[a3 - 1];
}

+ (int64_t)typeFromString:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("vocalizer"), "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("gryphon"), "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(CFSTR("neural"), "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if (v10)
        v6 = 3;
      else
        v6 = 0;
    }
  }

  return v6;
}

+ (double)absoluteTimeToSecond:(unint64_t)a3
{
  if (absoluteTimeToSecond__onceToken != -1)
    dispatch_once(&absoluteTimeToSecond__onceToken, &__block_literal_global_1285);
  return *(double *)&absoluteTimeToSecond__clockFactor * (double)a3;
}

double __47__SFSpeechSynthesisUtils_absoluteTimeToSecond___block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 / 1000000000.0;
  absoluteTimeToSecond__clockFactor = *(_QWORD *)&result;
  return result;
}

@end
