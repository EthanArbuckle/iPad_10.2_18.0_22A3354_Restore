@implementation AXPhoenixClassifierRNNModelWindow

- (void)resetHistory
{
  MLMultiArray *v2;

  v2 = -[AXPhoenixClassifierRNNModelWindow emptyHistoryArray](self, "emptyHistoryArray");
  -[AXPhoenixClassifierRNNModelWindow setHistoryArray:](self, "setHistoryArray:");

}

- (void)updateHistoryShape:(id)a3
{
  id v3;
  id v4;
  id v5;
  MLMultiArray *v6;
  id v7;
  NSArray *v8;
  BOOL v9;
  void *v10;
  unint64_t i;
  id location[2];
  AXPhoenixClassifierRNNModelWindow *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[AXPhoenixClassifierRNNModelWindow setHistoryShape:](v13, "setHistoryShape:", location[0]);
  v3 = objc_alloc(MEMORY[0x24BDBFFF0]);
  v10 = (void *)objc_msgSend(v3, "initWithShape:dataType:error:", location[0], 65568, 0);
  -[AXPhoenixClassifierRNNModelWindow setEmptyHistoryArray:](v13, "setEmptyHistoryArray:");

  for (i = 0; ; ++i)
  {
    v8 = -[AXPhoenixClassifierRNNModelWindow historyShape](v13, "historyShape");
    v7 = -[NSArray lastObject](v8, "lastObject");
    v9 = i >= objc_msgSend(v7, "unsignedIntegerValue");

    if (v9)
      break;
    v6 = -[AXPhoenixClassifierRNNModelWindow emptyHistoryArray](v13, "emptyHistoryArray");
    v14[0] = &unk_24F196728;
    v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
    v14[1] = v5;
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    -[MLMultiArray setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &unk_24F196718);

  }
  -[AXPhoenixClassifierRNNModelWindow resetHistory](v13, "resetHistory");
  objc_storeStrong(location, 0);
}

- (BOOL)foundTap
{
  return self->_foundTap;
}

- (void)setFoundTap:(BOOL)a3
{
  self->_foundTap = a3;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

- (void)setTapCount:(unint64_t)a3
{
  self->_tapCount = a3;
}

- (unint64_t)samplesSinceLastTap
{
  return self->_samplesSinceLastTap;
}

- (void)setSamplesSinceLastTap:(unint64_t)a3
{
  self->_samplesSinceLastTap = a3;
}

- (NSArray)historyShape
{
  return self->_historyShape;
}

- (void)setHistoryShape:(id)a3
{
  objc_storeStrong((id *)&self->_historyShape, a3);
}

- (MLMultiArray)historyArray
{
  return self->_historyArray;
}

- (void)setHistoryArray:(id)a3
{
  objc_storeStrong((id *)&self->_historyArray, a3);
}

- (MLMultiArray)emptyHistoryArray
{
  return self->_emptyHistoryArray;
}

- (void)setEmptyHistoryArray:(id)a3
{
  objc_storeStrong((id *)&self->_emptyHistoryArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyHistoryArray, 0);
  objc_storeStrong((id *)&self->_historyArray, 0);
  objc_storeStrong((id *)&self->_historyShape, 0);
}

@end
