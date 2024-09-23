@implementation TranscriptionDecoder

+ (id)decodeTransciptionData:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;

  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "decodeDictionary:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributedString"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
      }
      else
      {
        objc_msgSend(a1, "decodeAttributedStringRuns:error:", v9, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          if ((unint64_t)objc_msgSend(v11, "count") < 2)
          {
LABEL_12:
            v10 = v12;
          }
          else
          {
            v13 = 0;
            while (1)
            {
              objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "decodeString:error:", v14, a4);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
                break;
              objc_msgSend(v12, "appendString:", v15);

              v16 = objc_msgSend(v11, "count");
              v17 = v13 + 3;
              v13 += 2;
              if (v16 <= v17)
                goto LABEL_12;
            }
            v10 = 0;
          }

        }
        else
        {
          v10 = 0;
        }

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)decodeDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    RCDecodeFail(1, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)decodeAttributedStringRuns:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  if (!v5)
  {
    v9 = 2;
LABEL_8:
    RCDecodeFail(v9, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("runs"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
    if (!v7)
    {
      v9 = 5;
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    RCDecodeFail(3, a4);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

+ (id)decodeString:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    RCDecodeFail(4, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

@end
