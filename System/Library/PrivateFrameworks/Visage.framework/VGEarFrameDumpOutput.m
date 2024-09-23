@implementation VGEarFrameDumpOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *leftEarEnrolledPoses;
  void *v5;
  NSArray *rightEarEnrolledPoses;
  void *v7;
  NSDictionary *leftEarEnrolledYawToBoundingBox;
  void *v9;
  NSDictionary *rightEarEnrolledYawToBoundingBox;
  void *v11;
  id v12;

  v12 = a3;
  leftEarEnrolledPoses = self->_leftEarEnrolledPoses;
  NSStringFromSelector(sel_leftEarEnrolledPoses);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", leftEarEnrolledPoses, v5);

  rightEarEnrolledPoses = self->_rightEarEnrolledPoses;
  NSStringFromSelector(sel_rightEarEnrolledPoses);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", rightEarEnrolledPoses, v7);

  leftEarEnrolledYawToBoundingBox = self->_leftEarEnrolledYawToBoundingBox;
  NSStringFromSelector(sel_leftEarEnrolledYawToBoundingBox);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", leftEarEnrolledYawToBoundingBox, v9);

  rightEarEnrolledYawToBoundingBox = self->_rightEarEnrolledYawToBoundingBox;
  NSStringFromSelector(sel_rightEarEnrolledYawToBoundingBox);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", rightEarEnrolledYawToBoundingBox, v11);

}

- (VGEarFrameDumpOutput)initWithCoder:(id)a3
{
  id v4;
  VGEarFrameDumpOutput *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *leftEarEnrolledPoses;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *rightEarEnrolledPoses;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *leftEarEnrolledYawToBoundingBox;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *rightEarEnrolledYawToBoundingBox;
  VGEarFrameDumpOutput *v30;
  objc_super v32;
  _QWORD v33[6];
  _QWORD v34[6];
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)VGEarFrameDumpOutput;
  v5 = -[VGEarFrameDumpOutput init](&v32, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_leftEarEnrolledPoses);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    leftEarEnrolledPoses = v5->_leftEarEnrolledPoses;
    v5->_leftEarEnrolledPoses = (NSArray *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_rightEarEnrolledPoses);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    rightEarEnrolledPoses = v5->_rightEarEnrolledPoses;
    v5->_rightEarEnrolledPoses = (NSArray *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    v34[3] = objc_opt_class();
    v34[4] = objc_opt_class();
    v34[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_leftEarEnrolledYawToBoundingBox);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    leftEarEnrolledYawToBoundingBox = v5->_leftEarEnrolledYawToBoundingBox;
    v5->_leftEarEnrolledYawToBoundingBox = (NSDictionary *)v22;

    v24 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    v33[4] = objc_opt_class();
    v33[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_rightEarEnrolledYawToBoundingBox);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    rightEarEnrolledYawToBoundingBox = v5->_rightEarEnrolledYawToBoundingBox;
    v5->_rightEarEnrolledYawToBoundingBox = (NSDictionary *)v28;

    v30 = v5;
  }

  return v5;
}

- (NSArray)leftEarEnrolledPoses
{
  return self->_leftEarEnrolledPoses;
}

- (void)setLeftEarEnrolledPoses:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarEnrolledPoses, a3);
}

- (NSArray)rightEarEnrolledPoses
{
  return self->_rightEarEnrolledPoses;
}

- (void)setRightEarEnrolledPoses:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarEnrolledPoses, a3);
}

- (NSDictionary)leftEarEnrolledYawToBoundingBox
{
  return self->_leftEarEnrolledYawToBoundingBox;
}

- (void)setLeftEarEnrolledYawToBoundingBox:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarEnrolledYawToBoundingBox, a3);
}

- (NSDictionary)rightEarEnrolledYawToBoundingBox
{
  return self->_rightEarEnrolledYawToBoundingBox;
}

- (void)setRightEarEnrolledYawToBoundingBox:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarEnrolledYawToBoundingBox, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarEnrolledYawToBoundingBox, 0);
  objc_storeStrong((id *)&self->_leftEarEnrolledYawToBoundingBox, 0);
  objc_storeStrong((id *)&self->_rightEarEnrolledPoses, 0);
  objc_storeStrong((id *)&self->_leftEarEnrolledPoses, 0);
}

@end
