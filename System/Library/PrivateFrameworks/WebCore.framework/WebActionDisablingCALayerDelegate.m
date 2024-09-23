@implementation WebActionDisablingCALayerDelegate

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3, a4);
}

+ (id)shared
{
  if ((_MergedGlobals_125 & 1) == 0)
  {
    qword_1ECE81928 = 0;
    _MergedGlobals_125 = 1;
  }
  if (qword_1ECE81930 != -1)
    dispatch_once(&qword_1ECE81930, &__block_literal_global_40);
  return (id)qword_1ECE81928;
}

void __43__WebActionDisablingCALayerDelegate_shared__block_invoke()
{
  WebActionDisablingCALayerDelegate *v0;
  const void *v1;

  v0 = objc_alloc_init(WebActionDisablingCALayerDelegate);
  v1 = (const void *)qword_1ECE81928;
  qword_1ECE81928 = (uint64_t)v0;
  if (v1)
    CFRelease(v1);
}

@end
