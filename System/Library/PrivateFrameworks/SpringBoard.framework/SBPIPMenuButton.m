@implementation SBPIPMenuButton

+ (id)pipMenuButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "buttonFontSize");
  objc_msgSend(v3, "systemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("plus.rectangle.on.rectangle"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v6, 0);
  objc_msgSend(v2, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v8);

  return v2;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBPIPMenuButton;
  v8 = a5;
  -[SBPIPMenuButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v10, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, a3, a4, v8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__SBPIPMenuButton_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  v9[3] = &unk_1E8E9DED8;
  v9[4] = self;
  objc_msgSend(v8, "addAnimations:", v9);

}

uint64_t __83__SBPIPMenuButton_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBPIPMenuButton;
  v8 = a5;
  -[SBPIPMenuButton contextMenuInteraction:willEndForConfiguration:animator:](&v10, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, v8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SBPIPMenuButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v9[3] = &unk_1E8E9DED8;
  v9[4] = self;
  objc_msgSend(v8, "addAnimations:", v9);

}

uint64_t __75__SBPIPMenuButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

@end
