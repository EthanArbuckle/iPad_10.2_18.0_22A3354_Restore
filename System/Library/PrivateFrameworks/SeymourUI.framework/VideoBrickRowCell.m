@implementation VideoBrickRowCell

- (_TtC9SeymourUI17VideoBrickRowCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17VideoBrickRowCell *)sub_22B1852F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17VideoBrickRowCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B185E34();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI17VideoBrickRowCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for VideoBrickRowCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[VideoBrickRowCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];
  uint64_t v8;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell____lazy_storage___videoBrickContentView));
  v3 = *(_OWORD *)((char *)&self->super.super.super._viewFlags + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout
                                                               + 8);
  v7[6] = *(_OWORD *)((char *)&self->super.super.super._viewDelegate
                    + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[7] = v3;
  v8 = *(_QWORD *)((char *)&self->super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout
                 + 24);
  v4 = *(_OWORD *)((char *)&self->super.super.super._swiftAnimationInfo
                 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[2] = *(_OWORD *)((char *)&self->super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[3] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super._window + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[4] = *(_OWORD *)((char *)&self->super.super.super._layerRetained
                    + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[5] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[1] = v6;
  sub_22B186048((uint64_t)v7);
}

@end
