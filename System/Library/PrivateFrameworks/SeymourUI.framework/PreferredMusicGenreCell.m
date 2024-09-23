@implementation PreferredMusicGenreCell

- (_TtC9SeymourUI23PreferredMusicGenreCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23PreferredMusicGenreCell *)sub_22B9CB424(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23PreferredMusicGenreCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B9CCC50();
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreferredMusicGenreCell();
  v2 = (char *)v5.receiver;
  -[PreferredMusicGenreCell layoutSubviews](&v5, sel_layoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_platter], sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, v4 * 0.5);

}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI23PreferredMusicGenreCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for PreferredMusicGenreCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[PreferredMusicGenreCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI23PreferredMusicGenreCell *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  v10 = -[PreferredMusicGenreCell contentView](v9, sel_contentView);
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)contentSizeCategoryChanged
{
  _TtC9SeymourUI23PreferredMusicGenreCell *v2;
  id v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  id v8;
  _OWORD v9[3];
  uint64_t v10;

  v2 = self;
  v3 = -[PreferredMusicGenreCell traitCollection](v2, sel_traitCollection);
  v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_titleLabel);
  v5 = *(_OWORD *)((char *)&v2->super.super.super._animationInfo
                 + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  v6 = *(uint64_t *)((char *)&v2->super.super.super._gestureRecognizers
                  + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  v7 = *(_OWORD *)((char *)&v2->super.super.super._subviewCache
                 + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  v9[1] = *(_OWORD *)((char *)&v2->super.super.super._traitChangeRegistry
                    + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  v9[2] = v7;
  v10 = v6;
  v9[0] = v5;
  sub_22B1001C4((uint64_t)v9);
  v8 = sub_22B100250(v3);
  sub_22B10020C((uint64_t)v9);
  objc_msgSend(v4, sel_setFont_, v8);

}

- (void).cxx_destruct
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_platter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_titleLabel));
  v3 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  v5 = (void *)v3[3];
  v6 = (void *)v3[4];
  v7 = (void *)v3[5];
  v9 = (id)v3[6];
  v8 = (void *)v3[7];
  swift_bridgeObjectRelease();

}

@end
