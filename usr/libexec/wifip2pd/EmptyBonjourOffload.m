@implementation EmptyBonjourOffload

- (void)startServiceDiscoveryWithConfiguration:(void *)a3 completionHandler:(void *)aBlock
{
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD);
  id v8;
  id v9;

  v6 = _Block_copy(aBlock);
  v7 = (void (*)(_QWORD *, _QWORD))v6[2];
  v8 = a3;
  v9 = a1;
  v7(v6, 0);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC12wifip2pdCore19EmptyBonjourOffload_transaction));
}

@end
