@implementation MailStatusDataSource

- (_TtC19MailWidgetExtension20MailStatusDataSource)init
{
  return (_TtC19MailWidgetExtension20MailStatusDataSource *)sub_100021B28();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19MailWidgetExtension20MailStatusDataSource_messageRepository));
  sub_10000A004((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19MailWidgetExtension20MailStatusDataSource_state));
  sub_10000A004((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19MailWidgetExtension20MailStatusDataSource_debouncers));
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  id v6;
  id v7;
  _TtC19MailWidgetExtension20MailStatusDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100021CF8((uint64_t)a3, a4, a5);

}

@end
