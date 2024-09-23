@implementation ContainerObserver

- (ContainerObserver)init
{
  ContainerObserver *v2;
  NSDateFormatter *v3;
  NSDateFormatter *dateFormatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ContainerObserver;
  v2 = -[ContainerObserver init](&v6, "init");
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    -[NSDateFormatter setDateStyle:](v3, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v3, "setTimeStyle:", 2);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

  }
  return v2;
}

- (void)containerDidEnterForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  BRCTermDumper *dumper;
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerObserver dateFormatter](self, "dateFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v6)));
  v8 = objc_msgSend(v7, "UTF8String");

  -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", 2, 2);
  dumper = self->_dumper;
  v10 = objc_retainAutorelease(v4);
  v11 = objc_msgSend(v10, "UTF8String");

  -[BRCTermDumper write:](dumper, "write:", "%s: %s is now foreground\n", v8, v11);
  -[BRCTermDumper reset](self->_dumper, "reset");
}

- (void)containerDidEnterBackground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  BRCTermDumper *dumper;
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerObserver dateFormatter](self, "dateFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v6)));
  v8 = objc_msgSend(v7, "UTF8String");

  dumper = self->_dumper;
  v10 = objc_retainAutorelease(v4);
  v11 = objc_msgSend(v10, "UTF8String");

  -[BRCTermDumper write:](dumper, "write:", "%s: %s is now background\n", v8, v11);
}

- (BRCTermDumper)dumper
{
  return (BRCTermDumper *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDumper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
}

@end
