@implementation VUIActionLeaveGroupSession

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupActivitiesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leaveSession");

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    v6 = v7;
  }

}

@end
