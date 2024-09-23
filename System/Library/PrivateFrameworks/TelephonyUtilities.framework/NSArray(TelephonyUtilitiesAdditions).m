@implementation NSArray(TelephonyUtilitiesAdditions)

- (id)tu_firstObjectPassingTest:()TelephonyUtilitiesAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__NSArray_TelephonyUtilitiesAdditions__tu_firstObjectPassingTest___block_invoke;
  v9[3] = &unk_1E38A3740;
  v5 = v4;
  v10 = v5;
  v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v9);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)tu_mapAndFilterObjectsUsingBlock:()TelephonyUtilitiesAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__NSArray_TelephonyUtilitiesAdditions__tu_mapAndFilterObjectsUsingBlock___block_invoke;
  v11[3] = &unk_1E38A3718;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", 0, v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (BOOL)tu_containsObjectPassingTest:()TelephonyUtilitiesAdditions
{
  id v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__NSArray_TelephonyUtilitiesAdditions__tu_containsObjectPassingTest___block_invoke;
  v8[3] = &unk_1E38A3740;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

@end
