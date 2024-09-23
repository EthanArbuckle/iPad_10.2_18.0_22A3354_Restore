@implementation SBStringMetrics

- (SBStringMetrics)init
{
  SBStringMetrics *v2;
  NSMutableArray *v3;
  NSMutableArray *fragments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBStringMetrics;
  v2 = -[SBStringMetrics init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fragments = v2->_fragments;
    v2->_fragments = v3;

  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p; %lu fragment(s)> %@"),
               objc_opt_class(),
               self,
               -[SBStringMetrics fragmentCount](self, "fragmentCount"),
               self->_fragments);
}

- (void)addFragment:(id)a3
{
  -[NSMutableArray addObject:](self->_fragments, "addObject:", a3);
}

- (id)fragments
{
  return (id)-[NSMutableArray copy](self->_fragments, "copy");
}

- (unint64_t)fragmentCount
{
  return -[NSMutableArray count](self->_fragments, "count");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_fragments, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragments, 0);
}

@end
