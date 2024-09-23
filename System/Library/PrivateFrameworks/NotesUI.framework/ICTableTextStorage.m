@implementation ICTableTextStorage

- (ICTableTextStorage)initWithDocument:(id)a3
{
  ICTableTextStorage *v3;
  ICTableTextController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTableTextStorage;
  v3 = -[ICTTTextStorage initWithDocument:](&v6, sel_initWithDocument_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(ICTableTextController);
    -[ICTTTextStorage setStyler:](v3, "setStyler:", v4);

  }
  return v3;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = -[ICTTTextStorage length](self, "length");
  v14.receiver = self;
  v14.super_class = (Class)ICTableTextStorage;
  -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](&v14, sel_replaceCharactersInRange_withAttributedString_, location, length, v7);

  if (-[ICTTTextStorage isReadingSelectionFromPasteboard](self, "isReadingSelectionFromPasteboard"))
  {
    v9 = length - v8 + -[ICTTTextStorage length](self, "length");
    -[ICTTTextStorage string](self, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "paragraphRangeForRange:", location, v9);
    v13 = v12;

    -[NSMutableAttributedString ic_convertParagraphStyleToBodyInRange:](self, "ic_convertParagraphStyleToBodyInRange:", v11, v13);
  }
}

- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  objc_msgSend(a3, "styleTextInRange:", a5.location, a5.length);
}

@end
