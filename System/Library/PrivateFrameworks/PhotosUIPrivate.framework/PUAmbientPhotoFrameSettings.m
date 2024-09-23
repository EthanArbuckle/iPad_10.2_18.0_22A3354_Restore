@implementation PUAmbientPhotoFrameSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAmbientPhotoFrameSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUAmbientPhotoFrameSettings setFixedAssetDuration:](self, "setFixedAssetDuration:", 40.0);
  -[PUAmbientPhotoFrameSettings setDisableNUp:](self, "setDisableNUp:", 1);
  -[PUAmbientPhotoFrameSettings setDisableLetterAndPillarBoxing:](self, "setDisableLetterAndPillarBoxing:", 1);
  -[PUAmbientPhotoFrameSettings setKenBurnsPanSpeed:](self, "setKenBurnsPanSpeed:", 4.0);
  -[PUAmbientPhotoFrameSettings setKenBurnsScaleSpeed:](self, "setKenBurnsScaleSpeed:", 4.0);
  -[PUAmbientPhotoFrameSettings setShowFavoriteAlbumAssets:](self, "setShowFavoriteAlbumAssets:", 1);
  -[PUAmbientPhotoFrameSettings setShowPeopleCuratedAssets:](self, "setShowPeopleCuratedAssets:", 0);
  -[PUAmbientPhotoFrameSettings setShowPetsCuratedAssets:](self, "setShowPetsCuratedAssets:", 0);
  -[PUAmbientPhotoFrameSettings setShowNatureCuratedAssets:](self, "setShowNatureCuratedAssets:", 0);
  -[PUAmbientPhotoFrameSettings setShowCitiesCuratedAssets:](self, "setShowCitiesCuratedAssets:", 0);
  -[PUAmbientPhotoFrameSettings setShowFeaturedCuratedAssets:](self, "setShowFeaturedCuratedAssets:", 1);
  -[PUAmbientPhotoFrameSettings setIncludeHighlightAssetsInFeatured:](self, "setIncludeHighlightAssetsInFeatured:", 1);
  -[PUAmbientPhotoFrameSettings setIncludeFeaturedPhotosInFeatured:](self, "setIncludeFeaturedPhotosInFeatured:", 1);
  -[PUAmbientPhotoFrameSettings setForceColdStart:](self, "setForceColdStart:", 0);
  -[PUAmbientPhotoFrameSettings setPersonLocalIdentifiers:](self, "setPersonLocalIdentifiers:", 0);
  -[PUAmbientPhotoFrameSettings setShowTapToRadarButton:](self, "setShowTapToRadarButton:", 1);
  -[PUAmbientPhotoFrameSettings setIncludePhotosInRadar:](self, "setIncludePhotosInRadar:", 0);
  -[PUAmbientPhotoFrameSettings setWatchType:](self, "setWatchType:", 2);
  -[PUAmbientPhotoFrameSettings setWatchTimeConfig:](self, "setWatchTimeConfig:", 1);
}

- (void)setShowTapToRadarButton:(BOOL)a3
{
  self->_showTapToRadarButton = a3;
}

- (void)setShowPetsCuratedAssets:(BOOL)a3
{
  self->_showPetsCuratedAssets = a3;
}

- (void)setShowPeopleCuratedAssets:(BOOL)a3
{
  self->_showPeopleCuratedAssets = a3;
}

- (void)setShowNatureCuratedAssets:(BOOL)a3
{
  self->_showNatureCuratedAssets = a3;
}

- (void)setShowFeaturedCuratedAssets:(BOOL)a3
{
  self->_showFeaturedCuratedAssets = a3;
}

- (void)setShowFavoriteAlbumAssets:(BOOL)a3
{
  self->_showFavoriteAlbumAssets = a3;
}

- (void)setShowCitiesCuratedAssets:(BOOL)a3
{
  self->_showCitiesCuratedAssets = a3;
}

- (void)setPersonLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_personLocalIdentifiers, a3);
}

- (void)setKenBurnsScaleSpeed:(double)a3
{
  self->_kenBurnsScaleSpeed = a3;
}

- (void)setKenBurnsPanSpeed:(double)a3
{
  self->_kenBurnsPanSpeed = a3;
}

- (void)setIncludePhotosInRadar:(BOOL)a3
{
  self->_includePhotosInRadar = a3;
}

- (void)setIncludeHighlightAssetsInFeatured:(BOOL)a3
{
  self->_includeHighlightAssetsInFeatured = a3;
}

- (void)setIncludeFeaturedPhotosInFeatured:(BOOL)a3
{
  self->_includeFeaturedPhotosInFeatured = a3;
}

- (void)setForceColdStart:(BOOL)a3
{
  self->_forceColdStart = a3;
}

