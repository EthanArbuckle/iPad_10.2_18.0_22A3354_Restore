@implementation MusicSplitViewContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  MusicSplitViewContext *v5;

  v4 = a3;
  v5 = self;
  sub_45B388(v4);

}

- (MusicSplitViewContext)initWithCoder:(id)a3
{
  return (MusicSplitViewContext *)sub_45B4F0(a3);
}

- (MusicSplitViewContext)init
{
  MusicSplitViewContext *result;

  result = (MusicSplitViewContext *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SplitViewColumnContextWrapper", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
