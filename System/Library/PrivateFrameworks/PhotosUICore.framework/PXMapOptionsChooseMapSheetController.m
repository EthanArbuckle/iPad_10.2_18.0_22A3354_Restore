@implementation PXMapOptionsChooseMapSheetController

- (PXMapOptionsChooseMapViewDelegate)delegate
{
  uint64_t (*v2)(void);
  PXMapOptionsChooseMapSheetController *v3;
  void *v4;

  v2 = *(uint64_t (**)(void))((**(_QWORD **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController) & *MEMORY[0x1E0DEEDD8])
                           + 0xC8);
  v3 = self;
  v4 = (void *)v2();

  return (PXMapOptionsChooseMapViewDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  void (*v5)(id);
  PXMapOptionsChooseMapSheetController *v6;

  v5 = *(void (**)(id))((**(_QWORD **)((char *)&self->super.super.super.isa
                                                + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController) & *MEMORY[0x1E0DEEDD8])
                                 + 0xD0);
  swift_unknownObjectRetain();
  v6 = self;
  v5(a3);

}

- (unint64_t)mapStyle
{
  uint64_t (*v2)(void);
  PXMapOptionsChooseMapSheetController *v3;
  unint64_t v4;

  v2 = *(uint64_t (**)(void))((**(_QWORD **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController) & *MEMORY[0x1E0DEEDD8])
                           + 0xE0);
  v3 = self;
  v4 = v2();

  return v4;
}

- (void)setMapStyle:(unint64_t)a3
{
  void (*v4)(unint64_t);
  PXMapOptionsChooseMapSheetController *v5;

  v4 = *(void (**)(unint64_t))((**(_QWORD **)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController) & *MEMORY[0x1E0DEEDD8])
                                               + 0xE8);
  v5 = self;
  v4(a3);

}

- (PXMapOptionsChooseMapSheetController)init
{
  return (PXMapOptionsChooseMapSheetController *)sub_1A6C61030();
}

- (PXMapOptionsChooseMapSheetController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A6C61DB8();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapOptionsChooseMapSheetController();
  v2 = v3.receiver;
  -[PXMapOptionsChooseMapSheetController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1A6C612F0();
  sub_1A6C6143C();

}

- (void)handleCloseAction
{
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  PXMapOptionsChooseMapSheetController *v6;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x70);
  v6 = self;
  if (v2())
  {
    v4 = v3;
    ObjectType = swift_getObjectType();
    (*(void (**)(PXMapOptionsChooseMapSheetController *, uint64_t, uint64_t))(v4 + 8))(v6, ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (PXMapOptionsChooseMapSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PXMapOptionsChooseMapSheetController *result;

  v4 = a4;
  result = (PXMapOptionsChooseMapSheetController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PXMapOptionsChooseMapSheetController_blurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PXMapOptionsChooseMapSheetController_closeButton));
  sub_1A688D368((uint64_t)self + OBJC_IVAR___PXMapOptionsChooseMapSheetController_controllerDelegate);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, sel_horizontalSizeClass, a3) == (id)1)
    return -1;
  else
    return 2;
}

@end
