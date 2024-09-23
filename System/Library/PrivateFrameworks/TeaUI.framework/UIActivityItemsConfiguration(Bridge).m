@implementation UIActivityItemsConfiguration(Bridge)

- (uint64_t)initTSWithActivityItemSources:()Bridge
{
  if (!a3)
    a3 = MEMORY[0x1E0C9AA60];
  return objc_msgSend(a1, "_initWithActivityItemSources:", a3);
}

- (void)ts_setExcludedActivityTypes:()Bridge
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "_setExcludedActivityTypes:", v4);

}

@end
