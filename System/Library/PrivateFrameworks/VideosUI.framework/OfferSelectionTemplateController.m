@implementation OfferSelectionTemplateController

- (_TtC8VideosUI32OfferSelectionTemplateController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA065460();
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI32OfferSelectionTemplateController *v2;

  v2 = self;
  sub_1DA065AB4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI32OfferSelectionTemplateController *v4;

  v4 = self;
  sub_1DA065BD4(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_4_201((void **)((char *)&self->super.super.super.super.super.isa
                                  + OBJC_IVAR____TtC8VideosUI32OfferSelectionTemplateController____lazy_storage___pinningFooterView));
}

- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8VideosUI32OfferSelectionTemplateController *v15;
  uint64_t v16;

  v9 = sub_1DA13F710();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA143E80();
  sub_1DA13F6BC();
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1DA065CC8((uint64_t)v13, (uint64_t)v14);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  OUTLINED_FUNCTION_3_1();
}

@end
