@implementation UNSServerActionHandler

- (UNSServerActionHandlerDelegate)delegate
{
  return (UNSServerActionHandlerDelegate *)(id)MEMORY[0x219A0356C]((char *)self+ OBJC_IVAR___UNSServerActionHandler_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UNSServerActionHandler)init
{
  return (UNSServerActionHandler *)UNSServerActionHandler.init()();
}

- (void)dealloc
{
  UNSServerActionHandler *v2;

  v2 = self;
  sub_216DFFD70();
}

- (void).cxx_destruct
{
  sub_216E007D8((uint64_t)self + OBJC_IVAR___UNSServerActionHandler_delegate);
  swift_release();
  swift_release();
}

@end
