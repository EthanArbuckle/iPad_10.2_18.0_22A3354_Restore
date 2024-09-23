@implementation UIAlertController

uint64_t __70__UIAlertController_IC__ic_showAlertWithTitle_message_viewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

@end
