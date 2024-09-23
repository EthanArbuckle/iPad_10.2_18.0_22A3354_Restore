@implementation TUIImageContent

- (TUIImageContent)initWithImage:(id)a3
{
  id v5;
  TUIImageContent *v6;
  TUIImageContent *v7;
  __int128 v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIImageContent;
  v6 = -[TUIImageContent init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    v8 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v7->_insets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v7->_insets.bottom = v8;
    objc_msgSend(v5, "size");
    v7->_intrinsicSize.width = v9;
    v7->_intrinsicSize.height = v10;
    v7->_flags = 0;
  }

  return v7;
}

- (TUIImageContent)initWithImage:(id)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v10;
  TUIImageContent *v11;
  TUIImageContent *v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v16;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIImageContent;
  v11 = -[TUIImageContent init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_image, a3);
    v12->_insets.top = top;
    v12->_insets.left = left;
    v12->_insets.bottom = bottom;
    v12->_insets.right = right;
    objc_msgSend(v10, "size");
    v12->_intrinsicSize.width = v13;
    v12->_intrinsicSize.height = v14;
    v12->_flags = 0;
  }

  return v12;
}

- (TUIImageContent)initWithImage:(id)a3 insets:(UIEdgeInsets)a4 intrinsicSize:(CGSize)a5 flags:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v15;
  TUIImageContent *v16;
  TUIImageContent *v17;
  objc_super v19;

  height = a5.height;
  width = a5.width;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIImageContent;
  v16 = -[TUIImageContent init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_image, a3);
    v17->_insets.top = top;
    v17->_insets.left = left;
    v17->_insets.bottom = bottom;
    v17->_insets.right = right;
    v17->_intrinsicSize.width = width;
    v17->_intrinsicSize.height = height;
    v17->_flags = a6;
  }

  return v17;
}

- (TUIImageContent)initWithIntrinsicSize:(CGSize)a3 flags:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  TUIImageContent *v7;
  TUIImageContent *v8;
  TUIPurgeableImage *image;
  __int128 v10;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)TUIImageContent;
  v7 = -[TUIImageContent init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    image = v7->_image;
    v7->_image = 0;

    v10 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v8->_insets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v8->_insets.bottom = v10;
    v8->_intrinsicSize.width = width;
    v8->_intrinsicSize.height = height;
    v8->_flags = a4;
  }
  return v8;
}

- (TUIPurgeableImage)image
{
  return self->_image;
}

- (CGSize)intrinsicSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
