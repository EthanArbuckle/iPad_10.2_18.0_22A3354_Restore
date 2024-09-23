@implementation REExpectation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)notifyOperationsCompleteOrPerformUsingQueue:(id)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[REExpectation outstandingOperations](self, "outstandingOperations"))
    -[REExpectation notifyOperationsCompleteOnQueue:block:](self, "notifyOperationsCompleteOnQueue:block:", v7, v6);
  else
    v6[2](v6);

}

- (int64_t)outstandingOperations
{
  int *p_count;
  signed int v3;

  p_count = &self->_count;
  do
    v3 = __ldaxr((unsigned int *)p_count);
  while (__stlxr(v3, (unsigned int *)p_count));
  return v3;
}

- (REExpectation)init
{
  REExpectation *v2;
  dispatch_group_t v3;
  OS_dispatch_group *group;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REExpectation;
  v2 = -[REExpectation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

  }
  return v2;
}

- (void)endOperation
{
  int *p_count;
  unsigned int v4;

  dispatch_group_leave((dispatch_group_t)self->_group);
  p_count = &self->_count;
  do
    v4 = __ldaxr((unsigned int *)p_count);
  while (__stlxr(v4 - 1, (unsigned int *)p_count));
}

- (void)beginOperation
{
  int *p_count;
  unsigned int v3;

  p_count = &self->_count;
  do
    v3 = __ldaxr((unsigned int *)p_count);
  while (__stlxr(v3 + 1, (unsigned int *)p_count));
  dispatch_group_enter((dispatch_group_t)self->_group);
}

- (void)notifyOperationsCompleteOnQueue:(id)a3 block:(id)a4
{
  dispatch_group_notify((dispatch_group_t)self->_group, (dispatch_queue_t)a3, a4);
}

@end
