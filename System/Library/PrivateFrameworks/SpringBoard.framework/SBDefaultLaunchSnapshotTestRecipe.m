@implementation SBDefaultLaunchSnapshotTestRecipe

- (id)title
{
  return CFSTR("Regenerate Default Launch Images");
}

- (void)handleVolumeIncrease
{
  SBGenerateLaunchSnapshotsAlertItem *v3;
  SBAlertItem *v4;
  SBAlertItem *alertItem;
  _QWORD v6[5];

  if (!self->_alertItem)
  {
    v3 = [SBGenerateLaunchSnapshotsAlertItem alloc];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__SBDefaultLaunchSnapshotTestRecipe_handleVolumeIncrease__block_invoke;
    v6[3] = &unk_1E8E9DED8;
    v6[4] = self;
    v4 = -[SBGenerateLaunchSnapshotsAlertItem initWithHandler:](v3, "initWithHandler:", v6);
    alertItem = self->_alertItem;
    self->_alertItem = v4;

    objc_msgSend(MEMORY[0x1E0DAC210], "activateAlertItem:", self->_alertItem);
  }
}

void __57__SBDefaultLaunchSnapshotTestRecipe_handleVolumeIncrease__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertItem, 0);
}

@end
