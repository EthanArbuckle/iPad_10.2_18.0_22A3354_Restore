@implementation SFShareAudioBringCloseViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *cancelButton;
  void *v10;
  objc_super v11;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v11.receiver = self;
  v11.super_class = (Class)SFShareAudioBringCloseViewController;
  -[SFShareAudioBaseViewController viewWillAppear:](&v11, sel_viewWillAppear_, v3);
  -[SFShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizedStringEx();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->super._titleLabel, "setText:", v6);

  SFAddSuffixForCurrentDeviceClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizedStringEx();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_infoLabel, "setText:", v8);

  -[SFShareAudioBringCloseViewController _cycleProductImage](self, "_cycleProductImage");
  cancelButton = self->_cancelButton;
  SFLocalizedStringForKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](cancelButton, "setTitle:forState:", v10, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  OS_dispatch_source *cycleImageTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  objc_super v8;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8.receiver = self;
  v8.super_class = (Class)SFShareAudioBringCloseViewController;
  -[SFShareAudioBaseViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  cycleImageTimer = self->_cycleImageTimer;
  if (cycleImageTimer)
  {
    v6 = cycleImageTimer;
    dispatch_source_cancel(v6);
    v7 = self->_cycleImageTimer;
    self->_cycleImageTimer = 0;

  }
}

- (void)eventCancel:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFShareAudioViewController reportUserCancelled](self->super._mainController, "reportUserCancelled");

}

- (void)_cycleProductImage
{
  NSMutableArray *v3;
  NSMutableArray *cycleImageArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  OS_dispatch_source *v19;
  OS_dispatch_source *cycleImageTimer;
  unint64_t cycleNextIndex;
  NSMutableArray *v22;
  void *v23;
  _QWORD handler[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!self->_cycleImageArray)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    cycleImageArray = self->_cycleImageArray;
    self->_cycleImageArray = v3;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = objc_msgSend(&unk_24CE21E68, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(&unk_24CE21E68);
          objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](self->_cycleImageArray, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(&unk_24CE21E68, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v6);
    }
    v10 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationWithHierarchicalColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", 3, 2, 120.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationByApplyingConfiguration:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_shareImageView, "setPreferredSymbolConfiguration:", v14);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_shareImageView, "setTintColor:", v15);

  }
  if (self->_cycleImageTimer)
  {
    objc_msgSend(MEMORY[0x24BDE57E8], "animation");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject setDuration:](v16, "setDuration:", 0.5);
    -[NSObject setType:](v16, "setType:", *MEMORY[0x24BDE5E30]);
    -[NSObject setSubtype:](v16, "setSubtype:", *MEMORY[0x24BDE5E18]);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setTimingFunction:](v16, "setTimingFunction:", v17);

    -[UIImageView layer](self->_shareImageView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnimation:forKey:", v16, 0);

  }
  else
  {
    v19 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    cycleImageTimer = self->_cycleImageTimer;
    self->_cycleImageTimer = v19;
    v16 = v19;

    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __58__SFShareAudioBringCloseViewController__cycleProductImage__block_invoke;
    handler[3] = &unk_24CE0ED80;
    handler[4] = self;
    dispatch_source_set_event_handler(v16, handler);
    CUDispatchTimerSet();
    dispatch_activate(v16);
  }

  cycleNextIndex = self->_cycleNextIndex;
  if (-[NSMutableArray count](self->_cycleImageArray, "count") > cycleNextIndex)
  {
    v22 = self->_cycleImageArray;
    ++self->_cycleNextIndex;
    -[NSMutableArray objectAtIndexedSubscript:](v22, "objectAtIndexedSubscript:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_shareImageView, "setImage:", v23);

    self->_cycleNextIndex %= (unint64_t)-[NSMutableArray count](self->_cycleImageArray, "count");
  }
}

uint64_t __58__SFShareAudioBringCloseViewController__cycleProductImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cycleProductImage");
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shareImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_cycleImageTimer, 0);
  objc_storeStrong((id *)&self->_cycleImageArray, 0);
}

@end
