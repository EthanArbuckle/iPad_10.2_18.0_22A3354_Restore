@implementation TTRIUnsupportedTextDropHandler

- (_TtC15RemindersUICore30TTRIUnsupportedTextDropHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[TTRIUnsupportedTextDropHandler init](&v3, sel_init);
}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3DA8]), sel_initWithDropOperation_, 0);
}

- (unint64_t)textDroppableView:(id)a3 willBecomeEditableForDrop:(id)a4
{
  return 0;
}

@end
