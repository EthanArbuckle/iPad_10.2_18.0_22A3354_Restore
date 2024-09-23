@implementation PLSysdiagnoseTimeSensitivePhase

void __PLSysdiagnoseTimeSensitivePhase_block_invoke()
{
  const __CFBoolean *v0;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  PLSysdiagnoseTimeSensitivePhase_hasBaseband = CFBooleanGetValue(v0) != 0;
  CFRelease(v0);
}

@end
