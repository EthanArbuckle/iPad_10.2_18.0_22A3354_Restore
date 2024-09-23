@implementation PLSnapshotUtilities

+ (double)secondsFromMachTime:(unint64_t)a3
{
  if (secondsFromMachTime__once != -1)
    dispatch_once(&secondsFromMachTime__once, &__block_literal_global);
  return *(double *)&secondsFromMachTime__ratio * (double)a3 / 1000000000.0;
}

uint64_t __43__PLSnapshotUtilities_secondsFromMachTime___block_invoke()
{
  uint64_t result;
  double v1;
  mach_timebase_info info;

  info = 0;
  result = mach_timebase_info(&info);
  if ((_DWORD)result)
  {
    result = _os_assumes_log();
    v1 = 1.0;
  }
  else
  {
    v1 = (double)(info.numer / info.denom);
  }
  secondsFromMachTime__ratio = *(_QWORD *)&v1;
  return result;
}

@end
