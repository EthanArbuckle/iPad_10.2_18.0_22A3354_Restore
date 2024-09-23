@implementation NSMutableAttributedString(REMTTParagraphStyle)

- (void)rem_addParagraphNamedStyle:()REMTTParagraphStyle inRange:
{
  unint64_t v9;
  REMTTParagraphStyle *v10;
  REMTTParagraphStyle *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  NSRange v24;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a1, "length");
  if (a4 >= v9)
    a4 = v9;
  if (a4 + a5 > v9)
    a5 = v9 - a4;
  if (a5)
  {
    objc_msgSend(a1, "beginEditing");
    v10 = -[REMTTParagraphStyle initWithStyle:]([REMTTParagraphStyle alloc], "initWithStyle:", a3);
    v11 = v10;
    v12 = TTAttributeNameParagraphStyle;
    if (v10)
    {
      -[REMTTParagraphStyle innerStyle](v10, "innerStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "addAttribute:value:range:", v12, v13, a4, a5);

    }
    else
    {
      objc_msgSend(a1, "removeAttribute:range:", TTAttributeNameParagraphStyle, a4, a5);
    }
    objc_msgSend(a1, "endEditing");
    +[REMLog crdt](REMLog, "crdt");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[REMTTParagraphStyle innerStyle](v11, "innerStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24.location = a4;
      v24.length = a5;
      NSStringFromRange(v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218498;
      v18 = a1;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_INFO, "Added REMTTParagraphStyle to this NSMutableAttributedString {self: %p, paragraphStyle: %@, range: %@}", (uint8_t *)&v17, 0x20u);

    }
  }
}

- (void)rem_removeParagraphNamedStyleFromRange:()REMTTParagraphStyle
{
  unint64_t v7;
  NSUInteger v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  NSRange v16;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a1, "length");
  if (a3 >= v7)
    a3 = v7;
  if (a3 + a4 <= v7)
    v8 = a4;
  else
    v8 = v7 - a3;
  if (v8)
  {
    objc_msgSend(a1, "removeAttribute:range:", TTAttributeNameParagraphStyle, a3, v8);
    +[REMLog crdt](REMLog, "crdt");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16.location = a3;
      v16.length = v8;
      NSStringFromRange(v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218242;
      v12 = a1;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1B4A39000, v9, OS_LOG_TYPE_INFO, "Remove REMTTParagraphStyle from this NSMutableAttributedString {self: %p, range: %@}", (uint8_t *)&v11, 0x16u);

    }
  }
}

@end
