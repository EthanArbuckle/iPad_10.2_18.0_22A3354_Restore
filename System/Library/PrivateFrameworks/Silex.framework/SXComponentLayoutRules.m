@implementation SXComponentLayoutRules

- (SXComponentLayoutRules)init
{
  SXComponentLayoutRules *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXComponentLayoutRules;
  result = -[SXComponentLayoutRules init](&v3, sel_init);
  if (result)
  {
    result->_minimumColumnSpan = 1;
    *(_DWORD *)&result->_allowsIntersection = 0x10000;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setMinimumColumnSpan:", -[SXComponentLayoutRules minimumColumnSpan](self, "minimumColumnSpan"));
  objc_msgSend(v4, "setAllowsIntersection:", -[SXComponentLayoutRules allowsIntersection](self, "allowsIntersection"));
  objc_msgSend(v4, "setShouldSpanAllColumns:", -[SXComponentLayoutRules shouldSpanAllColumns](self, "shouldSpanAllColumns"));
  objc_msgSend(v4, "setShouldIgnoreDocumentMargin:", -[SXComponentLayoutRules shouldIgnoreDocumentMargin](self, "shouldIgnoreDocumentMargin"));
  objc_msgSend(v4, "setAllowsSiblingBasedResizing:", -[SXComponentLayoutRules allowsSiblingBasedResizing](self, "allowsSiblingBasedResizing"));
  return v4;
}

- (unint64_t)minimumColumnSpan
{
  return self->_minimumColumnSpan;
}

- (void)setMinimumColumnSpan:(unint64_t)a3
{
  self->_minimumColumnSpan = a3;
}

- (BOOL)allowsIntersection
{
  return self->_allowsIntersection;
}

- (void)setAllowsIntersection:(BOOL)a3
{
  self->_allowsIntersection = a3;
}

- (BOOL)shouldSpanAllColumns
{
  return self->_shouldSpanAllColumns;
}

- (void)setShouldSpanAllColumns:(BOOL)a3
{
  self->_shouldSpanAllColumns = a3;
}

- (BOOL)allowsSiblingBasedResizing
{
  return self->_allowsSiblingBasedResizing;
}

- (void)setAllowsSiblingBasedResizing:(BOOL)a3
{
  self->_allowsSiblingBasedResizing = a3;
}

- (BOOL)shouldIgnoreDocumentMargin
{
  return self->_shouldIgnoreDocumentMargin;
}

- (void)setShouldIgnoreDocumentMargin:(BOOL)a3
{
  self->_shouldIgnoreDocumentMargin = a3;
}

+ (id)defaultLayoutRules
{
  if (defaultLayoutRules_onceToken != -1)
    dispatch_once(&defaultLayoutRules_onceToken, &__block_literal_global_94);
  return (id)defaultLayoutRules___defaultComponentLayoutRules;
}

void __57__SXComponentLayoutRules_Definitions__defaultLayoutRules__block_invoke()
{
  SXComponentLayoutRules *v0;
  void *v1;

  v0 = objc_alloc_init(SXComponentLayoutRules);
  v1 = (void *)defaultLayoutRules___defaultComponentLayoutRules;
  defaultLayoutRules___defaultComponentLayoutRules = (uint64_t)v0;

}

+ (id)fullWidthLayoutRules
{
  if (fullWidthLayoutRules_onceToken != -1)
    dispatch_once(&fullWidthLayoutRules_onceToken, &__block_literal_global_1_1);
  return (id)fullWidthLayoutRules___fullWidthComponentLayoutRules;
}

uint64_t __59__SXComponentLayoutRules_Definitions__fullWidthLayoutRules__block_invoke()
{
  SXComponentLayoutRules *v0;
  void *v1;

  v0 = objc_alloc_init(SXComponentLayoutRules);
  v1 = (void *)fullWidthLayoutRules___fullWidthComponentLayoutRules;
  fullWidthLayoutRules___fullWidthComponentLayoutRules = (uint64_t)v0;

  objc_msgSend((id)fullWidthLayoutRules___fullWidthComponentLayoutRules, "setMinimumColumnSpan:", 1);
  objc_msgSend((id)fullWidthLayoutRules___fullWidthComponentLayoutRules, "setShouldSpanAllColumns:", 1);
  return objc_msgSend((id)fullWidthLayoutRules___fullWidthComponentLayoutRules, "setAllowsSiblingBasedResizing:", 0);
}

+ (id)twoColumnLayoutRules
{
  if (twoColumnLayoutRules_onceToken != -1)
    dispatch_once(&twoColumnLayoutRules_onceToken, &__block_literal_global_2_2);
  return (id)twoColumnLayoutRules___twoColumnComponentLayoutRules;
}

uint64_t __59__SXComponentLayoutRules_Definitions__twoColumnLayoutRules__block_invoke()
{
  SXComponentLayoutRules *v0;
  void *v1;

  v0 = objc_alloc_init(SXComponentLayoutRules);
  v1 = (void *)twoColumnLayoutRules___twoColumnComponentLayoutRules;
  twoColumnLayoutRules___twoColumnComponentLayoutRules = (uint64_t)v0;

  objc_msgSend((id)twoColumnLayoutRules___twoColumnComponentLayoutRules, "setMinimumColumnSpan:", 2);
  return objc_msgSend((id)twoColumnLayoutRules___twoColumnComponentLayoutRules, "setAllowsSiblingBasedResizing:", 0);
}

+ (id)bodyComponentLayoutRules
{
  if (bodyComponentLayoutRules_onceToken != -1)
    dispatch_once(&bodyComponentLayoutRules_onceToken, &__block_literal_global_3_2);
  return (id)bodyComponentLayoutRules___bodyComponentLayoutRules;
}

uint64_t __63__SXComponentLayoutRules_Definitions__bodyComponentLayoutRules__block_invoke()
{
  SXComponentLayoutRules *v0;
  void *v1;

  v0 = objc_alloc_init(SXComponentLayoutRules);
  v1 = (void *)bodyComponentLayoutRules___bodyComponentLayoutRules;
  bodyComponentLayoutRules___bodyComponentLayoutRules = (uint64_t)v0;

  objc_msgSend((id)bodyComponentLayoutRules___bodyComponentLayoutRules, "setMinimumColumnSpan:", 2);
  return objc_msgSend((id)bodyComponentLayoutRules___bodyComponentLayoutRules, "setAllowsIntersection:", 1);
}

@end
