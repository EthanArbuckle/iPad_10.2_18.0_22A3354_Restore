@implementation ISLivePhotoSeekBehavior

- (ISLivePhotoSeekBehavior)initWithInitialLayoutInfo:(id)a3 seekTime:(id *)a4
{
  id v6;
  char *v7;
  ISLivePhotoSeekBehavior *v8;
  int64_t var3;
  double v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ISLivePhotoSeekBehavior;
  v7 = -[ISBehavior initWithInitialLayoutInfo:](&v12, sel_initWithInitialLayoutInfo_, v6);
  v8 = (ISLivePhotoSeekBehavior *)v7;
  if (v7)
  {
    var3 = a4->var3;
    *(_OWORD *)(v7 + 56) = *(_OWORD *)&a4->var0;
    *((_QWORD *)v7 + 9) = var3;
    objc_msgSend(v6, "videoAlpha");
    v8->_needsTransitionToVideo = v10 == 0.0;
    v8->_needsSeek = 1;
    v8->_signpostID = os_signpost_id_make_with_pointer(MEMORY[0x1E0C81028], v8);
  }

  return v8;
}

- (void)activeDidChange
{
  double v3;

  if (-[ISBehavior isActive](self, "isActive"))
  {
    LODWORD(v3) = 0;
    -[ISBehavior setVideoPlayRate:](self, "setVideoPlayRate:", v3);
    -[ISLivePhotoSeekBehavior _seekIfNeeded](self, "_seekIfNeeded");
  }
  else
  {
    -[ISLivePhotoSeekBehavior _callSeekCompletionHandler:](self, "_callSeekCompletionHandler:", 0);
  }
}

- (void)setSeekTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_seekTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 seekTime;
  CMTime time1;

  p_seekTime = &self->_seekTime;
  time1 = *(CMTime *)a3;
  seekTime = self->_seekTime;
  if (CMTimeCompare(&time1, (CMTime *)&seekTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_seekTime->epoch = a3->var3;
    *(_OWORD *)&p_seekTime->value = v6;
    self->_needsSeek = 1;
    -[ISLivePhotoSeekBehavior _seekIfNeeded](self, "_seekIfNeeded");
  }
  else
  {
    -[ISLivePhotoSeekBehavior _callSeekCompletionHandler:](self, "_callSeekCompletionHandler:", 1);
  }
}

- (void)_seekIfNeeded
{
  id v3;
  os_signpost_id_t signpostID;
  int64_t value;
  int timescale;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  int64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_isSeeking && self->_needsSeek)
  {
    v3 = MEMORY[0x1E0C81028];
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
    {
      value = self->_seekTime.value;
      timescale = self->_seekTime.timescale;
      *(_DWORD *)buf = 134218240;
      v10 = value;
      v11 = 1024;
      v12 = timescale;
      _os_signpost_emit_with_name_impl(&dword_1D2DCA000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "com.apple.photos.LivePhotoSeekBehavior", "Seeking to  (%lld/%d)", buf, 0x12u);
    }

    self->_isSeeking = 1;
    self->_needsSeek = 0;
    objc_initWeak((id *)buf, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke;
    v7[3] = &unk_1E9453F70;
    objc_copyWeak(&v8, (id *)buf);
    v7[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_callSeekCompletionHandler:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  v3 = a3;
  -[ISLivePhotoSeekBehavior seekCompletionHandler](self, "seekCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ISLivePhotoSeekBehavior seekCompletionHandler](self, "seekCompletionHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

    -[ISLivePhotoSeekBehavior setSeekCompletionHandler:](self, "setSeekCompletionHandler:", 0);
  }
}

- (void)_handleDidSeekToSeekTime:(BOOL)a3
{
  _BOOL4 v3;
  ISPlayerOutputTransitionOptions *v5;
  ISPlayerState *v6;

  v3 = a3;
  -[ISLivePhotoSeekBehavior _callSeekCompletionHandler:](self, "_callSeekCompletionHandler:");
  if (v3 && self->_needsTransitionToVideo)
  {
    self->_needsTransitionToVideo = 0;
    v5 = objc_alloc_init(ISPlayerOutputTransitionOptions);
    -[ISPlayerOutputTransitionOptions setTransitionDuration:](v5, "setTransitionDuration:", 0.3);
    v6 = -[ISPlayerState initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:]([ISPlayerState alloc], "initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("SEEK"), 0.0, 1.0, 0.0);
    -[ISBehavior setOutputInfo:withTransitionOptions:completion:](self, "setOutputInfo:withTransitionOptions:completion:", v6, v5, 0);

  }
  self->_isSeeking = 0;
  -[ISLivePhotoSeekBehavior _seekIfNeeded](self, "_seekIfNeeded");
}

- (int64_t)behaviorType
{
  return 5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (id)seekCompletionHandler
{
  return self->_seekCompletionHandler;
}

- (void)setSeekCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_seekCompletionHandler, 0);
}

void __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (__int128 *)(v4 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke_2;
  v9[3] = &unk_1E94537E0;
  v9[4] = v4;
  objc_copyWeak(&v10, v2);
  v6 = *v5;
  v8 = *((_QWORD *)v5 + 2);
  v7 = v6;
  LOBYTE(v2) = objc_msgSend(WeakRetained, "seekVideoPlayerToTime:completionHandler:", &v7, v9);

  if ((v2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  objc_destroyWeak(&v10);
}

void __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke_2(uint64_t a1, char a2)
{
  _QWORD block[5];
  id v3;
  char v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke_3;
  block[3] = &unk_1E9453758;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v3);
}

void __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  os_signpost_id_t v4;
  uint64_t v5;
  int v6;
  int v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C81028];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    v5 = *(_QWORD *)(v3 + 56);
    v6 = *(_DWORD *)(v3 + 64);
    v7 = *(unsigned __int8 *)(a1 + 48);
    v9 = 134218496;
    v10 = v5;
    v11 = 1024;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    _os_signpost_emit_with_name_impl(&dword_1D2DCA000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v4, "com.apple.photos.LivePhotoSeekBehavior", "Finished seeking (%lld/%d) [%d]", (uint8_t *)&v9, 0x18u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleDidSeekToSeekTime:", *(unsigned __int8 *)(a1 + 48));

}

@end
