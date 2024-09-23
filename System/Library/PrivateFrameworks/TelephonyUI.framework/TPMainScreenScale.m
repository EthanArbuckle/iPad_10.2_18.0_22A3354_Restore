@implementation TPMainScreenScale

void __TPMainScreenScale_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  TPMainScreenScale_sMainScreenScale = v0;

}

@end
