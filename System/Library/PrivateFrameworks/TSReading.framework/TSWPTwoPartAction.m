@implementation TSWPTwoPartAction

- (TSWPTwoPartAction)initWithStartAction:(id)a3 cancelAction:(id)a4 finishAction:(id)a5
{
  TSWPTwoPartAction *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSWPTwoPartAction;
  v8 = -[TSWPTwoPartAction init](&v10, sel_init);
  if (v8)
  {
    v8->_startAction = (id)objc_msgSend(a3, "copy");
    v8->_cancelAction = (id)objc_msgSend(a4, "copy");
    v8->_finishAction = (id)objc_msgSend(a5, "copy");
  }
  return v8;
}

+ (id)actionWithStartAction:(id)a3 cancelAction:(id)a4 finishAction:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartAction:cancelAction:finishAction:", a3, a4, a5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTwoPartAction;
  -[TSWPTwoPartAction dealloc](&v3, sel_dealloc);
}

- (void)performStartAction
{
  (*((void (**)(void))self->_startAction + 2))();
}

- (void)performFinishAction
{
  (*((void (**)(void))self->_finishAction + 2))();
}

- (void)cancel
{
  (*((void (**)(void))self->_cancelAction + 2))();
}

- (BOOL)performImmediately
{
  return self->_performImmediately;
}

- (void)setPerformImmediately:(BOOL)a3
{
  self->_performImmediately = a3;
}

@end
