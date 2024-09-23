@implementation MOTripPlan

- (MOTripPlan)initWithDestination:(id)a3 destinationType:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  MOTripPlan *v14;
  MOTripPlan *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MOTripPlan;
  v14 = -[MOTripPlan init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_destination, a3);
    v15->_destinationType = a4;
    objc_storeStrong((id *)&v15->_startDate, a5);
    objc_storeStrong((id *)&v15->_endDate, a6);
  }

  return v15;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (NSString)destination
{
  return self->_destination;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
