@implementation MTRadioGroupDescription

- (MTRadioGroupDescription)init
{
  MTRadioGroupDescription *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTRadioGroupDescription;
  v2 = -[MTRadioGroupDescription init](&v4, "init");
  if (v2)
    v2->_radioSettings = CFArrayCreateMutable(0, 0, 0);
  return v2;
}

+ (id)radioGroupWithInitialValue:(unint64_t)a3 changeHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "setValue:", a3);
  objc_msgSend(v7, "setChangeHandler:", v6);

  return v7;
}

- (void)addRadioSetting:(id)a3
{
  CFArrayAppendValue(self->_radioSettings, a3);
}

- (id)settings
{
  CFIndex Count;
  void *v4;
  CFIndex i;
  const void *ValueAtIndex;
  void *v7;

  Count = CFArrayGetCount(self->_radioSettings);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (Count)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_radioSettings, i);
      v7 = (void *)objc_claimAutoreleasedReturnValue(ValueAtIndex);
      objc_msgSend(v4, "addObject:", v7);

    }
  }
  return v4;
}

- (__CFArray)radioSettings
{
  return self->_radioSettings;
}

- (void)setRadioSettings:(__CFArray *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
}

@end
