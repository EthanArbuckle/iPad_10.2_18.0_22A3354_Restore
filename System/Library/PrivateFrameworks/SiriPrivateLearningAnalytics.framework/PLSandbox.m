@implementation PLSandbox

+ (BOOL)isCurrentProcessInSandbox
{
  getpid();
  return sandbox_check() != 0;
}

+ (int64_t)checkOperation:(id)a3 forPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "isCurrentProcessInSandbox"))
  {
    getpid();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v8 = (int)sandbox_check();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
