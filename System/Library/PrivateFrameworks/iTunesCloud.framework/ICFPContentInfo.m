@implementation ICFPContentInfo

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICFPContentInfo;
  return -[ICFPContentInfo init](&v3, sel_init);
}

- (FPContentInfo_)fpContentInfo
{
  *(_OWORD *)&retstr->var0 = 0uLL;
  *((_QWORD *)&retstr->var3 + 2) = 0;
  if (self->var2.var2 == 3)
  {
    retstr->var0 = 3;
    retstr->var2.var2 = *((_QWORD *)&self->var3 + 2);
  }
  return self;
}

- (int64_t)vodkaType
{
  return self->_vodkaType;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

+ (id)whaContentInfoWithAccountID:(unint64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  if (v4)
  {
    v4[1] = 3;
    v4[2] = a3;
  }
  return v4;
}

@end
