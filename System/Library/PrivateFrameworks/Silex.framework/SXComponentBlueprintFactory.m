@implementation SXComponentBlueprintFactory

- (id)componentBlueprintForComponent:(id)a3 layout:(id)a4 sizer:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  objc_class *v11;

  v7 = a3;
  v8 = 0;
  if (v7 && a5)
  {
    v9 = a5;
    v10 = a4;
    v11 = (objc_class *)objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v11 = (objc_class *)objc_opt_class();
    v8 = (void *)objc_msgSend([v11 alloc], "initWithComponent:componentLayout:componentSizer:", v7, v10, v9);

  }
  return v8;
}

@end
