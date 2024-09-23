@implementation UINavigationController(PSControllerAdditions)

- (id)popRecursivelyToRootController
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__UINavigationController_PSControllerAdditions__popRecursivelyToRootController__block_invoke;
  v4[3] = &unk_1E4A654F0;
  v4[4] = a1;
  objc_msgSend(MEMORY[0x1E0CEABB8], "_performWithoutDeferringTransitions:", v4);
  v3.receiver = a1;
  v3.super_class = (Class)UINavigationController_0;
  return objc_msgSendSuper2(&v3, sel_popRecursivelyToRootController);
}

@end
