@implementation AXPhoenixClassifierRNNModelInputData

- (void)updateInputShape:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id location[2];
  AXPhoenixClassifierRNNModelInputData *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", 0);
  v10[0] = v7;
  v3 = (void *)MEMORY[0x24BDD16E0];
  v6 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", 1);
  v5 = (id)objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue"));
  v10[1] = v5;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  -[AXPhoenixClassifierRNNModelInputData setInputShape:](v9, "setInputShape:");

  objc_storeStrong(location, 0);
}

- (NSArray)inputShape
{
  return self->_inputShape;
}

- (void)setInputShape:(id)a3
{
  objc_storeStrong((id *)&self->_inputShape, a3);
}

- (AccelerometerBuffer)accelerometerBuffer
{
  return self->_accelerometerBuffer;
}

- (void)setAccelerometerBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_accelerometerBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelerometerBuffer, 0);
  objc_storeStrong((id *)&self->_inputShape, 0);
}

@end
