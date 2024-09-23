@implementation PKMutableAccountUserPreferences

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PKAccountUserPreferences initWithAccountUserPreferences:](+[PKAccountUserPreferences allocWithZone:](PKAccountUserPreferences, "allocWithZone:", a3), "initWithAccountUserPreferences:", self);
}

@end
