@implementation DOCGoToSuggestionsCollectionView

- (_TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView_focusableCollectionViewDelegate);
  *v10 = 0;
  v10[1] = 0;
  v11 = OBJC_IVAR____TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView_focusableCollectionViewState;
  v12 = type metadata accessor for DOCFocusableCollectionViewState(0);
  v13 = (objc_class *)swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v14 = (char *)v13 + OBJC_IVAR____TtC5Files31DOCFocusableCollectionViewState_indexPathForMostRecentlySelectedItem;
  v15 = type metadata accessor for IndexPath(0);
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  v16((char *)v13 + OBJC_IVAR____TtC5Files31DOCFocusableCollectionViewState_indexPathForSelectionExtensionStart, 1, 1, v15);
  *((_BYTE *)v13 + OBJC_IVAR____TtC5Files31DOCFocusableCollectionViewState_hasFocus) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = v13;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for DOCGoToSuggestionsCollectionView();
  return -[DOCGoToSuggestionsCollectionView initWithFrame:collectionViewLayout:](&v18, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView)initWithCoder:(id)a3
{
  return (_TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView *)sub_100454160(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView_focusableCollectionViewDelegate));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView_focusableCollectionViewState));
}

@end
