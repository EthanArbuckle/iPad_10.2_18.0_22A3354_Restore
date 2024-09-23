@implementation TSKAnnotationAuthorTextHighlightColorProvider

- (TSKAnnotationAuthorTextHighlightColorProvider)initWithAnnotationAuthor:(id)a3
{
  void *v5;
  uint64_t v6;
  TSKAnnotationAuthorTextHighlightColorProvider *v7;
  objc_super v9;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAnnotationAuthorTextHighlightColorProvider initWithAnnotationAuthor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 540, CFSTR("Invalid parameter not satisfying: %s"), "annotationAuthor != nil");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSKAnnotationAuthorTextHighlightColorProvider;
  v7 = -[TSKAnnotationAuthorTextHighlightColorProvider init](&v9, sel_init);
  if (v7)
    v7->mAnnotationAuthor = (TSKAnnotationAuthor *)a3;
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKAnnotationAuthorTextHighlightColorProvider;
  -[TSKAnnotationAuthorTextHighlightColorProvider dealloc](&v3, sel_dealloc);
}

- (CGColor)cgColor
{
  return (CGColor *)-[TSUColor CGColor](-[TSKAnnotationAuthor textHighlightColor](self->mAnnotationAuthor, "textHighlightColor"), "CGColor");
}

@end
