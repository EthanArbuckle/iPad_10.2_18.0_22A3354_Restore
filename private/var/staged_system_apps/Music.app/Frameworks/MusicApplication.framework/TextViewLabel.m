@implementation TextViewLabel

- (_TtC16MusicApplication13TextViewLabel)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13TextViewLabel *)sub_55893C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13TextViewLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_55A46C();
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView));
}

- (CGSize)intrinsicContentSize
{
  _TtC16MusicApplication13TextViewLabel *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_558E44();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)sizeToFit
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView), "sizeToFit");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication13TextViewLabel *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_558F68(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView), "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView), "canBecomeFirstResponder");
}

- (NSString)accessibilityStringValue
{
  void *v2;
  _TtC16MusicApplication13TextViewLabel *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView);
  v3 = self;
  v4 = objc_msgSend(v2, "textStorage");
  v5 = objc_msgSend(v4, "string");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return (NSString *)v8;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->font[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_placeholderText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_placeholderTextColor));
  v3 = *(_QWORD *)&self->textColor[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
  v4 = *(_QWORD *)&self->lineBreakMode[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
  v5 = *(_QWORD *)&self->maximumNumberOfLines[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
  v6 = *(_QWORD *)&self->isEnabled[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate), *(_QWORD *)&self->font[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate]);
  sub_5C198(v3, v4);
  sub_5C198(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_baselinesLayoutGuide));
  sub_55A37C(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13TextViewLabel__text), *(id *)&self->font[OBJC_IVAR____TtC16MusicApplication13TextViewLabel__text], self->textColor[OBJC_IVAR____TtC16MusicApplication13TextViewLabel__text]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextViewLabel____lazy_storage___baselinesLayoutGuideFirst));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextViewLabel____lazy_storage___baselinesLayoutGuideLast));

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v7 = v6;
  if (v5 == 10 && v6 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease(0xE100000000000000);
    v8 = 0;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, 10, 0xE100000000000000, 0);
    swift_bridgeObjectRelease(v7);
    v8 = v9 ^ 1;
  }
  return v8 & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC16MusicApplication13TextViewLabel *v5;

  v4 = a3;
  v5 = self;
  sub_559B58(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  void (*v3)(_TtC16MusicApplication13TextViewLabel *);
  uint64_t v5;
  id v6;
  _TtC16MusicApplication13TextViewLabel *v7;

  v3 = *(void (**)(_TtC16MusicApplication13TextViewLabel *))&self->textColor[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
  if (v3)
  {
    v5 = *(_QWORD *)&self->lineBreakMode[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
    v6 = a3;
    v7 = self;
    sub_A9DEC((uint64_t)v3, v5);
    v3(v7);
    sub_5C198((uint64_t)v3, v5);

  }
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  void (*v6)(_TtC16MusicApplication13TextViewLabel *);
  uint64_t v8;
  id v9;
  id v10;
  _TtC16MusicApplication13TextViewLabel *v11;

  if (a5)
  {
    v6 = *(void (**)(_TtC16MusicApplication13TextViewLabel *))&self->maximumNumberOfLines[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
    if (v6)
    {
      v8 = *(_QWORD *)&self->isEnabled[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
      v9 = a3;
      v10 = a4;
      v11 = self;
      sub_A9DEC((uint64_t)v6, v8);
      v6(v11);
      sub_5C198((uint64_t)v6, v8);

    }
  }
}

@end
