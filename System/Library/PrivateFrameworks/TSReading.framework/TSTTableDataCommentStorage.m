@implementation TSTTableDataCommentStorage

- (id)initObjectWithCommentStorage:(id)a3
{
  TSTTableDataCommentStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataCommentStorage;
  v4 = -[TSTTableDataCommentStorage init](&v6, sel_init);
  if (v4)
  {
    v4->mCommentStorage = (TSDCommentStorage *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return -[TSDCommentStorage hash](self->mCommentStorage, "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TSDCommentStorage isEqual:](self->mCommentStorage, "isEqual:", *((_QWORD *)a3 + 2));
  else
    return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("refCount: %d   commentStorage: %@"), self->super.mRefCount, self->mCommentStorage);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataCommentStorage;
  -[TSTTableDataCommentStorage dealloc](&v3, sel_dealloc);
}

@end
