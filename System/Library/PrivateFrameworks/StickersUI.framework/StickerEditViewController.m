@implementation StickerEditViewController

- (_TtC10StickersUI25StickerEditViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_247A34A74();
}

- (void)loadView
{
  _TtC10StickersUI25StickerEditViewController *v2;

  v2 = self;
  sub_247A31984();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StickerEditViewController();
  v4 = v9.receiver;
  -[StickerEditViewController viewDidAppear:](&v9, sel_viewDidAppear_, v3);
  v5 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v4) + 0x1D0))(0);
  v6 = (void *)objc_opt_self();
  v7 = sub_247A3118C();
  objc_msgSend(v6, sel_playSettlingAnimation_, v7, v9.receiver, v9.super_class);

  v8 = sub_247A3135C();
  (*(void (**)(uint64_t))((*v5 & *v8) + 0x118))(1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StickerEditViewController();
  v4 = v7.receiver;
  -[StickerEditViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  v5 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v6 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v4) + 0x1D0))(1);
  (*(void (**)(uint64_t))((*v5 & *v4) + 0x2B8))(v6);

}

- (void)viewDidLayoutSubviews
{
  _TtC10StickersUI25StickerEditViewController *v2;

  v2 = self;
  sub_247A32948();

}

- (void)handleDoneButton
{
  uint64_t v3;
  void (*v4)(void (*)(), uint64_t);
  _TtC10StickersUI25StickerEditViewController *v5;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = *(void (**)(void (*)(), uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.isa) + 0x2E0);
  v5 = self;
  swift_retain();
  v4(sub_247A34BF0, v3);

  swift_release_n();
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC10StickersUI25StickerEditViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_247A35034;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_247A33B64(a3, (uint64_t)v6, v7);
  sub_247A35000((uint64_t)v6);

}

- (void)handleLiveButton
{
  _TtC10StickersUI25StickerEditViewController *v2;

  v2 = self;
  sub_247A33D08();

}

- (_TtC10StickersUI25StickerEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10StickersUI25StickerEditViewController *result;

  v4 = a4;
  result = (_TtC10StickersUI25StickerEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_sticker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_preferredRepresentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_stillRepresentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_animatedRepresentation));
  swift_release();
  swift_release();
  sub_247A314B0((uint64_t)self + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___previewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___effectChooser));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___liveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___previewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___previewHeightConstraint));
}

@end
