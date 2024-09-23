@implementation SiriCoreDataDecompressor

- (id)decompressedDataForBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  dispatch_data_t v5;
  id v6;

  if (a3)
  {
    v5 = dispatch_data_create(a3, a4, 0, 0);
  }
  else
  {
    v5 = (dispatch_data_t)MEMORY[0x24BDAC990];
    v6 = MEMORY[0x24BDAC990];
  }
  return v5;
}

- (id)decompressedDataForData:(id)a3 error:(id *)a4
{
  return a3;
}

@end
