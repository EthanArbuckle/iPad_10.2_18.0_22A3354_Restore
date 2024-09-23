@implementation JSATasteManager

+ (id)sharedInstance
{
  if (qword_B9F20 != -1)
    dispatch_once(&qword_B9F20, &stru_9E0F8);
  return (id)qword_B9F28;
}

- (void)syncTastes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v2, "enqueueBlock:file:line:", &stru_9E138, CFSTR("JSATasteManager.m"), 32);

}

@end
