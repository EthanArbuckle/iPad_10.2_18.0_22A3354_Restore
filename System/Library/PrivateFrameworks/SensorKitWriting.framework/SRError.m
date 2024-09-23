@implementation SRError

+ (id)errorWithCode:(int64_t)a3
{
  const __CFString *v5;

  v5 = descriptionFromErrorCode(a3);
  return (id)objc_msgSend(a1, "errorWithCode:description:recoverySuggestion:", a3, v5, recoverySuggestionFromErrorCode(a3));
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5
{
  return (id)objc_msgSend(a1, "errorWithCode:description:recoverySuggestion:underlyingError:", a3, a4, a5, 0);
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  const __CFString *v7;

  v7 = descriptionFromErrorCode(a3);
  return (id)objc_msgSend(a1, "errorWithCode:description:recoverySuggestion:underlyingError:", a3, v7, recoverySuggestionFromErrorCode(a3), a4);
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5 underlyingError:(id)a6
{
  void *v10;
  void *v11;

  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v11 = v10;
  if (a4)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", a4, *MEMORY[0x24BDD0FC8]);
  if (a5)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", a5, *MEMORY[0x24BDD0FF0]);
  if (a6)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", a6, *MEMORY[0x24BDD1398]);
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", SRErrorDomain, a3, v11);
}

+ (id)connectionNotFoundError
{
  return (id)objc_msgSend(a1, "errorWithCode:", 8193);
}

+ (id)invalidEntitlementError
{
  return (id)objc_msgSend(a1, "errorWithCode:", 0);
}

+ (id)authorizationErrorWithStatus:(int64_t)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SRErrorNoAuthorization"), &stru_2516F29D8, 0);
  return (id)objc_msgSend(a1, "errorWithCode:description:recoverySuggestion:underlyingError:", 1, v5, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SRErrorNoAuthorizationRecovery"), &stru_2516F29D8, 0), objc_msgSend(a1, "errorWithCode:", a3));
}

+ (id)authorizationError
{
  return (id)objc_msgSend(a1, "errorWithCode:", 1);
}

+ (id)invalidInfoPlistErrorWithMissingKey:(id)a3 code:(int64_t)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:description:recoverySuggestion:", a4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Your bundle's Info.plist must have an %@ key"), a3), 0);
}

@end
