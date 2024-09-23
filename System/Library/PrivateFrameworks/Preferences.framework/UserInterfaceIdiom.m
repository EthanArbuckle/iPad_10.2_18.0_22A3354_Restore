@implementation UserInterfaceIdiom

void __UserInterfaceIdiom_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  UserInterfaceIdiom_idiom = objc_msgSend(v0, "userInterfaceIdiom");

}

@end
