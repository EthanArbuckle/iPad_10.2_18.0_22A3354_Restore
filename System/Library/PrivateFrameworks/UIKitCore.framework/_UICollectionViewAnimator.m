@implementation _UICollectionViewAnimator

- (_QWORD)initWithHandler:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_UICollectionViewAnimator;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = _Block_copy(v3);
      v5 = (void *)a1[2];
      a1[2] = v4;

    }
  }

  return a1;
}

- (void)setAnimationContext:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_animationContext, 0);
}

@end
