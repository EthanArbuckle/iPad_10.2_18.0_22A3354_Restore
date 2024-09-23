@implementation TKPickerSectionItem

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TKPickerSectionItem;
  v4 = a3;
  -[TKPickerItem _appendDescriptionOfAttributesToString:](&v7, sel__appendDescriptionOfAttributesToString_, v4);
  -[TKPickerSectionItem text](self, "text", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withStringValue:toString:](self, "_appendDescriptionOfAttributeNamed:withStringValue:toString:", CFSTR("text"), v5, v4);

  -[TKPickerSectionItem footerText](self, "footerText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withStringValue:toString:](self, "_appendDescriptionOfAttributeNamed:withStringValue:toString:", CFSTR("footerText"), v6, v4);

}

- (NSString)text
{
  return self->_text;
}

- (void)_setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)_setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
