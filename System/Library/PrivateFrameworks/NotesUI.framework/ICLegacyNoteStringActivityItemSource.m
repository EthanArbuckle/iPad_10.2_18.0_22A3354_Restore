@implementation ICLegacyNoteStringActivityItemSource

- (ICLegacyNoteStringActivityItemSource)initWithTitle:(id)a3 content:(id)a4 plainText:(id)a5
{
  id v8;
  id v9;
  ICLegacyNoteStringActivityItemSource *v10;
  ICLegacyNoteStringActivityItemSource *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICLegacyNoteStringActivityItemSource;
  v10 = -[ICNoteBaseActivityItemSource initWithTitle:](&v13, sel_initWithTitle_, a3);
  v11 = v10;
  if (v10)
  {
    -[ICLegacyNoteStringActivityItemSource setContent:](v10, "setContent:", v8);
    -[ICLegacyNoteStringActivityItemSource setPlainText:](v11, "setPlainText:", v9);
  }

  return v11;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if (objc_msgSend(a4, "isEqual:", *MEMORY[0x1E0CEB1B0]))
    -[ICLegacyNoteStringActivityItemSource plainText](self, "plainText");
  else
    -[ICLegacyNoteStringActivityItemSource content](self, "content");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)plainText
{
  return self->_plainText;
}

- (void)setPlainText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainText, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
