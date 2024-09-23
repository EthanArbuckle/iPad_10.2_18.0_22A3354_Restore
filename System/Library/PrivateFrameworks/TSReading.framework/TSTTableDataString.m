@implementation TSTTableDataString

- (id)initObjectWithString:(id)a3
{
  TSTTableDataString *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSTTableDataString;
  v4 = -[TSTTableDataString init](&v8, sel_init);
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableDataString initObjectWithString:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableDataList.mm"), 155, CFSTR("created a string table entry with a nil string"));
    }
    v4->mString = (NSString *)objc_msgSend(a3, "copy");
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return -[NSString hash](self->mString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(*((id *)a3 + 2), "isEqual:", self->mString);
  else
    return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("refCount: %d   mString: %@"), self->super.mRefCount, self->mString);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataString;
  -[TSTTableDataString dealloc](&v3, sel_dealloc);
}

@end
