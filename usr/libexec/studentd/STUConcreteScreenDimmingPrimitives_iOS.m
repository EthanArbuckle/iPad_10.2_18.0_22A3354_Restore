@implementation STUConcreteScreenDimmingPrimitives_iOS

- (void)undimScreenWithReason:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = a3;
  if (qword_1000FC048 != -1)
    dispatch_once(&qword_1000FC048, &stru_1000C99F8);
  v4 = qword_1000FC040;
  if (os_log_type_enabled((os_log_t)qword_1000FC040, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Undimming screen with reason: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  SBSUndimScreen();

}

@end
