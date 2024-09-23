@implementation TSTTableDataRichTextPayload

- (id)initObjectWithRichTextPayload:(id)a3
{
  TSTTableDataRichTextPayload *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataRichTextPayload;
  v4 = -[TSTTableDataRichTextPayload init](&v6, sel_init);
  if (v4)
  {
    v4->mPayload = (TSTRichTextPayload *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return -[TSWPStorage hash](-[TSTRichTextPayload storage](self->mPayload, "storage"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TSWPStorage isEqual:](-[TSTRichTextPayload storage](self->mPayload, "storage"), "isEqual:", objc_msgSend(*((id *)a3 + 2), "storage"));
  else
    return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("refCount: %d   storage: %@"), self->super.mRefCount, -[TSTRichTextPayload storage](self->mPayload, "storage"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataRichTextPayload;
  -[TSTTableDataRichTextPayload dealloc](&v3, sel_dealloc);
}

@end
