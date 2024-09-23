@implementation SAExecutableCallTree

- (_QWORD)initWithTasks:(uint64_t)a3 rootObjects:
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v5 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SAExecutableCallTree;
    v6 = objc_msgSendSuper2(&v10, sel_initWithRootObjects_, a3);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)v6[2];
      v6[2] = v7;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)tasks
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end
