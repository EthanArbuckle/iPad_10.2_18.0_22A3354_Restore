@implementation RDDataAccessUserNotificationPresentingProvider

- (id)rem_notificationPresentingForDataAccess
{
  return (id)swift_unknownObjectRetain(*(_QWORD *)self->userNotificationCenter);
}

@end
