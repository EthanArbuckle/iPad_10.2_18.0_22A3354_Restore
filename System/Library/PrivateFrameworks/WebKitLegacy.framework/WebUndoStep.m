@implementation WebUndoStep

- (WebUndoStep)initWithUndoStep:(void *)a3
{
  WebUndoStep *v4;
  WebUndoStep *v5;
  UndoStep *v6;
  UndoStep *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebUndoStep;
  v4 = -[WebUndoStep init](&v9, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v6 = *(UndoStep **)a3;
  *(_QWORD *)a3 = 0;
  m_ptr = v4->m_step.m_ptr;
  v5->m_step.m_ptr = v6;
  if (!m_ptr)
    return v5;
  if (*((_DWORD *)m_ptr + 2) != 1)
  {
    --*((_DWORD *)m_ptr + 2);
    return v5;
  }
  (*(void (**)(UndoStep *))(*(_QWORD *)m_ptr + 8))(m_ptr);
  return v5;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WebUndoStep;
    -[WebUndoStep dealloc](&v4, sel_dealloc);
  }
}

+ (id)stepWithUndoStep:(void *)a3
{
  return (id)(id)CFMakeCollectable(-[WebUndoStep initWithUndoStep:]([WebUndoStep alloc], "initWithUndoStep:", a3));
}

- (void)step
{
  return self->m_step.m_ptr;
}

- (void).cxx_destruct
{
  UndoStep *m_ptr;

  m_ptr = self->m_step.m_ptr;
  self->m_step.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1)
      (*(void (**)(UndoStep *))(*(_QWORD *)m_ptr + 8))(m_ptr);
    else
      --*((_DWORD *)m_ptr + 2);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
