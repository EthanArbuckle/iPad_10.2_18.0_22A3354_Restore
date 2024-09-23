@implementation PXApplicationSettings

+ (id)stringTransformedForDisplay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  +[PXApplicationSettings sharedInstance](PXApplicationSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_wantsPseudoStringsForDisplay"))
  {
    v7 = objc_msgSend(v3, "length");

    v5 = v3;
    if (!v7)
      goto LABEL_4;
    +[PXApplicationSettings sharedInstance](PXApplicationSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    if (objc_msgSend(v4, "wantsPseudostringsWithIncreasedLength"))
    {
      objc_msgSend(v3, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v3, "length") * objc_msgSend(v4, "pseudoStringsLengthIncreaseFactor"), v3, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v4, "wantsPseudostringsWithSpecialCharacters"))
    {
      objc_msgSend(v4, "stringWithSpecialCharacters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", v5);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
  }
  else
  {
    v5 = v3;
  }

LABEL_4:
  return v5;
}

- (BOOL)wantsPseudostringsWithIncreasedLength
{
  return self->_wantsPseudostringsWithIncreasedLength;
}

- (BOOL)_wantsPseudoStringsForDisplay
{
  return -[PXApplicationSettings wantsPseudostringsWithSpecialCharacters](self, "wantsPseudostringsWithSpecialCharacters")|| -[PXApplicationSettings wantsPseudostringsWithIncreasedLength](self, "wantsPseudostringsWithIncreasedLength");
}

- (BOOL)wantsPseudostringsWithSpecialCharacters
{
  return self->_wantsPseudostringsWithSpecialCharacters;
}

+ (PXApplicationSettings)sharedInstance
{
  if (sharedInstance_onceToken_138610 != -1)
    dispatch_once(&sharedInstance_onceToken_138610, &__block_literal_global_138611);
  return (PXApplicationSettings *)(id)sharedInstance_sharedInstance_138612;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXApplicationSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXApplicationSettings setDefaultNavigationTimeoutDuration:](self, "setDefaultNavigationTimeoutDuration:", 2.0);
  -[PXApplicationSettings setWantsPseudostringsWithSpecialCharacters:](self, "setWantsPseudostringsWithSpecialCharacters:", 0);
  -[PXApplicationSettings setStringWithSpecialCharacters:](self, "setStringWithSpecialCharacters:", CFSTR("นี้ लड्डू चाँद लड्डू चाँद"));
  -[PXApplicationSettings setWantsPseudostringsWithIncreasedLength:](self, "setWantsPseudostringsWithIncreasedLength:", 0);
  -[PXApplicationSettings setPseudoStringsLengthIncreaseFactor:](self, "setPseudoStringsLengthIncreaseFactor:", 2);
  -[PXApplicationSettings setEnableSlideshowAction:](self, "setEnableSlideshowAction:", 0);
  -[PXApplicationSettings setEnablePlayMovieAction:](self, "setEnablePlayMovieAction:", 1);
  -[PXApplicationSettings setShouldClearUndoStackAutomatically:](self, "setShouldClearUndoStackAutomatically:", 1);
  -[PXApplicationSettings setBackgroundThresholdDurationForUndoActionsInvalidation:](self, "setBackgroundThresholdDurationForUndoActionsInvalidation:", 480.0);
}

- (void)setWantsPseudostringsWithSpecialCharacters:(BOOL)a3
{
  self->_wantsPseudostringsWithSpecialCharacters = a3;
}

- (void)setWantsPseudostringsWithIncreasedLength:(BOOL)a3
{
  self->_wantsPseudostringsWithIncreasedLength = a3;
}

- (void)setStringWithSpecialCharacters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setShouldClearUndoStackAutomatically:(BOOL)a3
{
  self->_shouldClearUndoStackAutomatically = a3;
}

- (void)setPseudoStringsLengthIncreaseFactor:(int64_t)a3
{
  self->_pseudoStringsLengthIncreaseFactor = a3;
}

- (void)setDefaultNavigationTimeoutDuration:(double)a3
{
  self->_defaultNavigationTimeoutDuration = a3;
}

- (void)setBackgroundThresholdDurationForUndoActionsInvalidation:(double)a3
{
  self->_backgroundThresholdDurationForUndoActionsInvalidation = a3;
}

void __39__PXApplicationSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_138612;
  sharedInstance_sharedInstance_138612 = v0;

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (double)defaultNavigationTimeoutDuration
{
  return self->_defaultNavigationTimeoutDuration;
}

