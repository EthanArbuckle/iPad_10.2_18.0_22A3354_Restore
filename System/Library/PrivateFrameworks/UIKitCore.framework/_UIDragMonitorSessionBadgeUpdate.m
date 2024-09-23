@implementation _UIDragMonitorSessionBadgeUpdate

- (_UIDragMonitorSessionBadgeUpdate)initWithDragBadgeStyle:(int64_t)a3
{
  _UIDragMonitorSessionBadgeUpdate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDragMonitorSessionBadgeUpdate;
  result = -[_UIDragMonitorSessionBadgeUpdate init](&v5, sel_init);
  if (result)
    result->_badgeStyle = a3;
  return result;
}

- (int64_t)badgeStyle
{
  return self->_badgeStyle;
}

@end
