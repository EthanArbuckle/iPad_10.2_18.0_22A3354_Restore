@implementation TVDisplayPreferencesOptionCell

- (_TtC9SeymourUI30TVDisplayPreferencesOptionCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI30TVDisplayPreferencesOptionCell *)sub_22B2A3BB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI30TVDisplayPreferencesOptionCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B2A44D4();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI30TVDisplayPreferencesOptionCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B2A426C(v6, (uint64_t)v7);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVDisplayPreferencesOptionCell_checkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVDisplayPreferencesOptionCell_label));
}

@end
