@implementation InboxInviteeResponsesGroupController

- (id)titleForHeader
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;

  *(_QWORD *)&v2 = objc_opt_class(self).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v3, v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Invitee Responses"), &stru_1001B67C0, 0));

  return v5;
}

- (id)filteredNotificationsFromArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1001B3D88));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

@end
