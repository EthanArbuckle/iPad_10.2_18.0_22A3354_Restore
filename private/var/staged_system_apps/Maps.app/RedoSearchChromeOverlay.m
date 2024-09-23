@implementation RedoSearchChromeOverlay

- (_TtP4Maps31RedoSearchChromeOverlayDelegate_)delegate
{
  return (_TtP4Maps31RedoSearchChromeOverlayDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_delegate, a3);
}

- (BOOL)isHidden
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_isHidden) = a3;
}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_host));
}

- (void)setHost:(id)a3
{
  uint64_t v5;
  _TtC4Maps23RedoSearchChromeOverlay *v6;

  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_host);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_host) = (Class)a3;
  swift_unknownObjectRetain_n(a3, 2);
  v6 = self;
  swift_unknownObjectRelease(v5);
  sub_1000378C8();

  swift_unknownObjectRelease(a3);
}

- (_TtC4Maps23RedoSearchChromeOverlay)init
{
  return (_TtC4Maps23RedoSearchChromeOverlay *)sub_100037C38();
}

- (void)updateContainerStyle:(unint64_t)a3
{
  _TtC4Maps23RedoSearchChromeOverlay *v4;

  v4 = self;
  sub_100037D30(a3);

}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _TtC4Maps23RedoSearchChromeOverlay *v6;

  v6 = self;
  sub_100037F30(a3, a4);

}

- (void)setAlpha:(double)a3
{
  _TtC4Maps23RedoSearchChromeOverlay *v4;

  v4 = self;
  sub_1000384A8(a3);

}

- (void)updateSearchOverlayWithState:(unsigned __int8)a3
{
  void *v3;
  _TtC4Maps23RedoSearchChromeOverlay *v5;
  id v6;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_redoSearchController);
  if (v3)
  {
    v5 = self;
    v6 = v3;
    sub_100203DC0(a3);

  }
}

- (void)shouldHideFloatingControl:(BOOL)a3 animated:(BOOL)a4
{
  _TtC4Maps23RedoSearchChromeOverlay *v6;

  v6 = self;
  sub_100037F30(a3, a4);

}

- (void).cxx_destruct
{

  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_constraints));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_host));
}

@end
