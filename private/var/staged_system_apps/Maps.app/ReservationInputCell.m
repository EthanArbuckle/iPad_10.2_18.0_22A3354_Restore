@implementation ReservationInputCell

- (void)loadDetailView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  id v18;

  v3 = objc_alloc_init((Class)UITextField);
  -[ReservationInputCell setTextField:](self, "setTextField:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  objc_msgSend(v10, "setTextAlignment:", 2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  objc_msgSend(v11, "setReturnKeyType:", 9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textInputTraits"));
  objc_msgSend(v13, "setContentsIsSingleValue:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  LODWORD(v15) = 1132068864;
  objc_msgSend(v14, "setContentHuggingPriority:forAxis:", 0, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](self, "titleLabel"));
  LODWORD(v17) = 1148846080;
  objc_msgSend(v16, "setContentHuggingPriority:forAxis:", 0, v17);

  -[ReservationInputCell configureTextField](self, "configureTextField");
  v18 = (id)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  -[ReservationTableViewCell setDetailView:](self, "setDetailView:", v18);

}

- (void)configureTextField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const UITextContentType *v12;
  void *v13;
  void *v14;
  UITextContentType v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  switch(-[ReservationInputCell type](self, "type"))
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v3, "setAutocorrectionType:", 1);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v4, "setKeyboardType:", 5);

      v20 = (id)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v20, "setTextContentType:", UITextContentTypeTelephoneNumber);
      goto LABEL_9;
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v5, "setAutocorrectionType:", 1);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v6, "setAutocapitalizationType:", 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v7, "setTextContentType:", UITextContentTypeEmailAddress);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      v20 = v8;
      v9 = 7;
      goto LABEL_7;
    case 2:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v10, "setAutocorrectionType:", 1);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v11, "setAutocapitalizationType:", 1);

      v12 = &UITextContentTypeGivenName;
      goto LABEL_6;
    case 3:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v13, "setAutocorrectionType:", 1);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v14, "setAutocapitalizationType:", 1);

      v12 = &UITextContentTypeFamilyName;
LABEL_6:
      v15 = *v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v16, "setTextContentType:", v15);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      v20 = v8;
      v9 = 0;
LABEL_7:
      objc_msgSend(v8, "setKeyboardType:", v9);
      goto LABEL_9;
    case 4:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v17, "setAutocorrectionType:", 2);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v18, "setAutocapitalizationType:", 2);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v19, "setKeyboardType:", 0);

      v20 = (id)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
      objc_msgSend(v20, "setTextSuggestionDelegate:", 0);
LABEL_9:

      break;
    default:
      return;
  }
}

- (void)doneButtonTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField", a3));
  objc_msgSend(v3, "resignFirstResponder");

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));

  if (v5 == v4)
    -[ReservationInputCell doneButtonTapped:](self, "doneButtonTapped:", v4);

  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if (!objc_msgSend(v10, "length")
    || -[ReservationInputCell type](self, "type")
    || (objc_msgSend(v10, "isEqualToString:", CFSTR(" ")) & 1) != 0)
  {
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10));

  if (!objc_msgSend(v12, "length"))
  {

    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "formattedStringValue"));
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
LABEL_8:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByReplacingCharactersInRange:withString:", location, length, v10));

    -[ReservationInputCell updateTextColorForText:](self, "updateTextColorForText:", v18);
    v16 = 1;
    goto LABEL_9;
  }
  v16 = 0;
LABEL_9:

  return v16;
}

- ($C9619C9B71239767CB6E25A81D0F9A71)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSString *v12;
  NSString *previousValue;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  $C9619C9B71239767CB6E25A81D0F9A71 result;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber defaultCountryCode](CNPhoneNumber, "defaultCountryCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithDigits:countryCode:](CNPhoneNumber, "phoneNumberWithDigits:countryCode:", v5, v6));

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formattedStringValue"));
  v9 = (void *)v8;
  if (v8)
  {
    v16 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v11 = objc_msgSend(v9, "length");
    v12 = (NSString *)objc_msgSend(v9, "copy");
    previousValue = self->_previousValue;
    self->_previousValue = v12;

  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  v14 = v10;
  v15 = (unint64_t)v11;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)updateTextColorForText:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[ReservationInputCell required](self, "required") && !objc_msgSend(v6, "length"))
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v5 = (void *)v4;
  -[ReservationTableViewCell setTitleTextColor:](self, "setTitleTextColor:", v4);

}

- (void)setPlaceholderText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  objc_msgSend(v5, "setPlaceholder:", v4);

}

- (NSString)placeholderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "placeholder"));

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  objc_msgSend(v4, "setText:", v5);

  -[ReservationInputCell updateTextColorForText:](self, "updateTextColorForText:", v5);
}

- (void)setDetailTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (id)detailTextColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textColor"));

  return v3;
}

- (NSString)text
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationInputCell textField](self, "textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[ReservationInputCell configureTextField](self, "configureTextField");
  }
}

- (void)setRequired:(BOOL)a3
{
  id v4;

  if (((!self->_required ^ a3) & 1) == 0)
  {
    self->_required = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ReservationInputCell text](self, "text"));
    -[ReservationInputCell updateTextColorForText:](self, "updateTextColorForText:", v4);

  }
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)required
{
  return self->_required;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_previousValue, 0);
}

@end
