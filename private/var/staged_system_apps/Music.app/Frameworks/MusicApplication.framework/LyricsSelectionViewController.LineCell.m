@implementation LyricsSelectionViewController.LineCell

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s8LineCellCMa();
  return -[LyricsSelectionViewController.LineCell isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtCC16MusicApplication29LyricsSelectionViewController8LineCell *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)_s8LineCellCMa();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[LyricsSelectionViewController.LineCell isHighlighted](&v9, "isHighlighted");
  v8.receiver = v6;
  v8.super_class = v5;
  -[LyricsSelectionViewController.LineCell setHighlighted:](&v8, "setHighlighted:", v3);
  sub_AE6218(v7);

}

- (_TtCC16MusicApplication29LyricsSelectionViewController8LineCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_AE946C();
}

- (_TtCC16MusicApplication29LyricsSelectionViewController8LineCell)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication29LyricsSelectionViewController8LineCell *)sub_AE6760(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication29LyricsSelectionViewController8LineCell *v2;

  v2 = self;
  sub_AE79DC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtCC16MusicApplication29LyricsSelectionViewController8LineCell *v6;

  v5 = a3;
  v6 = self;
  sub_AE8050(a3);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)_s8LineCellCMa();
  -[LyricsSelectionViewController.LineCell setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (UIBezierPath)accessibilityPath
{
  return (UIBezierPath *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_containerView), "accessibilityPath");
}

- (void)setAccessibilityPath:(id)a3
{
  sub_AE8E98(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityPath_);
}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->text[OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_text];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_AE8D48(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityHint
{
  _TtCC16MusicApplication29LyricsSelectionViewController8LineCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_AE8BF4();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityHint:(id)a3
{
  sub_AE8D48(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityHint_);
}

- (unint64_t)accessibilityTraits
{
  _TtCC16MusicApplication29LyricsSelectionViewController8LineCell *v2;
  UIAccessibilityTraits v3;

  v2 = self;
  v3 = sub_AE8E04();

  return v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  sub_AE8E98(self, (uint64_t)a2, a3, (SEL *)&selRef_setAccessibilityTraits_);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_text]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_backgroundColorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_highlightOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication29LyricsSelectionViewController8LineCell_borderLayer));
}

@end
