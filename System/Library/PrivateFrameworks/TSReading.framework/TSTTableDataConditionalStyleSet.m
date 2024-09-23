@implementation TSTTableDataConditionalStyleSet

- (id)initObjectWithConditionalStyleSet:(id)a3
{
  TSTTableDataConditionalStyleSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataConditionalStyleSet;
  v4 = -[TSTTableDataConditionalStyleSet init](&v6, sel_init);
  if (v4)
  {
    v4->mConditionalStyleSet = (TSTConditionalStyleSet *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return -[TSTConditionalStyleSet hash](self->mConditionalStyleSet, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TSTConditionalStyleSet isEqual:](self->mConditionalStyleSet, "isEqual:", *((_QWORD *)a3 + 2));
  else
    return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("refCount: %d   mStyle: %@"), self->super.mRefCount, self->mConditionalStyleSet);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataConditionalStyleSet;
  -[TSTTableDataConditionalStyleSet dealloc](&v3, sel_dealloc);
}

@end
