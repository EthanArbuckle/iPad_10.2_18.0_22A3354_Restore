@implementation _UIShareParticipantDetails

- (void)encodeWithCoder:(id)a3
{
  NSString *detailText;
  id v5;

  detailText = self->_detailText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", detailText, CFSTR("deta"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participantID, CFSTR("part"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participantColor, CFSTR("colo"));

}

- (_UIShareParticipantDetails)initWithCoder:(id)a3
{
  id v4;
  _UIShareParticipantDetails *v5;
  uint64_t v6;
  NSString *detailText;
  uint64_t v8;
  NSString *participantID;
  uint64_t v10;
  UIColor *participantColor;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIShareParticipantDetails;
  v5 = -[_UIShareParticipantDetails init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deta"));
    v6 = objc_claimAutoreleasedReturnValue();
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("part"));
    v8 = objc_claimAutoreleasedReturnValue();
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colo"));
    v10 = objc_claimAutoreleasedReturnValue();
    participantColor = v5->_participantColor;
    v5->_participantColor = (UIColor *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)participantID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)detailText
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (UIColor)participantColor
{
  return (UIColor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setParticipantColor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
}

@end
