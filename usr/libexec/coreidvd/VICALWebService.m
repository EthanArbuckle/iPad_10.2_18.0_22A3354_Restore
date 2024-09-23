@implementation VICALWebService

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8coreidvd15VICALWebService_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  _s8coreidvd24DigitalPresentmentHelperVwxx_0((Class *)((char *)&self->super.super.isa
                                                      + OBJC_IVAR____TtC8coreidvd15VICALWebService_validator));
}

@end
