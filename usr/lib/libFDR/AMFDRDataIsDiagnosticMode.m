@implementation AMFDRDataIsDiagnosticMode

void __AMFDRDataIsDiagnosticMode_block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  CFTypeID v2;
  const __CFBoolean *v3;
  const __CFString *v4;
  CFTypeID v5;

  v0 = AMFDRSealingMapCallMGCopyAnswer(CFSTR("RestoreOSBuild"), 0);
  v1 = v0;
  if (v0)
  {
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue((CFBooleanRef)v1))
      {
        v3 = 0;
LABEL_10:
        CFRelease(v1);
        goto LABEL_11;
      }
    }
  }
  v4 = AMFDRSealingMapCallMGCopyAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"), 0);
  v3 = (const __CFBoolean *)v4;
  if (v4)
  {
    v5 = CFGetTypeID(v4);
    if (v5 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v3))
        AMFDRDataIsDiagnosticMode_result = 1;
    }
  }
  if (v1)
    goto LABEL_10;
LABEL_11:
  if (v3)
    CFRelease(v3);
}

@end
