@implementation UVObjCExceptionHandler

+ (BOOL)perform:(id)a3 error:(id *)a4
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  v4[2]();

  return 1;
}

@end
