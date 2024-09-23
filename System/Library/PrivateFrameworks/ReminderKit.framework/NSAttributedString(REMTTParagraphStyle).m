@implementation NSAttributedString(REMTTParagraphStyle)

- (REMTTParagraphStyle)rem_paragraphStyleAtIndex:()REMTTParagraphStyle effectiveRange:
{
  void *v7;
  unint64_t v8;
  void *v9;
  REMTTParagraphStyle *v10;

  if ((a3 & 0x8000000000000000) != 0
    || (objc_msgSend(a1, "string"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8 <= a3))
  {
    v10 = 0;
    if (a4)
      *a4 = xmmword_1B4B743E0;
  }
  else
  {
    objc_msgSend(a1, "attribute:atIndex:effectiveRange:", TTAttributeNameParagraphStyle, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[REMTTParagraphStyle initWithContents:]([REMTTParagraphStyle alloc], "initWithContents:", v9);
    }
    else
    {
      v10 = 0;
      if (a4)
        *a4 = xmmword_1B4B743E0;
    }

  }
  return v10;
}

@end
