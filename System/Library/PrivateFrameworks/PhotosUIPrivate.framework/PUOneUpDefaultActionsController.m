@implementation PUOneUpDefaultActionsController

- (PUOneUpActionsControllerDelegate)delegate
{
  sub_1AAC59AD0();
}

- (void)setDelegate:(id)a3
{
  PUOneUpDefaultActionsController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC59B28();

}

- (PUOneUpDefaultActionsControllerActionManagerSource)assetActionManagerSource
{
  sub_1AAC59BD8();
}

- (void)setAssetActionManagerSource:(id)a3
{
  PUOneUpDefaultActionsController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC59C30();

}

- (PUOneUpActionsControllerPopoverHelper)popoverHelper
{
  sub_1AAC59CDC();
}

- (void)setPopoverHelper:(id)a3
{
  PUOneUpDefaultActionsController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC59D68();

}

- (PUOneUpDefaultActionsController)initWithBrowsingSession:(id)a3 viewController:(id)a4
{
  PUOneUpDefaultActionsController *result;

  OneUpDefaultActionsController.init(browsingSession:viewController:)(a3, a4);
  return result;
}

- (void)performShareAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC59FC4((uint64_t)v2);

}

- (void)preheatShareAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5A2E8((uint64_t)v2);

}

- (void)performLikeActionWithLike:(BOOL)a3
{
  PUOneUpDefaultActionsController *v4;

  v4 = self;
  sub_1AAC5A4D0(a3);

}

- (void)performRestoreAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5A660((uint64_t)v2);

}

- (void)performMuteActionWithShouldMute:(BOOL)a3
{
  PUOneUpDefaultActionsController *v4;

  v4 = self;
  sub_1AAC5A910(a3);

}

- (void)performToggleFavoriteAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5A9AC((uint64_t)v2);

}

- (void)performSyndicationSaveAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5ACC4((uint64_t)v2);

}

- (void)togglePlayback
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5B07C();

}

- (void)toggleChromeVisibility
{
  self;
  sub_1AAC5B174();
}

- (void)toggleImmersiveMode
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5B1B4();

}

- (void)performPlayPauseActionWithDesiredState:(int64_t)a3
{
  PUOneUpDefaultActionsController *v4;

  v4 = self;
  sub_1AAC5B2AC(a3);

}

- (void)performToggleMuteAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5B724();

}

- (void)performToggleDetailsAction
{
  self;
  sub_1AAC5B7B8();
}

- (void)performZoomAt:(id)a3
{
  swift_unknownObjectRetain();
  self;
  sub_1AAC5B848();
}

- (void)performToggleCommentsActionAndBeginEditing:(BOOL)a3
{
  self;
  sub_1AAC5B8F8();
}

- (void)performShowInLibraryAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5BBB8();

}

- (void)performDoneEditingAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5C0A8();

}

- (void)performCancelEditingAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5C0F8();

}

- (void)performMergeDuplicatesAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5C23C((uint64_t)v2);

}

- (void)performQuickCropActionWithContext:(id)a3
{
  id v4;
  PUOneUpDefaultActionsController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC5C3D0((uint64_t)v4);

}

- (void)performEditPlaybackRateActionWithPlaybackRate:(float)a3
{
  PUOneUpDefaultActionsController *v4;

  v4 = self;
  sub_1AAC5C43C((uint64_t)v4, a3);

}

- (void)performEditAudioMixModeActionWithAudioMixMode:(id)a3
{
  id v4;
  PUOneUpDefaultActionsController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC5C698((uint64_t)v4);

}

- (void)performPendingEditsActionWithRequest:(id)a3
{
  id v4;
  PUOneUpDefaultActionsController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC5C934(v4);

}

- (void)performActionType:(unint64_t)a3 assetsByAssetCollection:(id)a4
{
  uint64_t v6;
  PUOneUpDefaultActionsController *v7;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEBC0430);
  v6 = sub_1AB08D3A8();
  v7 = self;
  sub_1AAC5CD00(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)performDuplicateActionWithAssetsByAssetCollection:(id)a3
{
  uint64_t v4;
  PUOneUpDefaultActionsController *v5;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEBC0430);
  v4 = sub_1AB08D3A8();
  v5 = self;
  sub_1AAC5CE20(v4);

  swift_bridgeObjectRelease();
}

