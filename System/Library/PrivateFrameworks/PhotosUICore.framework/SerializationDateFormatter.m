@implementation SerializationDateFormatter

uint64_t ___SerializationDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_SerializationDateFormatter__dateFormatter;
  _SerializationDateFormatter__dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_SerializationDateFormatter__dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

@end
