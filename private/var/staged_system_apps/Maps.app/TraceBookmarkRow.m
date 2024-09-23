@implementation TraceBookmarkRow

- (TraceBookmarkRow)initWithName:(id)a3 detail:(id)a4
{
  id v7;
  id v8;
  TraceBookmarkRow *v9;
  TraceBookmarkRow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TraceBookmarkRow;
  v9 = -[TraceBookmarkRow init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_detail, a4);
  }

  return v10;
}

- (void)configureCell:(id)a3
{
  NSString *detail;
  id v5;
  void *v6;
  NSString *name;
  id v8;

  detail = self->_detail;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailTextLabel"));
  objc_msgSend(v6, "setText:", detail);

  name = self->_name;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));

  objc_msgSend(v8, "setText:", name);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
