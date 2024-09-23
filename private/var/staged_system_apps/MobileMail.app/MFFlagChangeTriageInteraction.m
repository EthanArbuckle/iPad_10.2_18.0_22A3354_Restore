@implementation MFFlagChangeTriageInteraction

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 reason:(int64_t)a7
{
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___MFFlagChangeTriageInteraction;
  v8 = objc_msgSendSuper2(&v11, "interactionWithMessageListItemSelection:undoManager:origin:actor:", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setReason:", a7);
  return v9;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 reason:(int64_t)a7
{
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___MFFlagChangeTriageInteraction;
  v8 = objc_msgSendSuper2(&v11, "interactionWithMessageListItems:undoManager:origin:actor:", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setReason:", a7);
  return v9;
}

+ (id)interactionWithQuery:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 reason:(int64_t)a7
{
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___MFFlagChangeTriageInteraction;
  v8 = objc_msgSendSuper2(&v11, "interactionWithQuery:undoManager:origin:actor:", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setReason:", a7);
  return v9;
}

- (BOOL)flagState
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction triageAction](self, "triageAction"));
  v3 = objc_msgSend(v2, "flagState");

  return v3;
}

- (BOOL)supportsSelectAll
{
  return 1;
}

- (id)updateReason
{
  return CFSTR("flagChanged");
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

@end
