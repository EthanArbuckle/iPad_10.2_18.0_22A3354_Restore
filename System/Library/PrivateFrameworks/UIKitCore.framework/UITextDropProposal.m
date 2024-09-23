@implementation UITextDropProposal

- (UITextDropProposal)initWithDropOperation:(unint64_t)a3
{
  UITextDropProposal *v3;
  UITextDropProposal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextDropProposal;
  v3 = -[UIDropProposal initWithDropOperation:](&v6, sel_initWithDropOperation_, a3);
  v4 = v3;
  if (v3)
  {
    -[UIDropProposal setPrecise:](v3, "setPrecise:", 1);
    -[UITextDropProposal setDropAction:](v4, "setDropAction:", 0);
    -[UITextDropProposal setUseFastSameViewOperations:](v4, "setUseFastSameViewOperations:", 1);
    -[UITextDropProposal setDropProgressMode:](v4, "setDropProgressMode:", 0);
    -[UITextDropProposal setDropPerformer:](v4, "setDropPerformer:", 0);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextDropProposal;
  v4 = -[UIDropProposal copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDropAction:", -[UITextDropProposal dropAction](self, "dropAction"));
  objc_msgSend(v4, "setUseFastSameViewOperations:", -[UITextDropProposal useFastSameViewOperations](self, "useFastSameViewOperations"));
  objc_msgSend(v4, "setDropProgressMode:", -[UITextDropProposal dropProgressMode](self, "dropProgressMode"));
  objc_msgSend(v4, "setDropPerformer:", -[UITextDropProposal dropPerformer](self, "dropPerformer"));
  return v4;
}

- (UITextDropAction)dropAction
{
  return self->_dropAction;
}

- (void)setDropAction:(UITextDropAction)dropAction
{
  self->_dropAction = dropAction;
}

- (UITextDropProgressMode)dropProgressMode
{
  return self->_dropProgressMode;
}

- (void)setDropProgressMode:(UITextDropProgressMode)dropProgressMode
{
  self->_dropProgressMode = dropProgressMode;
}

- (BOOL)useFastSameViewOperations
{
  return self->_useFastSameViewOperations;
}

- (void)setUseFastSameViewOperations:(BOOL)useFastSameViewOperations
{
  self->_useFastSameViewOperations = useFastSameViewOperations;
}

- (UITextDropPerformer)dropPerformer
{
  return self->_dropPerformer;
}

- (void)setDropPerformer:(UITextDropPerformer)dropPerformer
{
  self->_dropPerformer = dropPerformer;
}

@end
