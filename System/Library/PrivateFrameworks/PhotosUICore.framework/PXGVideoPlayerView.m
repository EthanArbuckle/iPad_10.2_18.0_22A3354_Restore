@implementation PXGVideoPlayerView

- (PXGVideoPlayerView)init
{
  PXGVideoPlayerView *v2;
  PXVideoSessionUIView *v3;
  uint64_t v4;
  PXVideoSessionUIView *videoSessionView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGVideoPlayerView;
  v2 = -[PXGVideoPlayerView init](&v8, sel_init);
  if (v2)
  {
    v3 = [PXVideoSessionUIView alloc];
    -[PXGVideoPlayerView bounds](v2, "bounds");
    v4 = -[PXVideoSessionUIView initWithFrame:](v3, "initWithFrame:");
    videoSessionView = v2->_videoSessionView;
    v2->_videoSessionView = (PXVideoSessionUIView *)v4;

    -[PXVideoSessionUIView setAutoresizingMask:](v2->_videoSessionView, "setAutoresizingMask:", 18);
    -[PXGVideoPlayerView addSubview:](v2, "addSubview:", v2->_videoSessionView);
    -[PXGVideoPlayerView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGVideoPlayerView setBackgroundColor:](v2, "setBackgroundColor:", v6);

  }
  return v2;
}

- (void)becomeReusable
{
  -[PXGVideoPlayerView setVideoSession:](self, "setVideoSession:", 0);
}

- (void)setUserData:(id)a3
{
  NSCopying *v6;
  void *v7;
  NSCopying *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSCopying *v16;

  v16 = (NSCopying *)a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCopying px_descriptionForAssertionMessage](v16, "px_descriptionForAssertionMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGVideoPlayerView.m"), 43, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("userData"), v14, v15);

    }
  }

  v6 = self->_userData;
  v7 = v16;
  if (v6 == v16)
    goto LABEL_7;
  v8 = v6;
  v9 = -[NSCopying isEqual:](v6, "isEqual:", v16);

  if ((v9 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userData, a3);
    -[NSCopying videoSession](v16, "videoSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGVideoPlayerView setVideoSession:](self, "setVideoSession:", v10);

    v11 = -[NSCopying toneMapToStandardDynamicRange](v16, "toneMapToStandardDynamicRange");
    -[PXGVideoPlayerView videoSessionView](self, "videoSessionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToneMapToStandardDynamicRange:", v11);
LABEL_7:

  }
}

- (void)setVideoSession:(id)a3
{
  PXVideoSession *v5;
  void *v6;
  PXVideoSession *v7;
  char v8;
  PXVideoSession *v9;

  v9 = (PXVideoSession *)a3;
  v5 = self->_videoSession;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = v5;
  v8 = -[PXVideoSession isEqual:](v5, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_videoSession, a3);
    -[PXGVideoPlayerView videoSessionView](self, "videoSessionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVideoSession:", v9);
LABEL_4:

  }
}

- (NSCopying)userData
{
  return self->_userData;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (PXVideoSessionUIView)videoSessionView
{
  return self->_videoSessionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSessionView, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
