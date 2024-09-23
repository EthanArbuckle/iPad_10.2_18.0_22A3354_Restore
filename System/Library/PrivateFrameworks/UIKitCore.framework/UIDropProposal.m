@implementation UIDropProposal

- (UIDropProposal)initWithDropOperation:(UIDropOperation)operation
{
  UIDropProposal *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDropProposal;
  result = -[UIDropProposal init](&v5, sel_init);
  if (result)
  {
    result->_operation = operation;
    result->_prefersFullSizePreview = 1;
  }
  return result;
}

- (UIDropProposal)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDropInteraction.m"), 77, CFSTR("Not implemented"));

  return 0;
}

+ (UIDropProposal)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIDropInteraction.m"), 83, CFSTR("Not implemented"));

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDropOperation:", -[UIDropProposal operation](self, "operation"));
  objc_msgSend(v4, "setPrecise:", -[UIDropProposal isPrecise](self, "isPrecise"));
  objc_msgSend(v4, "setPrefersFullSizePreview:", -[UIDropProposal prefersFullSizePreview](self, "prefersFullSizePreview"));
  objc_msgSend(v4, "_setPreferredBadgeStyle:", -[UIDropProposal _preferredBadgeStyle](self, "_preferredBadgeStyle"));
  return v4;
}

- (UIDropOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (BOOL)isPrecise
{
  return self->_precise;
}

- (void)setPrecise:(BOOL)precise
{
  self->_precise = precise;
}

- (BOOL)prefersFullSizePreview
{
  return self->_prefersFullSizePreview;
}

- (void)setPrefersFullSizePreview:(BOOL)prefersFullSizePreview
{
  self->_prefersFullSizePreview = prefersFullSizePreview;
}

- (int64_t)_preferredBadgeStyle
{
  return self->_preferredBadgeStyle;
}

- (void)_setPreferredBadgeStyle:(int64_t)a3
{
  self->_preferredBadgeStyle = a3;
}

@end
