@implementation VSRecognitionResultHandlingRequest

- (VSRecognitionResultHandlingRequest)initWithHandler:(id)a3 results:(id)a4
{
  VSRecognitionResultHandlingRequest *v6;

  v6 = -[VSRecognitionResultHandlingRequest init](self, "init");
  if (v6)
  {
    v6->_handler = (VSRecognitionResultHandler *)a3;
    v6->_results = (NSArray *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSRecognitionResultHandlingRequest;
  -[VSRecognitionResultHandlingRequest dealloc](&v3, sel_dealloc);
}

- (id)results
{
  return self->_results;
}

- (id)handler
{
  return self->_handler;
}

- (void)setNextAction:(id)a3
{
  VSRecognitionAction *action;
  VSRecognitionAction *v6;

  action = self->_action;
  if (action != a3)
  {
    v6 = action;
    self->_action = (VSRecognitionAction *)a3;
  }
}

- (id)nextAction
{
  return self->_action;
}

@end
