@implementation LemonadePeopleNamingViewDelegate

- (void)contactPickerDidCancel:(id)a3
{
  id v4;
  _TtC12PhotosUICore32LemonadePeopleNamingViewDelegate *v5;
  id v6;

  v4 = a3;
  v5 = self;
  sub_1A7AE3F44();
  v6 = (id)*sub_1A6E3E9C4();
  sub_1A7ADFE40();

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  _TtC12PhotosUICore32LemonadePeopleNamingViewDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A70C9D80(v7);

}

- (_TtC12PhotosUICore32LemonadePeopleNamingViewDelegate)init
{
  _TtC12PhotosUICore32LemonadePeopleNamingViewDelegate *result;

  result = (_TtC12PhotosUICore32LemonadePeopleNamingViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32LemonadePeopleNamingViewDelegate_dismissAction;
  v4 = sub_1A7AE0AF4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

@end
