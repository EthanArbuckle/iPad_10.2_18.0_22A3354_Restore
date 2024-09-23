@implementation LemonadeOneUpPresentationDelegate

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_assetsDataSourceManager));
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_mediaProvider));
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  id v6;
  id v7;
  _TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1A6BC8618(v7);

  return v9;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v6;
  id v7;
  _TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A6BC7C34(v6, v7);

}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  uint64_t v4;
  id v7;
  _TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate *v8;

  v4 = (uint64_t)a4;
  if (a4)
  {
    sub_1A6856488(0, &qword_1EE8D8BB0);
    sub_1A6BCB404();
    v4 = sub_1A7AE3DA0();
  }
  v7 = a3;
  v8 = self;
  sub_1A6BCB45C(v4);

  swift_bridgeObjectRelease();
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  void *v4;
  id v5;
  _TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_assetsDataSourceManager);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, sel_dataSource);
  v8 = *(uint64_t *)((char *)&v6->super.isa
                  + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_initialAsset);
  objc_msgSend(v7, sel_indexPathForObjectID_, v8);
  v14 = v15;
  v9 = v16;
  v10 = v17;
  v11 = objc_allocWithZone((Class)off_1E50B1688);
  v15 = v14;
  v16 = v9;
  v17 = v10;
  v12 = objc_msgSend(v11, sel_initWithSectionObject_itemObject_subitemObject_indexPath_, 0, v8, 0, &v15);

  return v12;
}

- (BOOL)oneUpPresentationWantsShowInLibraryButton:(id)a3
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_wantsShowInLibraryButton);
}

- (id)oneUpPresentation:(id)a3 presentingScrollViewForAssetReference:(id)a4
{
  id v6;
  id v7;
  _TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A6BCB508(v7);
  v10 = v9;

  return v10;
}

- (_TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate)init
{
  _TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate *result;

  result = (_TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_initialAsset));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_assetsDataSourceManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_mediaProvider));
  swift_unknownObjectUnownedDestroy();
  sub_1A6BCB674((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_context);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_7168310A7BB869661DCEBE4E2645382233LemonadeOneUpPresentationDelegate_sourceImageViewSpec));
  swift_bridgeObjectRelease();
}

@end
