@implementation InboxRepliedEventInvitationCell

- (id)actions
{
  return &off_1001BC700;
}

- (BOOL)showAsCancelledOrDeclined
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)InboxRepliedEventInvitationCell;
  if (-[CalendarMessageEventInvitationCell showAsCancelledOrDeclined](&v6, "showAsCancelledOrDeclined"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v3 = objc_msgSend(v4, "participationStatus") == (id)3;

  return v3;
}

- (void)setNotification:(id)a3
{
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)InboxRepliedEventInvitationCell;
  -[CalendarMessageEventInvitationCell setNotification:](&v5, "setNotification:", a3);
  -[CalendarMessageCell setHasDisclosure:](self, "setHasDisclosure:", EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, v4));
}

- (unint64_t)options
{
  return 0;
}

@end
