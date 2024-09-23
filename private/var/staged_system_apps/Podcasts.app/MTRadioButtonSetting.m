@implementation MTRadioButtonSetting

- (MTRadioGroupDescription)radioGroup
{
  return self->_radioGroup;
}

- (void)setRadioGroup:(id)a3
{
  objc_storeStrong((id *)&self->_radioGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioGroup, 0);
}

@end
