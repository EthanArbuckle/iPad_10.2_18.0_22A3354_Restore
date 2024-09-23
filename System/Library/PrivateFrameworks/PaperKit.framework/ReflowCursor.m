@implementation ReflowCursor

- (_TtC8PaperKit12ReflowCursor)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8PaperKit12ReflowCursor *v7;
  void *v8;
  _TtC8PaperKit12ReflowCursor *v9;
  id v10;
  id v11;
  objc_super v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ReflowCursor();
  v7 = -[ReflowCursor initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_tintColor);
  -[ReflowCursor setBackgroundColor:](v9, sel_setBackgroundColor_, v10);

  v11 = -[ReflowCursor layer](v9, sel_layer);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  objc_msgSend(v11, sel_setCornerRadius_, CGRectGetWidth(v14) * 0.5);

  return v9;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ReflowCursor();
  -[ReflowCursor frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  id v8;
  objc_super v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ReflowCursor();
  v7 = v9.receiver;
  -[ReflowCursor setFrame:](&v9, sel_setFrame_, x, y, width, height);
  v8 = objc_msgSend(v7, sel_layer, v9.receiver, v9.super_class);
  objc_msgSend(v7, sel_frame);
  objc_msgSend(v8, sel_setCornerRadius_, CGRectGetWidth(v10) * 0.5);

}

- (_TtC8PaperKit12ReflowCursor)initWithCoder:(id)a3
{
  _TtC8PaperKit12ReflowCursor *result;

  result = (_TtC8PaperKit12ReflowCursor *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end
