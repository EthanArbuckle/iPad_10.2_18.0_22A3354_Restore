@implementation UIViewAnimationContext

- (void)setViewAnimations:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeToDeleteCell, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_viewAnimations, 0);
}

- (_QWORD)initWithCompletionHandler:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)UIViewAnimationContext;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[3];
      a1[3] = v4;

    }
  }

  return a1;
}

@end
