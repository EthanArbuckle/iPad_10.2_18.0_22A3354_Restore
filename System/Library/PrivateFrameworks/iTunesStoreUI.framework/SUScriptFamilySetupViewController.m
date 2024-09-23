@implementation SUScriptFamilySetupViewController

- (id)newNativeViewController
{
  id v2;
  void *v3;
  SUScriptFamilySetupDelegate *v4;

  v2 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  v3 = (void *)objc_msgSend(objc_alloc((Class)ISWeakLinkedClassForString()), "initWithAccount:store:", objc_msgSend(v2, "aa_primaryAppleAccount"), v2);

  v4 = objc_alloc_init(SUScriptFamilySetupDelegate);
  objc_setAssociatedObject(v3, "com.apple.iTunesStoreUI.SUScriptFamilySetupDelegate", v4, (void *)1);
  objc_msgSend(v3, "setDelegate:", v4);

  return v3;
}

@end
