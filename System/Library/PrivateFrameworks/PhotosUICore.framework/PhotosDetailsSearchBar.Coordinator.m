@implementation PhotosDetailsSearchBar.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  _TtCV12PhotosUICore22PhotosDetailsSearchBar11Coordinator *v11;

  v6 = sub_1A7AE3764();
  v8 = v7;
  v9 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v10 = a3;
  v11 = self;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v9(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, sel_resignFirstResponder);
}

- (_TtCV12PhotosUICore22PhotosDetailsSearchBar11Coordinator)init
{
  _TtCV12PhotosUICore22PhotosDetailsSearchBar11Coordinator *result;

  result = (_TtCV12PhotosUICore22PhotosDetailsSearchBar11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