- (NSString)stringWithSpecialCharacters
{
  return self->_stringWithSpecialCharacters;
}

- (int64_t)pseudoStringsLengthIncreaseFactor
{
  return self->_pseudoStringsLengthIncreaseFactor;
}

- (BOOL)enableSlideshowAction
{
  return self->_enableSlideshowAction;
}

- (void)setEnableSlideshowAction:(BOOL)a3
{
  self->_enableSlideshowAction = a3;
}

- (BOOL)enablePlayMovieAction
{
  return self->_enablePlayMovieAction;
}

- (void)setEnablePlayMovieAction:(BOOL)a3
{
  self->_enablePlayMovieAction = a3;
}

- (BOOL)shouldClearUndoStackAutomatically
{
  return self->_shouldClearUndoStackAutomatically;
}

- (double)backgroundThresholdDurationForUndoActionsInvalidation
{
  return self->_backgroundThresholdDurationForUndoActionsInvalidation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringWithSpecialCharacters, 0);
}

+ (id)attributedStringTransformedForDisplay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a3;
  +[PXApplicationSettings sharedInstance](PXApplicationSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_wantsPseudoStringsForDisplay"))
  {
    v7 = objc_msgSend(v3, "length");

    v5 = v3;
    if (!v7)
      goto LABEL_4;
    +[PXApplicationSettings sharedInstance](PXApplicationSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "mutableCopy");
    if (objc_msgSend(v4, "wantsPseudostringsWithIncreasedLength")
      && objc_msgSend(v4, "pseudoStringsLengthIncreaseFactor") >= 2)
    {
      v9 = 1;
      do
      {
        objc_msgSend(v8, "appendAttributedString:", v3);
        ++v9;
      }
      while (v9 < objc_msgSend(v4, "pseudoStringsLengthIncreaseFactor"));
    }
    if (objc_msgSend(v4, "wantsPseudostringsWithSpecialCharacters"))
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v4, "stringWithSpecialCharacters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithString:", v11);
      objc_msgSend(v8, "insertAttributedString:atIndex:", v12, 0);

    }
    v5 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v5 = v3;
  }

LABEL_4:
  return v5;
}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v26;
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
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[3];
  void *v62;
  _QWORD v63[8];

  v63[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v40 = (id)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_defaultNavigationTimeoutDuration);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Navigation Timeout"), v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "minValue:maxValue:", 0.0, 10.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "px_increment:", 0.2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v53, CFSTR("Durations"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v52;
  v4 = (void *)MEMORY[0x1E0D83078];
  v5 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsPseudostringsWithSpecialCharacters);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Special Characters"), v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v50;
  v6 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsPseudostringsWithIncreasedLength);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Increased Length"), v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v48;
  v7 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_pseudoStringsLengthIncreaseFactor);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Factor"), v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "px_possibleValues:", &unk_1E53E9C18);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsPseudostringsWithIncreasedLength);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == YES"), v45);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "condition:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v39, CFSTR("Pseudo Strings"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v38;
  v9 = (void *)MEMORY[0x1E0D83078];
  v10 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableSlideshowAction);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Slideshow (Legacy)"), v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v36;
  v11 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enablePlayMovieAction);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:valueKeyPath:", CFSTR("Play as Slideshow"), v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v33, CFSTR("Actions"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v32;
  v12 = (void *)MEMORY[0x1E0D83078];
  v13 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldClearUndoStackAutomatically);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Clear Undo After Background"), v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v30;
  v14 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_backgroundThresholdDurationForUndoActionsInvalidation);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Max Background (seconds)"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "minValue:maxValue:", 0.0, 3600.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "px_increment:", 5.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v17, CFSTR("Undo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v18;
  v19 = (void *)MEMORY[0x1E0D83078];
  v20 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_150804);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:action:", CFSTR("GreenTea Status"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionWithRows:title:", v23, CFSTR("GreenTea"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v24;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "moduleWithTitle:contents:", CFSTR("Application"), v26);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  return v41;
}

uint64_t __53__PXApplicationSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  int v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = PLIsChinaSKU();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = CFSTR("NO");
  if (v4)
    v6 = CFSTR("YES");
  v7 = v6;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Is device in GreenTea: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("GreenTea Status"), v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v10);

  objc_msgSend(v3, "presentViewController:animated:completion:", v9, 1, 0);
  return 1;
}

@end
