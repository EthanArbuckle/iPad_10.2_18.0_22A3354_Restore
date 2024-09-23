@implementation TFFeedbackForm

- (TFFeedbackForm)initWithTitle:(id)a3 entryGroups:(id)a4
{
  id v6;
  id v7;
  TFFeedbackForm *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSArray *entryGroups;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TFFeedbackForm;
  v8 = -[TFFeedbackForm init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    entryGroups = v8->_entryGroups;
    v8->_entryGroups = (NSArray *)v11;

  }
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)entryGroups
{
  return self->_entryGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryGroups, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
