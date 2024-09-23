@implementation CRTextDetectorModelOutput

- (CRTextDetectorModelOutput)initWithF_score_act_sigmoid_output:(id)a3 geometry_output:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_f_score_act_sigmoid_output, a3);
    objc_storeStrong((id *)&self->_geometry_output, a4);
  }

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993CF68);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("f_score_act_sigmoid_output")) & 1) != 0)
  {
    v5 = 8;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("geometry_output")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = 16;
  }
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", *(Class *)((char *)&self->super.isa + v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (MLMultiArray)f_score_act_sigmoid_output
{
  return self->_f_score_act_sigmoid_output;
}

- (void)setF_score_act_sigmoid_output:(id)a3
{
  objc_storeStrong((id *)&self->_f_score_act_sigmoid_output, a3);
}

- (MLMultiArray)geometry_output
{
  return self->_geometry_output;
}

- (void)setGeometry_output:(id)a3
{
  objc_storeStrong((id *)&self->_geometry_output, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry_output, 0);
  objc_storeStrong((id *)&self->_f_score_act_sigmoid_output, 0);
}

@end
