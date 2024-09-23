@implementation ZL31

char *___ZL31_logSwiftUnknownFieldsIsEnabledv_block_invoke()
{
  char *result;

  result = _debugSwiftSubfieldEnvironmentVariableIsEnabled("SYMBOLICATION_LOG_SWIFT_UNKNOWN_FIELDS");
  _logSwiftUnknownFieldsIsEnabled(void)::isEnabled = (char)result;
  return result;
}

@end
