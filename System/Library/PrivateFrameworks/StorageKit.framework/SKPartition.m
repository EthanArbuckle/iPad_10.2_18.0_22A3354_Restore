@implementation SKPartition

- (id)buildWithScheme:(int)a3 sectorSize:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v10;

  v10 = 0;
  -[SKPartition fs](self, "fs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentMask");

  -[SKPartition name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPartition size](self, "size");
  v7 = (void *)MKCFBuildPartition();

  v8 = v7;
  return v8;
}

id __42__SKPartition_buildWithScheme_sectorSize___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKPartitionTable.m", 67);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (SKFilesystem)fs
{
  return self->_fs;
}

- (void)setFs:(id)a3
{
  objc_storeStrong((id *)&self->_fs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fs, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
