@implementation UIDevice(ICQUI)

+ (BOOL)icqui_isiPad
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  return v1;
}

@end
