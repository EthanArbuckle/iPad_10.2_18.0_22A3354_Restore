@implementation ContextAwareObject

- (int)ctxType
{
  return self->ctxType;
}

- (id)initCTXBase
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContextAwareObject;
  result = -[ContextAwareObject init](&v3, "init");
  if (result)
    *((_BYTE *)result + 8) = 0;
  return result;
}

- (int)getContextState
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10004EEC0(v2, v3, v4, v5, v6, v7, v8, v9);
  return -1;
}

- (BOOL)isContextTriggered
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10004EEF0(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

- (BOOL)synchContext
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10004EF20(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

@end
