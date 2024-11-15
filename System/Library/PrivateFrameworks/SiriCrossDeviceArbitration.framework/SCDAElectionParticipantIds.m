@implementation SCDAElectionParticipantIds

- (id)init:(id)a3 rotatedElectionParticipantId:(id)a4
{
  id v7;
  id v8;
  SCDAElectionParticipantIds *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCDAElectionParticipantIds;
  v9 = -[SCDAElectionParticipantIds init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_electionParticipantId, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSUUID)electionParticipantId
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)rotatedElectionParticipantId
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatedElectionParticipantId, 0);
  objc_storeStrong((id *)&self->_electionParticipantId, 0);
}

@end
