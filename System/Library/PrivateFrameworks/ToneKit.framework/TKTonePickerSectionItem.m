@implementation TKTonePickerSectionItem

- (id)childItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  -[TKTonePickerSectionItem _parentTonePickerController](self, "_parentTonePickerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pickerRowItemAtIndex:inSectionForItem:", a3, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TKTonePickerSectionItem;
  v4 = a3;
  -[TKPickerSectionItem _appendDescriptionOfAttributesToString:](&v7, sel__appendDescriptionOfAttributesToString_, v4);
  v5 = -[TKTonePickerSectionItem sectionHeader](self, "sectionHeader", v7.receiver, v7.super_class);
  if (v5 > 4)
    v6 = 0;
  else
    v6 = (uint64_t)*(&off_24D380440 + v5);
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withStringValue:toString:](self, "_appendDescriptionOfAttributeNamed:withStringValue:toString:", CFSTR("sectionHeader"), v6, v4);
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withIntegerValue:toString:](self, "_appendDescriptionOfAttributeNamed:withIntegerValue:toString:", CFSTR("regularToneSectionIndex"), -[TKTonePickerSectionItem regularToneSectionIndex](self, "regularToneSectionIndex"), v4);

}

- (unint64_t)sectionHeader
{
  return self->_sectionHeader;
}

- (void)_setSectionHeader:(unint64_t)a3
{
  self->_sectionHeader = a3;
}

- (unint64_t)regularToneSectionIndex
{
  return self->_regularToneSectionIndex;
}

- (void)_setRegularToneSectionIndex:(unint64_t)a3
{
  self->_regularToneSectionIndex = a3;
}

- (TKTonePickerController)_parentTonePickerController
{
  return (TKTonePickerController *)objc_loadWeakRetained((id *)&self->__parentTonePickerController);
}

- (void)_setParentTonePickerController:(id)a3
{
  objc_storeWeak((id *)&self->__parentTonePickerController, a3);
}

- (int64_t)numberOfChildren
{
  return self->_numberOfChildren;
}

- (void)_setNumberOfChildren:(int64_t)a3
{
  self->_numberOfChildren = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__parentTonePickerController);
}

@end
