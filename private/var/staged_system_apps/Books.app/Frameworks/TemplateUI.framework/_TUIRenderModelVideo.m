@implementation _TUIRenderModelVideo

- (_TUIRenderModelVideo)initWithUrl:(id)a3 posterFrameResource:(id)a4 videoId:(id)a5 loop:(BOOL)a6 muted:(BOOL)a7 allowFullScreen:(BOOL)a8 autoPlay:(BOOL)a9 showPlaybackControls:(BOOL)a10 gravity:(id)a11 cornerRadius:(double)a12 topTriggerName:(id)a13 bottomTriggerName:(id)a14 leftTriggerName:(id)a15 rightTriggerName:(id)a16 actionHandler:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _TUIRenderModelVideo *v28;
  _TUIRenderModelVideo *v29;
  id obj;
  id v32;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v37 = a3;
  obj = a4;
  v22 = a4;
  v32 = a5;
  v23 = a5;
  v24 = a11;
  v38 = a13;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v36 = a17;
  v39.receiver = self;
  v39.super_class = (Class)_TUIRenderModelVideo;
  v28 = -[_TUIRenderModelVideo init](&v39, "init");
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_url, a3);
    objc_storeStrong((id *)&v29->_posterFrameResource, obj);
    objc_storeStrong((id *)&v29->_videoId, v32);
    v29->_loop = a6;
    v29->_muted = a7;
    v29->_allowFullScreen = a8;
    v29->_autoPlay = a9;
    v29->_showPlaybackControls = a10;
    objc_storeStrong((id *)&v29->_gravity, a11);
    v29->_cornerRadius = a12;
    objc_storeStrong((id *)&v29->_topTriggerName, a13);
    objc_storeStrong((id *)&v29->_bottomTriggerName, a14);
    objc_storeStrong((id *)&v29->_leftTriggerName, a15);
    objc_storeStrong((id *)&v29->_rightTriggerName, a16);
    objc_storeStrong((id *)&v29->_actionHandler, a17);
  }

  return v29;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  TUIImageResource *posterFrameResource;
  void *v6;
  id v7;

  posterFrameResource = self->_posterFrameResource;
  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResource resource](posterFrameResource, "resource"));
  objc_msgSend(v7, "collectResource:", v6);

  objc_msgSend(v7, "collectImageResource:", self->_posterFrameResource);
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo url](self, "url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self, "videoId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "videoId"));
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo posterFrameResource](self, "posterFrameResource"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "posterFrameResource"));
      if (v9 == v10
        && (v11 = -[_TUIRenderModelVideo loop](self, "loop"), v11 == objc_msgSend(v4, "loop"))
        && (v12 = -[_TUIRenderModelVideo muted](self, "muted"), v12 == objc_msgSend(v4, "muted"))
        && (v13 = -[_TUIRenderModelVideo allowFullScreen](self, "allowFullScreen"),
            v13 == objc_msgSend(v4, "allowFullScreen"))
        && (v14 = -[_TUIRenderModelVideo autoPlay](self, "autoPlay"), v14 == objc_msgSend(v4, "autoPlay"))
        && (v15 = -[_TUIRenderModelVideo showPlaybackControls](self, "showPlaybackControls"),
            v15 == objc_msgSend(v4, "showPlaybackControls")))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo gravity](self, "gravity"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gravity"));
        if (v18 == v19
          && (-[_TUIRenderModelVideo cornerRadius](self, "cornerRadius"),
              v21 = v20,
              objc_msgSend(v4, "cornerRadius"),
              v21 == v22))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo actionHandler](self, "actionHandler"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionHandler"));
          v16 = v24 == v23;

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TUIRenderModelVideo url: %@, posterFrameResource: %@, videoId: %@, loop: %i, muted: %i, allowsFullscreen: %i, showPlaybackControls: %i, autoPlay: %i, gravity: %@, cornerRadius: %f>"), self->_url, self->_posterFrameResource, self->_videoId, self->_loop, self->_muted, self->_allowFullScreen, self->_showPlaybackControls, self->_autoPlay, self->_gravity, *(_QWORD *)&self->_cornerRadius);
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)kind
{
  return self->_kind;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (NSURL)url
{
  return self->_url;
}

- (TUIImageResource)posterFrameResource
{
  return self->_posterFrameResource;
}

- (NSString)videoId
{
  return self->_videoId;
}

- (NSString)topTriggerName
{
  return self->_topTriggerName;
}

- (NSString)bottomTriggerName
{
  return self->_bottomTriggerName;
}

- (NSString)leftTriggerName
{
  return self->_leftTriggerName;
}

- (NSString)rightTriggerName
{
  return self->_rightTriggerName;
}

- (BOOL)loop
{
  return self->_loop;
}

- (BOOL)muted
{
  return self->_muted;
}

- (BOOL)allowFullScreen
{
  return self->_allowFullScreen;
}

- (BOOL)autoPlay
{
  return self->_autoPlay;
}

- (BOOL)showPlaybackControls
{
  return self->_showPlaybackControls;
}

- (NSString)gravity
{
  return self->_gravity;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_rightTriggerName, 0);
  objc_storeStrong((id *)&self->_leftTriggerName, 0);
  objc_storeStrong((id *)&self->_bottomTriggerName, 0);
  objc_storeStrong((id *)&self->_topTriggerName, 0);
  objc_storeStrong((id *)&self->_videoId, 0);
  objc_storeStrong((id *)&self->_posterFrameResource, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
}

@end
