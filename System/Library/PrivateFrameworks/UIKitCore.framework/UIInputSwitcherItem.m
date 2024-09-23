@implementation UIInputSwitcherItem

+ (id)switcherItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIInputSwitcherItem setPersistentSelectedIndex:](self, "setPersistentSelectedIndex:", 0);
  -[UIInputSwitcherItem setSwitchIsOnBlock:](self, "setSwitchIsOnBlock:", 0);
  -[UIInputSwitcherItem setSwitchToggleBlock:](self, "setSwitchToggleBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIInputSwitcherItem;
  -[UIInputSwitcherItem dealloc](&v3, sel_dealloc);
}

- (UIInputSwitcherItem)initWithIdentifier:(id)a3
{
  id v4;
  UIInputSwitcherItem *v5;
  UIInputSwitcherItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherItem;
  v5 = -[UIInputSwitcherItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[UIInputSwitcherItem setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (BOOL)isSegmentedItem
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UIInputSwitcherItem segmentImages](self, "segmentImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[UIInputSwitcherItem segmentTitles](self, "segmentTitles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFont, a3);
}

- (BOOL)usesDeviceLanguage
{
  return self->_usesDeviceLanguage;
}

- (void)setUsesDeviceLanguage:(BOOL)a3
{
  self->_usesDeviceLanguage = a3;
}

- (UISwitch)switchControl
{
  return self->_switchControl;
}

- (void)setSwitchControl:(id)a3
{
  objc_storeStrong((id *)&self->_switchControl, a3);
}

- (id)switchIsOnBlock
{
  return self->_switchIsOnBlock;
}

- (void)setSwitchIsOnBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)switchToggleBlock
{
  return self->_switchToggleBlock;
}

- (void)setSwitchToggleBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  self->_selectedSegmentIndex = a3;
}

- (NSArray)segmentTitles
{
  return self->_segmentTitles;
}

- (void)setSegmentTitles:(id)a3
{
  objc_storeStrong((id *)&self->_segmentTitles, a3);
}

- (NSArray)segmentImages
{
  return self->_segmentImages;
}

- (void)setSegmentImages:(id)a3
{
  objc_storeStrong((id *)&self->_segmentImages, a3);
}

- (id)persistentSelectedIndex
{
  return self->_persistentSelectedIndex;
}

- (void)setPersistentSelectedIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_persistentSelectedIndex, 0);
  objc_storeStrong((id *)&self->_segmentImages, 0);
  objc_storeStrong((id *)&self->_segmentTitles, 0);
  objc_storeStrong(&self->_switchToggleBlock, 0);
  objc_storeStrong(&self->_switchIsOnBlock, 0);
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
