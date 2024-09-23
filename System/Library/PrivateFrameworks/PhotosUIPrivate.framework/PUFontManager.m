@implementation PUFontManager

- (PUFontManager)init
{
  PUFontManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUFontManager;
  v2 = -[PUFontManager init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__preferredContentSizeChanged_, *MEMORY[0x1E0DC48E8], 0);

    -[PUFontManager invalidateFonts](v2, "invalidateFonts");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PUFontManager;
  -[PUFontManager dealloc](&v4, sel_dealloc);
}

- (void)setAlbumListTitleLabelFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_albumListTitleLabelFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_albumListTitleLabelFont, a3);
    -[PUFontManager _setNeedsUpdate](self, "_setNeedsUpdate");
    v5 = v6;
  }

}

- (void)setAlbumListSubtitleLabelFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_albumListSubtitleLabelFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_albumListSubtitleLabelFont, a3);
    -[PUFontManager _setNeedsUpdate](self, "_setNeedsUpdate");
    v5 = v6;
  }

}

- (void)setAlbumListSectionTitleLabelFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_albumListSectionTitleLabelFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_albumListSectionTitleLabelFont, a3);
    -[PUFontManager _setNeedsUpdate](self, "_setNeedsUpdate");
    v5 = v6;
  }

}

- (void)_preferredContentSizeChanged:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PUFontManager__preferredContentSizeChanged___block_invoke;
  v3[3] = &unk_1E58AB370;
  v3[4] = self;
  -[PUFontManager performChanges:](self, "performChanges:", v3);
}

- (void)invalidateFonts
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__PUFontManager_invalidateFonts__block_invoke;
  v2[3] = &unk_1E58AB370;
  v2[4] = self;
  -[PUFontManager performChanges:](self, "performChanges:", v2);
}

- (void)_setNeedsUpdate
{
  -[PUFontManager signalChange:](self, "signalChange:", 0);
}

- (UIFont)albumListTitleLabelFont
{
  return self->_albumListTitleLabelFont;
}

- (UIFont)albumListSubtitleLabelFont
{
  return self->_albumListSubtitleLabelFont;
}

- (UIFont)albumListSectionTitleLabelFont
{
  return self->_albumListSectionTitleLabelFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumListSectionTitleLabelFont, 0);
  objc_storeStrong((id *)&self->_albumListSubtitleLabelFont, 0);
  objc_storeStrong((id *)&self->_albumListTitleLabelFont, 0);
}

void __32__PUFontManager_invalidateFonts__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "albumListTitleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlbumListTitleLabelFont:", v4);

  v5 = *(void **)(a1 + 32);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albumListSubtitleLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlbumListSubtitleLabelFont:", v7);

  v8 = *(void **)(a1 + 32);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "albumListSectionTitleLabelFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlbumListSectionTitleLabelFont:", v9);

}

uint64_t __46__PUFontManager__preferredContentSizeChanged___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateFonts");
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

@end
