@implementation NSMutableArray(PKMutableArrayAdditions)

- (void)safelyAddObject:()PKMutableArrayAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)pk_safelyAddObjectsFromArray:()PKMutableArrayAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObjectsFromArray:");
  return a1;
}

- (void)pk_removeObjectsPassingTest:()PKMutableArrayAdditions
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    v7[1] = 3221225472;
    v7[2] = __71__NSMutableArray_PKMutableArrayAdditions__pk_removeObjectsPassingTest___block_invoke;
    v7[3] = &unk_1E2AC2338;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    objc_msgSend(a1, "indexesOfObjectsPassingTest:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectsAtIndexes:", v5);

    v4 = v6;
  }

}

@end
