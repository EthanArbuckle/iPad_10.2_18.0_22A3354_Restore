@implementation HighlightView.View

- (void)layoutSubviews
{
  _TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View *v2;

  v2 = self;
  sub_1AAB884A0();

}

- (id)contextMenuItemsForAttributionView:(id)a3
{
  id v4;
  _TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1AAB8854C(v4);

  sub_1AAB74D50(0, (unint64_t *)&unk_1EEBBB758);
  v6 = (void *)sub_1AB08D5B8();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View)initWithFrame:(CGRect)a3
{
  return (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View *)sub_1AAB8887C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View)initWithCoder:(id)a3
{
  return (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View *)sub_1AAB88928(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View_highlight));
  sub_1AAB88C0C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View_menuActionsProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View_highlightView));
}

@end
