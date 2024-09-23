@implementation SearchUIButton

- (SearchUIButton)initWithType:(unint64_t)a3
{
  SearchUIButton *v4;
  SearchUIButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIButton;
  v4 = -[TLKButton init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SearchUIButton setType:](v4, "setType:", a3);
  return v5;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
  -[SearchUIButton updateWithType:](self, "updateWithType:");
}

- (BOOL)isPlayButton
{
  return self->_type == 0;
}

- (id)imageNameForToggleState:(BOOL)a3
{
  __CFString *v3;
  __CFString *v4;

  v3 = CFSTR("plus");
  if (a3)
    v3 = CFSTR("minus");
  v4 = CFSTR("play.fill");
  if (a3)
    v4 = CFSTR("pause.fill");
  if (self->_type)
    return v3;
  else
    return v4;
}

- (void)updateWithType:(unint64_t)a3
{
  double v4;
  double v5;
  void *v7;
  _BOOL4 v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[TLKButton fixedSize](self, "fixedSize", a3);
  if (v5 == *MEMORY[0x1E0C9D820] && v4 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v7 = (void *)MEMORY[0x1E0DBD940];
    v8 = -[SearchUIButton useCompactMode](self, "useCompactMode");
    v9 = (_QWORD *)MEMORY[0x1E0DC4AB8];
    if (!v8)
      v9 = (_QWORD *)MEMORY[0x1E0DC4A88];
    objc_msgSend(v7, "preferredFontForTextStyle:maximumContentSizeCategory:", *v9, *MEMORY[0x1E0DC48F0]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[SearchUIButton imageNameForToggleState:](self, "imageNameForToggleState:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUISymbolImage uiImageWithSymbolName:font:scale:](SearchUISymbolImage, "uiImageWithSymbolName:font:scale:", v10, v14, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKButton setUntoggledImage:](self, "setUntoggledImage:", v11);

  -[SearchUIButton imageNameForToggleState:](self, "imageNameForToggleState:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUISymbolImage uiImageWithSymbolName:font:scale:](SearchUISymbolImage, "uiImageWithSymbolName:font:scale:", v12, v14, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKButton setToggledImage:](self, "setToggledImage:", v13);

  -[TLKButton showPlayIndicator:](self, "showPlayIndicator:", -[TLKButton isToggled](self, "isToggled") ^ 1);
  -[SearchUIButton tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");

}

- (void)setUseCompactMode:(BOOL)a3
{
  if (self->_useCompactMode != a3)
  {
    self->_useCompactMode = a3;
    -[SearchUIButton updateWithType:](self, "updateWithType:", -[SearchUIButton type](self, "type"));
  }
}

- (void)setFixedSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUIButton;
  -[TLKButton setFixedSize:](&v4, sel_setFixedSize_, a3.width, a3.height);
  -[SearchUIButton updateWithType:](self, "updateWithType:", -[SearchUIButton type](self, "type"));
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

@end
