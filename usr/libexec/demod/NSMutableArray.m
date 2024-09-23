@implementation NSMutableArray

- (BOOL)_addHMACComponent:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  if (a4)
    *a4 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_stringForHMAC"));
  if (v6)
  {
    -[NSMutableArray addObject:](self, "addObject:", v6);
  }
  else if (a4)
  {
    v9 = NSLocalizedDescriptionKey;
    v10 = CFSTR("Cannot encode HMAC component");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AluminiumAuthenticatorErrorDomain"), 1, v7));

  }
  return v6 != 0;
}

@end
