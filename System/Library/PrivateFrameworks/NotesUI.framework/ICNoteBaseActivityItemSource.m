@implementation ICNoteBaseActivityItemSource

- (ICNoteBaseActivityItemSource)initWithTitle:(id)a3
{
  id v4;
  ICNoteBaseActivityItemSource *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteBaseActivityItemSource;
  v5 = -[ICNoteBaseActivityItemSource init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "length"))
    {
      -[ICNoteBaseActivityItemSource setTitle:](v5, "setTitle:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D63BB8], "defaultTitleForEmptyNote");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteBaseActivityItemSource setTitle:](v5, "setTitle:", v6);

    }
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
