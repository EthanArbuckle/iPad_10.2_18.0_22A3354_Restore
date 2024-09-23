@implementation NSString

void __57__NSString_SBUIEmojiAdditions__sbui_rangesOfEmojiTokens___block_invoke(_QWORD *a1, int a2, NSRange range)
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSRange v11;

  if (range.location != -1)
  {
    length = range.length;
    if (range.length != -1)
    {
      location = range.location;
      v6 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
      NSStringFromRange(range);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      v8 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      if (v8)
      {
        v11.location = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 32);
        v11.length = location - v11.location;
        NSStringFromRange(v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        v10 = *(_QWORD *)(a1[6] + 8);
        *(_QWORD *)(v10 + 32) = location;
        *(_QWORD *)(v10 + 40) = length;
      }
    }
  }
}

@end
