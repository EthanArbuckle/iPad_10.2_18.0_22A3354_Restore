@implementation ICQBubbleBannerView

- (_TtP13iCloudQuotaUI27ICQBubbleBannerViewDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_delegate;
  swift_beginAccess();
  return (_TtP13iCloudQuotaUI27ICQBubbleBannerViewDelegate_ *)(id)MEMORY[0x2207C9154](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)initWithOffer:(id)a3 bannerSpecification:(id)a4
{
  return (_TtC13iCloudQuotaUI19ICQBubbleBannerView *)ICQBubbleBannerView.init(offer:bannerSpecification:)(a3, a4);
}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)initWithCoder:(id)a3
{
  char *v4;
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_actionButtons) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_delegate;
  swift_unknownObjectWeakInit();
  v5 = self;
  swift_bridgeObjectRelease();
  sub_21F414DA8((uint64_t)v4);

  type metadata accessor for ICQBubbleBannerView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)updateBannerView
{
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *v2;

  v2 = self;
  sub_21F43BD30();

}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)initWithFrame:(CGRect)a3
{
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *result;

  result = (_TtC13iCloudQuotaUI19ICQBubbleBannerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_subTitleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_closeButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_bannerSpecification));
  sub_21F414DA8((uint64_t)self + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_delegate);
}

@end
