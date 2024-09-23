@implementation UIStatusBarDataConverter

uint64_t __59___UIStatusBarDataConverter_convertData_fromReferenceData___block_invoke(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
  if ((result & 1) == 0 && *(_BYTE *)(*(_QWORD *)(a1 + 40) + a2))
  {
    if (a3 == 5)
    {
      v7 = 0;
      goto LABEL_8;
    }
    if (a3 == 6)
    {
      v7 = 1;
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "setType:", v7);
      return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
    }
  }
  return result;
}

@end
