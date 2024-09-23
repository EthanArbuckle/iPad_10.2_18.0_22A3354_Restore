@implementation NSException(TSUAdditions)

+ (uint64_t)tsu_raiseWithError:()TSUAdditions
{
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSException(TSUAdditions) tsu_raiseWithError:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSException_TSUAdditions.m"), 17, 0, "Invalid parameter not satisfying: %{public}s", "error != nil");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v5 = (const __CFString *)objc_msgSend(a3, "localizedFailureReason");
  if (!v5)
  {
    v6 = objc_msgSend(a3, "localizedDescription");
    if (v6)
      v5 = (const __CFString *)v6;
    else
      v5 = CFSTR("NSError exception");
  }
  v8 = CFSTR("TSUErrorExceptionUserInfoKey");
  v9[0] = a3;
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("TSUErrorException"), v5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)), "raise");
}

- (uint64_t)tsu_error
{
  uint64_t v1;
  uint64_t v2;

  v1 = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", CFSTR("TSUErrorExceptionUserInfoKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v1)
  {
    v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSException(TSUAdditions) tsu_error]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSException_TSUAdditions.m"), 31, 0, "Unexpected NSException value for TSUErrorExceptionUserInfoKey: %@", v1);
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    return 0;
  }
  return v1;
}

@end
