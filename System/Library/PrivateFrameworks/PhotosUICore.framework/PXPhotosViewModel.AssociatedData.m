@implementation PXPhotosViewModel.AssociatedData

- (_TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData)init
{
  return (_TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData *)sub_1A6964704();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self
     + OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_environmentValues;
  v4 = sub_1A7ADF540();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_release();
  sub_1A686EE5C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_customActionMenuVisibilityChangeHandler));
  swift_release();
  sub_1A691F300((uint64_t)self+ OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_bannerModel, (uint64_t)&qword_1EE8C3330, (uint64_t)&qword_1EE8C2768, (uint64_t)&protocol descriptor for PhotosViewBannerModel, (uint64_t (*)(_QWORD))sub_1A694E1AC);
  sub_1A691F300((uint64_t)self+ OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_bannerProvider, (uint64_t)&qword_1EE8C3340, (uint64_t)&qword_1EE8C3338, (uint64_t)&protocol descriptor for PhotosViewBannerProvider, (uint64_t (*)(_QWORD))sub_1A694E1AC);
  swift_unknownObjectRelease();
  v5 = (char *)self
     + OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_topChromeSize;
  v6 = sub_1A7ADD428();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A688D368((uint64_t)self+ OBJC_IVAR____TtCE12PhotosUICoreCSo17PXPhotosViewModelP33_2AC3A5E5F9AD66AE8113F7D60683096514AssociatedData_scrollRequestHandler);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
