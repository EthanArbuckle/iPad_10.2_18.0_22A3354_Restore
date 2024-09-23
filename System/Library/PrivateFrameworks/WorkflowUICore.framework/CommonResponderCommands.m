@implementation CommonResponderCommands

- (_TtC14WorkflowUICore23CommonResponderCommands)init
{
  return (_TtC14WorkflowUICore23CommonResponderCommands *)sub_2270C12F8();
}

- (uint64_t)duplicateShortcut:(uint64_t)a3
{
  id v4;
  id v5;
  _OWORD v7[2];

  if (a3)
  {
    v4 = a1;
    swift_unknownObjectRetain();
    sub_227101880();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v5 = a1;
  }

  return sub_22707FC34((uint64_t)v7);
}

@end
