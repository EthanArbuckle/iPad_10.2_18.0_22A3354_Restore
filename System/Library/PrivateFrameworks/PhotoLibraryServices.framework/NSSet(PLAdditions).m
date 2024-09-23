@implementation NSSet(PLAdditions)

- (uint64_t)pl_countOfObjectsPassingTest:()PLAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__NSSet_PLAdditions__pl_countOfObjectsPassingTest___block_invoke;
  v9[3] = &unk_1E366AA60;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  objc_autoreleasePoolPop(v5);

  return v7;
}

@end
