@implementation CatalogLockupPreviewProvider

- (_TtC9SeymourUI28CatalogLockupPreviewProvider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6B8158();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI28CatalogLockupPreviewProvider *v2;

  v2 = self;
  sub_22B6B6CF4();

}

- (_TtC9SeymourUI28CatalogLockupPreviewProvider)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI28CatalogLockupPreviewProvider *result;

  v4 = a4;
  result = (_TtC9SeymourUI28CatalogLockupPreviewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_artwork;
  v4 = sub_22BA7D0E8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_artworkImageLoader);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_mediaTagStringBuilder);
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_lockup;
  v6 = sub_22BA7A5EC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_subtitleLabel));
}

@end
