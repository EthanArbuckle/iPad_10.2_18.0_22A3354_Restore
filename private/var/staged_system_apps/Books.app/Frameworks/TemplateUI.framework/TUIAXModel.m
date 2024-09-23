@implementation TUIAXModel

- (TUIAXModel)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIAXModel;
  return -[TUIAXModel init](&v3, "init");
}

- (TUIAXModel)initWithIdentifier:(id)a3 boxType:(id)a4
{
  id v7;
  id v8;
  TUIAXModel *v9;
  TUIAXModel *v10;
  NSString *v11;
  NSString *boxType;

  v7 = a3;
  v8 = a4;
  v9 = -[TUIAXModel init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = (NSString *)objc_msgSend(v8, "copy");
    boxType = v10->_boxType;
    v10->_boxType = v11;

  }
  return v10;
}

- (id)boxType
{
  return self->_boxType;
}

- (id)description
{
  void *v2;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TUIAXModel *v17;
  void *v18;

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel boxType](self, "boxType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel identifier](self, "identifier"));
  if (v8)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel identifier](self, "identifier"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" identifier=%@"), v18));
  }
  else
  {
    v9 = &stru_243BF0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel stateName](self, "stateName"));
  if (v10)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel stateName](self, "stateName"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" state=%@;"),
                            v2));
  }
  else
  {
    v11 = &stru_243BF0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel children](self, "children"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count")));
  v17 = self;
  v14 = (void *)v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; %@;%@%@ #children=%@>"),
                    v6,
                    v17,
                    v7,
                    v9,
                    v11,
                    v13));

  if (v10)
  {

  }
  if (v8)
  {

  }
  return v15;
}

- (BOOL)hasAccessibleDescendants
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel axAttributes](self, "axAttributes"));
  if ((objc_msgSend(v3, "isAXElement") & 1) != 0)
  {

LABEL_4:
    LOBYTE(v5) = 1;
    return (char)v5;
  }
  v4 = -[TUIAXModel shouldVendControlView](self, "shouldVendControlView");

  if ((v4 & 1) != 0)
    goto LABEL_4;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXModel children](self, "children", 0));
  v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "hasAccessibleDescendants") & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_15;
        }
      }
      v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_15:

  return (char)v5;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)flipsHorizontal
{
  return self->_flipsHorizontal;
}

- (void)setFlipsHorizontal:(BOOL)a3
{
  self->_flipsHorizontal = a3;
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (BOOL)shouldVendControlView
{
  return self->_shouldVendControlView;
}

- (void)setShouldVendControlView:(BOOL)a3
{
  self->_shouldVendControlView = a3;
}

- (BOOL)hasContextMenu
{
  return self->_hasContextMenu;
}

- (void)setHasContextMenu:(BOOL)a3
{
  self->_hasContextMenu = a3;
}

- (TUIAXAttributes)axAttributes
{
  return self->_axAttributes;
}

- (void)setAxAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)resolvedCustomActions
{
  return self->_resolvedCustomActions;
}

- (void)setResolvedCustomActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TUIIdentifier)scrollAncestorIdentifier
{
  return self->_scrollAncestorIdentifier;
}

- (void)setScrollAncestorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_scrollAncestorIdentifier, a3);
}

- (CGRect)accessibilityFrameRelativeToScrollAncestor
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_accessibilityFrameRelativeToScrollAncestor.origin.x;
  y = self->_accessibilityFrameRelativeToScrollAncestor.origin.y;
  width = self->_accessibilityFrameRelativeToScrollAncestor.size.width;
  height = self->_accessibilityFrameRelativeToScrollAncestor.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAccessibilityFrameRelativeToScrollAncestor:(CGRect)a3
{
  self->_accessibilityFrameRelativeToScrollAncestor = a3;
}

- (BOOL)shouldScrollHorizontally
{
  return self->_shouldScrollHorizontally;
}

- (void)setShouldScrollHorizontally:(BOOL)a3
{
  self->_shouldScrollHorizontally = a3;
}

- (BOOL)shouldScrollVertically
{
  return self->_shouldScrollVertically;
}

- (void)setShouldScrollVertically:(BOOL)a3
{
  self->_shouldScrollVertically = a3;
}

- (TUIIdentifier)liveTransformAncestorIdentifier
{
  return self->_liveTransformAncestorIdentifier;
}

- (void)setLiveTransformAncestorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_liveTransformAncestorIdentifier, a3);
}

- (unint64_t)liveTransformKind
{
  return self->_liveTransformKind;
}

- (void)setLiveTransformKind:(unint64_t)a3
{
  self->_liveTransformKind = a3;
}

- (BOOL)isControl
{
  return self->_isControl;
}

- (void)setIsControl:(BOOL)a3
{
  self->_isControl = a3;
}

- (BOOL)isEditableControl
{
  return self->_isEditableControl;
}

- (void)setIsEditableControl:(BOOL)a3
{
  self->_isEditableControl = a3;
}

- (NSString)stateName
{
  return self->_stateName;
}

- (void)setStateName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_liveTransformAncestorIdentifier, 0);
  objc_storeStrong((id *)&self->_scrollAncestorIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedCustomActions, 0);
  objc_storeStrong((id *)&self->_axAttributes, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_boxType, 0);
}

@end
