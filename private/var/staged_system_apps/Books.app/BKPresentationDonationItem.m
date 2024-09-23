@implementation BKPresentationDonationItem

- (BKPresentationDonationItem)init
{
  BKPresentationDonationItem *result;

  result = (BKPresentationDonationItem *)_swift_stdlib_reportUnimplementedInitializer("Books.PresentationDonationItem", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR___BKPresentationDonationItem_identifier]);

  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationItem_prepareForAdoption), *(_QWORD *)&self->identifier[OBJC_IVAR___BKPresentationDonationItem_prepareForAdoption]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationItem_finishAdoption), *(_QWORD *)&self->identifier[OBJC_IVAR___BKPresentationDonationItem_finishAdoption]);
}

@end
