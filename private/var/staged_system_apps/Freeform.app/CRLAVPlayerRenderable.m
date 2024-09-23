@implementation CRLAVPlayerRenderable

- (CRLAVPlayerRenderable)initWithAVPlayerLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLAVPlayerRenderable;
  return -[CRLCanvasRenderable initWithCALayer:](&v4, "initWithCALayer:", a3);
}

+ (id)renderableFromAVPlayerLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithAVPlayerLayer:", v4);

  return v5;
}

+ (id)renderable
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerLayer layer](AVPlayerLayer, "layer"));
  v4 = objc_msgSend(v2, "initWithAVPlayerLayer:", v3);

  return v4;
}

- (id)p_avPlayerLayer
{
  CALayer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLAVPlayerRenderable;
  v2 = -[CRLCanvasRenderable layer](&v4, "layer");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)addReadyToDisplayObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v8, CFSTR("readyForDisplay"), a4, a5);

}

- (void)removeReadyToDisplayObserver:(id)a3 context:(void *)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", v6, CFSTR("readyForDisplay"), a4);

}

@end
