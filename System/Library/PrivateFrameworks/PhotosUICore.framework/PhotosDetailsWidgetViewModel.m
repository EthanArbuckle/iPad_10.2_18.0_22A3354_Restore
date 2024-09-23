@implementation PhotosDetailsWidgetViewModel

- (void)preferredContentSizeDidChangeWithNotification:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtC12PhotosUICore28PhotosDetailsWidgetViewModel *v6;

  v4 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x150);
  v5 = a3;
  v6 = self;
  v4();

}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t (*v4)(void);
  id v5;
  void *v6;
  id v7;
  id v8;
  void **v9;
  void *v10;
  _TtC12PhotosUICore28PhotosDetailsWidgetViewModel *v11;
  id v12;

  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x88);
  v5 = a3;
  v11 = self;
  v6 = (void *)v4();
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C4430);
  v12 = (id)sub_1A7AE4394();

  if (v12)
  {
    v7 = objc_msgSend(v12, sel_objectAfterChanges);
    if (v7)
    {
      v8 = v7;
      v9 = (void **)((char *)&v11->super.isa + OBJC_IVAR____TtC12PhotosUICore28PhotosDetailsWidgetViewModel_asset);
      swift_beginAccess();
      v10 = *v9;
      *v9 = v8;

    }
    else
    {

    }
  }
  else
  {

  }
}

- (_TtC12PhotosUICore28PhotosDetailsWidgetViewModel)init
{
  _TtC12PhotosUICore28PhotosDetailsWidgetViewModel *result;

  result = (_TtC12PhotosUICore28PhotosDetailsWidgetViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore28PhotosDetailsWidgetViewModel_maxContentSizeCategory));

  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore28PhotosDetailsWidgetViewModel_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore28PhotosDetailsWidgetViewModel__spec;
  sub_1A6DB5DD4(0, &qword_1EE8C34D0, MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
