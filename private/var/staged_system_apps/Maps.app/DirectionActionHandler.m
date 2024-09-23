@implementation DirectionActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  v6 = objc_opt_class(DirectionAction);
  if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0)
  {
    v7 = v11;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "coordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));

    objc_msgSend(v8, "viewController:doDirectionItem:withUserInfo:", 0, v9, v10);
  }

}

@end
