@implementation TUConversationInvitationPreference

- (TUConversationInvitationPreference)initWithHandleType:(int64_t)a3 notificationStyles:(int64_t)a4
{
  TUConversationInvitationPreference *v6;
  TUConversationInvitationPreference *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUConversationInvitationPreference;
  v6 = -[TUConversationInvitationPreference init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_handleType = a3;
    v6->_notificationStyles = objc_msgSend((id)objc_opt_class(), "validateNotificationStyles:", a4);
  }
  return v7;
}

+ (int64_t)validateNotificationStyles:(int64_t)a3
{
  int64_t v3;
  int64_t v4;

  v3 = a3 & 2;
  if ((a3 & 4) != 0)
    v3 = a3 & 0xA | 4;
  v4 = v3 | a3 & 0x10;
  if ((a3 & 1) != 0)
    return 1;
  else
    return v4;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handleType=%ld"), -[TUConversationInvitationPreference handleType](self, "handleType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" notificationStyles=%ld"), -[TUConversationInvitationPreference notificationStyles](self, "notificationStyles"));
  if ((-[TUConversationInvitationPreference notificationStyles](self, "notificationStyles") & 1) != 0)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" notificationStyles.NoNotification=%@"), v4);
  if ((-[TUConversationInvitationPreference notificationStyles](self, "notificationStyles") & 2) != 0)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" notificationStyles.UserNotification=%@"), v5);
  if ((-[TUConversationInvitationPreference notificationStyles](self, "notificationStyles") & 4) != 0)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" notificationStyles.IncomingCall=%@"), v6);
  if ((-[TUConversationInvitationPreference notificationStyles](self, "notificationStyles") & 8) != 0)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" notificationStyles.IndefiniteCall=%@"), v7);
  if ((-[TUConversationInvitationPreference notificationStyles](self, "notificationStyles") & 0x10) != 0)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" notificationStyles.ScreenShareRequest=%@"), v8);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationInvitationPreference isEqualToInvitationPreference:](self, "isEqualToInvitationPreference:", v4);

  return v5;
}

- (BOOL)isEqualToInvitationPreference:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[TUConversationInvitationPreference handleType](self, "handleType");
  if (v5 == objc_msgSend(v4, "handleType"))
  {
    v6 = -[TUConversationInvitationPreference notificationStyles](self, "notificationStyles");
    v7 = v6 == objc_msgSend(v4, "notificationStyles");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[TUConversationInvitationPreference handleType](self, "handleType");
  return -[TUConversationInvitationPreference notificationStyles](self, "notificationStyles") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithHandleType:notificationStyles:", self->_handleType, self->_notificationStyles);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationInvitationPreference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  NSStringFromSelector(sel_handleType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  NSStringFromSelector(sel_notificationStyles);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", v7);

  return -[TUConversationInvitationPreference initWithHandleType:notificationStyles:](self, "initWithHandleType:notificationStyles:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t handleType;
  id v5;
  void *v6;
  int64_t notificationStyles;
  id v8;

  handleType = self->_handleType;
  v5 = a3;
  NSStringFromSelector(sel_handleType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", handleType, v6);

  notificationStyles = self->_notificationStyles;
  NSStringFromSelector(sel_notificationStyles);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", notificationStyles, v8);

}

+ (id)invitationPreferencesForAllHandlesWithStyles:(int64_t)a3
{
  id v4;
  TUConversationInvitationPreference *v5;
  TUConversationInvitationPreference *v6;
  TUConversationInvitationPreference *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]([TUConversationInvitationPreference alloc], "initWithHandleType:notificationStyles:", 2, a3);
  v6 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]([TUConversationInvitationPreference alloc], "initWithHandleType:notificationStyles:", 3, a3, v5);
  v11[1] = v6;
  v7 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]([TUConversationInvitationPreference alloc], "initWithHandleType:notificationStyles:", 1, a3);
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithArray:", v8);

  return v9;
}

+ (NSSet)standardInvitationPreferencesForLink
{
  return (NSSet *)objc_msgSend((id)objc_opt_class(), "invitationPreferencesForAllHandlesWithStyles:", 2);
}

+ (NSSet)letMeInResponseInvitationPreferences
{
  return (NSSet *)objc_msgSend((id)objc_opt_class(), "invitationPreferencesForAllHandlesWithStyles:", 1);
}

+ (NSSet)noNotificationInvitationPreferences
{
  return (NSSet *)objc_msgSend((id)objc_opt_class(), "invitationPreferencesForAllHandlesWithStyles:", 1);
}

+ (NSSet)incomingCallInvitationPreferences
{
  return (NSSet *)objc_msgSend((id)objc_opt_class(), "invitationPreferencesForAllHandlesWithStyles:", 4);
}

+ (NSSet)incomingCallAndNotificationInvitationPreferences
{
  return (NSSet *)objc_msgSend((id)objc_opt_class(), "invitationPreferencesForAllHandlesWithStyles:", 6);
}

+ (NSSet)screenShareRequestInvitationPreferences
{
  return (NSSet *)objc_msgSend((id)objc_opt_class(), "invitationPreferencesForAllHandlesWithStyles:", 16);
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (int64_t)notificationStyles
{
  return self->_notificationStyles;
}

@end
