@implementation PGGraphBuilderInsertedIdentifiedPerson

- (PGGraphBuilderInsertedIdentifiedPerson)initWithPersonNode:(id)a3
{
  id v5;
  PGGraphBuilderInsertedIdentifiedPerson *v6;
  PGGraphBuilderInsertedIdentifiedPerson *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBuilderInsertedIdentifiedPerson;
  v6 = -[PGGraphBuilderInsertedIdentifiedPerson init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_personNode, a3);

  return v7;
}

- (PGGraphPersonNode)personNode
{
  return (PGGraphPersonNode *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)birthdayDate
{
  return self->_birthdayDate;
}

- (void)setBirthdayDate:(id)a3
{
  objc_storeStrong((id *)&self->_birthdayDate, a3);
}

- (NSDate)anniversaryDate
{
  return self->_anniversaryDate;
}

- (void)setAnniversaryDate:(id)a3
{
  objc_storeStrong((id *)&self->_anniversaryDate, a3);
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anniversaryDate, 0);
  objc_storeStrong((id *)&self->_birthdayDate, 0);
  objc_storeStrong((id *)&self->_personNode, 0);
}

@end
