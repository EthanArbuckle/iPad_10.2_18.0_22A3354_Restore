@implementation PUAlbumListTableViewCell

- (void)willTransitionToState:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAlbumListTableViewCell;
  -[PUAlbumListTableViewCell willTransitionToState:](&v6, sel_willTransitionToState_);
  -[PUAlbumListTableViewCell stateChangeDelegate](self, "stateChangeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albumListTableViewCell:willChangeState:", self, a3);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PUAlbumListTableViewCell viewWithTag:](self, "viewWithTag:", 236897);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (PUAlbumListTableViewCellDelegate)stateChangeDelegate
{
  return (PUAlbumListTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_stateChangeDelegate);
}

- (void)setStateChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stateChangeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateChangeDelegate);
}

@end
