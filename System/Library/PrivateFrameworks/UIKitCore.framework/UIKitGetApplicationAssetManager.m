@implementation UIKitGetApplicationAssetManager

void ___UIKitGetApplicationAssetManager_block_invoke()
{
  _UIAssetManager *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [_UIAssetManager alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[_UIAssetManager initWithName:inBundle:idiom:](v0, "initWithName:inBundle:idiom:", CFSTR("Assets"), v4, objc_msgSend(v1, "userInterfaceIdiom"));
  v3 = (void *)qword_1ECD79880;
  qword_1ECD79880 = v2;

}

@end
