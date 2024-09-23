@implementation _UILabelImpl

- (_UILabelImpl)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UILabelImpl_minimumScaleFactor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UILabelImpl();
  return -[_UILabelImpl init](&v3, sel_init);
}

- (double)minimumScaleFactor
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____UILabelImpl_minimumScaleFactor);
}

- (void)setMinimumScaleFactor:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____UILabelImpl_minimumScaleFactor) = a3;
}

@end
