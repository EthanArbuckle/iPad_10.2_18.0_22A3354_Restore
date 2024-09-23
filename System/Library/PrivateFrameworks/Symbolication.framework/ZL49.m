@implementation ZL49

char *___ZL49_debugRemoteMirrorOutputForSwiftSubfieldIsEnabledv_block_invoke()
{
  char *result;

  result = _debugSwiftSubfieldEnvironmentVariableIsEnabled("SYMBOLICATION_DEBUG_REMOTE_MIRROR_OUTPUT_FOR_SWIFT_SUBFIELDS");
  _debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled = (char)result;
  return result;
}

@end
