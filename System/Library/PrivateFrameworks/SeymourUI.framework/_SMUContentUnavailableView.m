@implementation _SMUContentUnavailableView

- (void)smu_updateWithType:(int64_t)a3 text:(id)a4 secondaryText:(id)a5 image:(id)a6 buttonTitle:(id)a7 buttonPrimaryAction:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  -[_SMUContentUnavailableView configurationForType:](self, "configurationForType:", a3);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v18);

  objc_msgSend(v22, "setSecondaryText:", v17);
  objc_msgSend(v22, "setImage:", v16);

  objc_msgSend(v22, "buttonProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v15);

  objc_msgSend(v22, "buttonProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPrimaryAction:", v14);

  -[UIContentUnavailableView setConfiguration:](self, "setConfiguration:", v22);
}

- (id)configurationForType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      objc_msgSend(MEMORY[0x24BEBD4E8], "loadingConfiguration");
      self = (_SMUContentUnavailableView *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
      self = (_SMUContentUnavailableView *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      objc_msgSend(MEMORY[0x24BEBD4E8], "emptyConfiguration");
      self = (_SMUContentUnavailableView *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return self;
}

@end
