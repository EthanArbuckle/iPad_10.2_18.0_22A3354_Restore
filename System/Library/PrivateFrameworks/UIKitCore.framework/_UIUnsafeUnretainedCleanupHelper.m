@implementation _UIUnsafeUnretainedCleanupHelper

- (_QWORD)initWithParent:(void *)a3 deallocationHandler:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v5 = a3;
  v6 = v5;
  if (!a1)
    goto LABEL_6;
  if (a2)
  {
    if (v5)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithParent_deallocationHandler_, a1, CFSTR("_UIWeakHelper.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parent != nil"));

    if (v6)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithParent_deallocationHandler_, a1, CFSTR("_UIWeakHelper.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deallocationHandler != NULL"));

LABEL_4:
  v14.receiver = a1;
  v14.super_class = (Class)_UIUnsafeUnretainedCleanupHelper;
  a1 = objc_msgSendSuper2(&v14, sel_init);
  if (a1)
  {
    v7 = _Block_copy(v6);
    v8 = (void *)a1[1];
    a1[1] = v7;

    a1[2] = a2;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    v10 = (void *)a1[3];
    a1[3] = v9;

  }
LABEL_6:

  return a1;
}

- (void)dealloc
{
  objc_super v3;

  (*((void (**)(void))self->_deallocationHandler + 2))();
  v3.receiver = self;
  v3.super_class = (Class)_UIUnsafeUnretainedCleanupHelper;
  -[_UIUnsafeUnretainedCleanupHelper dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong(&self->_deallocationHandler, 0);
}

@end
