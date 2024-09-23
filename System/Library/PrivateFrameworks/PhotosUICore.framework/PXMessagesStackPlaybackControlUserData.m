@implementation PXMessagesStackPlaybackControlUserData

- (PXMessagesStackPlaybackControlUserData)initWithItemIndex:(int64_t)a3 viewModel:(id)a4
{
  id v7;
  PXMessagesStackPlaybackControlUserData *v8;
  PXMessagesStackPlaybackControlUserData *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXMessagesStackPlaybackControlUserData;
  v8 = -[PXMessagesStackPlaybackControlUserData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_itemIndex = a3;
    objc_storeStrong((id *)&v8->_viewModel, a4);
  }

  return v9;
}

- (int64_t)itemIndex
{
  return self->_itemIndex;
}

- (PXMessagesStackPlaybackControlViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
