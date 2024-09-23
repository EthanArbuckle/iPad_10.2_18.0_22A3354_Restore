@implementation ICTableLinkPresentationActivityItemSource

- (ICTableLinkPresentationActivityItemSource)init
{
  -[ICTableLinkPresentationActivityItemSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICTableLinkPresentationActivityItemSource)initWithAttachment:(id)a3
{
  id v4;
  ICTableLinkPresentationActivityItemSource *v5;
  ICTableLinkPresentationActivityItemSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTableLinkPresentationActivityItemSource;
  v5 = -[ICTableLinkPresentationActivityItemSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICTableLinkPresentationActivityItemSource setAttachment:](v5, "setAttachment:", v4);

  return v6;
}

- (id)title
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Table"), CFSTR("Table"), 0, 1);
}

- (id)detail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[ICTableLinkPresentationActivityItemSource attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringsAtRow:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttachment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
