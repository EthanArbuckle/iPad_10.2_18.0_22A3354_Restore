@implementation DescriptionModal.Content

- (_TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content)initWithCoder:(id)a3
{
  id v4;
  _TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content_heightNeeded) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___descriptionTextView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___maskView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___blurView) = 0;
  v4 = a3;

  result = (_TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/Header+DescriptionModal.swift", 35, 2, 54, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content *v2;

  v2 = self;
  sub_100766C84();

}

- (void)viewDidLayoutSubviews
{
  _TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content *v2;

  v2 = self;
  sub_1007675FC();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content *v5;

  v4 = a3;
  v5 = self;
  sub_100768458();

}

- (void)dismissAnimated
{
  -[DescriptionModal.Content dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_10035A2A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"Music.Content", 13);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->heightNeeded[OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___maskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___blurView));
}

@end
