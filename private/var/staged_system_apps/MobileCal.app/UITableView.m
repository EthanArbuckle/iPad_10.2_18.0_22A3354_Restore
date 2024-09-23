@implementation UITableView

- (void)setEditorBackgroundColor:(id)a3
{
  id v4;

  v4 = a3;
  if ((id)-[UITableView style](self, "style") == (id)1)
    -[UITableView setBackgroundColor:](self, "setBackgroundColor:", v4);

}

@end
