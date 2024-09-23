@implementation WebFormDelegate

+ (id)_sharedWebFormDelegate
{
  id result;

  result = (id)sharedDelegate_2;
  if (!sharedDelegate_2)
  {
    result = objc_alloc_init(WebFormDelegate);
    sharedDelegate_2 = (uint64_t)result;
  }
  return result;
}

- (BOOL)textField:(id)a3 doCommandBySelector:(SEL)a4 inFrame:(id)a5
{
  return 0;
}

- (void)frame:(id)a3 sourceFrame:(id)a4 willSubmitForm:(id)a5 withValues:(id)a6 submissionListener:(id)a7
{
  objc_msgSend(a7, "continue", a3, a4, a5, a6);
}

@end
