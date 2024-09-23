@implementation SBIconStateUnarchiveResult

- (BOOL)isValid
{
  return !self->_corrupted;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)_pushFolder:(id)a3
{
  id v4;
  NSMutableArray *folderStack;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    folderStack = self->_folderStack;
    v8 = v4;
    if (folderStack)
    {
      -[NSMutableArray addObject:](folderStack, "addObject:", v4);
    }
    else
    {
      v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v4, 0);
      v7 = self->_folderStack;
      self->_folderStack = v6;

    }
    -[SBIconStateUnarchiveResult _noteEnteredNode](self, "_noteEnteredNode");
    v4 = v8;
  }

}

- (id)_currentFolder
{
  return (id)-[NSMutableArray lastObject](self->_folderStack, "lastObject");
}

- (id)_popFolder
{
  void *v3;
  unint64_t v4;
  NSMutableArray *folderStack;

  -[NSMutableArray lastObject](self->_folderStack, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableArray count](self->_folderStack, "count");
  folderStack = self->_folderStack;
  if (v4 >= 2)
  {
    -[NSMutableArray removeLastObject](folderStack, "removeLastObject");
    if (!v3)
      return v3;
    goto LABEL_5;
  }
  self->_folderStack = 0;

  if (v3)
LABEL_5:
    -[SBIconStateUnarchiveResult _noteExitedNode](self, "_noteExitedNode");
  return v3;
}

- (void)_noteEnteredNode
{
  ++self->_parseDepth;
}

- (void)_noteExitedNode
{
  --self->_parseDepth;
}

- (int64_t)_currentParseDepth
{
  return self->_parseDepth;
}

- (void)_noteRepresentationIsCorrupted
{
  self->_corrupted = 1;
}

- (void)_noteSignificantDeviation
{
  -[SBFolder markIconStateDirty](self->_rootFolder, "markIconStateDirty");
  self->_dirty = 1;
}

- (BOOL)_isNodeIdentifierAlreadyUnarchived:(id)a3
{
  return -[NSMutableSet containsObject:](self->_nodeIdentifiersUnarchived, "containsObject:", a3);
}

- (void)_noteNodeIdentifierWasUnarchived:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *nodeIdentifiersUnarchived;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v5 = v4;
    nodeIdentifiersUnarchived = self->_nodeIdentifiersUnarchived;
    if (nodeIdentifiersUnarchived)
    {
      -[NSMutableSet addObject:](nodeIdentifiersUnarchived, "addObject:", v5);
    }
    else
    {
      v7 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", &v9, 1);
      v8 = self->_nodeIdentifiersUnarchived;
      self->_nodeIdentifiersUnarchived = v7;

      v5 = v9;
    }

  }
}

- (BOOL)_isWidgetUniqueIdentifierAlreadyUnarchived:(id)a3
{
  return -[NSMutableSet containsObject:](self->_widgetUniqueIdentifiersUnarchived, "containsObject:", a3);
}

- (void)_noteWidgetUniqueIdentifierWasUnarchived:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *widgetUniqueIdentifiersUnarchived;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v5 = v4;
    widgetUniqueIdentifiersUnarchived = self->_widgetUniqueIdentifiersUnarchived;
    if (widgetUniqueIdentifiersUnarchived)
    {
      -[NSMutableSet addObject:](widgetUniqueIdentifiersUnarchived, "addObject:", v5);
    }
    else
    {
      v7 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", &v9, 1);
      v8 = self->_widgetUniqueIdentifiersUnarchived;
      self->_widgetUniqueIdentifiersUnarchived = v7;

      v5 = v9;
    }

  }
}

- (NSString)description
{
  return (NSString *)-[SBIconStateUnarchiveResult descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconStateUnarchiveResult descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconStateUnarchiveResult rootFolder](self, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("rootFolder"));

  v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconStateUnarchiveResult isValid](self, "isValid"), CFSTR("isValid"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconStateUnarchiveResult isDirty](self, "isDirty"), CFSTR("isDirty"));
  -[SBIconStateUnarchiveResult metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("metadata"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconStateUnarchiveResult succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (void)_setRootFolder:(id)a3
{
  objc_storeStrong((id *)&self->_rootFolder, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)_setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
  objc_storeStrong(&self->_rootNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_widgetUniqueIdentifiersUnarchived, 0);
  objc_storeStrong((id *)&self->_nodeIdentifiersUnarchived, 0);
  objc_storeStrong((id *)&self->_folderStack, 0);
  objc_storeStrong((id *)&self->_rootFolder, 0);
}

@end
