@implementation CAKeyPathFromUIKeyPath

void ___CAKeyPathFromUIKeyPath_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  const __CFString *v5;
  id v6;

  v6 = a2;
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = CFSTR("layer.position");
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", a3, v5);
    goto LABEL_13;
  }
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = CFSTR("layer.cornerRadius");
    goto LABEL_12;
  }
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = CFSTR("layer.opacity");
    goto LABEL_12;
  }
  if ((BSEqualStrings() & 1) != 0
    || (BSEqualStrings() & 1) != 0
    || (BSEqualStrings() & 1) != 0
    || BSEqualStrings())
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v5 = &stru_1E8EC7EC0;
    goto LABEL_12;
  }
LABEL_13:

}

@end
