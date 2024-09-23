@implementation SATaskCallTree

- (id)initWithTask:(uint64_t)a3 rootObjects:
{
  id v6;
  id *v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SATaskCallTree;
    v7 = (id *)objc_msgSendSuper2(&v10, sel_initWithRootObjects_, a3);
    v8 = v7;
    if (v7)
      objc_storeStrong(v7 + 2, a2);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SATask)task
{
  return (SATask *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
}

@end
