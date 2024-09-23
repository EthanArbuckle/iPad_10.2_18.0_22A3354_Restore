@implementation TextViewWithPlaceHolder

- (UIFont)font
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  return -[TextViewWithPlaceHolder font](&v3, "font");
}

- (void)setFont:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  v4 = a3;
  v5 = v8.receiver;
  -[TextViewWithPlaceHolder setFont:](&v8, "setFont:", v4);
  v6 = sub_100190DF0();
  v7 = objc_msgSend(v5, "font", v8.receiver, v8.super_class);
  objc_msgSend(v6, "setFont:", v7);

}

- (int64_t)textAlignment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  return -[TextViewWithPlaceHolder textAlignment](&v3, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  v4 = v6.receiver;
  -[TextViewWithPlaceHolder setTextAlignment:](&v6, "setTextAlignment:", a3);
  v5 = sub_100190DF0();
  objc_msgSend(v5, "setTextAlignment:", objc_msgSend(v4, "textAlignment", v6.receiver, v6.super_class));

}

- (UIEdgeInsets)textContainerInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  -[TextViewWithPlaceHolder textContainerInset](&v6, "textContainerInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setTextContainerInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v7;
  id v8;
  objc_super v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  v8 = sub_100190DF0();
  objc_msgSend(v8, "setTextContainerInset:", top, left, bottom, right);

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  -[TextViewWithPlaceHolder setTextContainerInset:](&v9, "setTextContainerInset:", top, left, bottom, right);

}

- (NSString)text
{
  id v2;
  NSString *v3;
  NSString *v4;
  NSString v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  v2 = v7.receiver;
  v3 = -[TextViewWithPlaceHolder text](&v7, "text");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);

    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {

    return (NSString *)0;
  }
}

- (void)setText:(id)a3
{
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v4;
  NSString v5;
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v6;
  objc_super v7;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v4 = self;
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  -[TextViewWithPlaceHolder setText:](&v7, "setText:", v5);

  sub_100190E50();
}

- (_TtC17SequoiaTranslator23TextViewWithPlaceHolder)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  return (_TtC17SequoiaTranslator23TextViewWithPlaceHolder *)sub_100191614(a4, x, y, width, height);
}

- (_TtC17SequoiaTranslator23TextViewWithPlaceHolder)initWithCoder:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v5;
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *result;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator23TextViewWithPlaceHolder____lazy_storage___placeholder) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC17SequoiaTranslator23TextViewWithPlaceHolder_adjustsFontSize) = 0;
  *(int64x2_t *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC17SequoiaTranslator23TextViewWithPlaceHolder_minSourceTextSize) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  v4 = a3;
  v5 = -[TranslateCalloutDisabledTextView initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
  {

    result = (_TtC17SequoiaTranslator23TextViewWithPlaceHolder *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/TextViewWithPlaceholder.swift", 47, 2, 107, 0);
    __break(1u);
  }
  else
  {

    return 0;
  }
  return result;
}

- (void)textDidUpdate
{
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v2;

  v2 = self;
  sub_100190E50();

}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v7;
  NSString v8;
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v9;
  objc_super v10;

  length = a4.length;
  location = a4.location;
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = self;
    v8 = String._bridgeToObjectiveC()();
  }
  else
  {
    v9 = self;
    v8 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  -[TextViewWithPlaceHolder setMarkedText:selectedRange:](&v10, "setMarkedText:selectedRange:", v8, location, length);

  sub_100190E50();
  swift_bridgeObjectRelease();
}

- (void)paste:(id)a3
{
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v5;
  uint64_t v6;
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100191C88((uint64_t)v8);

  sub_1000110E8((uint64_t)v8);
}

- (id)_axPlaceholderTextView
{
  _TtC17SequoiaTranslator23TextViewWithPlaceHolder *v2;
  id v3;

  v2 = self;
  v3 = sub_100190DF0();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator23TextViewWithPlaceHolder____lazy_storage___placeholder));
}

@end
