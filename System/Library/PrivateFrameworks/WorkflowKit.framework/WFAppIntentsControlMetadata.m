@implementation WFAppIntentsControlMetadata

- (unint64_t)type
{
  return ControlMetadata.type.getter();
}

- (CHSControlIdentity)identity
{
  return (CHSControlIdentity *)ControlMetadata.identity.getter();
}

- (WFAppIntentsControlMetadata)init
{
  ControlMetadata.init()();
}

- (void).cxx_destruct
{

}

- (void)presentIfPossibleInUserInterface:(WFUserInterfaceHost *)a3 completionBlock:(id)a4
{
  void *v6;
  _QWORD *v7;
  WFAppIntentsControlMetadata *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1C18B1138((uint64_t)&unk_1EF701D88, (uint64_t)v7);
}

@end
