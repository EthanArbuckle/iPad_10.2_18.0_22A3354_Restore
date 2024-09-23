@implementation PhotosDetailsEXIFWidgetViewModel

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  _TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_1A6F978E4();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  uint64_t v9;

  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel__isContentLoaded;
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198];
  sub_1A6847920(0, (unint64_t *)&unk_1EE8C34C0, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0C96198]);
  v6 = v5;
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v7(v3, v5);
  v7((char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel__showRawEXIF, v6);
  v8 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel__videoHDRBadgeTitle;
  sub_1A6B863F4(0, &qword_1EE8C34B8, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel____lazy_storage___videoFormatInfoProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel_metadataProcessingQueue));
}

@end
