@implementation PUSidebarHeaderCell

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUSidebarHeaderCell;
  -[PUSidebarHeaderCell updateConfigurationUsingState:](&v11, sel_updateConfigurationUsingState_, a3);
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSidebarHeaderCell configurationState](self, "configurationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedConfigurationForState:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSidebarHeaderCell contentConfiguration](self, "contentConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v8);

  -[PUSidebarHeaderCell setContentConfiguration:](self, "setContentConfiguration:", v9);
}

@end
