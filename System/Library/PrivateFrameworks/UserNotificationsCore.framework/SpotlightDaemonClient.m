@implementation SpotlightDaemonClient

- (void)searchableItemsDidUpdate:(id)a3
{
  uint64_t v4;
  void (*v5)(uint64_t);
  _TtC21UserNotificationsCoreP33_2EBB79DBAE553364D10B28CEFE20CBF021SpotlightDaemonClient *v6;

  sub_2499ABC2C(0, (unint64_t *)&qword_2544B7BC0);
  v4 = sub_249B02668();
  v5 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC21UserNotificationsCoreP33_2EBB79DBAE553364D10B28CEFE20CBF021SpotlightDaemonClient_handler);
  if (v5)
  {
    v6 = self;
    sub_2499AB0EC((uint64_t)v5);
    v5(v4);
    sub_2499AAB44((uint64_t)v5);

  }
  swift_bridgeObjectRelease();
}

- (_TtC21UserNotificationsCoreP33_2EBB79DBAE553364D10B28CEFE20CBF021SpotlightDaemonClient)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21UserNotificationsCoreP33_2EBB79DBAE553364D10B28CEFE20CBF021SpotlightDaemonClient_handler);
  v4 = (objc_class *)type metadata accessor for SpotlightDaemonClient();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[SpotlightDaemonClient init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_2499AAB44(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21UserNotificationsCoreP33_2EBB79DBAE553364D10B28CEFE20CBF021SpotlightDaemonClient_handler));
}

@end
