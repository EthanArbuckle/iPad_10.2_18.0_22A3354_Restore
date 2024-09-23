@implementation ICNoteStringActivityItemSource

- (ICNoteStringActivityItemSource)init
{
  -[ICNoteStringActivityItemSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICNoteStringActivityItemSource)initWithTitle:(id)a3 attributedStringCreator:(id)a4
{
  id v6;
  ICNoteStringActivityItemSource *v7;
  ICNoteStringActivityItemSource *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICNoteStringActivityItemSource;
  v7 = -[ICNoteBaseActivityItemSource initWithTitle:](&v10, sel_initWithTitle_, a3);
  v8 = v7;
  if (v6)
  {
    -[ICNoteStringActivityItemSource setAttributedStringCreator:](v7, "setAttributedStringCreator:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "attributedStringCreator", "-[ICNoteStringActivityItemSource initWithTitle:attributedStringCreator:]", 1, 0, CFSTR("attributedStringCreator is nil"));

    v8 = 0;
  }

  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_opt_new();
}

- (BOOL)allowsAttributedStringForActivityType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = allowsAttributedStringForActivityType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&allowsAttributedStringForActivityType__onceToken, &__block_literal_global_60);
  v5 = objc_msgSend((id)allowsAttributedStringForActivityType__s_activitiesSupportingAttributedString, "containsObject:", v4);

  return v5;
}

void __72__ICNoteStringActivityItemSource_allowsAttributedStringForActivityType___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  if (!allowsAttributedStringForActivityType__s_activitiesSupportingAttributedString)
  {
    v0 = objc_alloc(MEMORY[0x1E0C99E60]);
    v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0CEB1F0], *MEMORY[0x1E0CEB218], *MEMORY[0x1E0CEB1E0], *MEMORY[0x1E0CEB1D0], *MEMORY[0x1E0CEB200], 0);
    v2 = (void *)allowsAttributedStringForActivityType__s_activitiesSupportingAttributedString;
    allowsAttributedStringForActivityType__s_activitiesSupportingAttributedString = v1;

  }
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEB1D0]) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[ICNoteStringActivityItemSource attributedString](self, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[ICNoteStringActivityItemSource attributedStringCreator](self, "attributedStringCreator");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteStringActivityItemSource setAttributedString:](self, "setAttributedString:", v9);

    }
    v10 = -[ICNoteStringActivityItemSource allowsAttributedStringForActivityType:](self, "allowsAttributedStringForActivityType:", v5);
    -[ICNoteStringActivityItemSource attributedString](self, "attributedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (!v10)
    {
      objc_msgSend(v11, "string");
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v12;
    }
  }

  return v6;
}

- (id)attributedStringCreator
{
  return self->_attributedStringCreator;
}

- (void)setAttributedStringCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong(&self->_attributedStringCreator, 0);
}

@end
