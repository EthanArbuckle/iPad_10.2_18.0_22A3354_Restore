@implementation PreviewConfiguration.ContentView

- (_TtCC10WorkflowUI20PreviewConfiguration11ContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2201CE4EC();
}

- (void)textDidChange
{
  _TtCC10WorkflowUI20PreviewConfiguration11ContentView *v2;

  v2 = self;
  sub_2201CF20C();

}

- (BOOL)becomeFirstResponder
{
  _TtCC10WorkflowUI20PreviewConfiguration11ContentView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_2201CCDFC();

  return v3 & 1;
}

- (BOOL)resignFirstResponder
{
  _TtCC10WorkflowUI20PreviewConfiguration11ContentView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_2201CF368();

  return v3 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtCC10WorkflowUI20PreviewConfiguration11ContentView *v5;

  v4 = a3;
  v5 = self;
  sub_2201CF3C0(v4);

  return 0;
}

- (void)backgroundTapped
{
  _TtCC10WorkflowUI20PreviewConfiguration11ContentView *v2;

  v2 = self;
  sub_2201CF420();

}

- (_TtCC10WorkflowUI20PreviewConfiguration11ContentView)initWithFrame:(CGRect)a3
{
  sub_2201CF4A8();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCC10WorkflowUI20PreviewConfiguration11ContentView_configuration);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC10WorkflowUI20PreviewConfiguration11ContentView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC10WorkflowUI20PreviewConfiguration11ContentView_titleField));
}

@end
