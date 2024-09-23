@implementation TCProgressStage

- (id)initRootStageInContext:(id)a3
{
  id v5;
  char *v6;
  id *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCProgressStage;
  v6 = -[TCProgressStage init](&v10, sel_init);
  v7 = (id *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_22A4BD1A0;
    v8 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = 0;

    objc_storeStrong(v7 + 6, a3);
  }

  return v7;
}

- (TCProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5 inContext:(id)a6
{
  id v11;
  id v12;
  TCProgressStage *v13;
  uint64_t v14;
  TCProgressStage *m_parentStage;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TCProgressStage;
  v13 = -[TCProgressStage init](&v17, sel_init);
  if (v13)
  {
    objc_msgSend(v12, "currentStage");
    v14 = objc_claimAutoreleasedReturnValue();
    m_parentStage = v13->m_parentStage;
    v13->m_parentStage = (TCProgressStage *)v14;

    v13->m_currentPosition = 0.0;
    v13->m_totalSteps = a3;
    v13->m_stepsInParent = a4;
    objc_storeStrong((id *)&v13->m_name, a5);
    objc_storeStrong((id *)&v13->m_context, a6);
  }

  return v13;
}

- (id)initBranchWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5 inContext:(id)a6
{
  id v11;
  id v12;
  TCProgressStage *v13;
  uint64_t v14;
  TCProgressStage *m_parentStage;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TCProgressStage;
  v13 = -[TCProgressStage init](&v17, sel_init);
  if (v13)
  {
    objc_msgSend(v12, "rootStage");
    v14 = objc_claimAutoreleasedReturnValue();
    m_parentStage = v13->m_parentStage;
    v13->m_parentStage = (TCProgressStage *)v14;

    v13->m_currentPosition = 0.0;
    v13->m_totalSteps = a3;
    v13->m_stepsInParent = a4;
    objc_storeStrong((id *)&v13->m_name, a5);
    objc_storeStrong((id *)&v13->m_context, a6);
  }

  return v13;
}

- (void)dealloc
{
  TCProgressStage *m_parentStage;
  objc_super v4;

  m_parentStage = self->m_parentStage;
  self->m_parentStage = 0;

  v4.receiver = self;
  v4.super_class = (Class)TCProgressStage;
  -[TCProgressStage dealloc](&v4, sel_dealloc);
}

- (void)advanceProgress:(double)a3
{
  double m_currentPosition;
  double v4;

  m_currentPosition = self->m_currentPosition;
  v4 = m_currentPosition + a3;
  if (m_currentPosition != v4)
  {
    self->m_currentPosition = v4;
    if (self->m_parentStage)
      -[TCProgressStage advanceProgress:](self->m_parentStage, "advanceProgress:", (v4 - m_currentPosition) / self->m_totalSteps * self->m_stepsInParent);
    else
      -[TCProgressContext reportProgress:](self->m_context, "reportProgress:");
  }
}

- (void)setProgress:(double)a3
{
  -[TCProgressStage advanceProgress:](self, "advanceProgress:", a3 - self->m_currentPosition);
}

- (void)end
{
  -[TCProgressStage setProgress:](self, "setProgress:", self->m_totalSteps);
}

- (id)parentStage
{
  return self->m_parentStage;
}

- (double)currentPosition
{
  return self->m_currentPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_context, 0);
  objc_storeStrong((id *)&self->m_parentStage, 0);
  objc_storeStrong((id *)&self->m_name, 0);
}

@end
