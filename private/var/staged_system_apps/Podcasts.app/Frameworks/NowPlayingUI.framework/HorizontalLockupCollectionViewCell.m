@implementation HorizontalLockupCollectionViewCell

- (_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell *)sub_BF068(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_C09A8();
}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI34HorizontalLockupCollectionViewCell *v2;

  v2 = self;
  sub_BF4D0();

}

- (void)clearArtworkCatalogs
{
  _TtC12NowPlayingUI34HorizontalLockupCollectionViewCell *v2;

  v2 = self;
  sub_BFEEC();

}

- (void)music_inheritedLayoutInsetsDidChange
{
  char *v2;
  void (*v3)(char *);
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HorizontalLockupCollectionViewCell(0);
  v2 = (char *)v5.receiver;
  -[HorizontalLockupCollectionViewCell music_inheritedLayoutInsetsDidChange](&v5, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v5.receiver, v5.super_class);
  v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_layoutInvalidationHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_layoutInvalidationHandler + 8];
    swift_retain();
    v3(v2);
    sub_145A0((uint64_t)v3, v4);
  }

}

- (void)applyLayoutAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HorizontalLockupCollectionViewCell(0);
  -[CompositeCollectionViewAwareTableCell applyLayoutAttributes:](&v4, "applyLayoutAttributes:", a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NowPlayingUI34HorizontalLockupCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_C0040((uint64_t)a3);

}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4;
  void (*v5)(_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell *);
  uint64_t v6;
  _TtC12NowPlayingUI34HorizontalLockupCollectionViewCell *v7;

  v4 = a3;
  v7 = self;
  -[HorizontalLockupCollectionViewCell setNeedsLayout](v7, "setNeedsLayout");
  v5 = *(void (**)(_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell *))&v7->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_layoutInvalidationHandler];
  if (v5)
  {
    v6 = *(_QWORD *)&v7->artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_layoutInvalidationHandler];
    swift_retain();
    v5(v7);
    sub_145A0((uint64_t)v5, v6);
  }

}

- (void).cxx_destruct
{
  sub_791D4(*(void **)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkPlaceholder], *(_QWORD *)&self->artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkPlaceholder], self->artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkPlaceholder + 8]);

  sub_C0C60(*(id *)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkAccessoryStyle]);
  sub_145A0(*(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_layoutInvalidationHandler], *(_QWORD *)&self->artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_layoutInvalidationHandler]);
  swift_release(*(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkComponent]);
  swift_release(*(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkCachingContext]);

  swift_release(*(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_textDrawingCache]);
}

@end
