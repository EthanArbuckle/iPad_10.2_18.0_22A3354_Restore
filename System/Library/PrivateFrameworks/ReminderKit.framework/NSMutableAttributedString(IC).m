@implementation NSMutableAttributedString(IC)

- (void)ic_appendAttributedSubstring:()IC fromRange:
{
  id v8;

  v8 = a3;
  objc_msgSend(a1, "ic_replaceCharactersInRange:withAttributedSubstring:fromRange:", objc_msgSend(a1, "length"), 0, v8, a4, a5);

}

- (void)ic_replaceCharactersInRange:()IC withAttributedSubstring:fromRange:
{
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[8];

  v14 = a5;
  objc_msgSend(v14, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "substringWithRange:", a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replaceCharactersInRange:withString:", a3, a4, v13);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__NSMutableAttributedString_IC__ic_replaceCharactersInRange_withAttributedSubstring_fromRange___block_invoke;
  v15[3] = &unk_1E67FACB8;
  v15[6] = a7;
  v15[7] = a3;
  v15[4] = a1;
  v15[5] = a6;
  objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", a6, a7, 0x100000, v15);

}

@end
