@implementation TSTTableDataMultipleChoiceList

- (id)initObjectWithPopUpMenuModel:(id)a3
{
  TSTTableDataMultipleChoiceList *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataMultipleChoiceList;
  v4 = -[TSTTableDataMultipleChoiceList init](&v6, sel_init);
  if (v4)
  {
    v4->mPopUpMenuModel = (TSTPopUpMenuModel *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return -[TSTPopUpMenuModel hash](self->mPopUpMenuModel, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TSTPopUpMenuModel isEqual:](self->mPopUpMenuModel, "isEqual:", *((_QWORD *)a3 + 2));
  else
    return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("refCount: %d   mPopUpMenuModel: %@"), self->super.mRefCount, self->mPopUpMenuModel);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataMultipleChoiceList;
  -[TSTTableDataMultipleChoiceList dealloc](&v3, sel_dealloc);
}

@end
