@implementation ISLivePhotoSettleBehavior

- (void)settle:(BOOL)a3
{
  double v3;
  _BOOL4 v4;
  void *v6;
  ISPlayerOutputTransitionOptions *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  LODWORD(v3) = 0;
  -[ISBehavior setVideoPlayRate:](self, "setVideoPlayRate:", v3);
  +[ISPlayerState outputInfoWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:](ISPlayerState, "outputInfoWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("SETTLE"), 0.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = objc_alloc_init(ISPlayerOutputTransitionOptions);
    -[ISPlayerOutputTransitionOptions setTransitionDuration:](v7, "setTransitionDuration:", 0.3);
  }
  else
  {
    v7 = 0;
  }
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__ISLivePhotoSettleBehavior_settle___block_invoke;
  v8[3] = &unk_1E9453830;
  objc_copyWeak(&v9, &location);
  -[ISBehavior setOutputInfo:withTransitionOptions:completion:](self, "setOutputInfo:withTransitionOptions:completion:", v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_didFinish
{
  id v3;

  -[ISBehavior delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "livePhotoSettleBehaviorDidFinish:", self);

}

- (int64_t)behaviorType
{
  return 4;
}

void __36__ISLivePhotoSettleBehavior_settle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didFinish");

}

@end