- (void)performTrashAction
{
  self;
  sub_1AAC5D078();
}

- (BOOL)canPerformTrashAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5D220();
}

- (void)toggleSelectionMode
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5D2D4((uint64_t)v2);

}

- (BOOL)canPerformSimpleActionWithActionType:(unint64_t)a3
{
  PUOneUpDefaultActionsController *v4;

  v4 = self;
  LOBYTE(a3) = sub_1AAC5D4CC(a3);

  return a3 & 1;
}

- (BOOL)performSimpleActionWithActionType:(unint64_t)a3
{
  PUOneUpDefaultActionsController *v4;

  v4 = self;
  LOBYTE(a3) = sub_1AAC5D67C(a3);

  return a3 & 1;
}

- (BOOL)performSimpleActionWithActionType:(unint64_t)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  PUOneUpDefaultActionsController *v8;
  char v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1AAC607A8;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  v9 = sub_1AAC5D6C0(a3, (uint64_t)v6, v7);
  sub_1AAB88C0C((uint64_t)v6);

  return v9 & 1;
}

- (BOOL)presentViewController:(id)a3
{
  id v4;
  PUOneUpDefaultActionsController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1AAC5DA78();

  return self & 1;
}

- (void)jumpToNextAsset
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5DC70();

}

- (void)jumpToPreviousAsset
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5DCC8();

}

- (void)dismissOneUp
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5DEA8();

}

- (BOOL)shouldEnableSimpleActionWithActionType:(unint64_t)a3
{
  PUOneUpDefaultActionsController *v4;
  char v5;

  v4 = self;
  sub_1AAC5DF24(a3);
  LOBYTE(a3) = v5;

  return a3 & 1;
}

- (BOOL)shouldEnableToggleDetailsAction
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5E174();
}

- (void)internalToggleGainMapImage
{
  PUOneUpDefaultActionsController *v2;

  v2 = self;
  sub_1AAC5E204();

}

- (id)undoManagerForAssetActionPerformer:(id)a3
{
  id v4;
  PUOneUpDefaultActionsController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1AAC5E34C();
  v7 = v6;

  return v7;
}

- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  PUOneUpDefaultActionsController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_1AAC5E3F0((uint64_t)v8, (uint64_t)a4);

  return a4 & 1;
}

- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  PUOneUpDefaultActionsController *v11;

  v8 = _Block_copy(a5);
  if (v8)
    *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1AAC5E45C();
}

- (id)assetActionPerformerHostViewControllerForPresentingToast:(id)a3
{
  id v4;
  PUOneUpDefaultActionsController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC5E684();
}

- (double)assetActionPerformerBottomPaddingForPresentingToast:(id)a3
{
  id v4;
  PUOneUpDefaultActionsController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC5E734();
}

- (BOOL)prefersAssetInclusionAfterRemovalForActionPerformer:(id)a3
{
  id v4;
  PUOneUpDefaultActionsController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC5E7F4();
}

- (BOOL)executeActionPerformer:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  PUOneUpDefaultActionsController *v9;
  char v10;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1AAC272B4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  v10 = sub_1AAC5E8EC(v8, (uint64_t)v6, v7);
  sub_1AAB88C0C((uint64_t)v6);

  return v10 & 1;
}

- (PUOneUpDefaultActionsController)init
{
  OneUpDefaultActionsController.init()();
}

- (void).cxx_destruct
{
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUOneUpDefaultActionsController_delegate);
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUOneUpDefaultActionsController_assetActionManagerSource);
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUOneUpDefaultActionsController_popoverHelper);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUOneUpDefaultActionsController_activeActionPerformer);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUOneUpDefaultActionsController_activeAssetActionPerformer);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUOneUpDefaultActionsController_browsingSession);
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUOneUpDefaultActionsController_preheatedSharingPerformer);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)prepareForPopoverPresentation:(id)a3
{
  UIPopoverPresentationController *v4;
  PUOneUpDefaultActionsController *v5;

  v4 = (UIPopoverPresentationController *)a3;
  v5 = self;
  OneUpDefaultActionsController.prepareForPopoverPresentation(_:)(v4);

}

@end
