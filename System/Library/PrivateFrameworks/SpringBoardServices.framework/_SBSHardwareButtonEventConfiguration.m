@implementation _SBSHardwareButtonEventConfiguration

- (void)setMaximumPriority:(int64_t)a3
{
  self->_maximumPriority = a3;
}

- (void)setEventMask:(unint64_t)a3
{
  self->_eventMask = a3;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_eventMask, CFSTR("eventMask"));
  NSStringFromSBSHardwareButtonEventPriority(self->_maximumPriority);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("eventPriority"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (int64_t)maximumPriority
{
  return self->_maximumPriority;
}

@end
