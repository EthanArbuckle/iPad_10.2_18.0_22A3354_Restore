@implementation NSMutableAttributedString(VK)

- (void)vk_appendString:()VK
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  objc_msgSend(a1, "appendAttributedString:", v6);
}

- (void)vk_replaceCharactersInRange:()VK withAttributedSubstring:fromRange:
{
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[8];

  v12 = a5;
  objc_msgSend(v12, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "substringWithRange:", a6, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replaceCharactersInRange:withString:", a3, a4, v14);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__NSMutableAttributedString_VK__vk_replaceCharactersInRange_withAttributedSubstring_fromRange___block_invoke;
  v15[3] = &unk_1E9465CA0;
  v15[6] = a7;
  v15[7] = a3;
  v15[4] = a1;
  v15[5] = a6;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", a6, a7, 0x100000, v15);

}

- (void)vk_appendAttributedSubstring:()VK fromRange:
{
  id v8;

  v8 = a3;
  objc_msgSend(a1, "vk_replaceCharactersInRange:withAttributedSubstring:fromRange:", objc_msgSend(a1, "length"), 0, v8, a4, a5);

}

@end
