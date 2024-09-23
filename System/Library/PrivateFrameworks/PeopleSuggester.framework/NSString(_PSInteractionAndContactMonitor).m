@implementation NSString(_PSInteractionAndContactMonitor)

- (uint64_t)_ps_pointerSizedHash
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v5;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  if (_ps_pointerSizedHash__pasOnceToken1 != -1)
    dispatch_once(&_ps_pointerSizedHash__pasOnceToken1, &__block_literal_global_15);
  _PASRepairString();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (!objc_msgSend(v1, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, &v5))
  {
    v2 = objc_retainAutorelease(v1);
    objc_msgSend(v2, "UTF8String");
    v5 = objc_msgSend(v2, "lengthOfBytesUsingEncoding:", 4);
  }
  v3 = _PASMurmur3_x64_128();

  objc_autoreleasePoolPop(v0);
  return v3;
}

@end
