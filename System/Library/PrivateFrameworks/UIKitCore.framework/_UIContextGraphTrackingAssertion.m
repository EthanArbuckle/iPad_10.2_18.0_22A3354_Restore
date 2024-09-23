@implementation _UIContextGraphTrackingAssertion

- (BOOL)isContextIDRelevant:(unsigned int)a3
{
  BOOL v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_contextID == a3)
    return 1;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_contextIDGraph;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntValue", (_QWORD)v11) == a3)
        {
          v3 = 1;
          goto LABEL_13;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
  v3 = 0;
LABEL_13:

  return v3;
}

- (_UIContextGraphTrackingAssertion)initWithContextID:(unsigned int)a3 windowGraph:(id)a4 clientHandlerBlock:(id)a5 invalidationBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _UIContextGraphTrackingAssertion *v16;
  uint64_t v17;
  id clientHandlerBlock;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0CB3A28];
  v13 = a6;
  objc_msgSend(v12, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)_UIContextGraphTrackingAssertion;
  v16 = -[BSSimpleAssertion initWithIdentifier:forReason:queue:invalidationBlock:](&v20, sel_initWithIdentifier_forReason_queue_invalidationBlock_, v15, CFSTR("observerTrackingAssertion"), MEMORY[0x1E0C80D38], v13);

  if (v16)
  {
    v16->_contextID = a3;
    v17 = objc_msgSend(v11, "copy");
    clientHandlerBlock = v16->_clientHandlerBlock;
    v16->_clientHandlerBlock = (id)v17;

    -[_UIContextGraphTrackingAssertion _setWindowGraph:callHandler:](v16, "_setWindowGraph:callHandler:", v10, 0);
  }

  return v16;
}

- (void)_setWindowGraph:(id)a3 callHandler:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v6;
  NSArray *contextIDGraph;
  id v8;

  v4 = a4;
  v8 = a3;
  objc_msgSend(v8, "bs_map:", &__block_literal_global_34);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  contextIDGraph = self->_contextIDGraph;
  self->_contextIDGraph = v6;

  if (v4)
    (*((void (**)(void))self->_clientHandlerBlock + 2))();

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientHandlerBlock, 0);
  objc_storeStrong((id *)&self->_contextIDGraph, 0);
}

- (void)setWindowGraph:(id)a3
{
  -[_UIContextGraphTrackingAssertion _setWindowGraph:callHandler:](self, "_setWindowGraph:callHandler:", a3, 1);
}

- (unsigned)contextID
{
  return self->_contextID;
}

@end
