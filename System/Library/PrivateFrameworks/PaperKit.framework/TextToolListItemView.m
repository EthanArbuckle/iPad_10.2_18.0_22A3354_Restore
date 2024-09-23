@implementation TextToolListItemView

- (_TtC8PaperKit20TextToolListItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized TextToolListItemView.init(coder:)();
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[TextToolListItemView isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC8PaperKit20TextToolListItemView *v6;
  id v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = self;
  -[TextToolListItemView setHighlighted:](&v9, sel_setHighlighted_, v3);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (-[TextToolListItemView isHighlighted](&v8, sel_isHighlighted))
    v7 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemFillColor);
  else
    v7 = 0;
  -[TextToolListItemView setBackgroundColor:](v6, sel_setBackgroundColor_, v7);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtC8PaperKit20TextToolListItemView *v12;
  void *v13;

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIPointerRegion);
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  -[TextToolListItemView bounds](v12, sel_bounds);
  v13 = (void *)UIPointerRegion.init(rect:identifier:)();

  return v13;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC8PaperKit20TextToolListItemView *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)specialized TextToolListItemView.pointerInteraction(_:styleFor:)();

  return v9;
}

- (_TtC8PaperKit20TextToolListItemView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit20TextToolListItemView *result;

  result = (_TtC8PaperKit20TextToolListItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_contentButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_titleLabelTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_imageViewTintColor));
}

@end
