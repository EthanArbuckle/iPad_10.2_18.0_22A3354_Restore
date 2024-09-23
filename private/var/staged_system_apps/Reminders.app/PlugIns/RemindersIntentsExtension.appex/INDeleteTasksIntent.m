@implementation INDeleteTasksIntent

- (BOOL)rem_all
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[INDeleteTasksIntent all](self, "all"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

@end
