@implementation NSException(SFUtilityAdditions)

+ (uint64_t)sfu_errnoRaise:()SFUtilityAdditions format:
{
  id v11;
  void *v12;
  int *v13;
  uint64_t v14;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a4, &a9);
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = __error();
  v14 = objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: %s"), v11, strerror(*v13));
  return objc_msgSend((id)objc_msgSend(a1, "exceptionWithName:reason:userInfo:", a3, v14, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *__error()), CFSTR("SFUFileUtilsErrnoKey"))), "raise");
}

- (uint64_t)sfu_localErrno
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", CFSTR("SFUFileUtilsErrnoKey"));
  if (v1 && (v2 = (void *)v1, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return objc_msgSend(v2, "intValue");
  else
    return 0;
}

@end
