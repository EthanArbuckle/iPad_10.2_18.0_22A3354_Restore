@implementation PFAIHead

- (CGSize)sizeOfPage:(id)a3 contentState:(id)a4
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
  char *v5;
  char *v6;
  char *i;
  id v8;
  id v9;
  THModelPageInfo *v10;
  double v11;
  double v12;
  id v13;

  v5 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "paginatedState"), "pageCache"), "pageCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = objc_msgSend(a3, "paginatedState");
      v9 = objc_msgSend(v8, "pageCache");
      v10 = -[THModelPageInfo initWithContext:]([THModelPageInfo alloc], "initWithContext:", objc_msgSend(a3, "tspContext"));
      -[PFAIHead sizeOfPage:contentState:](self, "sizeOfPage:contentState:", objc_msgSend(v9, "pageWithIndex:", i), a3);
      v13 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithSize:", v11, v12);
      -[THModelPageInfo setGeometry:](v10, "setGeometry:", v13);

      objc_msgSend(objc_msgSend(v8, "contentNodeBody"), "addPageInfo:", v10);
      -[THDrawablesZOrder addDrawable:](-[THModelPageInfo drawablesZOrder](v10, "drawablesZOrder"), "addDrawable:", objc_msgSend(v8, "bodyStorage"));

    }
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  -[PFAIHead createPagesWithContentState:](self, "createPagesWithContentState:");
  objc_msgSend(a3, "resetTotalTextRead");
}

@end
