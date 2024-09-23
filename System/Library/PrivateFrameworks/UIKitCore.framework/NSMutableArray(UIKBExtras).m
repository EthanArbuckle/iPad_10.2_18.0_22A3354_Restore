@implementation NSMutableArray(UIKBExtras)

- (void)_kb_reverse
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(a1, "count");
  if (v2 >= 2)
  {
    v3 = 0;
    v4 = v2 >> 1;
    v5 = v2 - 1;
    do
    {
      objc_msgSend(a1, "objectAtIndex:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "replaceObjectAtIndex:withObject:", v3, v7);

      objc_msgSend(a1, "replaceObjectAtIndex:withObject:", v5, v6);
      ++v3;
      --v5;
    }
    while (v4 != v3);
  }
}

@end
