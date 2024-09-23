@implementation TFFeedbackEntry

- (TFFeedbackEntry)initWithType:(unint64_t)a3 identifier:(id)a4 title:(id)a5
{
  id v8;
  id v9;
  TFFeedbackEntry *v10;
  TFFeedbackEntry *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *title;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TFFeedbackEntry;
  v10 = -[TFFeedbackEntry init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v14;

  }
  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
