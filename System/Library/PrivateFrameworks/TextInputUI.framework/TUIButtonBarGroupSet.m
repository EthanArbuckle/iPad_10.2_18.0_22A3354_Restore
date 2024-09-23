@implementation TUIButtonBarGroupSet

- (NSArray)trailingButtonGroups
{
  return self->_trailingButtonGroups;
}

- (NSArray)leadingButtonGroups
{
  return self->_leadingButtonGroups;
}

- (NSArray)trailingSeparators
{
  return self->_trailingSeparators;
}

- (void)setUnifiedButtonGroups:(id)a3
{
  objc_storeStrong((id *)&self->_unifiedButtonGroups, a3);
}

- (void)setTrailingButtonGroups:(id)a3
{
  objc_storeStrong((id *)&self->_trailingButtonGroups, a3);
}

- (void)setLeadingButtonGroups:(id)a3
{
  objc_storeStrong((id *)&self->_leadingButtonGroups, a3);
}

- (NSArray)leadingSeparators
{
  return self->_leadingSeparators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedSeparators, 0);
  objc_storeStrong((id *)&self->_trailingSeparators, 0);
  objc_storeStrong((id *)&self->_leadingSeparators, 0);
  objc_storeStrong((id *)&self->_unifiedButtonGroups, 0);
  objc_storeStrong((id *)&self->_trailingButtonGroups, 0);
  objc_storeStrong((id *)&self->_leadingButtonGroups, 0);
}

- (NSArray)unifiedButtonGroups
{
  return self->_unifiedButtonGroups;
}

- (void)setLeadingSeparators:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSeparators, a3);
}

- (void)setTrailingSeparators:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSeparators, a3);
}

- (NSArray)unifiedSeparators
{
  return self->_unifiedSeparators;
}

- (void)setUnifiedSeparators:(id)a3
{
  objc_storeStrong((id *)&self->_unifiedSeparators, a3);
}

@end