- (void)setFixedAssetDuration:(double)a3
{
  self->_fixedAssetDuration = a3;
}

- (void)setDisableNUp:(BOOL)a3
{
  self->_disableNUp = a3;
}

- (void)setDisableLetterAndPillarBoxing:(BOOL)a3
{
  self->_disableLetterAndPillarBoxing = a3;
}

- (void)wallpaperShuffleConfigurationViewControllerDidDismiss:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)wallpaperShuffleConfigurationViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  objc_msgSend(a4, "shuffleConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "shuffleSmartAlbums");
  -[PUAmbientPhotoFrameSettings setShowPeopleCuratedAssets:](self, "setShowPeopleCuratedAssets:", v7 & 1);
  -[PUAmbientPhotoFrameSettings setShowPetsCuratedAssets:](self, "setShowPetsCuratedAssets:", (v7 >> 1) & 1);
  -[PUAmbientPhotoFrameSettings setShowCitiesCuratedAssets:](self, "setShowCitiesCuratedAssets:", (v7 >> 3) & 1);
  -[PUAmbientPhotoFrameSettings setShowNatureCuratedAssets:](self, "setShowNatureCuratedAssets:", (v7 >> 2) & 1);
  -[PUAmbientPhotoFrameSettings setShowFeaturedCuratedAssets:](self, "setShowFeaturedCuratedAssets:", (v7 >> 4) & 1);
  objc_msgSend(v10, "personLocalIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAmbientPhotoFrameSettings setPersonLocalIdentifiers:](self, "setPersonLocalIdentifiers:", v9);

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)wallpaperShuffleConfigurationViewControllerDidCancelManuallySelectingPhotos:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  id v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[9];
  _QWORD v115[3];
  void *v116;
  _QWORD v117[2];
  _QWORD v118[5];
  _QWORD v119[3];
  _QWORD v120[2];
  _QWORD v121[3];
  _QWORD v122[2];
  _QWORD v123[3];

  v123[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D83078];
  v4 = (void *)MEMORY[0x1E0D83010];
  v112[0] = MEMORY[0x1E0C809B0];
  v5 = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke;
  v112[3] = &unk_1E58A8568;
  v6 = v2;
  v113 = v6;
  objc_msgSend(v4, "pu_rowWithTitle:action:", CFSTR("Play (Long Press then Lift finger To Dismiss)"), v112);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:", v8);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Ambient Category Inspector"), &__block_literal_global_38779);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v10;
  v11 = (void *)MEMORY[0x1E0D83010];
  v110[0] = v5;
  v110[1] = 3221225472;
  v110[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_3;
  v110[3] = &unk_1E58A8568;
  v96 = v6;
  v111 = v96;
  objc_msgSend(v11, "pu_rowWithTitle:action:", CFSTR("Ambient People Inspector"), v110);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v13, CFSTR("Ambient Wallpaper Inspector"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83078];
  v15 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_fixedAssetDuration);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Fixed Asset Duration"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minValue:maxValue:", 1.0, 120.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v18;
  v19 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableNUp);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rowWithTitle:valueKeyPath:", CFSTR("Disable NUp"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v121[1] = v21;
  v22 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableLetterAndPillarBoxing);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:valueKeyPath:", CFSTR("Disable Letterboxing & Pillarboxing"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v121[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v25, CFSTR("General"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83078];
  v27 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_kenBurnsPanSpeed);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Pan Speed (points per second)"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "minValue:maxValue:", 0.0, 200.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "px_increment:", 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v31;
  v32 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_kenBurnsScaleSpeed);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:valueKeyPath:", CFSTR("Scale Speed (points per second at furthest edge)"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "minValue:maxValue:", 0.0, 200.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "px_increment:", 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionWithRows:title:", v37, CFSTR("Ken Burns"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0D83078];
  v39 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showFavoriteAlbumAssets);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowWithTitle:valueKeyPath:", CFSTR("Favorite Album"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v41;
  v42 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showCuratedCategories);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rowWithTitle:valueKeyPath:", CFSTR("Curated Categories"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v44;
  v45 = (void *)MEMORY[0x1E0D83010];
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_4;
  v108[3] = &unk_1E58A8568;
  v46 = v96;
  v109 = v46;
  objc_msgSend(v45, "pu_rowWithTitle:action:", CFSTR("Configure Curated Categories"), v108);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_enabledCurationCategoriesPredicate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "condition:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v119[2] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sectionWithRows:title:", v50, CFSTR("Asset Sources"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = (void *)MEMORY[0x1E0D83078];
  v51 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_includeHighlightAssetsInFeatured);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rowWithTitle:valueKeyPath:", CFSTR("Highlight Summary Assets"), v92);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v90;
  v52 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_includeFeaturedPhotosInFeatured);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rowWithTitle:valueKeyPath:", CFSTR("Featured Photos"), v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v54;
  v55 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceColdStart);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rowWithTitle:valueKeyPath:", CFSTR("Force Cold Start"), v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v57;
  v58 = (void *)MEMORY[0x1E0D83010];
  v59 = MEMORY[0x1E0C809B0];
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_5;
  v106[3] = &unk_1E58A8568;
  v60 = v46;
  v107 = v60;
  objc_msgSend(v58, "pu_rowWithTitle:action:", CFSTR("Highlight Summary Assets"), v106);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v118[3] = v61;
  v62 = (void *)MEMORY[0x1E0D83010];
  v104[0] = v59;
  v104[1] = 3221225472;
  v104[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_6;
  v104[3] = &unk_1E58A8568;
  v105 = v60;
  v97 = v60;
  objc_msgSend(v62, "pu_rowWithTitle:action:", CFSTR("Memory Key Assets"), v104);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v118[4] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 5);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "sectionWithRows:title:", v64, CFSTR("Featured Content"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (void *)MEMORY[0x1E0D83078];
  v66 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showTapToRadarButton);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:valueKeyPath:", CFSTR("Show Tap To Radar"), v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v68;
  v69 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_includePhotosInRadar);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "rowWithTitle:valueKeyPath:", CFSTR("Include Photos in Radar"), v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "sectionWithRows:title:", v72, CFSTR("Tap To Radar"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = (void *)MEMORY[0x1E0D83078];
  v74 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "rowWithTitle:action:", CFSTR("Restore Defaults"), v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "sectionWithRows:", v77);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Watch Category Inspector"), &__block_literal_global_251);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v79;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Model"), CFSTR("watchType"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "possibleValues:titles:", &unk_1E59BA060, &unk_1E59BA078);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v81;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Time Position"), CFSTR("watchTimeConfig"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "possibleValues:titles:", &unk_1E59BA090, &unk_1E59BA0A8);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v83;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 3);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "sectionWithRows:title:", v84, CFSTR("Watch Face Inspector"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = (void *)MEMORY[0x1E0D83078];
  v114[0] = v103;
  v114[1] = v102;
  v114[2] = v99;
  v114[3] = v95;
  v114[4] = v101;
  v114[5] = v100;
  v114[6] = v93;
  v114[7] = v85;
  v114[8] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 9);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "moduleWithTitle:contents:", CFSTR("Ambient Photo Frame"), v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  return v88;
}

