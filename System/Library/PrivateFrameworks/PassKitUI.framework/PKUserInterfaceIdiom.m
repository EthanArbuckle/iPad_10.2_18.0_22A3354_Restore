@implementation PKUserInterfaceIdiom

void __PKUserInterfaceIdiom_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  qword_1ED06C648 = objc_msgSend(v0, "userInterfaceIdiom");

}

@end
