@implementation _PXStoryAnimationInfo

- (_PXStoryAnimationInfo)initWithAnimation:(id)a3 startTime:(id *)a4
{
  id v6;
  char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t var3;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PXStoryAnimationInfo;
  v7 = -[_PXStoryAnimationInfo init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v9;

    objc_storeWeak((id *)v7 + 2, v6);
    var3 = a4->var3;
    *(_OWORD *)(v7 + 24) = *(_OWORD *)&a4->var0;
    *((_QWORD *)v7 + 5) = var3;
  }

  return (_PXStoryAnimationInfo *)v7;
}

- (NSString)animationIdentifier
{
  return self->_animationIdentifier;
}

- (PXStoryAnimation)animation
{
  return (PXStoryAnimation *)objc_loadWeakRetained((id *)&self->_animation);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animation);
  objc_storeStrong((id *)&self->_animationIdentifier, 0);
}

@end
