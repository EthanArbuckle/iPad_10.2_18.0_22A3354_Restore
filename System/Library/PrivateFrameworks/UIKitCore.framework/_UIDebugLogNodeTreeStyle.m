@implementation _UIDebugLogNodeTreeStyle

+ (id)defaultStyle
{
  if (qword_1ECD79EB0 != -1)
    dispatch_once(&qword_1ECD79EB0, &__block_literal_global_440);
  return (id)_MergedGlobals_1_17;
}

- (_UIDebugLogNodeTreeStyle)initWithNode:(id)a3 lastNode:(id)a4 intermediate:(id)a5 trailing:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _UIDebugLogNodeTreeStyle *v14;
  uint64_t v15;
  NSString *node;
  uint64_t v17;
  NSString *lastNode;
  uint64_t v19;
  NSString *intermediate;
  uint64_t v21;
  NSString *trailing;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_UIDebugLogNodeTreeStyle;
  v14 = -[_UIDebugLogNodeTreeStyle init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    node = v14->_node;
    v14->_node = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    lastNode = v14->_lastNode;
    v14->_lastNode = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    intermediate = v14->_intermediate;
    v14->_intermediate = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    trailing = v14->_trailing;
    v14->_trailing = (NSString *)v21;

  }
  return v14;
}

+ (id)styleWithNode:(id)a3 lastNode:(id)a4 intermediate:(id)a5 trailing:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNode:lastNode:intermediate:trailing:", v13, v12, v11, v10);

  return v14;
}

- (NSString)node
{
  return self->_node;
}

- (NSString)lastNode
{
  return self->_lastNode;
}

- (NSString)intermediate
{
  return self->_intermediate;
}

- (NSString)trailing
{
  return self->_trailing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailing, 0);
  objc_storeStrong((id *)&self->_intermediate, 0);
  objc_storeStrong((id *)&self->_lastNode, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

@end
