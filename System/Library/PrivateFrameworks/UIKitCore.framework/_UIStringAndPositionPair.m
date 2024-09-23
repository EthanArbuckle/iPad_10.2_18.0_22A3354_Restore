@implementation _UIStringAndPositionPair

- (id)initWithString:(void *)a3 position:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_UIStringAndPositionPair;
    a1 = (id *)objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (BOOL)isEqualToPair:(void *)a3 inputDelegate:
{
  _QWORD *v5;
  id v6;
  _BOOL8 v7;

  v5 = a2;
  v6 = a3;
  v7 = 0;
  if (a1 && v5)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", v5[1]))
      v7 = objc_msgSend(v6, "comparePosition:toPosition:", *(_QWORD *)(a1 + 16), v5[2]) == 0;
    else
      v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
