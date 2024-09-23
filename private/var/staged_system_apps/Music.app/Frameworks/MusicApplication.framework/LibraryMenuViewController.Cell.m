@implementation LibraryMenuViewController.Cell

- (_TtCC16MusicApplication25LibraryMenuViewController4Cell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtCC16MusicApplication25LibraryMenuViewController4Cell *)sub_4B3490(a3, (uint64_t)a4, v6);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  UIAccessibilityTraits *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LibraryMenuViewController.Cell();
  v6 = v8.receiver;
  -[LibraryMenuViewController.Cell setSelected:animated:](&v8, "setSelected:animated:", v5, v4);
  v7 = &UIAccessibilityTraitNone;
  if (v5)
    v7 = &UIAccessibilityTraitSelected;
  objc_msgSend(v6, "setAccessibilityTraits:", *v7, v8.receiver, v8.super_class);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _TtCC16MusicApplication25LibraryMenuViewController4Cell *v6;
  unsigned int v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v6 = self;
  v7 = -[LibraryMenuViewController.Cell isEditing](v6, "isEditing");
  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for LibraryMenuViewController.Cell();
  -[LibraryMenuViewController.Cell setEditing:animated:](&v8, "setEditing:animated:", v5, v4);
  if (v7 != v5)
    -[LibraryMenuViewController.Cell invalidateIntrinsicContentSize](v6, "invalidateIntrinsicContentSize");

}

- (_TtCC16MusicApplication25LibraryMenuViewController4Cell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4B5D90();
}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LibraryMenuViewController.Cell();
  v2 = v3.receiver;
  -[LibraryMenuViewController.Cell prepareForReuse](&v3, "prepareForReuse");
  sub_4B42E0();

}

- (void)layoutSubviews
{
  _TtCC16MusicApplication25LibraryMenuViewController4Cell *v2;

  v2 = self;
  sub_4B3E50();

}

- (void)music_inheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LibraryMenuViewController.Cell();
  v2 = v3.receiver;
  -[LibraryMenuViewController.Cell music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "music_inheritedLayoutInsets", v3.receiver, v3.super_class);
  objc_msgSend(v2, "setLayoutMargins:");

}

- (void)layoutMarginsDidChange
{
  _TtCC16MusicApplication25LibraryMenuViewController4Cell *v2;

  v2 = self;
  sub_4B4080();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell_symbol));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell_symbolView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell_activeDownloadsCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell____lazy_storage___defaultTitleLabelTrailingConstraint));
}

@end
