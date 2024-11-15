@implementation StitchableInteraction

- (StitchableInteraction)initWithType:(id)a3 identifier:(id)a4 startDate:(id)a5 duration:(double)a6 isDonatedBySiri:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  StitchableInteraction *v16;
  StitchableInteraction *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)StitchableInteraction;
  v16 = -[StitchableInteraction init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_type, a3);
    objc_storeStrong((id *)&v17->_identifier, a4);
    objc_storeStrong((id *)&v17->_startDate, a5);
    v17->_duration = a6;
    v17->_isDonatedBySiri = a7;
  }

  return v17;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isDonatedBySiri
{
  return self->_isDonatedBySiri;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
