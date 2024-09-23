@implementation SMBDirEntry

- (unsigned)ntstatus
{
  return self->_ntstatus;
}

- (void)setNtstatus:(unsigned int)a3
{
  self->_ntstatus = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (smbfattr)attributes
{
  smbfattr *result;

  objc_copyStruct(retstr, &self->_attributes, 240, 1, 0);
  return result;
}

- (void)setAttributes:(smbfattr *)a3
{
  objc_copyStruct(&self->_attributes, a3, 240, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
