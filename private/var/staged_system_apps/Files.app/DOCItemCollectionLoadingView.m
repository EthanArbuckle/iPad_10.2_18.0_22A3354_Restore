@implementation DOCItemCollectionLoadingView

- (_TtC5Files28DOCItemCollectionLoadingView)initWithFrame:(CGRect)a3
{
  return (_TtC5Files28DOCItemCollectionLoadingView *)sub_100220E54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCItemCollectionLoadingView();
  v4 = a3;
  v5 = v7.receiver;
  -[DOCItemCollectionLoadingView effectiveAppearanceDidChange:](&v7, "effectiveAppearanceDidChange:", v4);
  v6 = objc_msgSend(v4, "backgroundColor", v7.receiver, v7.super_class);
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCItemCollectionLoadingView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCItemCollectionLoadingView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCItemCollectionLoadingView_activity));
}

@end
