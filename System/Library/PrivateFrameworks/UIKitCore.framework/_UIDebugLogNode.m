@implementation _UIDebugLogNode

- (_UIDebugLogNode)initWithString:(id)a3 attributedString:(id)a4
{
  _UIDebugLogNode *v4;
  uint64_t v5;
  NSMutableArray *childMessages;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDebugLogNode;
  v4 = -[_UIDebugLogMessage initWithString:attributedString:](&v8, sel_initWithString_attributedString_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    childMessages = v4->_childMessages;
    v4->_childMessages = (NSMutableArray *)v5;

  }
  return v4;
}

+ (id)rootNode
{
  return -[_UIDebugLogNode initWithString:attributedString:]([__UIDebugLogRootNode alloc], "initWithString:attributedString:", CFSTR("@rootNode"), 0);
}

- (BOOL)_isNode
{
  return 1;
}

- (BOOL)hasMessages
{
  return -[NSMutableArray count](self->_childMessages, "count") != 0;
}

- (void)addMessage:(id)a3
{
  -[NSMutableArray addObject:](self->_childMessages, "addObject:", a3);
}

- (void)__genericAppendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5 recursionSelector:(SEL)a6 appendHandler:(id)a7
{
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int v19;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void (**v30)(id, void *, void *, id);
  id v31;
  id v32;

  v32 = a3;
  v31 = a4;
  v11 = a5;
  v30 = (void (**)(id, void *, void *, id))a7;
  if (-[NSMutableArray count](self->_childMessages, "count"))
  {
    v12 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](self->_childMessages, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_89_5);
    -[_UIDebugLogNode treeStyle](self, "treeStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v28 = v11;
    if (v13 || (v14 = v11) != 0)
    {
      v15 = v14;
    }
    else
    {
      +[_UIDebugLogNodeTreeStyle defaultStyle](_UIDebugLogNodeTreeStyle, "defaultStyle");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    if (-[NSMutableArray count](self->_childMessages, "count"))
    {
      v17 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_childMessages, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "_isNode");
        v21 = v12 != 0x7FFFFFFFFFFFFFFFLL && v12 > v17;
        if ((objc_msgSend(v18, "_isTransparent") & 1) == 0)
        {
          v22 = (void *)MEMORY[0x1E0CB3940];
          _prefixForItem(v19, v21, v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("\n%@%@"), v31, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v30[2](v30, v18, v24, v32);
        }
        if (v19)
        {
          v25 = v18;
          if (objc_msgSend(v25, "_isTransparent"))
          {
            v26 = v31;
          }
          else
          {
            _prefixForItem(0, v21, v16);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringByAppendingString:", v27);
            v26 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v25, a6, v32, v26, v16);

        }
        ++v17;
      }
      while (v17 < -[NSMutableArray count](self->_childMessages, "count"));
    }

    v11 = v28;
  }

}

- (void)_appendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5
{
  -[_UIDebugLogNode __genericAppendChildDescription:withPrefix:inheritedTreeStyle:recursionSelector:appendHandler:](self, "__genericAppendChildDescription:withPrefix:inheritedTreeStyle:recursionSelector:appendHandler:", a3, a4, a5, a2, &__block_literal_global_93_2);
}

- (void)_appendAttributedChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5
{
  -[_UIDebugLogNode __genericAppendChildDescription:withPrefix:inheritedTreeStyle:recursionSelector:appendHandler:](self, "__genericAppendChildDescription:withPrefix:inheritedTreeStyle:recursionSelector:appendHandler:", a3, a4, a5, a2, &__block_literal_global_97);
}

- (id)description
{
  void *v3;
  void *v4;

  -[_UIDebugLogMessage _stringRepresentation](self, "_stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIDebugLogNode _appendChildDescription:withPrefix:inheritedTreeStyle:](self, "_appendChildDescription:withPrefix:inheritedTreeStyle:", v4, &stru_1E16EDF20, 0);
  return v4;
}

- (id)attributedDescription
{
  void *v3;
  void *v4;

  -[_UIDebugLogMessage _attributedStringRepresentation](self, "_attributedStringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIDebugLogNode _appendAttributedChildDescription:withPrefix:inheritedTreeStyle:](self, "_appendAttributedChildDescription:withPrefix:inheritedTreeStyle:", v4, &stru_1E16EDF20, 0);
  return v4;
}

- (_UIDebugLogNodeTreeStyle)treeStyle
{
  return self->_treeStyle;
}

- (void)setTreeStyle:(id)a3
{
  objc_storeStrong((id *)&self->_treeStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treeStyle, 0);
  objc_storeStrong((id *)&self->_childMessages, 0);
}

@end
