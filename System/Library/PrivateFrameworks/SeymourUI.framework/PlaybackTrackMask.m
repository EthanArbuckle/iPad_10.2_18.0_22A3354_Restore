@implementation PlaybackTrackMask

- (_TtC9SeymourUI17PlaybackTrackMask)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC9SeymourUI17PlaybackTrackMask *v7;
  void *v8;
  _TtC9SeymourUI17PlaybackTrackMask *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PlaybackTrackMask();
  v7 = -[PlaybackTrackMask initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_blackColor);
  -[PlaybackTrackMask setBackgroundColor:](v9, sel_setBackgroundColor_, v10);

  return v9;
}

- (_TtC9SeymourUI17PlaybackTrackMask)initWithCoder:(id)a3
{
  _TtC9SeymourUI17PlaybackTrackMask *result;

  result = (_TtC9SeymourUI17PlaybackTrackMask *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaybackTrackMask();
  v2 = v4.receiver;
  -[PlaybackTrackMask layoutSubviews](&v4, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);

}

@end
