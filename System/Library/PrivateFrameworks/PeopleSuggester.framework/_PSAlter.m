@implementation _PSAlter

- (_PSAlter)initWithName:(id)a3
{
  id v5;
  _PSAlter *v6;
  _PSAlter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSAlter;
  v6 = -[_PSAlter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    *(_OWORD *)&v7->_distanceToCluster = xmmword_1A08F9240;
  }

  return v7;
}

- (_PSAlter)initWithName:(id)a3 andDistance:(double)a4 andTime:(double)a5
{
  id v9;
  _PSAlter *v10;
  _PSAlter *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PSAlter;
  v10 = -[_PSAlter init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_distanceToCluster = a4;
    v11->_timeSinceLastContact = a5;
  }

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (double)distanceToCluster
{
  return self->_distanceToCluster;
}

- (void)setDistanceToCluster:(double)a3
{
  self->_distanceToCluster = a3;
}

- (double)timeSinceLastContact
{
  return self->_timeSinceLastContact;
}

- (void)setTimeSinceLastContact:(double)a3
{
  self->_timeSinceLastContact = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
