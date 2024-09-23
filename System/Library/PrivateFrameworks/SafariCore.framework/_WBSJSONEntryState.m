@implementation _WBSJSONEntryState

- (_WBSJSONEntryState)initWithKind:(int64_t)a3
{
  _WBSJSONEntryState *v4;
  _WBSJSONEntryState *v5;
  uint64_t v6;
  NSMutableSet *encodedKeys;
  _WBSJSONEntryState *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_WBSJSONEntryState;
  v4 = -[_WBSJSONEntryState init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_kind = a3;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = objc_claimAutoreleasedReturnValue();
      encodedKeys = v5->_encodedKeys;
      v5->_encodedKeys = (NSMutableSet *)v6;

    }
    v8 = v5;
  }

  return v5;
}

- (BOOL)containsKey:(id)a3
{
  return -[NSMutableSet containsObject:](self->_encodedKeys, "containsObject:", a3);
}

- (void)addKey:(id)a3
{
  ++self->_numberOfEntries;
  -[NSMutableSet addObject:](self->_encodedKeys, "addObject:", a3);
}

- (void)addEntry
{
  ++self->_numberOfEntries;
}

- (int64_t)kind
{
  return self->_kind;
}

- (unint64_t)numberOfEntries
{
  return self->_numberOfEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedKeys, 0);
}

@end
