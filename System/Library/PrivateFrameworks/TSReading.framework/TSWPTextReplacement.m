@implementation TSWPTextReplacement

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextReplacement;
  -[TSWPTextReplacement dealloc](&v3, sel_dealloc);
}

- (void)performWithStorage:(id)a3 delta:(int64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5 replaceBlock:(id)a6
{
  TSWPSelection *selection;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  selection = self->_selection;
  if (a4)
  {
    v11 = -[TSWPSelection range](self->_selection, "range") + a4;
    -[TSWPSelection range](self->_selection, "range");
    selection = -[TSWPSelection copyWithNewRange:](selection, "copyWithNewRange:", v11, v12);

    self->_selection = selection;
  }
  (*((void (**)(id, TSWPSelection *, NSString *))a6 + 2))(a6, selection, self->_string);
  v13 = -[TSWPTextReplacement insertedRange](self, "insertedRange");
  objc_msgSend(a3, "p_handleChangeSplittingForInsertedRange:changeSession:undoTransaction:", v13, v14, 0, a5);
}

- (_NSRange)insertedRange
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[TSWPSelection range](self->_selection, "range");
  v4 = -[NSString length](self->_string, "length");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (int64_t)delta
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString length](self->_string, "length");
  -[TSWPSelection range](self->_selection, "range");
  return v3 - v4;
}

- (TSWPTextReplacement)initWithSelection:(id)a3 string:(id)a4
{
  TSWPTextReplacement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSWPTextReplacement;
  v6 = -[TSWPTextReplacement init](&v8, sel_init);
  if (v6)
  {
    v6->_selection = (TSWPSelection *)a3;
    v6->_string = (NSString *)a4;
  }
  return v6;
}

- (unint64_t)targetCharIndex
{
  return -[TSWPSelection range](self->_selection, "range");
}

@end
