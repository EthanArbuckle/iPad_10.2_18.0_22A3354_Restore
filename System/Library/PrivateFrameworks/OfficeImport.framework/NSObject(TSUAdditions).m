@implementation NSObject(TSUAdditions)

+ (BOOL)tsu_overridesSelector:()TSUAdditions ofBaseClass:
{
  Method InstanceMethod;

  InstanceMethod = class_getInstanceMethod(a1, name);
  return InstanceMethod != class_getInstanceMethod(a4, name);
}

+ (BOOL)tsu_overridesClassSelector:()TSUAdditions ofBaseClass:
{
  Method ClassMethod;

  ClassMethod = class_getClassMethod(a1, name);
  return ClassMethod != class_getClassMethod(a4, name);
}

- (void)tsu_performSelector:()TSUAdditions withValue:
{
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSUInteger sizep;

  v7 = (void *)objc_msgSend(a1, "methodSignatureForSelector:");
  if (!v7)
  {
    objc_msgSend(a1, "doesNotRecognizeSelector:", a3);
    return;
  }
  v8 = v7;
  if (objc_msgSend(v7, "numberOfArguments") != 3)
  {
    v14 = (void *)MEMORY[0x24BDBCE88];
    v15 = *MEMORY[0x24BDBCAB8];
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "stringWithFormat:", CFSTR("*** -[%@ %@] does not take one argument."), v17, NSStringFromSelector(a3));
    v19 = v14;
    v20 = v15;
    goto LABEL_30;
  }
  v9 = (const char *)objc_msgSend(v8, "getArgumentTypeAtIndex:", 2);
  while (2)
  {
    switch(*v9)
    {
      case '@':
        goto LABEL_8;
      case 'A':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'J':
      case 'K':
      case 'M':
      case 'P':
      case 'T':
      case 'U':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '_':
      case 'a':
      case 'b':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'p':
        goto LABEL_9;
      case 'B':
        objc_msgSend(a4, "BOOLValue");
        goto LABEL_8;
      case 'C':
        objc_msgSend(a4, "unsignedCharValue");
        goto LABEL_8;
      case 'I':
        objc_msgSend(a4, "unsignedIntValue");
        goto LABEL_8;
      case 'L':
        objc_msgSend(a4, "unsignedLongValue");
        goto LABEL_8;
      case 'N':
      case 'O':
      case 'R':
      case 'V':
      case 'n':
      case 'o':
      case 'r':
        ++v9;
        continue;
      case 'Q':
        objc_msgSend(a4, "unsignedLongLongValue");
        goto LABEL_8;
      case 'S':
        objc_msgSend(a4, "unsignedShortValue");
        goto LABEL_8;
      case '^':
        objc_msgSend(a4, "pointerValue");
        goto LABEL_8;
      case 'c':
        objc_msgSend(a4, "charValue");
        goto LABEL_8;
      case 'd':
        objc_msgSend(a4, "doubleValue");
        objc_msgSend(a1, a3);
        return;
      case 'f':
        objc_msgSend(a4, "floatValue");
        objc_msgSend(a1, a3);
        return;
      case 'i':
        objc_msgSend(a4, "intValue");
        goto LABEL_8;
      case 'l':
        objc_msgSend(a4, "longValue");
        goto LABEL_8;
      case 'q':
        objc_msgSend(a4, "longLongValue");
        goto LABEL_8;
      case 's':
        objc_msgSend(a4, "shortValue");
        goto LABEL_8;
      default:
        if (*v9 == 35)
        {
LABEL_8:
          objc_msgSend(a1, a3);
          return;
        }
LABEL_9:
        v10 = (const char *)objc_msgSend(a4, "objCType");
        if (!v10 || (v11 = v10, strcmp(v9, v10)))
        {
          v21 = (void *)MEMORY[0x24BDBCE88];
          v22 = *MEMORY[0x24BDBCAB8];
          v23 = (void *)MEMORY[0x24BDD17C8];
          v24 = objc_opt_class();
          v18 = objc_msgSend(v23, "stringWithFormat:", CFSTR("*** -[%@ %@] first argument type does not match type of %@."), v24, NSStringFromSelector(a3), a4);
          v19 = v21;
          v20 = v22;
LABEL_30:
          objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v18, 0));
        }
        v12 = (void *)objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v8);
        objc_msgSend(v12, "setTarget:", a1);
        objc_msgSend(v12, "setSelector:", a3);
        sizep = 0;
        NSGetSizeAndAlignment(v11, &sizep, 0);
        v13 = malloc_type_malloc(sizep, 0x7A44F819uLL);
        objc_msgSend(a4, "getValue:", v13);
        objc_msgSend(v12, "setArgument:atIndex:", v13, 2);
        objc_msgSend(v12, "invoke");
        free(v13);
        return;
    }
  }
}

+ (uint64_t)tsu_object:()TSUAdditions isEqualToObject:
{
  void *v4;
  void *v5;

  if (a3 == a4)
    return 1;
  if (a3)
  {
    v4 = a3;
    v5 = a4;
    return objc_msgSend(v4, "isEqual:", v5);
  }
  if (a4)
  {
    v4 = a4;
    v5 = 0;
    return objc_msgSend(v4, "isEqual:", v5);
  }
  return 0;
}

- (OITSUKVOToken)tsu_addObserver:()TSUAdditions forKeyPath:options:context:
{
  OITSUKVOToken *v11;
  id AssociatedObject;
  void *v13;
  void *v14;

  v11 = -[OITSUKVOToken initWithObserver:target:keyPath:context:]([OITSUKVOToken alloc], "initWithObserver:target:keyPath:context:", a3, a1, a4, a6);
  AssociatedObject = objc_getAssociatedObject(a1, (const void *)TSUNSObjectKVOTokensKey);
  if (!AssociatedObject)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", v11, 0);
    objc_setAssociatedObject(a1, (const void *)TSUNSObjectKVOTokensKey, v14, (void *)1);
LABEL_7:
    objc_msgSend(a1, "addObserver:forKeyPath:options:context:", a3, a4, a5, a6);
    return v11;
  }
  v13 = AssociatedObject;
  if ((objc_msgSend(AssociatedObject, "containsObject:", v11) & 1) == 0)
  {
    objc_msgSend(v13, "addObject:", v11);
    goto LABEL_7;
  }
  if (TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_7);
  return v11;
}

- (void)tsu_removeObserverForToken:()TSUAdditions
{
  uint64_t v5;
  void *result;
  void *v7;
  uint64_t v8;
  id AssociatedObject;

  v5 = objc_opt_class();
  result = (void *)TSUDynamicCast(v5, a3);
  if (result)
  {
    v7 = result;
    if ((void *)objc_msgSend(result, "target") != a1)
    {
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSObject(TSUAdditions) tsu_removeObserverForToken:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSObject_TSUAdditions.m"), 211, 0, "Attempted to stop key-value observing on %@ using a token that it was not associated with", a1);
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    AssociatedObject = objc_getAssociatedObject(a1, (const void *)TSUNSObjectKVOTokensKey);
    result = (void *)objc_msgSend(AssociatedObject, "containsObject:", v7);
    if ((_DWORD)result)
    {
      objc_msgSend((id)objc_msgSend(v7, "target"), "removeObserver:forKeyPath:context:", objc_msgSend(v7, "observer"), objc_msgSend(v7, "keyPath"), objc_msgSend(v7, "context"));
      return (void *)objc_msgSend(AssociatedObject, "removeObject:", v7);
    }
  }
  return result;
}

@end
