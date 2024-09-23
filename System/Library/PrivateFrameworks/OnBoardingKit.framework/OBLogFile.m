@implementation OBLogFile

uint64_t ___OBLogFile_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_OBLogFile_dateFormatter;
  _OBLogFile_dateFormatter = v0;

  objc_msgSend((id)_OBLogFile_dateFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)_OBLogFile_dateFormatter, "setTimeStyle:", 1);
}

@end
