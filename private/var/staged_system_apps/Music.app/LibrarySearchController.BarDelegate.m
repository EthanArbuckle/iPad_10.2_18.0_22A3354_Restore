@implementation LibrarySearchController.BarDelegate

- (void)searchBarTextDidBeginEditing:(id)a3
{
  sub_10040A0E0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didBeginEditing);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  sub_10040A0E0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didEndEditing);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate *v11;
  void (*v12)(_TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate *, __n128);
  uint64_t v13;
  __n128 v14;
  id v15;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_text);
  v10 = *(_QWORD *)&self->text[OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_text];
  *v9 = v6;
  v9[1] = v7;
  v15 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v10);
  v12 = *(void (**)(_TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate *, __n128))((char *)&v11->super.isa + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_textDidChange);
  if (v12)
  {
    v13 = *(_QWORD *)&v11->text[OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_textDidChange];
    v14 = swift_retain();
    v12(v11, v14);
    sub_10004BA30((uint64_t)v12, v13);
  }

  swift_bridgeObjectRelease(v8);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10040A224(v4);

}

- (_TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate)init
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  objc_class *v8;
  objc_super v10;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_text);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didBeginEditing);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didEndEditing);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_textDidChange);
  *v6 = 0;
  v6[1] = 0;
  v7 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didCancel);
  v8 = (objc_class *)type metadata accessor for LibrarySearchController.BarDelegate();
  *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return -[LibrarySearchController.BarDelegate init](&v10, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_text]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didBeginEditing), *(_QWORD *)&self->text[OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didBeginEditing]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didEndEditing), *(_QWORD *)&self->text[OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didEndEditing]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_textDidChange), *(_QWORD *)&self->text[OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_textDidChange]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didCancel), *(_QWORD *)&self->text[OBJC_IVAR____TtCC5Music23LibrarySearchControllerP33_D5FA0BEF708D1E9261BCB607AD690C3E11BarDelegate_didCancel]);
}

@end
