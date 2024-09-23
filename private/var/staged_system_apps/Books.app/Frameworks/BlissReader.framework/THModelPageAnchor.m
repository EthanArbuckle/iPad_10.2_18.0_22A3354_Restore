@implementation THModelPageAnchor

- (THModelPageAnchor)initWithContentNode:(id)a3 relativePageIndex:(unint64_t)a4 presentationType:(id)a5
{
  THModelPageAnchor *v7;
  THModelPageAnchor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THModelPageAnchor;
  v7 = -[THModelBoundAnchor initWithContentNode:](&v10, "initWithContentNode:", a3);
  v8 = v7;
  if (v7)
  {
    -[THModelPageAnchor setRelativePageIndex:](v7, "setRelativePageIndex:", a4);
    -[THModelPageAnchor setPresentationType:](v8, "setPresentationType:", a5);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[THModelPageAnchor setPresentationType:](self, "setPresentationType:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THModelPageAnchor;
  -[THModelBoundAnchor dealloc](&v3, "dealloc");
}

- (unint64_t)absolutePageIndex
{
  if (!-[THPresentationType isPaginated](-[THModelPageAnchor presentationType](self, "presentationType"), "isPaginated"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelPageAnchor absolutePageIndex]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelPageAnchor.m"), 34, CFSTR("absolute page index will likely be wrong in a non-paginated presentation type"));
  return -[THModelNode absolutePageIndexForRelativePageIndex:forPresentationType:](-[THModelBoundAnchor contentNode](self, "contentNode"), "absolutePageIndexForRelativePageIndex:forPresentationType:", -[THModelPageAnchor relativePageIndex](self, "relativePageIndex"), -[THModelPageAnchor presentationType](self, "presentationType"));
}

- (THPresentationType)presentationType
{
  return self->mPresentationType;
}

- (void)setPresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)relativePageIndex
{
  return self->mRelativePageIndex;
}

- (void)setRelativePageIndex:(unint64_t)a3
{
  self->mRelativePageIndex = a3;
}

@end
