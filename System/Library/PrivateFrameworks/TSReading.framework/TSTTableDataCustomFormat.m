@implementation TSTTableDataCustomFormat

- (id)initObjectWithCustomFormat:(void *)a3
{
  TSTTableDataCustomFormat *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTTableDataCustomFormat;
  v4 = -[TSTTableDataCustomFormat init](&v7, sel_init);
  if (v4)
  {
    v5 = operator new();
    MEMORY[0x219A151A8](v5, a3);
    v4->mCustomFormat = (void *)v5;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return TSUCustomFormat::hash((TSUCustomFormat *)self->mCustomFormat);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return TSUCustomFormat::customFormatIsEqual((TSUCustomFormat *)self->mCustomFormat, *((TSUCustomFormat **)a3 + 2));
  else
    return 0;
}

- (id)description
{
  void *v2;
  uint64_t mRefCount;
  TSUCustomFormat *mCustomFormat;
  const __CFString *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  mRefCount = self->super.mRefCount;
  mCustomFormat = (TSUCustomFormat *)self->mCustomFormat;
  if (mCustomFormat)
    v5 = (const __CFString *)TSUCustomFormat::formatName(mCustomFormat);
  else
    v5 = CFSTR("NULL");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("refCount: %d   mCustomFormat: %@"), mRefCount, v5);
}

- (void)dealloc
{
  void *mCustomFormat;
  uint64_t v4;
  objc_super v5;

  mCustomFormat = self->mCustomFormat;
  if (mCustomFormat)
  {
    v4 = MEMORY[0x219A151B4](mCustomFormat, a2);
    MEMORY[0x219A153B8](v4, 0x10A0C40ADE6F494);
  }
  self->mCustomFormat = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSTTableDataCustomFormat;
  -[TSTTableDataCustomFormat dealloc](&v5, sel_dealloc);
}

@end
