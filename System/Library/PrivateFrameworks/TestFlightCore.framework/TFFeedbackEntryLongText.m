@implementation TFFeedbackEntryLongText

- (TFFeedbackEntryLongText)initWithIdentifier:(id)a3 title:(id)a4 placeholder:(id)a5
{
  id v8;
  TFFeedbackEntryLongText *v9;
  uint64_t v10;
  NSString *placeholder;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TFFeedbackEntryLongText;
  v9 = -[TFFeedbackEntry initWithType:identifier:title:](&v13, sel_initWithType_identifier_title_, 1, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    placeholder = v9->_placeholder;
    v9->_placeholder = (NSString *)v10;

  }
  return v9;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
}

@end
