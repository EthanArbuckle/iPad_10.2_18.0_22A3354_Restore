@implementation NSString(RTExtensions)

- (uint64_t)stringByRemovingAllWhitespace
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[:space:]"), &stru_1E92AB3A8, 1024, 0, objc_msgSend(a1, "length"));
}

- (uint64_t)stringByRemovingAllWhitespaceAndPunctuation
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[:space:]|[:punct:]"), &stru_1E92AB3A8, 1024, 0, objc_msgSend(a1, "length"));
}

- (uint64_t)levenshteinDistanceFromString:()RTExtensions withMaxCutOffDistance:
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  unint64_t *v25;
  int v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v32;
  unint64_t *v33;
  _QWORD v34[2];
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t *v38;
  char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a1;
  v8 = objc_msgSend(v7, "length");
  if (v8 <= objc_msgSend(v6, "length") + a4 && (v9 = objc_msgSend(v6, "length"), v9 <= objc_msgSend(v7, "length") + a4))
  {
    v12 = objc_msgSend(v7, "length");
    v10 = objc_msgSend(v6, "length");
    if (v12)
    {
      if (v10)
      {
        if ((objc_msgSend(v7, "isEqualToString:", v6) & 1) != 0)
        {
          v10 = 0;
        }
        else
        {
          v34[1] = v34;
          v13 = (_QWORD *)((char *)v34 - ((8 * objc_msgSend(v7, "length") + 23) & 0xFFFFFFFFFFFFFFF0));
          v39 = (char *)v34 - ((8 * objc_msgSend(v7, "length") + 23) & 0xFFFFFFFFFFFFFFF0);
          v14 = objc_msgSend(v7, "length");
          v15 = v14 + 1;
          if (v14 != -1)
          {
            bzero(v39, 8 * v14 + 8);
            v16 = 0;
            do
            {
              v13[v16] = v16;
              ++v16;
            }
            while (v15 != v16);
          }
          if ((unint64_t)(objc_msgSend(v6, "length") - 1) > 0xFFFFFFFFFFFFFFFDLL)
          {
            v33 = v13;
LABEL_39:
            if (v33[objc_msgSend(v7, "length")] <= a4)
            {
              v10 = v33[objc_msgSend(v7, "length")];
              goto LABEL_4;
            }
          }
          else
          {
            v17 = a4 + 1;
            v18 = 1;
            v35 = a4;
            v36 = a4 + 1;
            while (1)
            {
              v19 = (unint64_t *)v39;
              v39 = (char *)v13;
              v20 = v18 - a4;
              if (v18 <= a4)
              {
                *v19 = v18;
                v20 = 1;
              }
              else
              {
                v19[v20 - 1] = v17;
              }
              v21 = v18 + a4;
              v22 = objc_msgSend(v7, "length");
              v37 = v18;
              v38 = v19;
              if (v18 + a4 >= v22)
                v21 = objc_msgSend(v7, "length");
              else
                v19[v21 + 1] = v17;
              if (v20 < v15)
              {
                v17 = v36;
                if (v20 <= v21)
                {
                  v17 = v36;
                  v23 = v37 - 1;
                  v24 = &v39[8 * v20];
                  v25 = &v38[v20];
                  do
                  {
                    v26 = objc_msgSend(v7, "characterAtIndex:", v20 - 1);
                    v27 = objc_msgSend(v6, "characterAtIndex:", v23);
                    v28 = *((_QWORD *)v24 - 1);
                    if (v26 != v27)
                      ++v28;
                    v29 = *(_QWORD *)v24 + 1;
                    v30 = *(v25 - 1);
                    if (v29 >= v30 + 1)
                      v29 = v30 + 1;
                    if (v28 >= v29)
                      v28 = v29;
                    *v25 = v28;
                    if (v17 >= v28)
                      v17 = v28;
                    if (v20 + 1 >= v15)
                      break;
                    v24 += 8;
                    ++v25;
                  }
                  while (v20++ < v21);
                }
              }
              a4 = v35;
              if (v17 > v35)
                break;
              v18 = v37 + 1;
              v32 = objc_msgSend(v6, "length") + 1;
              v33 = v38;
              v13 = v38;
              v17 = v36;
              if (v18 >= v32)
                goto LABEL_39;
            }
          }
          v10 = -1;
        }
      }
      else
      {
        v10 = objc_msgSend(v7, "length");
      }
    }
  }
  else
  {
    v10 = -1;
  }
LABEL_4:

  return v10;
}

- (id)base64EncodedString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)base64DecodedString
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", a1, 0);
  v4 = (void *)objc_msgSend(v2, "initWithData:encoding:", v3, 4);

  return v4;
}

- (id)hmacSha1WithKey:()RTExtensions
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmacSha1WithKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
