@implementation UIResponder

+ (id)currentFirstResponder
{
  void *v2;

  objc_storeWeak(&qword_1001ED980, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v2, "sendAction:to:from:forEvent:", "findFirstResponder:", 0, 0, 0);

  return objc_loadWeakRetained(&qword_1001ED980);
}

- (void)findFirstResponder:(id)a3
{
  objc_storeWeak(&qword_1001ED980, self);
}

@end
