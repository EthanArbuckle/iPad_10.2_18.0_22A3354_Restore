@implementation PXAlbumsDebugUISettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAlbumsDebugUISettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXAlbumsDebugUISettings setShowBestKeyFrameDebugAlbum:](self, "setShowBestKeyFrameDebugAlbum:", 0);
  -[PXAlbumsDebugUISettings setShowUtilitiesDebugAlbum:](self, "setShowUtilitiesDebugAlbum:", 0);
  -[PXAlbumsDebugUISettings setShowDreamyDebugAlbum:](self, "setShowDreamyDebugAlbum:", 0);
  -[PXAlbumsDebugUISettings setShowGazeDebugAlbum:](self, "setShowGazeDebugAlbum:", 0);
  -[PXAlbumsDebugUISettings setShowCustomDebugAlbum:](self, "setShowCustomDebugAlbum:", 0);
  -[PXAlbumsDebugUISettings setCustomDebugAlbumTitle:](self, "setCustomDebugAlbumTitle:", CFSTR("Custom"));
  -[PXAlbumsDebugUISettings setCustomDebugInternalPredicate:](self, "setCustomDebugInternalPredicate:", 0);
  -[PXAlbumsDebugUISettings setCustomDebugPredicate:](self, "setCustomDebugPredicate:", 0);
}

- (void)setShowUtilitiesDebugAlbum:(BOOL)a3
{
  self->_showUtilitiesDebugAlbum = a3;
}

- (void)setShowGazeDebugAlbum:(BOOL)a3
{
  self->_showGazeDebugAlbum = a3;
}

- (void)setShowDreamyDebugAlbum:(BOOL)a3
{
  self->_showDreamyDebugAlbum = a3;
}

- (void)setShowCustomDebugAlbum:(BOOL)a3
{
  self->_showCustomDebugAlbum = a3;
}

- (void)setShowBestKeyFrameDebugAlbum:(BOOL)a3
{
  self->_showBestKeyFrameDebugAlbum = a3;
}

- (void)setCustomDebugPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setCustomDebugInternalPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setCustomDebugAlbumTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Utilities Album"), CFSTR("showUtilitiesDebugAlbum"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v4;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Best Key Frame Album"), CFSTR("showBestKeyFrameDebugAlbum"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v5;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Dreamy Album"), CFSTR("showDreamyDebugAlbum"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v6;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Gaze Album"), CFSTR("showGazeDebugAlbum"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v8, CFSTR("Internal Albums"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("showCustomDebugAlbum == YES"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Custom Album"), CFSTR("showCustomDebugAlbum"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  objc_msgSend(MEMORY[0x1E0D83068], "rowWithTitle:valueKeyPath:", CFSTR("Title"), CFSTR("customDebugAlbumTitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "condition:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v13;
  v14 = (void *)MEMORY[0x1E0D83068];
  objc_msgSend(a1, "_predicateValidatorUsingInternalPredicate:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "px_rowWithTitle:valueKeyPath:alertTitle:alertMessage:textPlaceholder:textValidator:condition:", CFSTR("Predicate"), CFSTR("customDebugPredicate"), CFSTR("Custom Album"), CFSTR("Enter a predicate for this album."), CFSTR("Predicate"), v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v16;
  v17 = (void *)MEMORY[0x1E0D83068];
  objc_msgSend(a1, "_predicateValidatorUsingInternalPredicate:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "px_rowWithTitle:valueKeyPath:alertTitle:alertMessage:textPlaceholder:textValidator:condition:", CFSTR("Internal Predicate"), CFSTR("customDebugInternalPredicate"), CFSTR("Custom Album"), CFSTR("Enter an internal predicate for this album."), CFSTR("Internal Predicate"), v18, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v20, CFSTR("Custom Internal Album"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0D83078];
  v28[0] = v27;
  v28[1] = v21;
  v28[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "moduleWithTitle:contents:", CFSTR("Albums Debug UI"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)_predicateValidatorUsingInternalPredicate:(BOOL)a3
{
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  BOOL v7;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PXAlbumsDebugUISettings_UI___predicateValidatorUsingInternalPredicate___block_invoke;
  aBlock[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
  v7 = a3;
  v3 = _Block_copy(aBlock);
  v4 = _Block_copy(v3);

  return v4;
}

id __73__PXAlbumsDebugUISettings_UI___predicateValidatorUsingInternalPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CD1570];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchOptionsWithPhotoLibrary:orObject:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInternalPredicate:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v7);
  }

  v8 = (id)objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
  v9 = v3;

  return v9;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)showBestKeyFrameDebugAlbum
{
  return self->_showBestKeyFrameDebugAlbum;
}

- (BOOL)showUtilitiesDebugAlbum
{
  return self->_showUtilitiesDebugAlbum;
}

- (BOOL)showDreamyDebugAlbum
{
  return self->_showDreamyDebugAlbum;
}

- (BOOL)showGazeDebugAlbum
{
  return self->_showGazeDebugAlbum;
}

- (BOOL)showCustomDebugAlbum
{
  return self->_showCustomDebugAlbum;
}

- (NSString)customDebugAlbumTitle
{
  return self->_customDebugAlbumTitle;
}

- (NSString)customDebugInternalPredicate
{
  return self->_customDebugInternalPredicate;
}

- (NSString)customDebugPredicate
{
  return self->_customDebugPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDebugPredicate, 0);
  objc_storeStrong((id *)&self->_customDebugInternalPredicate, 0);
  objc_storeStrong((id *)&self->_customDebugAlbumTitle, 0);
}

+ (PXAlbumsDebugUISettings)sharedInstance
{
  if (sharedInstance_onceToken_169246 != -1)
    dispatch_once(&sharedInstance_onceToken_169246, &__block_literal_global_169247);
  return (PXAlbumsDebugUISettings *)(id)sharedInstance_sharedInstance_169248;
}

void __41__PXAlbumsDebugUISettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumsDebugUISettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_169248;
  sharedInstance_sharedInstance_169248 = v0;

}

@end
