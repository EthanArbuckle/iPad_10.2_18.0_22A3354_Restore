@implementation WFImageGetCoreServicesBundlePath

uint64_t __WFImageGetCoreServicesBundlePath_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
    goto LABEL_6;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("System")) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v7 = 1;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Cryptexes"));

  if ((v9 & 1) != 0)
    goto LABEL_12;
LABEL_7:
  objc_msgSend(v4, "pathComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") <= 1)
  {
LABEL_11:

    v7 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("System")) & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Cryptexes"));

  v7 = v13 << 63 >> 63;
LABEL_12:

  return v7;
}

@end
