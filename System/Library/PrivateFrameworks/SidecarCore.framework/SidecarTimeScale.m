@implementation SidecarTimeScale

double __SidecarTimeScale_block_invoke()
{
  kern_return_t v0;
  unint64_t v1;
  unint64_t v2;
  double result;
  kern_return_t v4;
  mach_timebase_info info;
  uint8_t buf[4];
  kern_return_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  info = 0;
  v0 = mach_timebase_info(&info);
  if (v0)
  {
    v4 = v0;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v7 = v4;
      _os_log_impl(&dword_220044000, 0, OS_LOG_TYPE_ERROR, "%{mach.errno}d", buf, 8u);
    }
  }
  LODWORD(v1) = info.numer;
  LODWORD(v2) = info.denom;
  result = (double)v1 / (double)v2 * 0.000000001;
  SidecarTimeScale_scale = *(_QWORD *)&result;
  return result;
}

@end
