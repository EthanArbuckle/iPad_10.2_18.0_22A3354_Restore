@implementation NSObject(AXDebug)

- (void)_accessibilityElementsDescriptionProcess:()AXDebug tabCount:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = objc_msgSend(a1, "accessibilityElementCount");
  if (v6 >= 1)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(a1, "accessibilityElementAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a4;
      if (a4 >= 1)
      {
        do
        {
          objc_msgSend(v10, "appendString:", CFSTR("\t"));
          --v11;
        }
        while (v11);
      }
      if ((objc_msgSend(v9, "isAccessibilityElement") & 1) != 0)
      {
        objc_msgSend(v12, "appendFormat:", CFSTR("+%@%@\n"), v10, v9);
      }
      else
      {
        objc_msgSend(v12, "appendFormat:", CFSTR("-%@%@\n"), v10, v9);
        objc_msgSend(v9, "_accessibilityElementsDescriptionProcess:tabCount:", v12, a4 + 1);
      }

    }
  }

}

- (id)_axElementsDescription
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityElementsDescriptionProcess:tabCount:", v2, 0);
  return v2;
}

@end
