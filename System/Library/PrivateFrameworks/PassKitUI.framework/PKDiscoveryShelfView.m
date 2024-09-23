@implementation PKDiscoveryShelfView

+ (id)viewForShelf:(id)a3 discoveryCardViewDelegate:(id)a4 itemIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  __objc2_class *v10;
  PKDiscoveryCallToActionShelfView *v11;
  id v12;
  void *v13;
  uint64_t v14;
  __objc2_class **v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  switch(objc_msgSend(v7, "type"))
  {
    case 1:
      v10 = PKDiscoveryTextBlockShelfView;
      goto LABEL_9;
    case 2:
      v12 = v7;
      objc_msgSend(v12, "media");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "type");

      v15 = &off_1E3E1B280;
      if (v14 != 2)
        v15 = off_1E3E1B270;
      v11 = (PKDiscoveryCallToActionShelfView *)objc_msgSend(objc_alloc(*v15), "initWithShelf:", v12);

      if (!v9)
        break;
      goto LABEL_12;
    case 3:
      v10 = PKDiscoverySpacerShelfView;
LABEL_9:
      v11 = (PKDiscoveryCallToActionShelfView *)objc_msgSend([v10 alloc], "initWithShelf:", v7);
      if (!v9)
        break;
      goto LABEL_12;
    case 4:
      v11 = -[PKDiscoveryCallToActionShelfView initWithShelf:]([PKDiscoveryCallToActionShelfView alloc], "initWithShelf:", v7);
      -[PKDiscoveryCallToActionShelfView setDelegate:](v11, "setDelegate:", v8);
      if (v9)
      {
LABEL_12:
        if (v11)
          -[PKDiscoveryShelfView setItemIdentifier:](v11, "setItemIdentifier:", v9);
      }
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

+ (id)viewForShelf:(id)a3 discoveryCardViewDelegate:(id)a4
{
  return (id)objc_msgSend(a1, "viewForShelf:discoveryCardViewDelegate:itemIdentifier:", a3, a4, 0);
}

- (PKDiscoveryShelfView)initWithFrame:(CGRect)a3
{
  PKDiscoveryShelfView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDiscoveryShelfView;
  v3 = -[PKDiscoveryShelfView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryShelfView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
