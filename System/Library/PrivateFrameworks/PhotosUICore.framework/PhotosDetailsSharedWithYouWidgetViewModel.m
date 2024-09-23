@implementation PhotosDetailsSharedWithYouWidgetViewModel

- (void)syndicationAttributionInfoDidChange:(id)a3
{
  id v4;
  _TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_1A6B86B14(v4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t (*v4)(_QWORD, uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t);

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel_attributionInfo));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel_appAttributionModel));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__syndicationContactName;
  v4 = (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0C96198];
  sub_1A6B863F4(0, &qword_1EE8C34B8, MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__syndicationContactImage;
  sub_1A6B863D8(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self
     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__syndicationSharedInAttributedTitle;
  sub_1A6B863BC(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self
      + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__syndicationAttributionInfoIsLoading;
  sub_1A6847920(0, (unint64_t *)&unk_1EE8C34C0, MEMORY[0x1E0DEAFA0], v4);
  v12 = v11;
  v13 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v13(v10, v11);
  v13((char *)self+ OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__hasSyndicationAttributionInfo, v12);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
