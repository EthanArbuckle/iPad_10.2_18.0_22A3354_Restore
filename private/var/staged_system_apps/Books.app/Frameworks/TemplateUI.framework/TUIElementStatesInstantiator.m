@implementation TUIElementStatesInstantiator

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 137, a4.var0));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9));
    objc_msgSend(v11, "setStates:", v10);

  }
}

@end
