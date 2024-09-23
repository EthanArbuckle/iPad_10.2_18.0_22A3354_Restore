@implementation TUConversationHandoffContext

- (TUConversationHandoffContext)init
{
  TUConversationHandoffContext *v2;
  TUConversationHandoffContext *v3;
  uint64_t v4;
  NSSet *invitationPreferences;
  TUConversationPresentationContext *presentationContext;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUConversationHandoffContext;
  v2 = -[TUConversationHandoffContext init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_prefersToPlayDuringWombat = 1;
    +[TUConversationInvitationPreference noNotificationInvitationPreferences](TUConversationInvitationPreference, "noNotificationInvitationPreferences");
    v4 = objc_claimAutoreleasedReturnValue();
    invitationPreferences = v3->_invitationPreferences;
    v3->_invitationPreferences = (NSSet *)v4;

    presentationContext = v3->_presentationContext;
    v3->_presentationContext = 0;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationHandoffContext)initWithCoder:(id)a3
{
  id v4;
  TUConversationHandoffContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *invitationPreferences;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  TUConversationPresentationContext *presentationContext;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationHandoffContext;
  v5 = -[TUConversationHandoffContext init](&v18, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_prefersToPlayDuringWombat);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_prefersToPlayDuringWombat = objc_msgSend(v4, "decodeBoolForKey:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_invitationPreferences);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    invitationPreferences = v5->_invitationPreferences;
    v5->_invitationPreferences = (NSSet *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_presentationContext);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    presentationContext = v5->_presentationContext;
    v5->_presentationContext = (TUConversationPresentationContext *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = -[TUConversationHandoffContext prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat");
  NSStringFromSelector(sel_prefersToPlayDuringWombat);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  -[TUConversationHandoffContext invitationPreferences](self, "invitationPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_invitationPreferences);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationHandoffContext presentationContext](self, "presentationContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_presentationContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPrefersToPlayDuringWombat:", -[TUConversationHandoffContext prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"));
  -[TUConversationHandoffContext invitationPreferences](self, "invitationPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvitationPreferences:", v5);

  -[TUConversationHandoffContext presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentationContext:", v6);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" prefersToPlayDuringWombat=%d"), -[TUConversationHandoffContext prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"));
  -[TUConversationHandoffContext invitationPreferences](self, "invitationPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUConversationHandoffContext invitationPreferences](self, "invitationPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" invitationPreferences=%@"), v5);

  }
  -[TUConversationHandoffContext presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUConversationHandoffContext presentationContext](self, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" presentationContext=%@"), v7);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  if (-[TUConversationHandoffContext prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"))
    v3 = 1231;
  else
    v3 = 1237;
  -[TUConversationHandoffContext invitationPreferences](self, "invitationPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[TUConversationHandoffContext presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationHandoffContext *v4;
  BOOL v5;

  v4 = (TUConversationHandoffContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationHandoffContext isEqualToHandoffContext:](self, "isEqualToHandoffContext:", v4);
  }

  return v5;
}

- (BOOL)isEqualToHandoffContext:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[TUConversationHandoffContext prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat");
  if (v5 == objc_msgSend(v4, "prefersToPlayDuringWombat"))
  {
    -[TUConversationHandoffContext invitationPreferences](self, "invitationPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invitationPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[TUConversationHandoffContext presentationContext](self, "presentationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentationContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)prefersToPlayDuringWombat
{
  return self->_prefersToPlayDuringWombat;
}

- (void)setPrefersToPlayDuringWombat:(BOOL)a3
{
  self->_prefersToPlayDuringWombat = a3;
}

- (NSSet)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUConversationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_invitationPreferences, 0);
}

@end
