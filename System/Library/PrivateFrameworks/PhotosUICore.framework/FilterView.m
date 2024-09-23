@implementation FilterView

- (void)layoutSubviews
{
  char *v2;
  CGFloat v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FilterView();
  v2 = (char *)v4.receiver;
  -[FilterView layoutSubviews](&v4, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  v3 = CGRectGetHeight(v5) * 0.5;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_backgroundVisualEffectView], sel__setCornerRadius_, v3);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_button], sel__setCornerRadius_, v3);

}

- (void)handleTap:(id)a3
{
  id v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  _TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView *v7;

  v4 = a3;
  v7 = self;
  if (objc_msgSend(v4, sel_state) == (id)3)
  {
    v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.isa
                                        + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onShowDetails);
    if (v5)
    {
      v6 = sub_1A7ADBF34();
      v5(v6);
      sub_1A6855D80((uint64_t)v5);
    }
  }

}

- (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onToggle);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onShowDetails);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_targetFilterState) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_isFilterActive) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_dynamicConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  v6 = a3;

  result = (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView)initWithFrame:(CGRect)a3
{
  _TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView *result;

  result = (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onToggle));
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onShowDetails));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_targetFilterState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_backgroundVisualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_label));
  swift_bridgeObjectRelease();
}

@end
