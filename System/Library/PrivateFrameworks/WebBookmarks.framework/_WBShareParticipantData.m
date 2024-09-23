@implementation _WBShareParticipantData

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)activeParticipantIDs
{
  return self->_activeParticipantIDs;
}

- (void)setActiveParticipantIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeParticipantIDs, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
