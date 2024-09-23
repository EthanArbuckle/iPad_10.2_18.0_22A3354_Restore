@implementation WFScanRecordAlphaSortCompartor

uint64_t __WFScanRecordAlphaSortCompartor_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v5, "title");
    v7 = objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_9;
  }
  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "caseInsensitiveCompare:", v11);

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }
LABEL_9:

  return v7;
}

@end
