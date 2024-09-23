@implementation SRUIFConversationInsertion

- (SRUIFConversationInsertion)initWithConversationItemType:(int64_t)a3 aceObject:(id)a4 aceCommandIdentifier:(id)a5 transient:(BOOL)a6 supplemental:(BOOL)a7 immersiveExperience:(BOOL)a8 indexPath:(id)a9
{
  id v16;
  id v17;
  id v18;
  SRUIFConversationInsertion *v19;
  SRUIFConversationInsertion *v20;
  uint64_t v21;
  NSString *aceCommandIdentifier;
  uint64_t v23;
  NSIndexPath *indexPath;
  objc_super v26;

  v16 = a4;
  v17 = a5;
  v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SRUIFConversationInsertion;
  v19 = -[SRUIFConversationInsertion init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_conversationItemType = a3;
    objc_storeStrong((id *)&v19->_aceObject, a4);
    v21 = objc_msgSend(v17, "copy");
    aceCommandIdentifier = v20->_aceCommandIdentifier;
    v20->_aceCommandIdentifier = (NSString *)v21;

    v20->_transient = a6;
    v20->_supplemental = a7;
    v20->_immersiveExperience = a8;
    v23 = objc_msgSend(v18, "copy");
    indexPath = v20->_indexPath;
    v20->_indexPath = (NSIndexPath *)v23;

  }
  return v20;
}

- (int64_t)conversationItemType
{
  return self->_conversationItemType;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (NSString)aceCommandIdentifier
{
  return self->_aceCommandIdentifier;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (BOOL)isSupplemental
{
  return self->_supplemental;
}

- (BOOL)isImmersiveExperience
{
  return self->_immersiveExperience;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_aceCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_aceObject, 0);
}

@end
