@implementation CRLZipEntry

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = sub_10003DC58(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLZipEntry name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLZipEntry collapsedName](self, "collapsedName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@> %@ (%@) size=%qu compressedSize=%qu CRC=0x%X offset=%qu extraFieldLength=%hu"), v4, v5, v6, -[CRLZipEntry size](self, "size"), -[CRLZipEntry compressedSize](self, "compressedSize"), -[CRLZipEntry CRC](self, "CRC"), -[CRLZipEntry offset](self, "offset"), -[CRLZipEntry extraFieldsLength](self, "extraFieldsLength")));

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)collapsedName
{
  return self->_collapsedName;
}

- (void)setCollapsedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void)setLastModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
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

- (unsigned)nameLength
{
  return self->_nameLength;
}

- (void)setNameLength:(unsigned __int16)a3
{
  self->_nameLength = a3;
}

- (unsigned)extraFieldsLength
{
  return self->_extraFieldsLength;
}

- (void)setExtraFieldsLength:(unsigned __int16)a3
{
  self->_extraFieldsLength = a3;
}

- (unint64_t)fileHeaderLength
{
  return self->_fileHeaderLength;
}

- (void)setFileHeaderLength:(unint64_t)a3
{
  self->_fileHeaderLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_collapsedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
