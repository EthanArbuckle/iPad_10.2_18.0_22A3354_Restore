@implementation ProgressBarControl

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProgressBarControl();
  return -[ProgressBarControl isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  char *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ProgressBarControl();
  v4 = (char *)v7.receiver;
  -[ProgressBarControl setSelected:](&v7, "setSelected:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_videoControlButton];
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v6, "setSelected:", objc_msgSend(v4, "isSelected", v7.receiver, v7.super_class));

    v4 = v6;
  }

}

- (_TtC23ShelfKitCollectionViews18ProgressBarControl)init
{
  return (_TtC23ShelfKitCollectionViews18ProgressBarControl *)sub_213848();
}

- (_TtC23ShelfKitCollectionViews18ProgressBarControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2141A4();
}

- (void)didMoveToSuperview
{
  id v2;
  _TtC23ShelfKitCollectionViews18ProgressBarControl *v3;

  v3 = self;
  v2 = -[ProgressBarControl superview](v3, "superview");

  if (!v2)
    objc_msgSend(*(id *)((char *)&v3->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_displayLink), "invalidate");

}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews18ProgressBarControl *v2;

  v2 = self;
  sub_213BAC();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  double height;
  _TtC23ShelfKitCollectionViews18ProgressBarControl *v7;
  double v8;
  double v9;
  _TtC23ShelfKitCollectionViews18ProgressBarControl *v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_videoControlButton);
  if (v5)
  {
    height = a3.height;
    v7 = self;
    objc_msgSend(v5, "sizeThatFits:", width, height);
    v9 = v8;
  }
  else
  {
    v10 = self;
    v9 = 0.0;
  }
  if (qword_3CFB88 != -1)
    swift_once(&qword_3CFB88, sub_213750);
  v11 = *(double *)&qword_3DCFD8;

  if (v11 > v9)
    v12 = v11;
  else
    v12 = v9;
  v13 = width;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)updateProgressWithDisplayLink:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews18ProgressBarControl *v5;

  v4 = a3;
  v5 = self;
  sub_213ECC(v4);

}

- (_TtC23ShelfKitCollectionViews18ProgressBarControl)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews18ProgressBarControl *result;

  result = (_TtC23ShelfKitCollectionViews18ProgressBarControl *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ProgressBarControl", 42, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_videoControlButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_backgroundBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_progressBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_displayLink));
}

@end
