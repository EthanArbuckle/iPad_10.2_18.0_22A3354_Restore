@implementation SharedRecycleBin

void ___SharedRecycleBin_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 512, 1000);
  v1 = (void *)_SharedRecycleBin_recycleBin;
  _SharedRecycleBin_recycleBin = v0;

}

@end
