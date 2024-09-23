@implementation SBWidgetExtensionDebugSearchResult

- (SBWidgetExtensionDebugSearchResult)initWithKind:(id)a3
{
  return -[SBWidgetExtensionDebugSearchResult initWithKind:family:](self, "initWithKind:family:", a3, 0);
}

- (SBWidgetExtensionDebugSearchResult)initWithKind:(id)a3 family:(int64_t)a4
{
  id v6;
  SBWidgetExtensionDebugSearchResult *v7;
  uint64_t v8;
  NSString *kind;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBWidgetExtensionDebugSearchResult;
  v7 = -[SBWidgetExtensionDebugSearchResult init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    kind = v7->_kind;
    v7->_kind = (NSString *)v8;

    v7->_family = a4;
  }

  return v7;
}

- (NSString)kind
{
  return self->_kind;
}

- (int64_t)family
{
  return self->_family;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
