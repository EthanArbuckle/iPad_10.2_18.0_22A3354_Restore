@implementation SUConcernListDataSource

- (SUConcernListDataSource)init
{
  SUConcernListDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUConcernListDataSource;
  result = -[SUTableDataSource init](&v3, sel_init);
  if (result)
    result->_selectedConcernIndex = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_concerns = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUConcernListDataSource;
  -[SUTableDataSource dealloc](&v3, sel_dealloc);
}

- (SUTextViewCell)textViewCell
{
  SUTextViewCell *result;

  result = self->_textViewCell;
  if (!result)
  {
    self->_textViewCell = -[SUTextViewCell initWithStyle:reuseIdentifier:]([SUTextViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    -[SUTextContentView setPlaceholder:](-[SUTextViewCell textContentView](self->_textViewCell, "textContentView"), "setPlaceholder:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("COMMENTS_PLACEHOLDER"), &stru_24DE83F60, 0));
    return self->_textViewCell;
  }
  return result;
}

- (id)cellForIndexPath:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "section");
  if (v5 == 1)
    return -[SUConcernListDataSource textViewCell](self, "textViewCell");
  if (v5)
    return 0;
  return -[SUConcernListDataSource _titleCellForIndexPath:](self, "_titleCellForIndexPath:", a3);
}

- (double)cellHeightForIndexPath:(id)a3
{
  double result;
  objc_super v6;

  if (objc_msgSend(a3, "section") == 1)
    return 150.0;
  v6.receiver = self;
  v6.super_class = (Class)SUConcernListDataSource;
  -[SUTableDataSource cellHeightForIndexPath:](&v6, sel_cellHeightForIndexPath_, a3);
  return result;
}

- (int64_t)numberOfSections
{
  if (-[NSArray count](self->_concerns, "count"))
    return 2;
  else
    return 1;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  if (a3 != 1)
  {
    if (!a3)
      return -[NSArray count](self->_concerns, "count");
    return 0;
  }
  return a3;
}

- (int64_t)tableViewStyle
{
  return 1;
}

- (id)_titleCellForIndexPath:(id)a3
{
  uint64_t v4;
  SUTableCell *v5;
  void *v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "row");
  v5 = (SUTableCell *)objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource"), "dequeueReusableCellWithIdentifier:", CFSTR("0"));
  if (!v5)
    v5 = -[SUTableCell initWithStyle:reuseIdentifier:]([SUTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("0"));
  v6 = (void *)-[SUTableCell textLabel](v5, "textLabel");
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v6, "setMinimumScaleFactor:", 0.75);
  objc_msgSend(v6, "setText:", objc_msgSend(-[NSArray objectAtIndex:](self->_concerns, "objectAtIndex:", v4), "title"));
  if (v4 == -[SUConcernListDataSource selectedConcernIndex](self, "selectedConcernIndex"))
  {
    -[SUTableCell setAccessoryType:](v5, "setAccessoryType:", 3);
    v7 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.196078431, 0.309803922, 0.521568627, 1.0);
  }
  else
  {
    -[SUTableCell setAccessoryType:](v5, "setAccessoryType:", 0);
    v7 = objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  }
  objc_msgSend(v6, "setTextColor:", v7);
  return v5;
}

- (NSArray)concerns
{
  return self->_concerns;
}

- (void)setConcerns:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int64_t)selectedConcernIndex
{
  return self->_selectedConcernIndex;
}

- (void)setSelectedConcernIndex:(int64_t)a3
{
  self->_selectedConcernIndex = a3;
}

@end
