@implementation VideosExtrasZoomingImageTransitionContext

- (VideosExtrasZoomingImageTransitionContext)initWithZoomingImageView:(id)a3 itemIndex:(unint64_t)a4 appearState:(unint64_t)a5 isInteractive:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  VideosExtrasZoomingImageTransitionContext *v11;
  VideosExtrasZoomingImageTransitionContext *v12;
  objc_super v14;

  v6 = a6;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VideosExtrasZoomingImageTransitionContext;
  v11 = -[VideosExtrasZoomingImageTransitionContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[VideosExtrasZoomingImageTransitionContext setZoomingImageView:](v11, "setZoomingImageView:", v10);
    -[VideosExtrasZoomingImageTransitionContext setItemIndex:](v12, "setItemIndex:", a4);
    -[VideosExtrasZoomingImageTransitionContext setAppearState:](v12, "setAppearState:", a5);
    -[VideosExtrasZoomingImageTransitionContext setInteractive:](v12, "setInteractive:", v6);
  }

  return v12;
}

- (VideosExtrasBorderedImageView)zoomingImageView
{
  return self->_zoomingImageView;
}

- (void)setZoomingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_zoomingImageView, a3);
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
}

- (unint64_t)appearState
{
  return self->_appearState;
}

- (void)setAppearState:(unint64_t)a3
{
  self->_appearState = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingImageView, 0);
}

@end
