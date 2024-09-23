@implementation VGFrameSelectionDumpOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *selectedPoses;
  void *v5;
  id v6;

  v6 = a3;
  selectedPoses = self->_selectedPoses;
  NSStringFromSelector(sel_selectedPoses);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", selectedPoses, v5);

}

- (VGFrameSelectionDumpOutput)initWithCoder:(id)a3
{
  id v4;
  VGFrameSelectionDumpOutput *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *selectedPoses;
  VGFrameSelectionDumpOutput *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VGFrameSelectionDumpOutput;
  v5 = -[VGFrameSelectionDumpOutput init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_selectedPoses);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    selectedPoses = v5->_selectedPoses;
    v5->_selectedPoses = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (NSArray)selectedPoses
{
  return self->_selectedPoses;
}

- (void)setSelectedPoses:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPoses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPoses, 0);
}

@end
