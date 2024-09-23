@implementation ICNotesEditorSettings

- (void)setZoomOutOnScroll:(BOOL)a3
{
  self->_zoomOutOnScroll = a3;
}

- (void)setStickyHeaderWhenZoomed:(BOOL)a3
{
  self->_stickyHeaderWhenZoomed = a3;
}

- (void)setSnapToPDFWhileDraggingVelocityLimit:(double)a3
{
  self->_snapToPDFWhileDraggingVelocityLimit = a3;
}

- (void)setSnapToPDFWhileDraggingDistance:(double)a3
{
  self->_snapToPDFWhileDraggingDistance = a3;
}

- (void)setSnapToPDFDistanceForEndDragging:(double)a3
{
  self->_snapToPDFDistanceForEndDragging = a3;
}

- (void)setShadowLength:(double)a3
{
  self->_shadowLength = a3;
}

- (void)setRubberBandingEnabled:(BOOL)a3
{
  self->_rubberBandingEnabled = a3;
}

- (void)setRubberBandRange:(double)a3
{
  self->_rubberBandRange = a3;
}

- (void)setRubberBandDragDistance:(double)a3
{
  self->_rubberBandDragDistance = a3;
}

- (void)setRubberBandCatchUpAnimationDuration:(double)a3
{
  self->_rubberBandCatchUpAnimationDuration = a3;
}

- (void)setPageShadowEnabled:(BOOL)a3
{
  self->_pageShadowEnabled = a3;
}

- (void)setMaxShadowOpacity:(double)a3
{
  self->_maxShadowOpacity = a3;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNotesEditorSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[ICNotesEditorSettings setSnapToPDFWhileDraggingDistance:](self, "setSnapToPDFWhileDraggingDistance:", 5.0);
  -[ICNotesEditorSettings setSnapToPDFWhileDraggingVelocityLimit:](self, "setSnapToPDFWhileDraggingVelocityLimit:", 100.0);
  -[ICNotesEditorSettings setSnapToPDFDistanceForEndDragging:](self, "setSnapToPDFDistanceForEndDragging:", 30.0);
  -[ICNotesEditorSettings setAttachmentViewSnapToContentHeightThreshold:](self, "setAttachmentViewSnapToContentHeightThreshold:", 0.05);
  -[ICNotesEditorSettings setRubberBandingEnabled:](self, "setRubberBandingEnabled:", 0);
  -[ICNotesEditorSettings setRubberBandRange:](self, "setRubberBandRange:", 66.0);
  -[ICNotesEditorSettings setRubberBandDragDistance:](self, "setRubberBandDragDistance:", 200.0);
  -[ICNotesEditorSettings setRubberBandCatchUpAnimationDuration:](self, "setRubberBandCatchUpAnimationDuration:", 0.15);
  -[ICNotesEditorSettings setZoomOutOnScroll:](self, "setZoomOutOnScroll:", 0);
  -[ICNotesEditorSettings setStickyHeaderWhenZoomed:](self, "setStickyHeaderWhenZoomed:", 1);
  -[ICNotesEditorSettings setPageShadowEnabled:](self, "setPageShadowEnabled:", 0);
  -[ICNotesEditorSettings setMaxShadowOpacity:](self, "setMaxShadowOpacity:", 0.105);
  -[ICNotesEditorSettings setShadowLength:](self, "setShadowLength:", 4.0);
}

- (void)setAttachmentViewSnapToContentHeightThreshold:(double)a3
{
  self->_attachmentViewSnapToContentHeightThreshold = a3;
}

- (BOOL)isRubberBandingEnabled
{
  return self->_rubberBandingEnabled;
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
  id v17;
  id v18;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[11];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v17 = (id)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Snap While Dragging Distance"), CFSTR("snapToPDFWhileDraggingDistance"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "between:and:", 0.0, 500.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "precision:", 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v46;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Snap While Dragging Velocity Limit"), CFSTR("snapToPDFWhileDraggingVelocityLimit"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "between:and:", 0.0, 2000.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "precision:", 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v43;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Snap to PDF Distance - End Dragging"), CFSTR("snapToPDFDistanceForEndDragging"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "between:and:", 0.0, 500.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "precision:", 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v40;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Snap to Text View Height Threshold"), CFSTR("attachmentViewSnapToContentHeightThreshold"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "between:and:", 0.0, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "precision:", 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v37;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Rubber Banding Enabled"), CFSTR("rubberBandingEnabled"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v36;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Rubber Band Range"), CFSTR("rubberBandRange"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "between:and:", 0.0, 1000.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "precision:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v33;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Break Rubber Band Drag Distance"), CFSTR("rubberBandDragDistance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", 0.0, 1000.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "precision:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v30;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Rubber Band Catch Up Animation Duration"), CFSTR("rubberBandCatchUpAnimationDuration"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "between:and:", 0.0, 5.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "precision:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v27;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Out on Scroll"), CFSTR("zoomOutOnScroll"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v26;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Sticky Header When Zoomed"), CFSTR("stickyHeaderWhenZoomed"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = v25;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Page Shadows Enabled"), CFSTR("pageShadowEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[10] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v23, CFSTR("PDF Attachment Metrics"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v22;
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Maximum Shadow Opacity"), CFSTR("maxShadowOpacity"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "precision:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v19;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Length"), CFSTR("shadowLength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.0, 50.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v7, CFSTR("PDF Header Metrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v8;
  v9 = (void *)MEMORY[0x1E0D83078];
  v10 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:action:", CFSTR("Restore Defaults"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "moduleWithTitle:contents:", 0, v15);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)snapToPDFWhileDraggingDistance
{
  return self->_snapToPDFWhileDraggingDistance;
}

- (double)snapToPDFWhileDraggingVelocityLimit
{
  return self->_snapToPDFWhileDraggingVelocityLimit;
}

- (double)snapToPDFDistanceForEndDragging
{
  return self->_snapToPDFDistanceForEndDragging;
}

- (double)attachmentViewSnapToContentHeightThreshold
{
  return self->_attachmentViewSnapToContentHeightThreshold;
}

- (double)rubberBandRange
{
  return self->_rubberBandRange;
}

- (double)rubberBandDragDistance
{
  return self->_rubberBandDragDistance;
}

- (double)rubberBandCatchUpAnimationDuration
{
  return self->_rubberBandCatchUpAnimationDuration;
}

- (BOOL)zoomOutOnScroll
{
  return self->_zoomOutOnScroll;
}

- (BOOL)stickyHeaderWhenZoomed
{
  return self->_stickyHeaderWhenZoomed;
}

- (BOOL)pageShadowEnabled
{
  return self->_pageShadowEnabled;
}

- (double)maxShadowOpacity
{
  return self->_maxShadowOpacity;
}

- (double)shadowLength
{
  return self->_shadowLength;
}

@end
