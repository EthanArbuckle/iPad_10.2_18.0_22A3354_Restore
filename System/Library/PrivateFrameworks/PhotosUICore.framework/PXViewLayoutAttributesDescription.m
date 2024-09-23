@implementation PXViewLayoutAttributesDescription

__CFString *__PXViewLayoutAttributesDescription_block_invoke(double a1)
{
  __CFString *v1;

  if (a1 == INFINITY)
  {
    v1 = CFSTR("fit");
  }
  else if (a1 == -INFINITY)
  {
    v1 = CFSTR("anchored");
  }
  else
  {
    v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%0.1f"), *(_QWORD *)&a1);
  }
  return v1;
}

@end
