@implementation MDTSession

+ (void)initialize
{
  qword_10000C6E0 = (uint64_t)objc_alloc_init((Class)NSLock);
  qword_10000C6E8 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
}

+ (id)lookupSessionForPort:(unsigned int)a3
{
  void *v4;
  void *Value;

  v4 = (void *)qword_10000C6E0;
  objc_sync_enter((id)qword_10000C6E0);
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_10000C6E8, (const void *)a3);
  objc_sync_exit(v4);
  return Value;
}

+ (id)sessionWithServerPort:(unsigned int)a3 clientPort:(unsigned int)a4 pid:(int)a5
{
  MDTSession *v6;
  void *v7;

  v6 = -[MDTSession initWithServerPort:clientPort:pid:]([MDTSession alloc], "initWithServerPort:clientPort:pid:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v7 = (void *)qword_10000C6E0;
  objc_sync_enter((id)qword_10000C6E0);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_10000C6E8, (const void *)a3, v6);
  ++qword_10000C6F0;
  objc_sync_exit(v7);
  return v6;
}

+ (void)removeSession:(id)a3
{
  unsigned int v3;
  void *v4;

  v3 = objc_msgSend(a3, "serverPort");
  v4 = (void *)qword_10000C6E0;
  objc_sync_enter((id)qword_10000C6E0);
  if (CFDictionaryGetValue((CFDictionaryRef)qword_10000C6E8, (const void *)v3))
  {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_10000C6E8, (const void *)v3);
    --qword_10000C6F0;
  }
  objc_sync_exit(v4);
}

+ (int64_t)sessionCount
{
  return qword_10000C6F0;
}

- (MDTSession)initWithServerPort:(unsigned int)a3 clientPort:(unsigned int)a4 pid:(int)a5
{
  MDTSession *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MDTSession;
  result = -[MDTSession init](&v9, "init");
  result->_server = a3;
  result->_client = a4;
  result->_pid = a5;
  result->_valid = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MDTSession invalidate](self, "invalidate");

  self->_copier = 0;
  v3.receiver = self;
  v3.super_class = (Class)MDTSession;
  -[MDTSession dealloc](&v3, "dealloc");
}

- (void)finalize
{
  objc_super v3;

  -[MDTSession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MDTSession;
  -[MDTSession finalize](&v3, "finalize");
}

- (void)invalidate
{
  void *v3;

  if (self->_valid)
  {
    self->_valid = 0;
    mach_port_mod_refs(mach_task_self_, self->_server, 1u, -1);
    -[Copier invalidate](self->_copier, "invalidate");
    v3 = (void *)objc_opt_class(self);
    objc_msgSend(v3, "removeSession:", self);
  }
}

- (unsigned)clientPort
{
  return self->_client;
}

- (unsigned)serverPort
{
  return self->_server;
}

- (void)returnStatusWithDestURL:(id)a3 error:(id)a4
{
  __CFError *v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  const __CFData *v10;
  const __CFData *v11;
  __CFString *v12;
  const UInt8 *BytePtr;
  int Length;
  int v15;
  __CFError *v16;
  __CFError *v17;
  CFStringRef v18;

  v7 = sub_1000059D4((CFErrorRef)a4);
  v8 = sub_100005004((const __CFURL *)a3, v7);
  if (v8)
  {
    v9 = v8;
    v10 = (const __CFData *)sub_1000053D4(v8);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
    }
    else
    {
      NSLog(CFSTR("NULL data from __MDTSerializePropertyList"));
      v16 = CFErrorCreate(0, kCFErrorDomainPOSIX, 5, 0);
      if (v16)
      {
        v17 = v16;
        v18 = CFErrorCopyDescription(v16);
        v12 = (__CFString *)CFRetain(v18);
        CFRelease(v17);
      }
      else
      {
        v12 = CFSTR("Input/output error");
      }
      v11 = (const __CFData *)sub_100005314(v12, CFSTR("com.apple.mdt"), 1);
      if (!v11)
      {
        BytePtr = 0;
        Length = 0;
LABEL_11:
        CFRelease(v9);
        if (a4)
          goto LABEL_12;
LABEL_5:
        v15 = 0;
        goto LABEL_13;
      }
    }
    BytePtr = CFDataGetBytePtr(v11);
    Length = CFDataGetLength(v11);
    goto LABEL_11;
  }
  v11 = 0;
  BytePtr = 0;
  Length = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_5;
LABEL_12:
  v15 = objc_msgSend(a4, "code");
LABEL_13:
  sub_100005B70(self->_client, v15, (uint64_t)BytePtr, Length);
  if (v11)
    CFRelease(v11);
  if (v7)
    CFRelease(v7);
  if (v12)
    CFRelease(v12);
}

@end
