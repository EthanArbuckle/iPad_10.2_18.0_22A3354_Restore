@implementation SAThreadCallTree

- (uint64_t)initWithThread:(void *)a3 dispatchQueue:(void *)a4 swiftTask:(void *)a5 rootObjects:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  uint64_t result;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  uint8_t buf[16];

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a1)
    goto LABEL_7;
  if (v10 || v11 || v12)
  {
    v24.receiver = a1;
    v24.super_class = (Class)SAThreadCallTree;
    v14 = (id *)objc_msgSendSuper2(&v24, sel_initWithRootObjects_, v13);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
    }
LABEL_7:

    return (uint64_t)a1;
  }
  v16 = *__error();
  _sa_logt();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "Neither thread nor dispatchQueue nor swiftTask provided", buf, 2u);
  }

  *__error() = v16;
  _SASetCrashLogMessage(394, "Neither thread nor dispatchQueue nor swiftTask provided", v18, v19, v20, v21, v22, v23, (char)v24.receiver);
  result = _os_crash();
  __break(1u);
  return result;
}

- (SAThread)thread
{
  return (SAThread *)objc_getProperty(self, a2, 16, 1);
}

- (SADispatchQueue)dispatchQueue
{
  return (SADispatchQueue *)objc_getProperty(self, a2, 24, 1);
}

- (SASwiftTask)swiftTask
{
  return (SASwiftTask *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftTask, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_thread, 0);
}

@end
