@implementation _UICoreUIEffect

+ (id)_coreUIImplementationForStyle:(int64_t)a3
{
  return 0;
}

+ (id)coreUIEffectForBlurStyle:(int64_t)a3
{
  void *v3;
  id v4;

  objc_msgSend(a1, "_coreUIImplementationForStyle:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[UIBlurEffect _initWithImplementation:]([_UICoreUIEffect alloc], "_initWithImplementation:", v3);
  else
    v4 = 0;

  return v4;
}

@end
