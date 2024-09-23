@implementation ICOutlineController

- (ICOutlineController)initWithTextStorage:(id)a3 collapsedUUIDs:(id)a4 asynchronous:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  ICOutlineController *v10;
  OutlineController *v11;
  OutlineController *outlineControllerObject;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICOutlineController;
  v10 = -[ICOutlineController init](&v14, sel_init);
  if (v10)
  {
    v11 = -[OutlineController initWithTextStorage:collapsedUUIDs:asynchronous:]([OutlineController alloc], "initWithTextStorage:collapsedUUIDs:asynchronous:", v8, v9, v5);
    outlineControllerObject = v10->_outlineControllerObject;
    v10->_outlineControllerObject = v11;

  }
  return v10;
}

- (ICTTTextStorage)textStorage
{
  void *v2;
  void *v3;

  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTTTextStorage *)v3;
}

- (BOOL)isAsynchronous
{
  void *v2;
  char v3;

  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAsynchronous");

  return v3;
}

- (void)setIsAsynchronous:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAsynchronous:", v3);

}

- (NSSet)collapsedUUIDs
{
  void *v2;
  void *v3;

  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collapsedUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setCollapsedUUIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollapsedUUIDs:", v4);

}

- (int64_t)collapsibleSectionAffordanceUsages
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactedUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (_NSRange)visibleRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visibleRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)requestUpdate
{
  id v2;

  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestUpdate");

}

- (BOOL)canCollapseAnyUUIDs:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canCollapseAnyUUIDs:", v4);

  return v6;
}

- (BOOL)isUUIDCollapsible:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUUIDCollapsible:", v4);

  return v6;
}

- (BOOL)isUUIDCollapsed:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUUIDCollapsed:", v4);

  return v6;
}

- (void)collapseUUIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collapseUUIDs:", v4);

}

- (void)toggleUUIDCollapsed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleUUIDCollapsed:", v4);

}

- (void)collapseAll
{
  id v2;

  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collapseAll");

}

- (BOOL)canExpandAnyUUIDs:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canExpandAnyUUIDs:", v4);

  return v6;
}

- (void)expandUUIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expandUUIDs:", v4);

}

- (void)expandAncestorsOfRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expandAncestorsOfRange:", location, length);

}

- (void)expandAll
{
  id v2;

  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expandAll");

}

- (void)collapsibleSectionAffordanceUsedForUUIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collapsibleSectionAffordanceUsedForUUIDs:", v4);

}

- (void)resetCollapsibleSectionAffordanceUsages
{
  id v2;

  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetCollapsibleSectionAffordanceUsages");

}

- (BOOL)isUUIDHidden:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUUIDHidden:", v4);

  return v6;
}

- (_NSRange)rangeForUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeForUUID:", v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)descendantRangeForUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "descendantRangeForUUID:", v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)closestVisibleAncestorForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closestVisibleAncestorForUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ancestorsForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ancestorsForUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descendantsForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICOutlineController outlineControllerObject](self, "outlineControllerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descendantsForUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (OutlineController)outlineControllerObject
{
  return self->_outlineControllerObject;
}

- (void)setOutlineControllerObject:(id)a3
{
  objc_storeStrong((id *)&self->_outlineControllerObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineControllerObject, 0);
}

@end
