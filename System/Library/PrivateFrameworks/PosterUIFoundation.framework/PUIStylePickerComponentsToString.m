@implementation PUIStylePickerComponentsToString

uint64_t __PUIStylePickerComponentsToString_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  const __CFString *v3;

  v2 = *(void **)(a1 + 32);
  v3 = CFSTR("PUIStylePickerComponentFont");
  switch(a2)
  {
    case 1:
      return objc_msgSend(v2, "addObject:", v3);
    case 2:
      v3 = CFSTR("PUIStylePickerComponentNumberingSystem");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      v3 = CFSTR("PUIStylePickerComponentStyle");
      break;
    case 8:
      v3 = CFSTR("PUIStylePickerComponentTextLayout");
      break;
    default:
      if (a2 == 16)
        v3 = CFSTR("PUIStylePickerComponentTextAlignment");
      else
LABEL_6:
        v3 = CFSTR("(unknown PUIStylePickerComponent)");
      break;
  }
  return objc_msgSend(v2, "addObject:", v3);
}

@end
