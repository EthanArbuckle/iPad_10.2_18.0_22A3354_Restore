@implementation DOCDSFileServiceConnection

- (_TtC5Files26DOCDSFileServiceConnection)init
{
  unsigned __int8 *v3;
  objc_class *v4;
  objc_super v6;

  v3 = &self->DSFileServiceConnection_opaque[OBJC_IVAR____TtC5Files26DOCDSFileServiceConnection_didUpdateInProgressFileOperationsHandler];
  v4 = (objc_class *)type metadata accessor for DOCDSFileServiceConnection();
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[DOCDSFileServiceConnection init](&v6, "init");
}

- (void).cxx_destruct
{
  sub_100087534(*(_QWORD *)&self->DSFileServiceConnection_opaque[OBJC_IVAR____TtC5Files26DOCDSFileServiceConnection_didUpdateInProgressFileOperationsHandler], *(_QWORD *)&self->didUpdateInProgressFileOperationsHandler[OBJC_IVAR____TtC5Files26DOCDSFileServiceConnection_didUpdateInProgressFileOperationsHandler]);
}

@end
