@implementation CRLNoCopyDictionary

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class(NSMutableDictionary, a2);
}

- (CRLNoCopyDictionary)init
{
  return -[CRLNoCopyDictionary initWithCapacity:](self, "initWithCapacity:", 0);
}

- (CRLNoCopyDictionary)initWithCFDictionary:(__CFDictionary *)a3
{
  CRLNoCopyDictionary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLNoCopyDictionary;
  v4 = -[CRLNoCopyDictionary init](&v6, "init");
  if (v4)
    v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, a3);
  return v4;
}

- (CRLNoCopyDictionary)initWithCapacity:(unint64_t)a3
{
  CRLNoCopyDictionary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLNoCopyDictionary;
  v4 = -[CRLNoCopyDictionary init](&v6, "init");
  if (v4)
    v4->mDictionary = CFDictionaryCreateMutable(0, a3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  return v4;
}

- (void)dealloc
{
  __CFDictionary *mDictionary;
  objc_super v4;

  mDictionary = self->mDictionary;
  if (mDictionary)
  {
    CFRelease(mDictionary);
    self->mDictionary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLNoCopyDictionary;
  -[CRLNoCopyDictionary dealloc](&v4, "dealloc");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _objc_msgSend(v4, "initWithCFDictionary:", self->mDictionary);
}

- (void)removeObjectForKey:(id)a3
{
  CFDictionaryRemoveValue(self->mDictionary, a3);
}

- (void)removeAllObjects
{
  CFDictionaryRemoveAllValues(self->mDictionary);
}

- (void)setObject:(id)a3 forUncopiedKey:(id)a4
{
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  CRLNoCopyDictionary *v19;
  __int16 v20;
  id v21;

  if (a3)
  {
    if (a4)
    {
LABEL_3:
      CFDictionarySetValue(self->mDictionary, a4, a3);
      return;
    }
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempt to insert nil value into %@"), objc_opt_class(self, a2));
    if (a4)
      goto LABEL_3;
  }
  v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122CD88);
  v8 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67110402;
    v11 = v7;
    v12 = 2082;
    v13 = "-[CRLNoCopyDictionary setObject:forUncopiedKey:]";
    v14 = 2082;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLNoCopyDictionary.m";
    v16 = 1024;
    v17 = 72;
    v18 = 2048;
    v19 = self;
    v20 = 2112;
    v21 = a3;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Inserting a value into no-copy dictionary with a NULL key into %p! Object is %@", buf, 0x36u);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CDA8);
  }
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE8ABC(v7, v9);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLNoCopyDictionary setObject:forUncopiedKey:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLNoCopyDictionary.m"), 72, 0, "Inserting a value into no-copy dictionary with a NULL key into %p! Object is %@", self, a3);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  -[CRLNoCopyDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", a3, a4, -1);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t Count;
  unint64_t v10;
  BOOL v11;

  Count = CFDictionaryGetCount(self->mDictionary);
  if (Count >= a5)
    v10 = a5;
  else
    v10 = Count;
  if (v10)
    v11 = ((unint64_t)a3 | (unint64_t)a4) == 0;
  else
    v11 = 1;
  if (!v11)
    CFDictionaryGetKeysAndValues(self->mDictionary, (const void **)a4, (const void **)a3);
}

- (id)objectForKey:(id)a3
{
  if (a3)
    return (id)CFDictionaryGetValue(self->mDictionary, a3);
  else
    return 0;
}

- (id)allValues
{
  unint64_t Count;
  unint64_t v4;
  const void **v5;
  NSArray *v6;
  void *values[16];

  Count = CFDictionaryGetCount(self->mDictionary);
  v4 = Count;
  v5 = (const void **)values;
  if (Count >= 0x10)
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->mDictionary, 0, v5);
  v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, v4);
  if (v5 != (const void **)values)
    free(v5);
  return v6;
}

- (id)objectEnumerator
{
  return objc_msgSend(-[CRLNoCopyDictionary allValues](self, "allValues"), "objectEnumerator");
}

- (id)allKeys
{
  unint64_t Count;
  unint64_t v4;
  const void **v5;
  NSArray *v6;
  void *keys[16];

  Count = CFDictionaryGetCount(self->mDictionary);
  v4 = Count;
  v5 = (const void **)keys;
  if (Count >= 0x10)
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->mDictionary, v5, 0);
  v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, v4);
  if (v5 != (const void **)keys)
    free(v5);
  return v6;
}

- (id)keyEnumerator
{
  return objc_msgSend(-[CRLNoCopyDictionary allKeys](self, "allKeys"), "objectEnumerator");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t Count;
  unint64_t v10;
  const void **v11;

  Count = CFDictionaryGetCount(self->mDictionary);
  if (a3->var0 >= Count)
    return 0;
  v10 = Count;
  v11 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->mDictionary, v11, 0);
  if (v10 - a3->var0 < a5)
    a5 = v10 - a3->var0;
  memcpy(a4, &v11[a3->var0], 8 * a5);
  free(v11);
  a3->var0 += a5;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&a3->var2;
  return a5;
}

@end
