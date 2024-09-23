@implementation CNLabeledValue(TUAdditions)

- (uint64_t)tuIsSuggested
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "isSuggested");
  else
    return 0;
}

@end
