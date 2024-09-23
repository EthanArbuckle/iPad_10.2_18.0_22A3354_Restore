@implementation _REMCDObjectEffectiveVersionManualValidationDelegateImpl

- (void)processBatchOfTreeNodes:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "manual processBatchOfTreeNodes does not actually save", v4, 2u);
  }

}

@end
