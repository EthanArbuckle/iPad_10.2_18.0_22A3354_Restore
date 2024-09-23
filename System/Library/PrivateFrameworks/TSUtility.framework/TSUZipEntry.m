@implementation TSUZipEntry

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  TSUObjectReferenceDescription(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUZipEntry name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@> %@ size=%qu compressedSize=%qu CRC=0x%X offset=%qu extraFieldLength=%hu"), v4, v5, -[TSUZipEntry size](self, "size"), -[TSUZipEntry compressedSize](self, "compressedSize"), -[TSUZipEntry CRC](self, "CRC"), -[TSUZipEntry offset](self, "offset"), -[TSUZipEntry extraFieldLength](self, "extraFieldLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unsigned)CRC
{
  return self->_CRC;
}

- (void)setCRC:(unsigned int)a3
{
  self->_CRC = a3;
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (unint64_t)compressedSize
{
  return self->_compressedSize;
}

- (void)setCompressedSize:(unint64_t)a3
{
  self->_compressedSize = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unsigned)nameLength
{
  return self->_nameLength;
}

- (void)setNameLength:(unsigned __int16)a3
{
  self->_nameLength = a3;
}

- (unsigned)extraFieldLength
{
  return self->_extraFieldLength;
}

- (void)setExtraFieldLength:(unsigned __int16)a3
{
  self->_extraFieldLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
