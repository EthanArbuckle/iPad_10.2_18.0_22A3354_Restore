@implementation PQLRawInjection

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return 0;
}

+ (id)rawInjection:(const char *)a3 length:(unint64_t)a4
{
  uint64_t *v4;
  void *v5;
  int v6;
  PQLRawInjection *v7;

  if (a4 == 1)
  {
    v6 = *(unsigned __int8 *)a3;
    if (v6 == 49)
    {
      v5 = (void *)gPQLTrue;
    }
    else
    {
      if (v6 != 48)
        goto LABEL_9;
      v5 = (void *)gPQLFalse;
    }
LABEL_11:
    v7 = v5;
    return v7;
  }
  if (!a4)
  {
    v4 = &gPQLEmpty;
    if (!a3)
      v4 = &gPQLNULL;
    v5 = (void *)*v4;
    goto LABEL_11;
  }
LABEL_9:
  v7 = -[PQLRawInjection initWithUTF8String:length:]([PQLRawInjection alloc], "initWithUTF8String:length:", a3, a4);
  return v7;
}

+ (void)initialize
{
  PQLRawInjection *v2;
  void *v3;
  PQLRawInjection *v4;
  void *v5;
  PQLRawInjection *v6;
  void *v7;
  PQLRawInjection *v8;
  void *v9;

  v2 = -[PQLRawInjection initWithUTF8String:length:]([PQLRawInjection alloc], "initWithUTF8String:length:", ", 0);
  v3 = (void *)gPQLEmpty;
  gPQLEmpty = (uint64_t)v2;

  v4 = -[PQLRawInjection initWithUTF8String:length:]([PQLRawInjection alloc], "initWithUTF8String:length:", "0", 1);
  v5 = (void *)gPQLFalse;
  gPQLFalse = (uint64_t)v4;

  v6 = -[PQLRawInjection initWithUTF8String:length:]([PQLRawInjection alloc], "initWithUTF8String:length:", "1", 1);
  v7 = (void *)gPQLTrue;
  gPQLTrue = (uint64_t)v6;

  v8 = -[PQLRawInjection initWithUTF8String:length:]([PQLRawInjection alloc], "initWithUTF8String:length:", "NULL", 4);
  v9 = (void *)gPQLNULL;
  gPQLNULL = (uint64_t)v8;

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<PQLRaw %s>"), -[PQLNameInjectionBase bytes](objc_retainAutorelease(self), "bytes"));
}

@end
