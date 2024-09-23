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
  sub_10035AF18(v4);

}

- (MusicSplitViewContext)initWithCoder:(id)a3
{
  return (MusicSplitViewContext *)sub_10035B078(a3);
}

- (MusicSplitViewContext)init
{
  MusicSplitViewContext *result;

  result = (MusicSplitViewContext *)_swift_stdlib_reportUnimplementedInitializer("Music.SplitViewColumnContextWrapper", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
