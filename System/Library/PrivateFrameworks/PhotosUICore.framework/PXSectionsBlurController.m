@implementation PXSectionsBlurController

- (PXSectionsBlurController)initWithBlurrableSectionsSource:(id)a3
{
  objc_super v5;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXSectionsBlurController_behavior) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SectionsBlurController();
  return -[PXSectionsBlurController init](&v5, sel_init);
}

- (int64_t)behavior
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXSectionsBlurController_behavior);
  swift_beginAccess();
  return *v2;
}

- (void)setBehavior:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PXSectionsBlurController_behavior);
  swift_beginAccess();
  *v4 = a3;
}

- (void)updateSectionsBlurWithVisibleRect:(CGRect)a3 safeAreaInsets:(UIEdgeInsets)a4 interSectionSpacing:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  PXSectionsBlurController *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = self;
  sub_1A6F1CF98(x, y, width, height);

}

- (PXSectionsBlurController)init
{
  PXSectionsBlurController *result;

  result = (PXSectionsBlurController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self + OBJC_IVAR___PXSectionsBlurController_blurrableSectionsSource);
}

@end
