@implementation SHSheetRemoteSceneUpdateHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  objc_msgSend(a4, "transitionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationFence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && !-[SHSheetRemoteSceneUpdateHostComponent didPerformInitialFenceUpdate](self, "didPerformInitialFenceUpdate"))
  {
    -[SHSheetRemoteSceneUpdateHostComponent setDidPerformInitialFenceUpdate:](self, "setDidPerformInitialFenceUpdate:", 1);
    v9 = (void *)MEMORY[0x1E0CD28B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__SHSheetRemoteSceneUpdateHostComponent_scene_willUpdateSettings___block_invoke;
    v10[3] = &unk_1E4001608;
    v11 = v6;
    objc_msgSend(v9, "addCommitHandler:forPhase:", v10, 5);

  }
}

void __66__SHSheetRemoteSceneUpdateHostComponent_scene_willUpdateSettings___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SHSheetRemoteSceneUpdateHostComponent_scene_willUpdateSettings___block_invoke_2;
  block[3] = &unk_1E4001608;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__SHSheetRemoteSceneUpdateHostComponent_scene_willUpdateSettings___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_readyToInteract");

}

- (BOOL)didPerformInitialFenceUpdate
{
  return *(&self->super._invalid + 1);
}

- (void)setDidPerformInitialFenceUpdate:(BOOL)a3
{
  *(&self->super._invalid + 1) = a3;
}

@end
