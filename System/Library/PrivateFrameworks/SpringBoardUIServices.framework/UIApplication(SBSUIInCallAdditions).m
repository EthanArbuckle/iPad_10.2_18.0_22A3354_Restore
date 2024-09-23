@implementation UIApplication(SBSUIInCallAdditions)

- (uint64_t)SBSUI_requestInCallSceneSessionDestruction:()SBSUIInCallAdditions withReason:completion:
{
  return objc_msgSend(a1, "SBSUI_requestInCallSceneSessionDestruction:withReason:analyticsSource:completion:", a3, a4, 0, a5);
}

- (void)SBSUI_requestInCallSceneSessionDestruction:()SBSUIInCallAdditions withReason:analyticsSource:completion:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  SBSUIInCallDestroySceneAction *v15;
  SBSUIInCallDestroySceneAction *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "scene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_FBSScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogInCallPresentation();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v9;
    _os_log_impl(&dword_1A471F000, v14, OS_LOG_TYPE_DEFAULT, "Client requested destruction of %{public}@", buf, 0xCu);
  }

  if (v13)
  {
    v15 = [SBSUIInCallDestroySceneAction alloc];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __120__UIApplication_SBSUIInCallAdditions__SBSUI_requestInCallSceneSessionDestruction_withReason_analyticsSource_completion___block_invoke;
    v21 = &unk_1E4C409B0;
    v22 = 0;
    v23 = v11;
    v16 = -[SBSUIInCallDestroySceneAction initWithDestructionReason:analyticsSource:timeout:withResponseHandler:](v15, "initWithDestructionReason:analyticsSource:timeout:withResponseHandler:", a4, v10, &v18, 5.0);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16, v18, v19, v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendActions:", v17);

LABEL_7:
    goto LABEL_8;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBSUIInCallErrorDomain"), -1002, 0);
    v16 = (SBSUIInCallDestroySceneAction *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, SBSUIInCallDestroySceneAction *))v11 + 2))(v11, v16);
    goto LABEL_7;
  }
LABEL_8:

}

@end
