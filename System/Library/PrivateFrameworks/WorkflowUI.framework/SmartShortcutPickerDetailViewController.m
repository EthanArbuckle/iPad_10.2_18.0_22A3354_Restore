@implementation SmartShortcutPickerDetailViewController

- (_TtC10WorkflowUI39SmartShortcutPickerDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22016FA78();
}

- (void)viewDidLoad
{
  _TtC10WorkflowUI39SmartShortcutPickerDetailViewController *v2;

  v2 = self;
  sub_22016FB6C();

}

- (void)viewDidLayoutSubviews
{
  _TtC10WorkflowUI39SmartShortcutPickerDetailViewController *v2;

  v2 = self;
  sub_22017078C();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10WorkflowUI39SmartShortcutPickerDetailViewController *v11;
  uint64_t v12;

  v6 = sub_220304758();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  v10 = a3;
  v11 = self;
  sub_220170910(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI39SmartShortcutPickerDetailViewController_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI39SmartShortcutPickerDetailViewController_hostingView));
}

@end
