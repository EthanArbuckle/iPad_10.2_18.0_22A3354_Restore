@implementation MailStatusIndeterminateView

- (void)updateWithStatusInfo:(id)a3
{
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "status"));
  v4 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v5);
  -[MailStatusLabelView setPrimaryLabelText:](self, "setPrimaryLabelText:", v4);

}

@end
