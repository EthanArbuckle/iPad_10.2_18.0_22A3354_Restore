@implementation RichMapsActivityCreatingTaskImpl

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RichMapsActivity shortDescription](self->_computedRichMapsActivity, "shortDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p %@"), v5, self, v6));

  return v7;
}

- (void)performTaskWithCompletion:(id)a3
{
  id v4;
  id completion;

  v4 = objc_msgSend(a3, "copy");
  completion = self->_completion;
  self->_completion = v4;

  -[RichMapsActivityCreatingTaskImpl performTask](self, "performTask");
}

- (void)taskStarted
{
  id v3;
  NSObject *v4;
  int v5;
  RichMapsActivityCreatingTaskImpl *v6;

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "taskStarted %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)taskFinished:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void (**completion)(id, RichMapsActivity *, _QWORD);
  id v9;
  int v10;
  RichMapsActivityCreatingTaskImpl *v11;

  v5 = a3;
  objc_storeStrong((id *)&self->_computedRichMapsActivity, a3);
  v6 = sub_100431A4C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "taskFinished %@", (uint8_t *)&v10, 0xCu);
  }

  completion = (void (**)(id, RichMapsActivity *, _QWORD))self->_completion;
  if (completion)
  {
    completion[2](completion, self->_computedRichMapsActivity, 0);
    v9 = self->_completion;
    self->_completion = 0;

  }
}

- (void)taskFailed
{
  id v3;
  NSObject *v4;
  id completion;
  id v6;
  int v7;
  RichMapsActivityCreatingTaskImpl *v8;

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "taskFailed %@", (uint8_t *)&v7, 0xCu);
  }

  completion = self->_completion;
  if (completion)
  {
    (*((void (**)(id, _QWORD, _QWORD))completion + 2))(completion, 0, 0);
    v6 = self->_completion;
    self->_completion = 0;

  }
}

- (RichMapsActivity)computedRichMapsActivity
{
  return self->_computedRichMapsActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedRichMapsActivity, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
