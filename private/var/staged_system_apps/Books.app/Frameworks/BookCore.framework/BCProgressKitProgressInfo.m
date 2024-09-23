@implementation BCProgressKitProgressInfo

- (BCProgressKitProgressInfo)initWithIdentifier:(id)a3 pageRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  BCProgressKitProgressInfo *v9;
  BCProgressKitProgressInfo *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCProgressKitProgressInfo;
  v9 = -[BCProgressKitProgressInfo init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_pageRange.location = location;
    v10->_pageRange.length = length;
    v10->_currentPage = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)isProgressValid
{
  unint64_t v4;
  id v5;
  unint64_t v6;

  if (-[BCProgressKitProgressInfo pageRange](self, "pageRange") == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v4 = -[BCProgressKitProgressInfo currentPage](self, "currentPage");
  v5 = -[BCProgressKitProgressInfo pageRange](self, "pageRange");
  return v4 >= (unint64_t)v5 && v4 - (unint64_t)v5 < v6;
}

- (double)progress
{
  unsigned int v3;
  double result;
  uint64_t v5;
  int64_t v6;
  double v7;
  unint64_t v8;

  v3 = -[BCProgressKitProgressInfo isProgressValid](self, "isProgressValid");
  result = -1.0;
  if (v3)
  {
    -[BCProgressKitProgressInfo pageRange](self, "pageRange", -1.0);
    if (v5)
    {
      v6 = -[BCProgressKitProgressInfo currentPage](self, "currentPage");
      v7 = (double)(unint64_t)(v6 - (_QWORD)-[BCProgressKitProgressInfo pageRange](self, "pageRange") + 1);
      -[BCProgressKitProgressInfo pageRange](self, "pageRange");
      return v7 / (double)v8;
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
}

- (_NSRange)pageRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_pageRange.length;
  location = self->_pageRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPageRange:(_NSRange)a3
{
  self->_pageRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
