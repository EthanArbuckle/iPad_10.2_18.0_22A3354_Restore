@implementation AADataclassManager

void __57__AADataclassManager_iCloudSettings___isHiddenDataclass___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BDB3E28], *MEMORY[0x24BDB3DF8], *MEMORY[0x24BDB3EA0], *MEMORY[0x24BDB3DC0], *MEMORY[0x24BDB3DD0], *MEMORY[0x24BDB3DC8], *MEMORY[0x24BDB3DE0], *MEMORY[0x24BDB3DA0], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_isHiddenDataclass__dataclassesToHide;
  _isHiddenDataclass__dataclassesToHide = v0;

}

@end
