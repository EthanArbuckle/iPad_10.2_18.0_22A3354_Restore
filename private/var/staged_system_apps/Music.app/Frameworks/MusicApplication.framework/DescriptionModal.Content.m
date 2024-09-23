@implementation DescriptionModal.Content

- (_TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content_heightNeeded) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content____lazy_storage___descriptionTextView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content____lazy_storage___maskView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content____lazy_storage___blurView) = 0;
  v4 = a3;

  result = (_TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/Header+DescriptionModal.swift", 46, 2, 54, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content *v2;

  v2 = self;
  sub_64B8C();

}

- (void)viewDidLayoutSubviews
{
  _TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content *v2;

  v2 = self;
  sub_65504();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content *v5;

  v4 = a3;
  v5 = self;
  sub_66538();

}

- (void)dismissAnimated
{
  -[DescriptionModal.Content dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.Content", 24);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->heightNeeded[OBJC_IVAR____TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content____lazy_storage___descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content____lazy_storage___maskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication16DescriptionModalP33_003B5E72AE51392282BD208E8EE7BE767Content____lazy_storage___blurView));
}

@end
