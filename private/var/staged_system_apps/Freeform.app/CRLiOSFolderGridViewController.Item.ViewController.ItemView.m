@implementation CRLiOSFolderGridViewController.Item.ViewController.ItemView

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController8ItemView)initWithCoder:(id)a3
{
  id v5;
  _TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController8ItemView *result;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController8ItemView_owningViewController, 0);
  v5 = a3;

  result = (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController8ItemView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLFolderViewController-Item.swift", 43, 2, 834, 0);
  __break(1u);
  return result;
}

- (void)updateConstraints
{
  char *v2;
  char *Strong;
  uint64_t v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_s4ItemC14ViewControllerC8ItemViewCMa();
  v2 = (char *)v6.receiver;
  -[CRLiOSFolderGridViewController.Item.ViewController.ItemView updateConstraints](&v6, "updateConstraints");
  Strong = (char *)swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController8ItemView_owningViewController]);
  if (Strong)
  {
    v5 = Strong;
    (*(void (**)(char *, uint64_t))((swift_isaMask & *(_QWORD *)Strong) + 0x1C8))(Strong, v4);

    v2 = v5;
  }

}

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController8ItemView)initWithFrame:(CGRect)a3
{
  sub_100B33E4C((uint64_t)self, (uint64_t)a2, (uint64_t)"Freeform.ItemView", 17);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController8ItemView_owningViewController);
}

@end
