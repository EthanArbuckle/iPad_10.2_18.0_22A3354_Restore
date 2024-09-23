@implementation SBAutoPurgingImageView

- (SBAutoPurgingImageView)initWithImageGenerationBlock:(id)a3
{
  id v4;
  SBAutoPurgingImageView *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAutoPurgingImageView;
  v5 = -[SBAutoPurgingImageView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SBAutoPurgingImageView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*((void (**)(void))self->_block + 2))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)SBAutoPurgingImageView;
  -[SBAutoPurgingImageView setImage:](&v5, sel_setImage_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
