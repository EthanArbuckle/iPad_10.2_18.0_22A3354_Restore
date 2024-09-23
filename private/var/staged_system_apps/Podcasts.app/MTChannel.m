@implementation MTChannel

- (void)setSubscriptionActive:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (-[MTChannel subscriptionActive](self, "subscriptionActive") != a3)
  {
    v5 = kChannelSubscriptionActive;
    -[MTChannel willChangeValueForKey:](self, "willChangeValueForKey:", kChannelSubscriptionActive);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    -[MTChannel setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, v5);

    -[MTChannel didChangeValueForKey:](self, "didChangeValueForKey:", v5);
  }
}

@end
