@implementation LibraryArtistsContainerViewController.PlainLayoutContainer

- (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_navigatedArtistDetailViewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LibraryArtistsContainerViewController.PlainLayoutContainer();
  return -[LibraryArtistsContainerViewController.PlainLayoutContainer initWithNibName:bundle:](&v3, "initWithNibName:bundle:", 0, 0);
}

- (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer)initWithCoder:(id)a3
{
  id v4;
  _TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_navigatedArtistDetailViewController) = 0;
  v4 = a3;

  result = (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/LibraryArtistsContainerViewController.swift", 49, 2, 151, 0);
  __break(1u);
  return result;
}

- (UINavigationItem)navigationItem
{
  void *v3;
  _TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer *v4;
  id v5;
  void *v6;
  _TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer *v8;
  UINavigationItem *v9;
  objc_super v10;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_artistListViewController);
  if (v3)
  {
    v4 = self;
    v5 = objc_msgSend(v3, "navigationItem");
    if (v5)
    {
      v6 = v5;

      return (UINavigationItem *)v6;
    }
  }
  else
  {
    v8 = self;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for LibraryArtistsContainerViewController.PlainLayoutContainer();
  v9 = -[LibraryArtistsContainerViewController.PlainLayoutContainer navigationItem](&v10, "navigationItem");

  return v9;
}

- (void)viewDidLoad
{
  _TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer *v2;

  v2 = self;
  sub_1004535D4();

}

- (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_10035A2A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"Music.PlainLayoutContainer", 26);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_artistListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_navigatedArtistDetailViewController));
}

@end
