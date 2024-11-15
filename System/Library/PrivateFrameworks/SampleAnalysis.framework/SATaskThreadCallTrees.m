@implementation SATaskThreadCallTrees

- (_QWORD)initWithTask:(void *)a3 threadCallTrees:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SATaskThreadCallTrees;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 1, a2);
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

- (SATask)task
{
  return (SATask *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)threadCallTrees
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadCallTrees, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
