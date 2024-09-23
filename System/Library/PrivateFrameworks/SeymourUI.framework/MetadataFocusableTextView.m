@implementation MetadataFocusableTextView

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_textView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI25MetadataFocusableTextView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25MetadataFocusableTextView *)sub_22B642034(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25MetadataFocusableTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B642E00();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI25MetadataFocusableTextView *v2;

  v2 = self;
  sub_22B642630();

}

- (void).cxx_destruct
{
  void *v3;

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_onEntryTapped));
  v3 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_layout);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_layout));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_textViewHeightConstraint));
}

@end
