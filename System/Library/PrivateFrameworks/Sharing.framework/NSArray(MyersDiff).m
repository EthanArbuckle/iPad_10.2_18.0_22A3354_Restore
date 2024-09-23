@implementation NSArray(MyersDiff)

- (uint64_t)sf_differencesFromArray:()MyersDiff removedIndexes:insertedIndexes:
{
  return objc_msgSend(a1, "sf_differencesFromArray:usingComparator:removedIndexes:insertedIndexes:", a3, &__block_literal_global_17, a4, a5);
}

- (void)sf_differencesFromArray:()MyersDiff usingComparator:removedIndexes:insertedIndexes:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  char *v18;
  uint64_t v19;
  size_t v20;
  char *v21;
  uint64_t v22;
  _QWORD v23[2];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "count");
  v15 = objc_msgSend(v10, "count");
  v16 = v15;
  if (v14 >> 15 || v15 >= 0x8000)
  {
    objc_msgSend(v12, "addIndexesInRange:", 0, v14);
    objc_msgSend(v13, "addIndexesInRange:", 0, v16);
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v23[1] = v23;
  MEMORY[0x1E0C80A78](v15);
  v24 = v11;
  v18 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v18, v17);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v21, v20);
  objc_msgSend(a1, "getObjects:range:", v18, 0, v14);
  objc_msgSend(v10, "getObjects:range:", v21, 0, v16);
  v22 = (uint64_t)v18;
  v11 = v24;
  _SF_MyersDiff(v22, (uint64_t)v21, 0, 0, (__int16)v14, (__int16)v16, v24, v12, v13);
  if (a5)
LABEL_6:
    *a5 = objc_retainAutorelease(v12);
LABEL_7:
  if (a6)
    *a6 = objc_retainAutorelease(v13);

}

@end
