@implementation DreamworksRecord

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

- (unsigned)seqnum
{
  return self->_seqnum;
}

- (void)setSeqnum:(unsigned int)a3
{
  self->_seqnum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
