@implementation NSMutableURLRequest(WebNSURLRequestExtras)

- (uint64_t)_web_setHTTPContentType:()WebNSURLRequestExtras
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("Content-Type"));
}

- (uint64_t)_web_setHTTPReferrer:()WebNSURLRequestExtras
{
  uint64_t result;

  result = objc_msgSend(a3, "_webkit_isFileURL");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a3, "length");
    if (result)
      return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("Referer"));
  }
  return result;
}

- (uint64_t)_web_setHTTPUserAgent:()WebNSURLRequestExtras
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("User-Agent"));
}

@end
