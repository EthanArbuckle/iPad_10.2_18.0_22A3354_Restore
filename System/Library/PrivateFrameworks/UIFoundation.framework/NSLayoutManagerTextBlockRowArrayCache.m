@implementation NSLayoutManagerTextBlockRowArrayCache

- (NSLayoutManagerTextBlockRowArrayCache)initWithRowCharRange:(_NSRange)a3 containerWidth:(double)a4 rowArray:(id)a5 collapseBorders:(BOOL)a6
{
  NSUInteger length;
  NSUInteger location;
  NSLayoutManagerTextBlockRowArrayCache *v11;
  objc_super v13;

  length = a3.length;
  location = a3.location;
  v13.receiver = self;
  v13.super_class = (Class)NSLayoutManagerTextBlockRowArrayCache;
  v11 = -[NSLayoutManagerTextBlockRowArrayCache init](&v13, sel_init);
  v11->_rowCharRange.location = location;
  v11->_rowCharRange.length = length;
  v11->_containerWidth = a4;
  v11->_rowArray = (NSArray *)a5;
  v11->_collapseBorders = a6;
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSLayoutManagerTextBlockRowArrayCache;
  -[NSLayoutManagerTextBlockRowArrayCache dealloc](&v3, sel_dealloc);
}

@end
