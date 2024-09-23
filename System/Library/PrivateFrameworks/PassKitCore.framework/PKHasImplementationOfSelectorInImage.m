@implementation PKHasImplementationOfSelectorInImage

void __PKHasImplementationOfSelectorInImage_block_invoke(uint64_t a1)
{
  const char **v2;
  const char **v3;
  uint64_t v4;
  NSString *v5;
  objc_class *v6;
  unsigned int outCount;

  outCount = 0;
  v2 = objc_copyClassNamesForImage((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), &outCount);
  if (v2)
  {
    v3 = v2;
    if (outCount)
    {
      v4 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3[v4]);
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        v6 = NSClassFromString(v5);

        if (class_getInstanceMethod(v6, *(SEL *)(a1 + 56)))
          break;
        if (++v4 >= (unint64_t)outCount)
          goto LABEL_8;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = class_getName(v6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
LABEL_8:
    free(v3);
  }
}

@end
