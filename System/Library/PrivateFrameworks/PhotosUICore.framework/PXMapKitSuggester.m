@implementation PXMapKitSuggester

- (_TtC12PhotosUICore17PXMapKitSuggester)init
{
  _OWORD *v2;
  _QWORD *v3;
  MKCoordinateRegion *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _TtC12PhotosUICore17PXMapKitSuggester *v9;
  objc_super v11;
  MKMapRect v12;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester____lazy_storage___searchCompleter) = 0;
  v2 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_input);
  *v2 = 0u;
  v2[1] = 0u;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_completion);
  *v3 = 0;
  v3[1] = 0;
  v4 = (MKCoordinateRegion *)((char *)self + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_coordinateRegion);
  v5 = *MEMORY[0x1E0CC1670];
  v6 = *(double *)(MEMORY[0x1E0CC1670] + 8);
  v7 = *(double *)(MEMORY[0x1E0CC1670] + 16);
  v8 = *(double *)(MEMORY[0x1E0CC1670] + 24);
  v9 = self;
  v12.origin.x = v5;
  v12.origin.y = v6;
  v12.size.width = v7;
  v12.size.height = v8;
  *v4 = MKCoordinateRegionForMapRect(v12);

  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for PXMapKitSuggester();
  return -[PXMapKitSuggester init](&v11, sel_init);
}

- (void)completerDidUpdateResults:(id)a3
{
  id v4;
  _TtC12PhotosUICore17PXMapKitSuggester *v5;

  v4 = a3;
  v5 = self;
  sub_1A68C6400(v4);

}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC12PhotosUICore17PXMapKitSuggester *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1A68C6E78((uint64_t)v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester____lazy_storage___searchCompleter));
  sub_1A68C6258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_input), *(_QWORD *)&self->$__lazy_storage_$_searchCompleter[OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_input]);
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_completion));
}

@end
