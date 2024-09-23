@implementation OneUpMockActionsController

- (PUOneUpActionsControllerDelegate)delegate
{
  id v2;

  sub_1AAC25ECC();
  return (PUOneUpActionsControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAC25F24((uint64_t)a3);

}

- (void)toggleChromeVisibility
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC25F94();

}

- (BOOL)canPerformTrashAction
{
  char v2;

  sub_1AAC25FE4();
  return v2 & 1;
}

- (void)performTrashAction
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC260A8();

}

- (_TtC15PhotosUIPrivate26OneUpMockActionsController)init
{
  return (_TtC15PhotosUIPrivate26OneUpMockActionsController *)OneUpMockActionsController.init()();
}

- (PUOneUpActionsControllerPopoverHelper)popoverHelper
{
  id v2;

  sub_1AAC2625C();
  return (PUOneUpActionsControllerPopoverHelper *)v2;
}

- (void)setPopoverHelper:(id)a3
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAC262DC((uint64_t)a3);

}

- (void)dismissOneUp
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC2638C();

}

- (void)performShareAction
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC263E4();

}

- (void)performToggleFavoriteAction
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC26440();

}

- (void)performToggleDetailsAction
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC2649C();

}

- (void)performZoomAt:(id)a3
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC264EC();
  swift_unknownObjectRelease();

}

- (void)performToggleMuteAction
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC26580();

}

- (void)toggleImmersiveMode
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC265D0();

}

- (void)jumpToNextAsset
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC26620();

}

- (void)jumpToPreviousAsset
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v2;

  v2 = self;
  sub_1AAC26670();

}

- (BOOL)shouldEnableSimpleActionWithActionType:(unint64_t)a3
{
  return 1;
}

- (BOOL)canPerformSimpleActionWithActionType:(unint64_t)a3
{
  return 1;
}

- (void)performDuplicateActionWithAssetsByAssetCollection:(id)a3
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEBC0430);
  sub_1AB08D3A8();
  v4 = self;
  sub_1AAC266D0();

  swift_bridgeObjectRelease();
}

- (void)performActionType:(unint64_t)a3 assetsByAssetCollection:(id)a4
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEBC0430);
  sub_1AB08D3A8();
  v6 = self;
  sub_1AAC2674C(a3);

  swift_bridgeObjectRelease();
}

- (BOOL)performSimpleActionWithActionType:(unint64_t)a3
{
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v4;

  v4 = self;
  sub_1AAC26804(a3);

  return 1;
}

- (BOOL)performSimpleActionWithActionType:(unint64_t)a3 completionHandler:(id)a4
{
  void *v6;
  _TtC15PhotosUIPrivate26OneUpMockActionsController *v7;

  v6 = _Block_copy(a4);
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v6 = sub_1AAC272B4;
  }
  v7 = self;
  sub_1AAC26850(a3);
  sub_1AAB88C0C((uint64_t)v6);

  return 1;
}

- (BOOL)presentViewController:(id)a3
{
  return 1;
}

- (BOOL)shouldEnableToggleDetailsAction
{
  return 1;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
