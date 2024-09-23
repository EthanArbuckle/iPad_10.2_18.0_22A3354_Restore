@implementation AccelerometerData

- (AccelerometerData)initWithData:(id)a3 timestamp:(double)a4
{
  AccelerometerData *v5;
  objc_super v6;
  double v7;
  SEL v8;
  AccelerometerData *v9;
  $1AB5FA073B851C12C2339EC22442E995 v10;

  v10 = a3;
  v8 = a2;
  v7 = a4;
  v9 = 0;
  v6.receiver = self;
  v6.super_class = (Class)AccelerometerData;
  v9 = -[AccelerometerData init](&v6, sel_init);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v9->_timestamp = v7;
    v9->_x = v10.var0;
    v9->_y = v10.var1;
    v9->_z = v10.var2;
  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp);
  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_x);
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_y);
  v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_z);
  v8 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@,%@,%@,%@"), v7, v6, v5, v4);

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (double)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end
