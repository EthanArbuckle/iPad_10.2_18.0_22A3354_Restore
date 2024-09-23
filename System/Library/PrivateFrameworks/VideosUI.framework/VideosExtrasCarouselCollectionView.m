@implementation VideosExtrasCarouselCollectionView

- (void)didAddSubview:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasCarouselCollectionView;
  -[VideosExtrasCarouselCollectionView didAddSubview:](&v5, sel_didAddSubview_, a3);
  -[VideosExtrasCarouselCollectionView carouselCollectionViewDelegate](self, "carouselCollectionViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "subviewsDidChangeForCarouselCollectionView:", self);

}

- (VideosExtrasCarouselCollectionViewDelegate)carouselCollectionViewDelegate
{
  return (VideosExtrasCarouselCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_carouselCollectionViewDelegate);
}

- (void)setCarouselCollectionViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_carouselCollectionViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_carouselCollectionViewDelegate);
}

@end
