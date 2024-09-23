@implementation SAKCDataExclaveTextLayout

- (_QWORD)initWithInfo:(void *)a3 textSegments:
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SAKCDataExclaveTextLayout;
    v6 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v6;
    if (v6)
    {
      v6[1] = a2;
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)a1[2];
      a1[2] = v7;

    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSegments, 0);
}

@end
