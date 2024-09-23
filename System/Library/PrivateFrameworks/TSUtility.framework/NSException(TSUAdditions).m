@implementation NSException(TSUAdditions)

+ (uint64_t)tsu_raiseWithError:()TSUAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!a3)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSException(TSUAdditions) tsu_raiseWithError:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSException_TSUAdditions.m"), 17, CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", a3, CFSTR("TSUErrorExceptionUserInfoKey"), 0);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("TSUErrorException"), CFSTR("NSError exception"), v6);

  return objc_msgSend(v7, "raise");
}

- (uint64_t)tsu_error
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", CFSTR("TSUErrorExceptionUserInfoKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v1)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSException(TSUAdditions) tsu_error]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSException_TSUAdditions.m"), 38, CFSTR("Unexpected NSException value for TSUErrorExceptionUserInfoKey: %@"), v1);
    return 0;
  }
  return v1;
}

@end
