@implementation VGBodyPoseFrameState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGBodyPoseFrameState)initWithCoder:(id)a3
{
  id v4;
  VGBodyPoseFrameState *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *scores;
  float v10;
  VGBodyPoseFrameState *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[VGBodyPoseFrameState init](self, "init");
  if (v5)
  {
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("scores"));
    v8 = objc_claimAutoreleasedReturnValue();
    scores = v5->_scores;
    v5->_scores = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("aggregatedScore"));
    v5->_aggregatedScore = v10;
    v11 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_scores, CFSTR("scores"));
  *(float *)&v4 = self->_aggregatedScore;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("aggregatedScore"), v4);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float *v5;
  NSDictionary *scores;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (float *)v4;
    scores = self->_scores;
    v7 = (!((unint64_t)scores | *((_QWORD *)v5 + 2))
       || -[NSDictionary isEqualToDictionary:](scores, "isEqualToDictionary:"))
      && self->_aggregatedScore == v5[2];

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_storeStrong((id *)&self->_scores, a3);
}

- (float)aggregatedScore
{
  return self->_aggregatedScore;
}

- (void)setAggregatedScore:(float)a3
{
  self->_aggregatedScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
}

@end
