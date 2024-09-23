@implementation PBFPosterEditingIngestionManager

- (PBFPosterEditingIngestionManagerDelegate)delegate
{
  return (PBFPosterEditingIngestionManagerDelegate *)sub_1CBB13E58((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PBFPosterEditingIngestionManager_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_1CBB13EB4();
}

- (id)ingestConfiguration:(id)a3 updatedConfiguredProperties:(id)a4 editingViewController:(id)a5 galleryViewController:(id)a6 showEditingConfirmation:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  PBFPosterEditingIngestionManager *v16;
  void *v17;
  void *v18;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = self;
  PosterEditingIngestionManager.ingestConfiguration(_:updatedConfiguredProperties:editingViewController:galleryViewController:showEditingConfirmation:)(v12, v13, v14, (uint64_t)a6, v7);
  v18 = v17;

  return v18;
}

- (PREditingSceneViewController)editingViewController
{
  return (PREditingSceneViewController *)sub_1CBB13E58((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PBFPosterEditingIngestionManager_editingViewController);
}

- (void)setEditingViewController:(id)a3
{
  sub_1CBB13EB4();
}

- (void)dismissViewController
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___PBFPosterEditingIngestionManager_editingConfirmationViewController);
  if (v2)
    objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (PBFPosterEditingIngestionManager)init
{
  return (PBFPosterEditingIngestionManager *)PosterEditingIngestionManager.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PBFPosterEditingIngestionManager_editingConfirmationViewController));

  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR___PBFPosterEditingIngestionManager_delegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
