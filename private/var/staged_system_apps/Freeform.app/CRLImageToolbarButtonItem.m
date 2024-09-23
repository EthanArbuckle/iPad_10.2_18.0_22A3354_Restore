@implementation CRLImageToolbarButtonItem

- (CRLImageToolbarButtonItem)initWithImageNamed:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  CRLImageToolbarButtonItem *v10;
  CRLImageToolbarButtonItem *v11;
  uint64_t v12;
  CRLImageToolbarButton *button;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CRLImageToolbarButtonItem;
  v10 = -[CRLImageToolbarButtonItem init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    -[CRLImageToolbarButtonItem setStyle:](v10, "setStyle:", 0);
    -[CRLImageToolbarButtonItem setTarget:](v11, "setTarget:", v9);
    -[CRLImageToolbarButtonItem setAction:](v11, "setAction:", a5);
    v12 = objc_claimAutoreleasedReturnValue(+[CRLImageToolbarButton buttonWithType:](CRLImageToolbarButton, "buttonWithType:", 1));
    button = v11->_button;
    v11->_button = (CRLImageToolbarButton *)v12;

    -[CRLImageToolbarButton addTarget:action:forControlEvents:](v11->_button, "addTarget:action:forControlEvents:", v11, "didTapButton:withEvent:", 64);
    -[CRLImageToolbarButton setImageNamed:](v11->_button, "setImageNamed:", v8);
    -[CRLImageToolbarButtonItem setCustomView:](v11, "setCustomView:", v11->_button);
  }

  return v11;
}

+ (id)itemWithImageNamed:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithImageNamed:target:action:", v9, v8, a5);

  return v10;
}

- (CRLImageToolbarButtonItem)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124ED98);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLImageToolbarButtonItem init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m";
    v17 = 1024;
    v18 = 40;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124EDB8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButtonItem init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 40, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLImageToolbarButtonItem init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLImageToolbarButtonItem)initWithCoder:(id)a3
{
  id v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v3 = a3;
  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124EDD8);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v14 = v4;
    v15 = 2082;
    v16 = "-[CRLImageToolbarButtonItem initWithCoder:]";
    v17 = 2082;
    v18 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m";
    v19 = 1024;
    v20 = 44;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124EDF8);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    v8 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v14 = v4;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButtonItem initWithCoder:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 44, 0, "Do not call method");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLImageToolbarButtonItem initWithCoder:]"));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v11, 0));

  objc_exception_throw(v12);
}

- (void)setButtonImageWithImageNamed:(id)a3
{
  -[CRLImageToolbarButton setImageNamed:](self->_button, "setImageNamed:", a3);
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isSymbolImage"))
  {
    -[CRLImageToolbarButton setImage:](self->_button, "setImage:", v4);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EE18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1C554();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EE38);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButtonItem setImage:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 58, 0, "Only symbol images are supported");

  }
}

- (void)setLandscapeImagePhone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isSymbolImage"))
  {
    -[CRLImageToolbarButton setImage:](self->_button, "setImage:", v4);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EE58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1C5D8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EE78);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButtonItem setLandscapeImagePhone:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 68, 0, "Only symbol images are supported");

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CRLImageToolbarButtonItem;
  -[CRLImageToolbarButtonItem setEnabled:](&v5, "setEnabled:");
  -[CRLImageToolbarButton setEnabled:](self->_button, "setEnabled:", v3);
}

- (BOOL)isOn
{
  return -[CRLImageToolbarButton isOn](self->_button, "isOn");
}

- (void)setOn:(BOOL)a3
{
  -[CRLImageToolbarButton setOn:](self->_button, "setOn:", a3);
}

- (void)didTapButton:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  if (-[CRLImageToolbarButtonItem action](self, "action"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = -[CRLImageToolbarButtonItem action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageToolbarButtonItem target](self, "target"));
    objc_msgSend(v5, "sendAction:to:from:forEvent:", v6, v7, self, v8);

  }
}

- (CRLImageToolbarButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
