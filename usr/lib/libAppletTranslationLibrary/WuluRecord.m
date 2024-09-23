@implementation WuluRecord

+ (id)withRecordSfi:(unsigned __int8)a3 recordNumber:(unsigned __int8)a4 recordData:(id)a5 associatedSerialNumber:(unsigned __int16)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v6 = a6;
  v7 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSfi:", v8);
  objc_msgSend(v10, "setNumber:", v7);
  objc_msgSend(v10, "setData:", v9);

  objc_msgSend(v10, "setAssociatedSerialNumber:", v6);
  return v10;
}

- (unsigned)sfi
{
  return self->_sfi;
}

- (void)setSfi:(unsigned __int8)a3
{
  self->_sfi = a3;
}

- (unsigned)number
{
  return self->_number;
}

- (void)setNumber:(unsigned __int8)a3
{
  self->_number = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (unsigned)associatedSerialNumber
{
  return self->_associatedSerialNumber;
}

- (void)setAssociatedSerialNumber:(unsigned __int16)a3
{
  self->_associatedSerialNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
