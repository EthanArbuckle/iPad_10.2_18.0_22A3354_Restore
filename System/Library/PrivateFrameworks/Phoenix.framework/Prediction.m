@implementation Prediction

- (Prediction)initWithModelOutput:(id)a3
{
  Prediction *v3;
  double v4;
  double v5;
  double v6;
  Prediction *v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  id location[2];
  Prediction *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)Prediction;
  v14 = -[Prediction init](&v12, sel_init);
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    v9 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", 0);
    objc_msgSend(v9, "doubleValue");
    v14->_noneScore = v4;

    v10 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", 1);
    objc_msgSend(v10, "doubleValue");
    v14->_doubleTapScore = v5;

    v11 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", 2);
    objc_msgSend(v11, "doubleValue");
    v14->_tripleTapScore = v6;

    v14->_maxConfidence = v14->_noneScore;
    v14->_predictedClass = 0;
    if (v14->_doubleTapScore > v14->_maxConfidence)
    {
      v14->_maxConfidence = v14->_doubleTapScore;
      v14->_predictedClass = 1;
    }
    if (v14->_tripleTapScore > v14->_maxConfidence)
    {
      v14->_maxConfidence = v14->_tripleTapScore;
      v14->_predictedClass = 2;
    }
  }
  v8 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v8;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_predictedClass);
  v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maxConfidence);
  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_noneScore);
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_doubleTapScore);
  v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_tripleTapScore);
  v9 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("class: %@, maxScore: %@ scores:{%@, %@, %@}"), v8, v7, v6, v5, v4);

  return v9;
}

- (double)noneScore
{
  return self->_noneScore;
}

- (void)setNoneScore:(double)a3
{
  self->_noneScore = a3;
}

- (double)doubleTapScore
{
  return self->_doubleTapScore;
}

- (double)tripleTapScore
{
  return self->_tripleTapScore;
}

- (double)maxConfidence
{
  return self->_maxConfidence;
}

- (unint64_t)predictedClass
{
  return self->_predictedClass;
}

- (void)setPredictedClass:(unint64_t)a3
{
  self->_predictedClass = a3;
}

@end
