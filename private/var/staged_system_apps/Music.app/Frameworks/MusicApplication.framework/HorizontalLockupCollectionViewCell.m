@implementation HorizontalLockupCollectionViewCell

- (_TtC16MusicApplication34HorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication34HorizontalLockupCollectionViewCell *)sub_4C4CFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v11;
  uint64_t v12;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = a3;
  v11 = self;
  sub_4C53D0((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtC16MusicApplication34HorizontalLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4C9290();
}

- (BOOL)isDisabled
{
  return self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled];
}

- (void)setIsDisabled:(BOOL)a3
{
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v3;

  self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled] = a3;
  v3 = self;
  sub_4C5898();

}

- (BOOL)showsContextMenu
{
  return self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_showsContextMenu];
}

- (void)setShowsContextMenu:(BOOL)a3
{
  _BOOL8 v3;
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v4;

  v3 = a3;
  v4 = self;
  sub_4C2A20((id)v3);

}

- (_TtC11MusicCoreUI12SymbolButton)contextMenuButton
{
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v2;
  id v3;

  v2 = self;
  v3 = sub_4C2AA0();

  return (_TtC11MusicCoreUI12SymbolButton *)v3;
}

- (void)setContextMenuButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell____lazy_storage___contextMenuButton];
  *(_QWORD *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell____lazy_storage___contextMenuButton] = a3;
  v3 = a3;

}

- (_TtC11MusicCoreUI12SymbolButton)libraryStatusControl
{
  return (_TtC11MusicCoreUI12SymbolButton *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryStatusControl];
}

- (void)setLibraryStatusControl:(id)a3
{
  id v4;
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v5;
  id v6;

  v6 = *(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryStatusControl];
  *(_QWORD *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryStatusControl] = a3;
  v4 = a3;
  v5 = self;
  sub_4C5E64(v6);

}

- (BOOL)wantsNowPlayingIndicator
{
  return (self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_playbackIndicatorView] != 255) & self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_playbackIndicatorView];
}

- (void)prepareForReuse
{
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v2;

  v2 = self;
  sub_4C6AF8();

}

- (BOOL)isEditing
{
  return sub_4C717C(self, (uint64_t)a2, (SEL *)&selRef_isEditing);
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for HorizontalLockupCollectionViewCell(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[HorizontalLockupCollectionViewCell isEditing](&v9, "isEditing");
  v8.receiver = v6;
  v8.super_class = v5;
  -[HorizontalLockupCollectionViewCell setEditing:](&v8, "setEditing:", v3);
  if (v7 != -[HorizontalLockupCollectionViewCell isEditing](v6, "isEditing"))
    sub_4C48AC();

}

- (BOOL)isSelected
{
  return sub_4C717C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v4;

  v4 = self;
  sub_4C71FC(a3);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v2;

  v2 = self;
  sub_4C731C();

}

- (void)clearArtworkCatalogs
{
  _QWORD *v2;
  void *v3;
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v4;
  uint64_t v5;

  v2 = *(_QWORD **)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkComponent];
  v3 = (void *)v2[18];
  v4 = self;
  objc_msgSend(v3, "clearArtworkCatalogs");
  *(_QWORD *)((char *)v2
            + OBJC_IVAR____TtCE16MusicApplicationV11MusicCoreUI7Artwork9Component_representationsUpdatedFromConfigurationBlock) = 0;
  v5 = v2[30];
  v2[29] = 0;
  v2[30] = 0;

  swift_bridgeObjectRelease(v5);
}

- (void)music_inheritedLayoutInsetsDidChange
{
  char *v2;
  void (*v3)(char *, __n128);
  uint64_t v4;
  __n128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HorizontalLockupCollectionViewCell(0);
  v2 = (char *)v6.receiver;
  -[HorizontalLockupCollectionViewCell music_inheritedLayoutInsetsDidChange](&v6, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v6.receiver, v6.super_class);
  v3 = *(void (**)(char *, __n128))&v2[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_layoutInvalidationHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_layoutInvalidationHandler
                      + 8];
    v5 = swift_retain(v4);
    v3(v2, v5);
    sub_5C198((uint64_t)v3, v4);
  }

}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v5 = type metadata accessor for ShelfCollectionViewLayout.LayoutAttributes();
  v6 = swift_dynamicCastClass(a3, v5);
  if (v6)
    self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_rowPosition] = *(_BYTE *)(v6 + OBJC_IVAR____TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes_rowPosition);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HorizontalLockupCollectionViewCell(0);
  -[HorizontalLockupCollectionViewCell applyLayoutAttributes:](&v7, "applyLayoutAttributes:", a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication34HorizontalLockupCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_4C7FAC(a3);

}

- (_TtC11MusicCoreUI12SymbolButton)accessibilityMediaPickerAddButton
{
  return (_TtC11MusicCoreUI12SymbolButton *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_mediaPickerAddButton];
}

- (_TtC11MusicCoreUI12SymbolButton)accessibilityLibraryStatusControl
{
  return (_TtC11MusicCoreUI12SymbolButton *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryStatusControl];
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  double v4;
  uint64_t v5;

  sub_56024((uint64_t)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkCornerTreatment], &qword_14C0170);
  sub_9AFF4(*(void **)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkPlaceholder], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkPlaceholder], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkPlaceholder+ 8], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkPlaceholder+ 16]);

  sub_15BC34(*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkAccessoryStyle]);
  v3 = &self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_defaultBackgroundConfiguration];
  v5 = type metadata accessor for UIBackgroundConfiguration(0, v4);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  sub_5C198(*(_QWORD *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_layoutInvalidationHandler], *(_QWORD *)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_layoutInvalidationHandler]);

  sub_56024((uint64_t)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_reactionsConfiguration], &qword_14B20E8);
  sub_CBD68(*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_playbackIndicatorView], self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_playbackIndicatorView]);
  sub_64880((uint64_t)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryAddKeepLocalStatusControllableDelegate]);

  swift_release(*(_QWORD *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkCachingReference]);
  swift_release(*(_QWORD *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkComponent]);
  sub_5C198(*(_QWORD *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_imageDidChangeHandler], *(_QWORD *)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_imageDidChangeHandler]);

  swift_release(*(_QWORD *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_textDrawingCache]);
  swift_release(*(_QWORD *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryAddKeepLocalStatusObserver]);
}

@end
