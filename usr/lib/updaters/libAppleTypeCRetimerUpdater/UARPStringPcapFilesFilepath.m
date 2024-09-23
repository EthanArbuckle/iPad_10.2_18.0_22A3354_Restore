@implementation UARPStringPcapFilesFilepath

void __UARPStringPcapFilesFilepath_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDBCE30];
  InternalStorageDirectoryPath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithObjects:", v1, CFSTR("pcapfiles"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)UARPStringPcapFilesFilepath_path;
  UARPStringPcapFilesFilepath_path = v2;

}

@end
