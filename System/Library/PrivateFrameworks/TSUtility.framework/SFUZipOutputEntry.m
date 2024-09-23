@implementation SFUZipOutputEntry

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUZipOutputEntry;
  -[SFUZipOutputEntry dealloc](&v3, sel_dealloc);
}

- (id)description
{
  const __CFString *v2;

  if (self->isCompressed)
    v2 = CFSTR("yes");
  else
    v2 = CFSTR("no");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<SFUZipOutputEntry %p: name=%@, isCompressed=%@, compressedSize=%qu, uncompressedSize=%qu, offset=%qu>"), self, self->name, v2, self->compressedSize, self->uncompressedSize, self->offset);
}

- (int64_t)compareByOffset:(id)a3
{
  unint64_t offset;
  unint64_t v4;
  BOOL v5;
  int64_t v6;

  offset = self->offset;
  v4 = *((_QWORD *)a3 + 6);
  v5 = offset >= v4;
  v6 = offset > v4;
  if (v5)
    return v6;
  else
    return -1;
}

@end
