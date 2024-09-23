@implementation MapsPrintingInfo

- (MapsPrintingInfo)initWithNumberOfPages:(int64_t)a3
{
  MapsPrintingInfo *v4;
  MapsPrintingInfo *v5;
  MapsPrintingInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsPrintingInfo;
  v4 = -[MapsPrintingInfo init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_numberOfPages = a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

@end
