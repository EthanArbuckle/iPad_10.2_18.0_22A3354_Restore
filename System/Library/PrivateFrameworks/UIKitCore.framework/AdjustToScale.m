@implementation AdjustToScale

void __AdjustToScale_block_invoke()
{
  uint64_t v0;
  id v1;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  AdjustToScale___s = v0;

}

void __AdjustToScale_block_invoke_0()
{
  uint64_t v0;
  id v1;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  AdjustToScale___s_0 = v0;

}

@end
