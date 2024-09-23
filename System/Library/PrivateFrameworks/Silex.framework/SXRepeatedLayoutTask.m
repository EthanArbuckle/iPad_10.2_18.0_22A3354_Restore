@implementation SXRepeatedLayoutTask

- (SXRepeatedLayoutTask)initWithTask:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXRepeatedLayoutTask *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXLayoutInstructions defaultInstructions](SXLayoutInstructions, "defaultInstructions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blueprint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "DOM");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)SXRepeatedLayoutTask;
  v12 = -[SXLayoutTask initWithOptions:instructions:blueprint:DOM:](&v19, sel_initWithOptions_instructions_blueprint_DOM_, v8, v9, v10, v11);

  if (v12)
  {
    v13 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12->_repeatCount = objc_msgSend(v13, "repeatCount") + 1;
      objc_msgSend(v13, "elapsedDuration");
      v15 = v14;
      objc_msgSend(v7, "duration");
      v17 = v15 + v16;
    }
    else
    {
      v12->_repeatCount = 1;
      objc_msgSend(v7, "duration");
    }
    v12->_elapsedDuration = v17;

  }
  return v12;
}

- (unint64_t)repeatCount
{
  return self->_repeatCount;
}

- (double)elapsedDuration
{
  return self->_elapsedDuration;
}

@end
