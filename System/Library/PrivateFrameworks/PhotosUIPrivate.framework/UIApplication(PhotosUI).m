@implementation UIApplication(PhotosUI)

+ (void)pu_prepareCPAnalytics
{
  if (pu_prepareCPAnalytics_onceToken != -1)
    dispatch_once(&pu_prepareCPAnalytics_onceToken, &__block_literal_global_105266);
}

- (id)ppt_testDefinitions
{
  if (ppt_testDefinitions_onceToken != -1)
    dispatch_once(&ppt_testDefinitions_onceToken, &__block_literal_global_131);
  return (id)ppt_testDefinitions_testDefinitions;
}

- (void)pu_startedAnimationSubTest:()PhotosUI forTest:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("-Latency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startedSubTest:forTest:withMetrics:", v8, v7, &unk_1E59BAB40);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__UIApplication_PhotosUI__pu_startedAnimationSubTest_forTest___block_invoke;
  v11[3] = &unk_1E58AB790;
  v11[4] = a1;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(a1, "installCACommitCompletionBlock:", v11);

}

- (void)pu_finishedAnimationSubTest:()PhotosUI forTest:
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "finishedSubTest:forTest:", CFSTR("Animation"), v6);
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("-Animation"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "finishedSubTest:forTest:", v8, v6);
}

@end
