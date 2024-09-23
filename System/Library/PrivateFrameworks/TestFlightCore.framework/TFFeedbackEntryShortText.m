@implementation TFFeedbackEntryShortText

- (TFFeedbackEntryShortText)initWithIdentifier:(id)a3 title:(id)a4 placeholder:(id)a5 contentType:(unint64_t)a6
{
  id v10;
  TFFeedbackEntryShortText *v11;
  uint64_t v12;
  NSString *placeholder;
  objc_super v15;

  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TFFeedbackEntryShortText;
  v11 = -[TFFeedbackEntry initWithType:identifier:title:](&v15, sel_initWithType_identifier_title_, 0, a3, a4);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    placeholder = v11->_placeholder;
    v11->_placeholder = (NSString *)v12;

    v11->_contentType = a6;
  }

  return v11;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
}

@end
