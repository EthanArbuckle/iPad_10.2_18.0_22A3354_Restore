@implementation SBMainScreenScale

void ___SBMainScreenScale_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  _SBMainScreenScale___s = v0;

}

@end
