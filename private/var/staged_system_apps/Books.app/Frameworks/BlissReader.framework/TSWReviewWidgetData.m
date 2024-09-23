@implementation TSWReviewWidgetData

- (int64_t)currentPage
{
  return (int64_t)objc_msgSend(-[TSWReviewWidgetData currentPageNumber](self, "currentPageNumber"), "integerValue");
}

- (void)setCurrentPage:(int64_t)a3
{
  -[TSWReviewWidgetData setCurrentPageNumber:](self, "setCurrentPageNumber:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
}

@end
