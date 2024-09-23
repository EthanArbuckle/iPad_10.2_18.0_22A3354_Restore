@implementation RootWindowDisplayBlanker.SSKRootBlankingWindow

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithDisplay:(id)a3
{
  return (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow *)sub_246000B64(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithDisplay_);
}

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithScreen:(id)a3
{
  return (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow *)sub_246000B64(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithScreen_);
}

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow();
  return -[RootWindowDisplayBlanker.SSKRootBlankingWindow initWithWindowScene:](&v5, sel_initWithWindowScene_, a3);
}

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow();
  return -[RootWindowDisplayBlanker.SSKRootBlankingWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithCoder:(id)a3
{
  return (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow *)sub_246000B64(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end
