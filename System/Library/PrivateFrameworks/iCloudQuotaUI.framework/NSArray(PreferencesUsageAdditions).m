@implementation NSArray(PreferencesUsageAdditions)

- (uint64_t)sortedInsertionIndexWithRange:()PreferencesUsageAdditions block:
{
  uint64_t (**v8)(id, void *, uint64_t);
  uint64_t v9;
  void *v10;
  int v11;
  unint64_t v12;

  v8 = a5;
  if (a4)
  {
    v9 = a3 + (a4 >> 1);
    objc_msgSend(a1, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8[2](v8, v10, v9);
    if (v11)
    {
      if (v11 != 2)
      {
LABEL_8:

        goto LABEL_9;
      }
      a3 = v9 + 1;
      v12 = (unint64_t)(ceil((double)a4 * 0.5) + -1.0);
    }
    else
    {
      v12 = a4 >> 1;
    }
    v9 = objc_msgSend(a1, "sortedInsertionIndexWithRange:block:", a3, v12, v8);
    goto LABEL_8;
  }
  v9 = a3;
LABEL_9:

  return v9;
}

@end
