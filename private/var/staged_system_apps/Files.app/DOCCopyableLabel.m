@implementation DOCCopyableLabel

- (UIColor)textColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCopyableLabel();
  return -[DOCCopyableLabel textColor](&v3, "textColor");
}

- (void)setTextColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCCopyableLabel();
  -[DOCCopyableLabel setTextColor:](&v4, "setTextColor:", a3);
}

- (void)handleTapWithSender:(id)a3
{
  id v4;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  _TtC5Files16DOCCopyableLabel *v8;

  v4 = a3;
  v8 = self;
  if (objc_msgSend(v4, "state") == (id)3
    && (Strong = swift_unknownObjectWeakLoadStrong((char *)v8 + OBJC_IVAR____TtC5Files16DOCCopyableLabel_delegate)) != 0)
  {
    v7 = Strong;
    sub_1003D5718(Strong, v6);

    swift_unknownObjectRelease(v7);
  }
  else
  {

  }
}

- (BOOL)canBecomeFirstResponder
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files16DOCCopyableLabel_supportsCopy);
}

- (void)copyDetail
{
  _TtC5Files16DOCCopyableLabel *v2;

  v2 = self;
  sub_1001D2CB8();

}

- (void)tintColorDidChange
{
  objc_class *v3;
  _TtC5Files16DOCCopyableLabel *v4;
  id v5;
  void *v6;
  _TtC5Files16DOCCopyableLabel *v7;
  objc_super v8;
  objc_super v9;

  v3 = (objc_class *)type metadata accessor for DOCCopyableLabel();
  v9.receiver = self;
  v9.super_class = v3;
  v4 = self;
  v5 = -[DOCCopyableLabel tintColorDidChange](&v9, "tintColorDidChange");
  if (*((_BYTE *)&v4->super.super.super.super.isa + OBJC_IVAR____TtC5Files16DOCCopyableLabel_behaveAsLink) == 1)
  {
    v6 = (void *)UIView.doc_tintColorIgnoringVibrancyContainer.getter(v5);
    v7 = (_TtC5Files16DOCCopyableLabel *)objc_msgSend((id)objc_opt_self(UIColor), "_doc_safeTintColor:", v6);

    v8.receiver = v4;
    v8.super_class = v3;
    -[DOCCopyableLabel setTextColor:](&v8, "setTextColor:", v7);

    v4 = v7;
  }

}

- (_TtC5Files16DOCCopyableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC5Files16DOCCopyableLabel *)sub_1001D3070(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files16DOCCopyableLabel)initWithCoder:(id)a3
{
  return (_TtC5Files16DOCCopyableLabel *)sub_1001D3198(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files16DOCCopyableLabel_textColorIfStaticText));
  swift_bridgeObjectRelease(*(_QWORD *)&self->supportsCopy[OBJC_IVAR____TtC5Files16DOCCopyableLabel_copyableText]);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files16DOCCopyableLabel_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files16DOCCopyableLabel____lazy_storage___tapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files16DOCCopyableLabel____lazy_storage___menuInteraction));
}

@end
