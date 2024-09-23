@implementation TMLExceptionHandler

+ (void)setExceptionHandlerBlock:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x22E2E7E44](a3, a2);
  v4 = (void *)qword_255B51D20;
  qword_255B51D20 = v3;

}

+ (void)raiseException:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (!qword_255B51D20)
    objc_exception_throw(objc_retainAutorelease(v3));
  v4 = v3;
  (*(void (**)(void))(qword_255B51D20 + 16))();

}

@end
