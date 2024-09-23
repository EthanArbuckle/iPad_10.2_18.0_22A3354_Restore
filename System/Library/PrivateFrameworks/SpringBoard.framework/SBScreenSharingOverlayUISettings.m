@implementation SBScreenSharingOverlayUISettings

- (void)setDefaultValues
{
  -[SBScreenSharingOverlayUISettings setEdgeSwipeBuffer:](self, "setEdgeSwipeBuffer:", 80.0);
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
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Buffer"), CFSTR("edgeSwipeBuffer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMinValue:", 0.0);
  objc_msgSend(v2, "setMaxValue:", 100.0);
  v3 = (void *)MEMORY[0x1E0D83070];
  v11[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v4, CFSTR("Edge Swipe"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83070];
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moduleWithTitle:contents:", CFSTR("Screen Sharing Overlay UI Settings"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)edgeSwipeBuffer
{
  return self->_edgeSwipeBuffer;
}

- (void)setEdgeSwipeBuffer:(double)a3
{
  self->_edgeSwipeBuffer = a3;
}

@end
