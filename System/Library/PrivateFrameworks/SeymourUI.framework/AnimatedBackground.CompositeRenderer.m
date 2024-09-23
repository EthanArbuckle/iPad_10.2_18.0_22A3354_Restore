@implementation AnimatedBackground.CompositeRenderer

- (_TtCV9SeymourUI18AnimatedBackground17CompositeRenderer)init
{
  _TtCV9SeymourUI18AnimatedBackground17CompositeRenderer *result;

  result = (_TtCV9SeymourUI18AnimatedBackground17CompositeRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_observer);
  swift_release();
  v3 = *(void **)&self->spectrumAnalysis[OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_context];
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_crossfadeTimingFunction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_modeTimingFunction));
  swift_release();
  swift_release();
  swift_release();
  sub_22B649074(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_currentContent), self->observer[OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_currentContent]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_imageStorage));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9SeymourUI18AnimatedBackground17CompositeRenderer_placeholderColor));
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  double v9;
  double v10;
  _TtCV9SeymourUI18AnimatedBackground17CompositeRenderer *v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v11 = self;
  v8 = objc_msgSend(v7, sel_traitCollection);
  objc_msgSend(v8, sel_displayScale);
  v10 = v9;

  sub_22B648634(width, height, v10);
}

- (void)drawInMTKView:(id)a3
{
  id v4;
  _TtCV9SeymourUI18AnimatedBackground17CompositeRenderer *v5;

  v4 = a3;
  v5 = self;
  sub_22B6487D0(v4);

}

@end
