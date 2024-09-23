@implementation ComposeUndoHandler

- (_TtC10MobileMail18ComposeUndoHandler)initWithOutgoingMessageRepository:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC10MobileMail18ComposeUndoHandler *)sub_100007C20(a3);
}

- (void)enableUndoSend:(BOOL)a3 for:(id)a4
{
  id v5;
  _TtC10MobileMail18ComposeUndoHandler *v6;
  char v7;

  v5 = a4;
  v6 = self;
  v7 = _convertObjCBoolToBool(_:)(a3);
  sub_10020D8D8(v7 & 1, a4);

}

- (void)cancelLastDelayedMessage
{
  _TtC10MobileMail18ComposeUndoHandler *v2;

  v2 = self;
  sub_10020DC28();

}

- (_TtC10MobileMail18ComposeUndoHandler)init
{
  return (_TtC10MobileMail18ComposeUndoHandler *)sub_10020E59C();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  v3 = OBJC_IVAR____TtC10MobileMail18ComposeUndoHandler_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(char *))(*(_QWORD *)(v2 - 8) + 8))((char *)self + v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail18ComposeUndoHandler_outgoingMessageRepository));
}

@end
