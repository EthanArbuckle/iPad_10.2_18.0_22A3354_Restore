@implementation PlaceholderTextView

- (NSString)text
{
  id v2;
  NSString *v3;
  NSString *v4;
  NSString v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PlaceholderTextView();
  v2 = v7.receiver;
  v3 = -[PlaceholderTextView text](&v7, "text");
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC17SequoiaTranslator19PlaceholderTextView *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  PlaceholderTextView.text.setter(v4, v6);

}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)sub_1001413D8(self, (uint64_t)a2, (SEL *)&selRef_attributedText);
}

- (void)setAttributedText:(id)a3
{
  _TtC17SequoiaTranslator19PlaceholderTextView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10014290C((uint64_t)a3);

}

- (UIColor)textColor
{
  return (UIColor *)sub_1001413D8(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (void)setTextColor:(id)a3
{
  sub_100141470(self, (uint64_t)a2, a3, (const char **)&selRef_setTextColor_);
}

- (UIFont)font
{
  return (UIFont *)sub_1001413D8(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (void)setFont:(id)a3
{
  sub_100141470(self, (uint64_t)a2, a3, (const char **)&selRef_setFont_);
}

- (int64_t)textAlignment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceholderTextView();
  return -[PlaceholderTextView textAlignment](&v3, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlaceholderTextView();
  v4 = v5.receiver;
  -[PlaceholderTextView setTextAlignment:](&v5, "setTextAlignment:", a3);
  PlaceholderTextView.updatePlaceholderProperties()();

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
  v6.super_class = (Class)type metadata accessor for PlaceholderTextView();
  -[PlaceholderTextView textContainerInset](&v6, "textContainerInset");
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
  id v7;
  objc_super v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PlaceholderTextView();
  v7 = v8.receiver;
  -[PlaceholderTextView setTextContainerInset:](&v8, "setTextContainerInset:", top, left, bottom, right);
  PlaceholderTextView.updatePlaceholderProperties()();

}

- (CGSize)intrinsicContentSize
{
  _TtC17SequoiaTranslator19PlaceholderTextView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  PlaceholderTextView.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  _TtC17SequoiaTranslator19PlaceholderTextView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = self;
  PlaceholderTextView.alignmentRectInsets.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIView)viewForFirstBaselineLayout
{
  _TtC17SequoiaTranslator19PlaceholderTextView *v2;
  id Baseline;

  v2 = self;
  Baseline = PlaceholderTextView.forFirstBaselineLayout.getter();

  return (UIView *)Baseline;
}

- (UIView)viewForLastBaselineLayout
{
  _TtC17SequoiaTranslator19PlaceholderTextView *v2;
  id Baseline;

  v2 = self;
  Baseline = PlaceholderTextView.forLastBaselineLayout.getter();

  return (UIView *)Baseline;
}

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  _TtC17SequoiaTranslator19PlaceholderTextView *v2;
  id v3;

  v2 = self;
  v3 = PlaceholderTextView.firstBaselineAnchor.getter();

  return (NSLayoutYAxisAnchor *)v3;
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  _TtC17SequoiaTranslator19PlaceholderTextView *v2;
  id v3;

  v2 = self;
  v3 = PlaceholderTextView.lastBaselineAnchor.getter();

  return (NSLayoutYAxisAnchor *)v3;
}

- (_TtC17SequoiaTranslator19PlaceholderTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
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
  return (_TtC17SequoiaTranslator19PlaceholderTextView *)PlaceholderTextView.init(frame:textContainer:)(a4, x, y, width, height);
}

- (_TtC17SequoiaTranslator19PlaceholderTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s17SequoiaTranslator19PlaceholderTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  void *v3;
  _TtC17SequoiaTranslator19PlaceholderTextView *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", v4, UITextViewTextDidChangeNotification, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PlaceholderTextView();
  -[PlaceholderTextView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19PlaceholderTextView_placeholderTextView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.highlightDelegate[OBJC_IVAR____TtC17SequoiaTranslator19PlaceholderTextView_placeholder]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19PlaceholderTextView_placeholderColor));
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaceholderTextView();
  v2 = (char *)v4.receiver;
  -[PlaceholderTextView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC17SequoiaTranslator19PlaceholderTextView_placeholderTextView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC17SequoiaTranslator19PlaceholderTextView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  PlaceholderTextView.sizeThatFits(_:)(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  _TtC17SequoiaTranslator19PlaceholderTextView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  PlaceholderTextView.systemLayoutSizeFitting(_:)(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC17SequoiaTranslator19PlaceholderTextView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  PlaceholderTextView.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)(width, height, a4, a5);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC17SequoiaTranslator19PlaceholderTextView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  PlaceholderTextView._systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)(width, height, a4, a5);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGRect)alignmentRectForFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1001425B8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (double (*)(double, double, double, double))PlaceholderTextView.alignmentRect(forFrame:));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)frameForAlignmentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1001425B8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (double (*)(double, double, double, double))PlaceholderTextView.frame(forAlignmentRect:));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  Swift::Int length;
  Swift::Int location;
  uint64_t v7;
  void *v8;
  void *v9;
  _TtC17SequoiaTranslator19PlaceholderTextView *v10;
  Swift::String_optional v11;
  __C::_NSRange v12;

  length = a4.length;
  location = a4.location;
  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = self;
  v11.value._countAndFlagsBits = v7;
  v11.value._object = v9;
  v12.location = location;
  v12.length = length;
  PlaceholderTextView.setMarkedText(_:selectedRange:)(v11, v12);

  swift_bridgeObjectRelease();
}

- (void)textChangedWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC17SequoiaTranslator19PlaceholderTextView *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  PlaceholderTextView.textChanged(notification:)();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (id)_axPlaceholderTextView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC17SequoiaTranslator19PlaceholderTextView_placeholderTextView));
}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator19PlaceholderTextView *v5;

  v4 = a3;
  v5 = self;
  PlaceholderTextView.suppressPlaceholder.setter(1);

}

- (void)scribbleInteractionDidFinishWriting:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator19PlaceholderTextView *v5;

  v4 = a3;
  v5 = self;
  PlaceholderTextView.suppressPlaceholder.setter(0);

}

@end
