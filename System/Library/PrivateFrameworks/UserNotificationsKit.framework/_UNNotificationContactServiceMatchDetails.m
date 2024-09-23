@implementation _UNNotificationContactServiceMatchDetails

- (_UNNotificationContactServiceMatchDetails)initWithCnContactIdentifier:(id)a3 cnContactFullname:(id)a4 isSuggestedContact:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _UNNotificationContactServiceMatchDetails *v10;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UNNotificationContactServiceMatchDetails;
  v10 = -[_UNNotificationContactServiceMatchDetails init](&v12, sel_init);
  if (v10)
  {
    NCRegisterUserNotificationsUILogging();
    -[_UNNotificationContactServiceMatchDetails setCnContactIdentifier:](v10, "setCnContactIdentifier:", v8);
    -[_UNNotificationContactServiceMatchDetails setCnContactFullname:](v10, "setCnContactFullname:", v9);
    -[_UNNotificationContactServiceMatchDetails setIsSuggestedMatch:](v10, "setIsSuggestedMatch:", v5);
  }

  return v10;
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (void)setCnContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (void)setCnContactFullname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isSuggestedMatch
{
  return self->_isSuggestedMatch;
}

- (void)setIsSuggestedMatch:(BOOL)a3
{
  self->_isSuggestedMatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContactFullname, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
}

@end
