@implementation SymbolButton.BadgeView

- (_TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100403F50();
}

- (double)alpha
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SymbolButton.BadgeView();
  -[SymbolButton.BadgeView alpha](&v3, "alpha");
  return result;
}

- (void)setAlpha:(double)a3
{
  char *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SymbolButton.BadgeView();
  v4 = (char *)v6.receiver;
  -[SymbolButton.BadgeView setAlpha:](&v6, "setAlpha:", a3);
  v5 = *(void **)&v4[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView];
  objc_msgSend(v4, "alpha", v6.receiver, v6.super_class);
  objc_msgSend(v5, "setAlpha:");

}

- (BOOL)isHidden
{
  return sub_1003F77E0(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for SymbolButton.BadgeView, (SEL *)&selRef_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SymbolButton.BadgeView();
  v4 = (char *)v5.receiver;
  -[SymbolButton.BadgeView setHidden:](&v5, "setHidden:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView], "setHidden:", objc_msgSend(v4, "isHidden", v5.receiver, v5.super_class));

}

- (void)didMoveToSuperview
{
  char *v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SymbolButton.BadgeView();
  v2 = (char *)v5.receiver;
  -[SymbolButton.BadgeView didMoveToSuperview](&v5, "didMoveToSuperview");
  v3 = objc_msgSend(v2, "superview", v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "insertSubview:belowSubview:", *(_QWORD *)&v2[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView], v2);

  }
  else
  {
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView], "removeFromSuperview");
  }

}

- (void)layoutSubviews
{
  uint64_t v3;
  char *v4;
  objc_class *v5;
  _TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView *v6;
  id v7;
  uint64_t v8;
  objc_super v9;

  sub_10000B4C8(&qword_100560490);
  __chkstk_darwin();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (objc_class *)type metadata accessor for SymbolButton.BadgeView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[SymbolButton.BadgeView layoutSubviews](&v9, "layoutSubviews");
  static UIView.Corner.rounded.getter(v7);
  v8 = type metadata accessor for UIView.Corner(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 0, 1, v8);
  UIView.corner.setter(v4);
  sub_1003FB958();

}

- (_TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView)initWithFrame:(CGRect)a3
{
  sub_1002AA940((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicCoreUI.BadgeView", 21);
}

- (void).cxx_destruct
{
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_configuration
                                         + 8]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView));
}

@end
