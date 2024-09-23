@implementation STStatusBarDataBoolEntry(Converter)

- (uint64_t)initFromData:()Converter type:BOOLValue:
{
  int v7;
  void *v8;
  uint64_t v9;

  v7 = *(unsigned __int8 *)(a3 + a4);
  v8 = (void *)objc_opt_class();
  if (v7)
    objc_msgSend(v8, "entryWithBoolValue:", a5);
  else
    objc_msgSend(v8, "disabledEntry");
  v9 = objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
