@implementation FormatTooNewSynapseLinkView

- (_TtC8PaperKit27FormatTooNewSynapseLinkView)init
{
  return (_TtC8PaperKit27FormatTooNewSynapseLinkView *)FormatTooNewSynapseLinkView.init()();
}

- (_TtC8PaperKit27FormatTooNewSynapseLinkView)initWithCoder:(id)a3
{
  id v4;
  _TtC8PaperKit27FormatTooNewSynapseLinkView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit27FormatTooNewSynapseLinkView____lazy_storage___imageView) = 0;
  v4 = a3;

  result = (_TtC8PaperKit27FormatTooNewSynapseLinkView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FormatTooNewSynapseLinkView();
  v2 = v4.receiver;
  -[FormatTooNewSynapseLinkView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = FormatTooNewSynapseLinkView.imageView.getter();
  objc_msgSend(v2, sel_center, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setCenter_);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27FormatTooNewSynapseLinkView____lazy_storage___imageView));
}

@end
