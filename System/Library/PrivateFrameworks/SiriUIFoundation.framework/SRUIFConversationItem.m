@implementation SRUIFConversationItem

- (SRUIFConversationItem)initWithDelegateItem:(id)a3
{
  id v5;
  SRUIFConversationItem *v6;
  SRUIFConversationItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRUIFConversationItem;
  v6 = -[SRUIFConversationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_delegateItem, a3);

  return v7;
}

- (SRUIFConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 associatedDataStore:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SRUIFMutableConversationItem *v24;
  SRUIFConversationItem *v25;
  uint64_t v27;

  v18 = a14;
  v19 = a9;
  v20 = a7;
  v21 = a6;
  v22 = a4;
  v23 = a3;
  BYTE3(v27) = a13;
  BYTE2(v27) = a12;
  LOWORD(v27) = __PAIR16__(a11, a10);
  v24 = -[SRUIFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:]([SRUIFMutableConversationItem alloc], "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v23, v22, a5, v21, v20, a8, v19, v27, v18);

  v25 = -[SRUIFConversationItem initWithDelegateItem:](self, "initWithDelegateItem:", v24);
  return v25;
}

- (SRUIFConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 associatedDataStore:(id)a12
{
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SRUIFConversationItem *v23;
  uint64_t v25;

  v16 = (objc_class *)MEMORY[0x24BDD1880];
  v17 = a12;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  v21 = objc_alloc_init(v16);
  v22 = objc_alloc_init(MEMORY[0x24BDD1880]);
  BYTE3(v25) = a11;
  BYTE2(v25) = a10;
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  v23 = -[SRUIFConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](self, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v21, v22, a3, v20, v19, a6, v18, v25, v17);

  return v23;
}

- (NSString)description
{
  return -[SRUIFMutableConversationItem description](self->_delegateItem, "description");
}

- (id)identifier
{
  return -[SRUIFMutableConversationItem identifier](self->_delegateItem, "identifier");
}

- (id)revisionIdentifier
{
  return -[SRUIFMutableConversationItem revisionIdentifier](self->_delegateItem, "revisionIdentifier");
}

- (int64_t)type
{
  return -[SRUIFMutableConversationItem type](self->_delegateItem, "type");
}

- (id)aceObject
{
  return -[SRUIFMutableConversationItem aceObject](self->_delegateItem, "aceObject");
}

- (id)dialogPhase
{
  return -[SRUIFMutableConversationItem dialogPhase](self->_delegateItem, "dialogPhase");
}

- (id)aceCommandIdentifier
{
  return -[SRUIFMutableConversationItem aceCommandIdentifier](self->_delegateItem, "aceCommandIdentifier");
}

- (int64_t)presentationState
{
  return -[SRUIFMutableConversationItem presentationState](self->_delegateItem, "presentationState");
}

- (BOOL)isVirgin
{
  return -[SRUIFMutableConversationItem isVirgin](self->_delegateItem, "isVirgin");
}

- (BOOL)isTransient
{
  return -[SRUIFMutableConversationItem isTransient](self->_delegateItem, "isTransient");
}

- (BOOL)isSupplemental
{
  return -[SRUIFMutableConversationItem isSupplemental](self->_delegateItem, "isSupplemental");
}

- (BOOL)isImmersiveExperience
{
  return -[SRUIFMutableConversationItem isImmersiveExperience](self->_delegateItem, "isImmersiveExperience");
}

- (id)associatedDataStore
{
  return -[SRUIFMutableConversationItem associatedDataStore](self->_delegateItem, "associatedDataStore");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateItem, 0);
}

@end
