@implementation UIResponder(IC)

- (uint64_t)ic_inhibitsGlobalKeyCommands
{
  return 0;
}

- (BOOL)ic_isInResponderChainOfFirstResponder:()IC
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    do
    {
      v7 = v6 == a1;
      objc_msgSend(v6, "nextResponder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        break;
      v9 = v6 == a1;
      v6 = v8;
    }
    while (!v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)ic_isTextInputSourcePencil
{
  return (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a1, "_textInputSource") == 3;
}

@end
