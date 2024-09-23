@implementation TSDCheckableTableViewCell

- (TSDCheckableTableViewCell)initWithReuseIdentifier:(id)a3 showsCheckboxOnRight:(BOOL)a4
{
  TSDCheckableTableViewCell *v5;
  TSDCheckableTableViewCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDCheckableTableViewCell;
  v5 = -[TSDCheckableTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v6 = v5;
  if (v5)
  {
    v5->mShowsCheckboxOnRight = a4;
    if (!a4)
    {
      objc_msgSend((id)-[TSDCheckableTableViewCell imageView](v5, "imageView"), "setImage:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("TSD_TableViewCheckboxImage_N"), TSDBundle(), 0), "imageWithRenderingMode:", 2));
      objc_msgSend((id)-[TSDCheckableTableViewCell imageView](v6, "imageView"), "setHidden:", 1);
    }
  }
  return v6;
}

- (TSDCheckableTableViewCell)initWithReuseIdentifier:(id)a3 showsCheckboxOnRight:(BOOL)a4 style:(int64_t)a5
{
  TSDCheckableTableViewCell *v6;
  TSDCheckableTableViewCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDCheckableTableViewCell;
  v6 = -[TSDCheckableTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a5, a3);
  v7 = v6;
  if (v6)
  {
    v6->mShowsCheckboxOnRight = a4;
    if (!a4)
    {
      objc_msgSend((id)-[TSDCheckableTableViewCell imageView](v6, "imageView"), "setImage:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("TSD_TableViewCheckboxImage_N"), TSDBundle(), 0), "imageWithRenderingMode:", 2));
      objc_msgSend((id)-[TSDCheckableTableViewCell imageView](v7, "imageView"), "setHidden:", 1);
    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDCheckableTableViewCell;
  -[TSDCheckableTableViewCell dealloc](&v3, sel_dealloc);
}

- (void)setCheckmarkImage:(id)a3 forState:(unint64_t)a4
{
  UIImageView *mCheckmarkImageView;
  void *v8;
  uint64_t v9;

  if (self->mShowsCheckboxOnRight)
  {
    mCheckmarkImageView = self->mCheckmarkImageView;
    if (!mCheckmarkImageView)
    {
      mCheckmarkImageView = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", a3);
      self->mCheckmarkImageView = mCheckmarkImageView;
    }
  }
  else
  {
    mCheckmarkImageView = (UIImageView *)-[TSDCheckableTableViewCell imageView](self, "imageView");
  }
  if (a4 == 1)
  {
    -[UIImageView setHighlightedImage:](mCheckmarkImageView, "setHighlightedImage:", a3);
  }
  else if (a4)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCheckableTableViewCell setCheckmarkImage:forState:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCheckableTableViewCell.m"), 79, CFSTR("Setting checkmark image for unsupported state"));
  }
  else
  {
    -[UIImageView setImage:](mCheckmarkImageView, "setImage:", a3);
  }
}

- (id)imageForState:(unint64_t)a3
{
  return -[UIButton imageForState:](self->mImageButton, "imageForState:", a3);
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  UIButton *mImageButton;
  UIButton *v8;

  mImageButton = self->mImageButton;
  if (!mImageButton)
  {
    v8 = (UIButton *)(id)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    self->mImageButton = v8;
    -[UIButton setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    -[UIButton setClipsToBounds:](self->mImageButton, "setClipsToBounds:", 1);
    -[UIButton setContentHorizontalAlignment:](self->mImageButton, "setContentHorizontalAlignment:", 1);
    objc_msgSend((id)-[TSDCheckableTableViewCell contentView](self, "contentView"), "addSubview:", self->mImageButton);
    mImageButton = self->mImageButton;
  }
  -[UIButton setImage:forState:](mImageButton, "setImage:forState:", a3, a4);
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDCheckableTableViewCell;
  -[TSDCheckableTableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  objc_msgSend((id)-[TSDCheckableTableViewCell contentView](self, "contentView"), "frame");
  v3 = TSDRectWithSize();
  if (!self->mShowsCheckboxOnRight)
    v3 = v3 + 32.0;
  -[UIButton setFrame:](self->mImageButton, "setFrame:", v3);
}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  self->mChecked = a3;
  if (!-[TSDCheckableTableViewCell showsCheckboxOnRight](self, "showsCheckboxOnRight"))
  {
    v5 = !v3;
    v6 = (void *)-[TSDCheckableTableViewCell imageView](self, "imageView");
    goto LABEL_5;
  }
  if (self->mCheckmarkImageView)
  {
    -[TSDCheckableTableViewCell setAccessoryView:](self, "setAccessoryView:");
    v5 = !v3;
    v6 = (void *)-[TSDCheckableTableViewCell accessoryView](self, "accessoryView");
LABEL_5:
    objc_msgSend(v6, "setHidden:", v5);
    return;
  }
  if (v3)
    v7 = 3;
  else
    v7 = 0;
  -[TSDCheckableTableViewCell setAccessoryType:](self, "setAccessoryType:", v7);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  TSDCheckableTableViewCell *v11;
  uint64_t v12;
  objc_super v13;

  v4 = a4;
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSDCheckableTableViewCell;
  -[TSDCheckableTableViewCell setHighlighted:animated:](&v13, sel_setHighlighted_animated_);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __53__TSDCheckableTableViewCell_setHighlighted_animated___block_invoke;
  v10 = &unk_24D82B4E8;
  v11 = self;
  LOBYTE(v12) = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", &v7, 0.2);
  }
  else
  {
    -[UIButton setHighlighted:](self->mImageButton, "setHighlighted:", v5, v7, v8, v9, v10, v11, v12);
    -[UIImageView setHighlighted:](self->mCheckmarkImageView, "setHighlighted:", v5);
  }
}

uint64_t __53__TSDCheckableTableViewCell_setHighlighted_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setHighlighted:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setHighlighted:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)showsCheckboxOnRight
{
  return self->mShowsCheckboxOnRight;
}

- (BOOL)checked
{
  return self->mChecked;
}

@end
