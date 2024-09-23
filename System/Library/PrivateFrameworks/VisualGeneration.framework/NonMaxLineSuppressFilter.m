@implementation NonMaxLineSuppressFilter

- (CIImage)outputImage
{
  _TtC16VisualGeneration24NonMaxLineSuppressFilter *v2;
  id v3;

  v2 = self;
  v3 = sub_249E5B7D4();

  return (CIImage *)v3;
}

- (_TtC16VisualGeneration24NonMaxLineSuppressFilter)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_inputImage) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_threshold) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NonMaxLineSuppressFilter();
  return -[NonMaxLineSuppressFilter init](&v3, sel_init);
}

- (_TtC16VisualGeneration24NonMaxLineSuppressFilter)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_inputImage) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_threshold) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NonMaxLineSuppressFilter();
  return -[NonMaxLineSuppressFilter initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_inputImage));
}

@end
