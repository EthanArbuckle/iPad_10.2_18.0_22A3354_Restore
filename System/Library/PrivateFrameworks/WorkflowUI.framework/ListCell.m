@implementation ListCell

- (void)layoutSubviews
{
  _TtC10WorkflowUI8ListCell *v2;

  v2 = self;
  sub_2201C6F80();

}

- (void)prepareForReuse
{
  _TtC10WorkflowUI8ListCell *v2;

  v2 = self;
  sub_2201C7070();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10WorkflowUI8ListCell *v8;
  uint64_t v9;

  v4 = sub_220305298();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220305280();
  v8 = self;
  sub_2201C713C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC10WorkflowUI8ListCell)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI8ListCell *)sub_2201C7B9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10WorkflowUI8ListCell)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUI8ListCell *)sub_2201C7C34(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI8ListCell_hostingView));
  swift_release();
}

@end
