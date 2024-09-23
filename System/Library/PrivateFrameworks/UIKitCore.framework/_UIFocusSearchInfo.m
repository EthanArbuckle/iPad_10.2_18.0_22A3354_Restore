@implementation _UIFocusSearchInfo

+ (id)defaultInfo
{
  return -[_UIFocusSearchInfo initWithFocusEvaluator:]([_UIFocusSearchInfo alloc], "initWithFocusEvaluator:", 0);
}

- (_UIFocusSearchInfo)initWithFocusEvaluator:(id)a3
{
  id v4;
  _UIFocusSearchInfo *v5;
  _UIFocusSearchInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusSearchInfo;
  v5 = -[_UIFocusSearchInfo init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_treatFocusableItemAsLeaf = 1;
    -[_UIFocusSearchInfo setEvaluator:](v5, "setEvaluator:", v4);
  }

  return v6;
}

- (BOOL)shouldIncludeFocusItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;

  v4 = a3;
  -[_UIFocusSearchInfo evaluator](self, "evaluator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIFocusSearchInfo evaluator](self, "evaluator");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)treatFocusableItemAsLeaf
{
  return self->_treatFocusableItemAsLeaf;
}

- (void)setTreatFocusableItemAsLeaf:(BOOL)a3
{
  self->_treatFocusableItemAsLeaf = a3;
}

- (BOOL)forceFocusToLeaveContainer
{
  return self->_forceFocusToLeaveContainer;
}

- (void)setForceFocusToLeaveContainer:(BOOL)a3
{
  self->_forceFocusToLeaveContainer = a3;
}

- (id)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_evaluator, 0);
}

@end
