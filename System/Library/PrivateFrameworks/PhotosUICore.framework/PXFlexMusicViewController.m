@implementation PXFlexMusicViewController

- (void)viewDidLoad
{
  id v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PXFlexMusicViewController();
  v2 = v4.receiver;
  -[PXFlexMusicViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (void *)sub_1A7AE3734();
  objc_msgSend(v2, sel_setTitle_, v3, v4.receiver, v4.super_class);

  sub_1A6B6B4E4();
}

- (PXFlexMusicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  char *v9;
  id v10;
  PXFlexMusicViewController *v11;
  objc_super v13;

  if (a3)
  {
    sub_1A7AE3764();
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXFlexMusicViewController_player) = 0;
    v6 = (char *)self + OBJC_IVAR___PXFlexMusicViewController_pickerView;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    v6[32] = 0;
    v7 = a4;
    v8 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXFlexMusicViewController_player) = 0;
    v9 = (char *)self + OBJC_IVAR___PXFlexMusicViewController_pickerView;
    *(_OWORD *)v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    v9[32] = 0;
    v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PXFlexMusicViewController();
  v11 = -[PXFlexMusicViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v8, a4);

  return v11;
}

- (PXFlexMusicViewController)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXFlexMusicViewController_player) = 0;
  v5 = (char *)self + OBJC_IVAR___PXFlexMusicViewController_pickerView;
  v6 = (objc_class *)type metadata accessor for PXFlexMusicViewController();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[PXFlexMusicViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{

  sub_1A6B6B3B0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXFlexMusicViewController_pickerView), *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR___PXFlexMusicViewController_pickerView), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___PXFlexMusicViewController_pickerView));
}

@end
