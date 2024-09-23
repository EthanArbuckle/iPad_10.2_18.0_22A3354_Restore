@implementation Coordinator

- (_TtC12PhotosUICore11Coordinator)init
{
  objc_class *ObjectType;
  id v4;
  _TtC12PhotosUICore11Coordinator *v5;
  objc_class *v6;
  _TtC12PhotosUICore11Coordinator *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = objc_allocWithZone((Class)PXCMMWorkflowCoordinator);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_init);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC12PhotosUICore11Coordinator_workflowCoordinator) = v6;

  v9.receiver = v5;
  v9.super_class = ObjectType;
  v7 = -[Coordinator init](&v9, sel_init);
  objc_msgSend(*(id *)((char *)&v7->super.isa + OBJC_IVAR____TtC12PhotosUICore11Coordinator_workflowCoordinator), sel_setDelegate_, v7);
  return v7;
}

- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6
{
  objc_msgSend(a4, sel_dismissViewControllerAnimated_completion_, 1, 0, a5, a6);
}

- (void).cxx_destruct
{

}

@end
