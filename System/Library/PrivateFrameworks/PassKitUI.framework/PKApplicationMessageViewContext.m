@implementation PKApplicationMessageViewContext

- (PKApplicationMessageViewContext)init
{

  return 0;
}

- (_QWORD)initForNode:(_QWORD *)a1
{
  id v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v8;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKApplicationMessageViewContext;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    if (v5)
      v5[2] = v4;
    a1 = v5;
    v6 = a1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setNode:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    if (*(id *)(a1 + 16) != v3)
    {
      *(_QWORD *)(a1 + 16) = v3;
      v4 = *(_QWORD *)(a1 + 32);
      v6 = v3;
      v5 = objc_msgSend(v3, "numberOfChildren") + v4;
      v3 = v6;
      if (v5 <= 1)
        *(_BYTE *)(a1 + 8) = 0;
    }
  }

}

@end
