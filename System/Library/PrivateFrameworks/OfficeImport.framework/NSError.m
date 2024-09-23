@implementation NSError

uint64_t __46__NSError_TSUAdditions__tsu_isOutOfSpaceError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  const __CFString **v8;
  const __CFString *v9;
  uint64_t v10;

  v6 = a2;
  v7 = a4;
  if (a3 == 2)
  {
    v9 = CFSTR("com.apple.iWork.TSUtility");
  }
  else
  {
    if (a3 == 28)
    {
      v8 = (const __CFString **)MEMORY[0x24BDD1128];
    }
    else
    {
      if (a3 != 640)
      {
        v10 = 0;
        goto LABEL_10;
      }
      v8 = (const __CFString **)MEMORY[0x24BDD0B88];
    }
    v9 = *v8;
  }
  v10 = objc_msgSend(v6, "isEqualToString:", v9);
LABEL_10:

  return v10;
}

uint64_t __42__NSError_TSUAdditions__tsu_isCancelError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;

  v6 = a2;
  v7 = a4;
  if (a3 == 3072)
  {
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) == 0)
    {
      v8 = CFSTR("_OnDemandResourcesErrorDomain");
      goto LABEL_8;
    }
    v9 = 1;
  }
  else
  {
    if (a3 == -999)
    {
      v8 = (const __CFString *)*MEMORY[0x24BDD1308];
LABEL_8:
      v9 = objc_msgSend(v6, "isEqualToString:", v8);
      goto LABEL_9;
    }
    v9 = 0;
  }
LABEL_9:

  return v9;
}

uint64_t __46__NSError_TSUAdditions__tsu_isNoSuchFileError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;

  v6 = a2;
  v7 = a4;
  if (a3 == 2)
  {
    v8 = (_QWORD *)MEMORY[0x24BDD1128];
  }
  else
  {
    if (a3 != 260 && a3 != 4)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = (_QWORD *)MEMORY[0x24BDD0B88];
  }
  v9 = objc_msgSend(v6, "isEqualToString:", *v8);
LABEL_8:

  return v9;
}

uint64_t __33__NSError_TSUIO__tsu_isReadError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a2;
  v7 = a4;
  if (a3 == 256 && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TSUIOErrorType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", &unk_24F46A408);

  }
  return v8;
}

uint64_t __38__NSError_TSUIO__tsu_isCorruptedError__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 == 259)
    return objc_msgSend(a2, "isEqualToString:", *MEMORY[0x24BDD0B88]);
  else
    return 0;
}

uint64_t __34__NSError_TSUIO__tsu_isWriteError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a2;
  v7 = a4;
  if (a3 == 512 && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TSUIOErrorType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", &unk_24F46A420);

  }
  return v8;
}

@end
