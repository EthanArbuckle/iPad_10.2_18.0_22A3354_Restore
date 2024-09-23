@implementation InlineDrawingCanvasElementController

- (void)toolPickerFramesObscuredDidChange:(id)a3
{
  id v4;
  _TtC8PaperKit36InlineDrawingCanvasElementController *v5;

  v4 = a3;
  v5 = self;
  InlineDrawingCanvasElementController.updateToolPickerUI()();

}

- (BOOL)_supportsCanvasElements:(id)a3
{
  return 1;
}

- (_TtC8PaperKit36InlineDrawingCanvasElementController)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_toolPickerController) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[InlineDrawingCanvasElementController init](&v5, sel_init);
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_toolPickerController));
}

@end
