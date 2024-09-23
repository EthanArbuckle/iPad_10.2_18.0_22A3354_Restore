@implementation UILocalNotification

+ (UILocalNotification)alloc
{
  objc_super v4;

  if ((id)objc_opt_class() != a1)
    return (UILocalNotification *)[UIConcreteLocalNotification alloc];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___UILocalNotification;
  return (UILocalNotification *)objc_msgSendSuper2(&v4, sel_alloc);
}

+ (UILocalNotification)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() != a1)
    return (UILocalNotification *)+[UILocalNotification allocWithZone:](UIConcreteLocalNotification, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___UILocalNotification;
  return (UILocalNotification *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (UILocalNotification)init
{
  uint64_t v4;
  void *v6;
  objc_super v7;

  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UILocalNotification.m"), 944, CFSTR("UILocalNotification cannot be subclassed"));

  }
  v7.receiver = self;
  v7.super_class = (Class)UILocalNotification;
  return -[UILocalNotification init](&v7, sel_init);
}

- (UILocalNotification)initWithCoder:(NSCoder *)coder
{
  NSCoder *v3;
  id v4;

  v3 = coder;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("UILocalNotification cannot be subclassed"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)nextFireDateForLastFireDate:(id)a3
{
  return 0;
}

- (id)nextFireDateAfterDate:(id)a3 localTimeZone:(id)a4
{
  return 0;
}

- (BOOL)isValid
{
  return 0;
}

- (int64_t)compareFireDates:(id)a3
{
  return 0;
}

- (BOOL)isTriggeredByDate
{
  return 0;
}

- (BOOL)isTriggeredByRegion
{
  return 0;
}

@end
