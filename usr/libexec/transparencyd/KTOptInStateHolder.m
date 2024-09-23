@implementation KTOptInStateHolder

- (KTOptInStateHolder)init
{
  KTOptInStateHolder *v2;
  void *v3;
  void *v4;
  KTOptInStateHolder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KTOptInStateHolder;
  v2 = -[KTOptInStateHolder init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTOptInStateHolder setTargetOptInStates:](v2, "setTargetOptInStates:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTOptInStateHolder setCurrentStates:](v2, "setCurrentStates:", v4);

    v5 = v2;
  }

  return v2;
}

- (void)completedCurrentTarget
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInStateHolder targetOptInStates](self, "targetOptInStates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInStateHolder currentTarget](self, "currentTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetResolved"));
    objc_msgSend(v6, "fulfill");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInStateHolder targetOptInStates](self, "targetOptInStates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInStateHolder currentTarget](self, "currentTarget"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

    -[KTOptInStateHolder setCurrentTarget:](self, "setCurrentTarget:", 0);
  }
  else
  {
    if (qword_1002A4580 != -1)
      dispatch_once(&qword_1002A4580, &stru_10023E398);
    v9 = qword_1002A4588;
    if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "asked to complete target, but didn't have one", v10, 2u);
    }
  }

}

- (NSMutableDictionary)targetOptInStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTargetOptInStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)currentStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)currentTarget
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentTarget:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTarget, 0);
  objc_storeStrong((id *)&self->_currentStates, 0);
  objc_storeStrong((id *)&self->_targetOptInStates, 0);
}

@end
