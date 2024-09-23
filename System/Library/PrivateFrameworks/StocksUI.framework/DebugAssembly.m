@implementation DebugAssembly

- (_TtC8StocksUI13DebugAssembly)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[DebugAssembly init](&v3, sel_init);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0, a5);
}

@end
