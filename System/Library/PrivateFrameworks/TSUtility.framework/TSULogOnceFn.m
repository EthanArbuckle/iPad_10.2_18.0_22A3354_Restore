@implementation TSULogOnceFn

dispatch_queue_t __TSULogOnceFn_block_invoke()
{
  dispatch_queue_t result;

  TSULogOnceFn_tokens = objc_opt_new();
  result = dispatch_queue_create("TSULogOnce", 0);
  TSULogOnceFn_logOnceQueue = (uint64_t)result;
  return result;
}

uint64_t __TSULogOnceFn_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)TSULogOnceFn_tokens, "containsObject:", *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
  {
    NSLog((NSString *)CFSTR("%@"), *(_QWORD *)(a1 + 40));
    return objc_msgSend((id)TSULogOnceFn_tokens, "addObject:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

@end
