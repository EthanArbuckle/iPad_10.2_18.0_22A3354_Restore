@implementation BSUINavigationContext

- (BSUINavigationContext)initWithIsInCard:(BOOL)a3 isInModal:(BOOL)a4
{
  objc_super v5;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___BSUINavigationContext_isInCard) = a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BSUINavigationContext_isInModal) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NavigationContext();
  return -[BSUINavigationContext init](&v5, "init");
}

- (BSUINavigationContext)init
{
  BSUINavigationContext *result;

  result = (BSUINavigationContext *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.NavigationContext", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
