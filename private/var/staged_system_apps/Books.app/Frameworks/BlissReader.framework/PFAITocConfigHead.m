@implementation PFAITocConfigHead

- (CGSize)sizeOfPage:(id)a3 readerState:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(objc_msgSend(a3, "properties"), "objectForKey:", CFSTR("width")), a4);
  v7 = v6;
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(objc_msgSend(a3, "properties"), "objectForKey:", CFSTR("height")), a4);
  v9 = v8;
  v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)createPagesWithContentState:(id)a3
{
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  THModelPageInfo *v10;

  v5 = objc_msgSend(a3, "paginatedState");
  v6 = objc_msgSend(v5, "pageCache");
  v10 = -[THModelPageInfo initWithContext:]([THModelPageInfo alloc], "initWithContext:", objc_msgSend(a3, "tspContext"));
  -[PFAITocConfigHead sizeOfPage:readerState:](self, "sizeOfPage:readerState:", objc_msgSend(v6, "pageWithIndex:", 0), a3);
  v9 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithSize:", v7, v8);
  -[THModelPageInfo setGeometry:](v10, "setGeometry:", v9);

  objc_msgSend(objc_msgSend(v5, "contentNodeBody"), "addPageInfo:", v10);
  -[THDrawablesZOrder addDrawable:](-[THModelPageInfo drawablesZOrder](v10, "drawablesZOrder"), "addDrawable:", objc_msgSend(v5, "bodyStorage"));

}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

@end
