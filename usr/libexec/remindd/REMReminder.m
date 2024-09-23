@implementation REMReminder

- (BOOL)isPhantom
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMReminder list](self, "list"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMReminder list](self, "list"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
    v6 = v5 == 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

@end
