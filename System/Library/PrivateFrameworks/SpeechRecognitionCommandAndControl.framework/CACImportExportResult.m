@implementation CACImportExportResult

- (CACImportExportResult)initWithError:(id)a3 title:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  CACImportExportResult *v11;
  CACImportExportResult *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CACImportExportResult init](self, "init");
  v12 = v11;
  if (v11)
  {
    -[CACImportExportResult setError:](v11, "setError:", v8);
    -[CACImportExportResult setTitle:](v12, "setTitle:", v9);
    -[CACImportExportResult setMessage:](v12, "setMessage:", v10);
  }

  return v12;
}

- (void)displayAlertForViewController:(id)a3
{
  void *v4;
  NSError *error;
  void *title;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x24BEBD3B0];
  error = self->_error;
  if (error)
  {
    -[NSError localizedDescription](self->_error, "localizedDescription");
    title = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    title = self->_title;
  }
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", title, self->_message, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (error)

  v8 = (void *)MEMORY[0x24BEBD3A8];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommonStrings.OK"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, &__block_literal_global_45);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10);

  objc_msgSend(v11, "presentViewController:animated:completion:", v7, 1, 0);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
