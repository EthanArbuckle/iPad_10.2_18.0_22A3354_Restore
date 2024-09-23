@implementation WiFiCandidateNetworkStub

- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiCandidateNetworkStub;
  -[WiFiCandidateNetworkStub dealloc](&v3, "dealloc");
}

- (NSSet)accessPoints
{
  return self->_accessPoints;
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (BOOL)matched
{
  return self->_matched;
}

- (void)setMatched:(BOOL)a3
{
  self->_matched = a3;
}

- (NSString)password
{
  return self->_password;
}

- (TBScore)popularityScore
{
  return self->_popularityScore;
}

- (TBScore)qualityScore
{
  return self->_qualityScore;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)venueGroup
{
  return self->_venueGroup;
}

- (unsigned)venueType
{
  return self->_venueType;
}

@end
