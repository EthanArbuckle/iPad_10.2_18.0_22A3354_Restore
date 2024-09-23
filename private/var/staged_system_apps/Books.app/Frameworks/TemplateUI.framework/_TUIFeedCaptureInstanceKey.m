@implementation _TUIFeedCaptureInstanceKey

- (_TUIFeedCaptureInstanceKey)initWithInstance:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  _TUIFeedCaptureInstanceKey *v9;
  _TUIFeedCaptureInstanceKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIFeedCaptureInstanceKey;
  v9 = -[_TUIFeedCaptureInstanceKey init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_instance, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSObject hash](self->_instance, "hash");
  return (unint64_t)-[NSObject hash](self->_options, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  NSObject *instance;
  NSObject *options;

  v4 = a3;
  v6 = objc_opt_class(v4, v5);
  if (v6 == objc_opt_class(self, v7)
    && ((instance = self->_instance, instance == v4[1])
     || -[NSObject isEqual:](instance, "isEqual:")))
  {
    options = self->_options;
    if (options == v4[2])
      v8 = 1;
    else
      v8 = -[NSObject isEqual:](options, "isEqual:");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSObject)instance
{
  return self->_instance;
}

- (NSObject)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_instance, 0);
}

@end
