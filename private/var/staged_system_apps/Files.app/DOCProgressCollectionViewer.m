@implementation DOCProgressCollectionViewer

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files27DOCProgressCollectionViewer *v4;

  v4 = self;
  sub_10027F76C(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Files27DOCProgressCollectionViewer *v6;

  v5 = a3;
  v6 = self;
  sub_10027F9C4((uint64_t)a3);

}

- (BOOL)isEditing
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files27DOCProgressCollectionViewer_listViewController), "isEditing");
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _TtC5Files27DOCProgressCollectionViewer *v7;

  v3 = a3;
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files27DOCProgressCollectionViewer_listViewController);
  v6 = (void *)objc_opt_self(UIView);
  v7 = self;
  objc_msgSend(v5, "setEditing:animated:", v3, objc_msgSend(v6, "areAnimationsEnabled"));
  sub_10027FB7C();

}

- (void)toggleEditTapped
{
  _TtC5Files27DOCProgressCollectionViewer *v2;

  v2 = self;
  -[DOCProgressCollectionViewer setEditing:](v2, "setEditing:", -[DOCProgressCollectionViewer isEditing](v2, "isEditing") ^ 1);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC5Files27DOCProgressCollectionViewer *v13;
  id v14;
  _TtC5Files27DOCProgressCollectionViewer *v15;
  objc_class *v16;
  _QWORD v17[5];
  uint64_t v18;
  objc_super v19;

  v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1005D6B10, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1000E62C0;
    v17[4] = sub_1000E62C0;
    v18 = v9;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 1107296256;
    v17[2] = sub_10004A82C;
    v17[3] = &unk_1005D6B28;
    v10 = _Block_copy(v17);
    v11 = v18;
    v12 = a3;
    v13 = self;
    swift_retain();
    swift_release(v11);
  }
  else
  {
    v14 = a3;
    v15 = self;
    v10 = 0;
    v9 = 0;
  }
  v16 = (objc_class *)type metadata accessor for DOCProgressCollectionViewer();
  v19.receiver = self;
  v19.super_class = v16;
  -[DOCProgressCollectionViewer presentViewController:animated:completion:](&v19, "presentViewController:animated:completion:", a3, v5, v10);
  _Block_release(v10);
  sub_100087534((uint64_t)v8, v9);

}

- (int64_t)modalPresentationStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCProgressCollectionViewer();
  return -[DOCProgressCollectionViewer modalPresentationStyle](&v3, "modalPresentationStyle");
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCProgressCollectionViewer();
  -[DOCProgressCollectionViewer setModalPresentationStyle:](&v4, "setModalPresentationStyle:", a3);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCProgressCollectionViewer();
  -[DOCProgressCollectionViewer preferredContentSize](&v4, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC5Files27DOCProgressCollectionViewer)init
{
  _TtC5Files27DOCProgressCollectionViewer *result;

  result = (_TtC5Files27DOCProgressCollectionViewer *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCProgressCollectionViewer", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (_TtC5Files27DOCProgressCollectionViewer)initWithRootViewController:(id)a3
{
  id v3;
  _TtC5Files27DOCProgressCollectionViewer *result;

  v3 = a3;
  result = (_TtC5Files27DOCProgressCollectionViewer *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCProgressCollectionViewer", 33, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files27DOCProgressCollectionViewer_listViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files27DOCProgressCollectionViewer_adaptablePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files27DOCProgressCollectionViewer____lazy_storage___dismissButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files27DOCProgressCollectionViewer_listFittingHeightKVO));
}

@end
