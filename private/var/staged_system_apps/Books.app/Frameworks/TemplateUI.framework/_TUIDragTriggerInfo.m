@implementation _TUIDragTriggerInfo

- (_TUIDragTriggerInfo)initWithActionObject:(id)a3 behavior:(id)a4 arguments:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TUIDragTriggerInfo *v12;
  _TUIDragTriggerInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_TUIDragTriggerInfo;
  v12 = -[_TUIDragTriggerInfo init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_actionObject, a3);
    objc_storeStrong((id *)&v13->_behavior, a4);
    objc_storeStrong((id *)&v13->_arguments, a5);
  }

  return v13;
}

- (NSString)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)actionObject
{
  return self->_actionObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionObject, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
