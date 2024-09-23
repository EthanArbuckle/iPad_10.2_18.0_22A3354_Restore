@implementation PhotosDetailsSavedFromAppsWidgetViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSavedFromAppsWidgetViewModel_attributionInfo));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSavedFromAppsWidgetViewModel__attributionAppIcon;
  sub_1A67ECCF8(0, (unint64_t *)&unk_1EE8C34F0, (uint64_t (*)(uint64_t))sub_1A6B19E68, MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
