@implementation TVUpNextQueueButtonContentView

- (_TtC9SeymourUI30TVUpNextQueueButtonContentView)init
{
  return (_TtC9SeymourUI30TVUpNextQueueButtonContentView *)sub_22B456AAC();
}

- (_TtC9SeymourUI30TVUpNextQueueButtonContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B457544();
}

- (_TtC9SeymourUI30TVUpNextQueueButtonContentView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI30TVUpNextQueueButtonContentView *result;

  result = (_TtC9SeymourUI30TVUpNextQueueButtonContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_layout);
  v4 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_layout);
  v5 = *(UIViewAnimationInfo **)((char *)&self->super._animationInfo
                               + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_layout);
  objc_release(*(id *)((char *)&self->super._swiftAnimationInfo
                     + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_layout));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_stackView));
}

@end
