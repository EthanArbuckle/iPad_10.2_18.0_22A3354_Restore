@implementation MTSetPlaybackQueueRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
}

+ (id)requestWithContext:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = objc_msgSend(v4, "copy");

  objc_msgSend(v5, "setContext:", v6);
  return v5;
}

- (BOOL)validate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSetPlaybackQueueRequest manifest](self, "manifest"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSetPlaybackQueueRequest context](self, "context"));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    objc_msgSend(v5, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/Support/MTPlayerController.m", 2709, CFSTR("Falling back to the default playback context."));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext defaultContext](MTPlaybackContext, "defaultContext"));
    -[MTSetPlaybackQueueRequest setContext:](self, "setContext:", v6);

  }
  return v3 != 0;
}

- (void)finishWithStatus:(int64_t)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSetPlaybackQueueRequest completion](self, "completion"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MTSetPlaybackQueueRequest completion](self, "completion"));
    v6[2](v6, a3);

    -[MTSetPlaybackQueueRequest setCompletion:](self, "setCompletion:", 0);
  }
  self->_finished = 1;
}

- (id)completion
{
  return self->_completion;
}

- (MTPlayerManifest)manifest
{
  return self->_manifest;
}

- (MTPlaybackContext)context
{
  return self->_context;
}

- (BOOL)startPlayback
{
  return self->_startPlayback;
}

- (BOOL)suppressMetrics
{
  return self->_suppressMetrics;
}

- (void)setSuppressMetrics:(BOOL)a3
{
  self->_suppressMetrics = a3;
}

- (void)setStartPlayback:(BOOL)a3
{
  self->_startPlayback = a3;
}

- (void)setPlaybackDestination:(unint64_t)a3
{
  self->_playbackDestination = a3;
}

- (void)setManifest:(id)a3
{
  objc_storeStrong((id *)&self->_manifest, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)playbackDestination
{
  return self->_playbackDestination;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

@end