+ (id)_enabledCurationCategoriesPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("showCuratedCategories == YES"));
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PUAmbientPhotoFramePlayergroundViewController *v4;

  v3 = a2;
  v4 = -[PUAmbientPhotoFramePlayergroundViewController initWithPhotoLibrary:]([PUAmbientPhotoFramePlayergroundViewController alloc], "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  -[PUAmbientPhotoFramePlayergroundViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);

}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource *v4;
  PUWallpaperSmartAlbumPeopleDebugViewController *v5;
  void *v6;
  PUPassiveContentDebugViewSpec *v7;

  v3 = a2;
  v7 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 1);
  v4 = -[AmbientPhotoFramePeoplePickerDataSource initWithPhotoLibrary:]([_TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource alloc], "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = -[PUWallpaperSmartAlbumPeopleDebugViewController initWithSpec:dataSource:]([PUWallpaperSmartAlbumPeopleDebugViewController alloc], "initWithSpec:dataSource:", v7, v4);
  objc_msgSend(v3, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v5, 1);
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v11;
  id v12;

  v3 = a2;
  +[PUAmbientPhotoFrameSettings sharedInstance](PUAmbientPhotoFrameSettings, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75230]), "initWithShuffleType:", 0);
  v5 = 0;
  if (objc_msgSend(v12, "showPeopleCuratedAssets"))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v12, "personLocalIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPersonLocalIdentifiers:", v8);

    v5 = 1;
  }
  if (objc_msgSend(v12, "showCitiesCuratedAssets"))
    v5 |= 8uLL;
  if (objc_msgSend(v12, "showNatureCuratedAssets"))
    v5 |= 4uLL;
  if (objc_msgSend(v12, "showPetsCuratedAssets"))
    v5 |= 2uLL;
  if (objc_msgSend(v12, "showFeaturedCuratedAssets"))
    v9 = v5 | 0x10;
  else
    v9 = v5;
  objc_msgSend(v4, "setShuffleSmartAlbums:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751F0]), "initWithConfigurationType:", 1);
  objc_msgSend(v10, "setShuffleConfiguration:", v4);
  v11 = -[PUWallpaperShuffleConfigurationViewController initWithPhotoLibrary:style:posterConfiguration:centerMedia:contentMode:]([_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController alloc], "initWithPhotoLibrary:style:posterConfiguration:centerMedia:contentMode:", *(_QWORD *)(a1 + 32), 1, v10, 0, 1);
  -[PUWallpaperShuffleConfigurationViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 2);
  -[PUWallpaperShuffleConfigurationViewController setDelegate:](v11, "setDelegate:", v12);
  objc_msgSend(v3, "presentViewController:animated:completion:", v11, 1, 0);

}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(getPUTesterCurationViewControllerFactoryClass(), "ambientHighlightAssetReviewViewControllerWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(getPUTesterCurationViewControllerFactoryClass(), "ambientMemoryKeyAssetReviewViewControllerWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  PUPassiveContentSummaryViewController *v3;
  void *v4;
  PUPassiveContentSummaryViewController *v5;
  void *v6;
  PUPassiveContentDebugViewSpec *v7;

  v2 = a2;
  v7 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 3);
  v3 = [PUPassiveContentSummaryViewController alloc];
  +[PUPassiveContentDataSource watchFaceDataSource](PUPassiveContentDataSource, "watchFaceDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPassiveContentSummaryViewController initWithSpec:dataSource:](v3, "initWithSpec:dataSource:", v7, v4);

  objc_msgSend(v2, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v5, 1);
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PUPassiveContentSummaryViewController *v3;
  void *v4;
  PUPassiveContentSummaryViewController *v5;
  void *v6;
  PUPassiveContentDebugViewSpec *v7;

  v2 = a2;
  v7 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 2);
  v3 = [PUPassiveContentSummaryViewController alloc];
  +[PUPassiveContentDataSource ambientDataSource](PUPassiveContentDataSource, "ambientDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPassiveContentSummaryViewController initWithSpec:dataSource:](v3, "initWithSpec:dataSource:", v7, v4);

  objc_msgSend(v2, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v5, 1);
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (double)fixedAssetDuration
{
  return self->_fixedAssetDuration;
}

- (BOOL)disableNUp
{
  return self->_disableNUp;
}

- (BOOL)disableLetterAndPillarBoxing
{
  return self->_disableLetterAndPillarBoxing;
}

- (double)kenBurnsPanSpeed
{
  return self->_kenBurnsPanSpeed;
}

- (double)kenBurnsScaleSpeed
{
  return self->_kenBurnsScaleSpeed;
}

- (BOOL)showFavoriteAlbumAssets
{
  return self->_showFavoriteAlbumAssets;
}

- (BOOL)showCuratedCategories
{
  return self->_showCuratedCategories;
}

- (void)setShowCuratedCategories:(BOOL)a3
{
  self->_showCuratedCategories = a3;
}

- (BOOL)showPeopleCuratedAssets
{
  return self->_showPeopleCuratedAssets;
}

- (BOOL)showPetsCuratedAssets
{
  return self->_showPetsCuratedAssets;
}

- (BOOL)showNatureCuratedAssets
{
  return self->_showNatureCuratedAssets;
}

- (BOOL)showCitiesCuratedAssets
{
  return self->_showCitiesCuratedAssets;
}

- (BOOL)showFeaturedCuratedAssets
{
  return self->_showFeaturedCuratedAssets;
}

- (BOOL)includeHighlightAssetsInFeatured
{
  return self->_includeHighlightAssetsInFeatured;
}

- (BOOL)includeFeaturedPhotosInFeatured
{
  return self->_includeFeaturedPhotosInFeatured;
}

- (BOOL)forceColdStart
{
  return self->_forceColdStart;
}

- (NSArray)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (BOOL)showTapToRadarButton
{
  return self->_showTapToRadarButton;
}

- (BOOL)includePhotosInRadar
{
  return self->_includePhotosInRadar;
}

- (int64_t)watchType
{
  return self->_watchType;
}

- (void)setWatchType:(int64_t)a3
{
  self->_watchType = a3;
}

- (int64_t)watchTimeConfig
{
  return self->_watchTimeConfig;
}

- (void)setWatchTimeConfig:(int64_t)a3
{
  self->_watchTimeConfig = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

+ (PUAmbientPhotoFrameSettings)sharedInstance
{
  if (sharedInstance_onceToken_89688 != -1)
    dispatch_once(&sharedInstance_onceToken_89688, &__block_literal_global_89689);
  return (PUAmbientPhotoFrameSettings *)(id)sharedInstance_sharedInstance_89690;
}

void __45__PUAmbientPhotoFrameSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ambientPhotoFrameSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_89690;
  sharedInstance_sharedInstance_89690 = v0;

}

@end
