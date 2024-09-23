@implementation PGGraphMatchingOptions

- (PGGraphMatchingOptions)init
{
  PGGraphMatchingOptions *v2;
  PGGraphMatchingOptions *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphMatchingOptions;
  v2 = -[PGGraphMatchingOptions init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_relatedType = 63;
    v2->_targetEventDomain = objc_msgSend((id)objc_opt_class(), "defaultTargetEventDomain");
    v3->_needsKeywords = 0;
  }
  return v3;
}

- (unint64_t)relatedType
{
  return self->_relatedType;
}

- (void)setRelatedType:(unint64_t)a3
{
  self->_relatedType = a3;
}

- (unsigned)targetEventDomain
{
  return self->_targetEventDomain;
}

- (void)setTargetEventDomain:(unsigned __int16)a3
{
  self->_targetEventDomain = a3;
}

- (NSSet)focusedNodes
{
  return self->_focusedNodes;
}

- (void)setFocusedNodes:(id)a3
{
  objc_storeStrong((id *)&self->_focusedNodes, a3);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (BOOL)needsKeywords
{
  return self->_needsKeywords;
}

- (void)setNeedsKeywords:(BOOL)a3
{
  self->_needsKeywords = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_focusedNodes, 0);
}

+ (id)optionsWithRelatedType:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setRelatedType:", a3);
  return v4;
}

+ (unsigned)defaultTargetEventDomain
{
  return 102;
}

@end
