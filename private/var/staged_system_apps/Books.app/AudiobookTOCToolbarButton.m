@implementation AudiobookTOCToolbarButton

- (_TtC5Books25AudiobookTOCToolbarButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Books25AudiobookTOCToolbarButton *)sub_1004E15E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AudiobookTOCToolbarButton();
  -[AudiobookTOCToolbarButton setImage:forState:](&v6, "setImage:forState:", a3, a4);
}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiobookTOCToolbarButton();
  v2 = (char *)v5.receiver;
  -[AudiobookTOCToolbarButton tintColorDidChange](&v5, "tintColorDidChange");
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Books25AudiobookTOCToolbarButton_supplementalBackgroundView];
  v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setTintColor:", v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books25AudiobookTOCToolbarButton_supplementalBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books25AudiobookTOCToolbarButton_supplementalIconView));
}

@end
