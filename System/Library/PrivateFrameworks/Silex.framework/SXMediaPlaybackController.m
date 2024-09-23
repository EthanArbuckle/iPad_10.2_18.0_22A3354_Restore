@implementation SXMediaPlaybackController

- (id)initWithViewport:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SXMediaPlaybackController;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 2, a2);
      objc_msgSend(v4, "addViewportChangeListener:forOptions:", a1, 8);
    }
  }

  return a1;
}

- (void)registerMediaPlayBack:(uint64_t)a1
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  id obj;

  v3 = a2;
  if (a1)
  {
    obj = v3;
    v4 = (id *)(a1 + 8);
    WeakRetained = objc_loadWeakRetained(v4);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained(v4);

      if (v7 != obj)
      {
        v8 = objc_loadWeakRetained(v4);
        objc_msgSend(v8, "pauseMediaPlayback");

      }
    }
    objc_storeWeak(v4, obj);
    v3 = obj;
  }

}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  id v6;
  BOOL v7;
  id v8;

  v6 = a3;
  if (a4 != 3)
  {
    v8 = v6;
    v7 = objc_msgSend(v6, "appearState") == 3;
    v6 = v8;
    if (v7)
    {
      if (self)
        self = (SXMediaPlaybackController *)objc_loadWeakRetained((id *)&self->_mediaPlaybackDelegate);
      -[SXMediaPlaybackController pauseMediaPlaybackForDisappearance](self, "pauseMediaPlaybackForDisappearance");

      v6 = v8;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_destroyWeak((id *)&self->_mediaPlaybackDelegate);
}

@end
