@implementation _PXFeedInlinePlaybackRecord

- (void)setDesiredPlayState:(int64_t)a3
{
  id v5;

  -[_PXFeedInlinePlaybackRecord inlinePlaybackController](self, "inlinePlaybackController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_playbackRecord:setDesiredPlayState:", self, a3);

}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (_PXFeedInlinePlaybackController)inlinePlaybackController
{
  return (_PXFeedInlinePlaybackController *)objc_loadWeakRetained((id *)&self->_inlinePlaybackController);
}

- (void)setInlinePlaybackController:(id)a3
{
  objc_storeWeak((id *)&self->_inlinePlaybackController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inlinePlaybackController);
}

@end
