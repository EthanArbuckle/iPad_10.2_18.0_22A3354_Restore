@implementation TSTTableDataStyle

- (id)initObjectWithStyle:(id)a3
{
  TSTTableDataStyle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataStyle;
  v4 = -[TSTTableDataStyle init](&v6, sel_init);
  if (v4)
  {
    v4->mStyle = (TSSStyle *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return -[TSSStyle hash](self->mStyle, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[TSSStylesheet isEqual:](-[TSSStyle stylesheet](self->mStyle, "stylesheet"), "isEqual:", objc_msgSend(*((id *)a3 + 2), "stylesheet"))&& -[TSSStyle isEqual:](self->mStyle, "isEqual:", *((_QWORD *)a3 + 2));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("refCount: %d   mStyle: %@"), self->super.mRefCount, self->mStyle);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataStyle;
  -[TSTTableDataStyle dealloc](&v3, sel_dealloc);
}

@end
