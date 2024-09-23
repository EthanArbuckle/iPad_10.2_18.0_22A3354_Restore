@implementation EKReminderEditViewControllerCreator

- (BOOL)useThisIntegrationEditorForEvent:(id)a3
{
  return objc_msgSend(a3, "isReminderIntegrationEvent");
}

- (id)integrationViewControllerForEvent:(id)a3 eventEditViewDelegate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _TtC9MobileCal28EKReminderEditViewController *v9;

  v5 = a4;
  v6 = a3;
  if ((objc_opt_respondsToSelector(v5, "calendarModel") & 1) == 0
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarModel"))) == 0)
  {
    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_FAULT))
      sub_100129108((uint64_t)v5, v8);
    v7 = 0;
  }
  v9 = -[EKReminderEditViewController initWithModel:]([_TtC9MobileCal28EKReminderEditViewController alloc], "initWithModel:", v7);
  -[EKReminderEditViewController setEvent:](v9, "setEvent:", v6);

  -[EKReminderEditViewController setInternalEditViewDelegate:](v9, "setInternalEditViewDelegate:", v5);
  return v9;
}

@end
