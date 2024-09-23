@implementation TraceGuideMeBookmarkRow

- (TraceGuideMeBookmarkRow)initWithBookmarkIndex:(unint64_t)a3 time:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  TraceGuideMeBookmarkRow *v10;
  TraceGuideMeBookmarkRow *v11;
  objc_super v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Guide Me Bookmark %ld"), a3 + 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu:%02lu"), (unint64_t)a4 / 0x3C, (unint64_t)a4 % 0x3C));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("At time: %@"), v8));

  v13.receiver = self;
  v13.super_class = (Class)TraceGuideMeBookmarkRow;
  v10 = -[TraceBookmarkRow initWithName:detail:](&v13, "initWithName:detail:", v7, v9);
  v11 = v10;
  if (v10)
    v10->_bookmarkIndex = a3;

  return v11;
}

- (unint64_t)bookmarkIndex
{
  return self->_bookmarkIndex;
}

@end
