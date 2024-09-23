@implementation HomeDeselectionReason

- (HomeDeselectionReason)initWithAction:(int64_t)a3
{
  HomeDeselectionReason *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HomeDeselectionReason;
  result = -[HomeDeselectionReason init](&v5, "init");
  if (result)
    result->_action = a3;
  return result;
}

- (id)description
{
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = objc_opt_class(self);
  v4 = self->_action - 1;
  if (v4 > 2)
    v5 = CFSTR("HomeDeselectionActionUnknown");
  else
    v5 = off_1011E1FF8[v4];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; action = %@>"),
           v3,
           self,
           v5);
}

- (int64_t)action
{
  return self->_action;
}

@end
