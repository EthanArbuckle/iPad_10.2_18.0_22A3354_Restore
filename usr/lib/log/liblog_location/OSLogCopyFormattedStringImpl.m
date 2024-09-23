@implementation OSLogCopyFormattedStringImpl

CLLogFormatter *__OSLogCopyFormattedStringImpl_block_invoke()
{
  CLLogFormatter *result;

  result = objc_alloc_init(CLLogFormatter);
  OSLogCopyFormattedStringImpl_sFormatter = (uint64_t)result;
  return result;
}

@end
