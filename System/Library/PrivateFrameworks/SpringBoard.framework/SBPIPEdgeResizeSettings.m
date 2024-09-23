@implementation SBPIPEdgeResizeSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPIPEdgeResizeSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_disableCornerResizeForButtons = 0;
  self->_blurNoteWhileResizing = 0;
  self->_liveResizePointerInteractionRegionOuterLength = 10.0;
  self->_liveResizePointerInteractionRegionInnerLength = 10.0;
  self->_liveResizePointerInteractionRegionCornerLength = 25.0;
  self->_hysteresis = 0.0;
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
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[8];

  v35[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_anchorPointSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:childSettingsKeyPath:", CFSTR("Anchor point settings"), v3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Disable Corner Resize For Buttons"), CFSTR("disableCornerResizeForButtons"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Blur Notes PIP while resizing"), CFSTR("blurNoteWhileResizing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_hysteresis);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Hysteresis"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 1.0, 1500.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizePointerInteractionRegionOuterLength);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Pointer Interaction Region Outer Length"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 1.0, 1500.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizePointerInteractionRegionInnerLength);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Pointer Interaction Region Inner Length"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "precision:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 1.0, 1500.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizePointerInteractionRegionCornerLength);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Pointer Interaction Region Corner Length"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 1.0, 1500.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83070];
  v35[0] = v32;
  v35[1] = v31;
  v35[2] = v4;
  v35[3] = v30;
  v35[4] = v33;
  v35[5] = v29;
  v35[6] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:", v23, CFSTR("Edge Resize"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0D83070];
  v34 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "moduleWithTitle:contents:", CFSTR("PIP Edge Resize"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (SBPIPEdgeResizeAnchorPointSettings)anchorPointSettings
{
  return self->_anchorPointSettings;
}

- (void)setAnchorPointSettings:(id)a3
{
  objc_storeStrong((id *)&self->_anchorPointSettings, a3);
}

- (BOOL)disableCornerResizeForButtons
{
  return self->_disableCornerResizeForButtons;
}

- (void)setDisableCornerResizeForButtons:(BOOL)a3
{
  self->_disableCornerResizeForButtons = a3;
}

- (BOOL)blurNoteWhileResizing
{
  return self->_blurNoteWhileResizing;
}

- (void)setBlurNoteWhileResizing:(BOOL)a3
{
  self->_blurNoteWhileResizing = a3;
}

- (double)liveResizePointerInteractionRegionOuterLength
{
  return self->_liveResizePointerInteractionRegionOuterLength;
}

- (void)setLiveResizePointerInteractionRegionOuterLength:(double)a3
{
  self->_liveResizePointerInteractionRegionOuterLength = a3;
}

- (double)liveResizePointerInteractionRegionInnerLength
{
  return self->_liveResizePointerInteractionRegionInnerLength;
}

- (void)setLiveResizePointerInteractionRegionInnerLength:(double)a3
{
  self->_liveResizePointerInteractionRegionInnerLength = a3;
}

- (double)liveResizePointerInteractionRegionCornerLength
{
  return self->_liveResizePointerInteractionRegionCornerLength;
}

- (void)setLiveResizePointerInteractionRegionCornerLength:(double)a3
{
  self->_liveResizePointerInteractionRegionCornerLength = a3;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorPointSettings, 0);
}

@end
