@implementation BKPresentationDonationTarget

- (BKPresentationDonationTarget)init
{
  BKPresentationDonationTarget *result;

  result = (BKPresentationDonationTarget *)_swift_stdlib_reportUnimplementedInitializer("Books.PresentationDonationTarget", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR___BKPresentationDonationTarget_identifier]);

  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationTarget_targetFrame), *(_QWORD *)&self->identifier[OBJC_IVAR___BKPresentationDonationTarget_targetFrame]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationTarget_adopt), *(_QWORD *)&self->identifier[OBJC_IVAR___BKPresentationDonationTarget_adopt]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationTarget_prepareForAdoption), *(_QWORD *)&self->identifier[OBJC_IVAR___BKPresentationDonationTarget_prepareForAdoption]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationTarget_finalizeAdoption), *(_QWORD *)&self->identifier[OBJC_IVAR___BKPresentationDonationTarget_finalizeAdoption]);
}

@end
