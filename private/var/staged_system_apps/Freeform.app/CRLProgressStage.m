@implementation CRLProgressStage

- (id)initRootStageInContext:(id)a3
{
  id v5;
  char *v6;
  id *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLProgressStage;
  v6 = -[CRLProgressStage init](&v10, "init");
  v7 = (id *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_100EED6E0;
    v8 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 5) = 0x3FF0000000000000;
    *((_QWORD *)v6 + 6) = 0;

    objc_storeStrong(v7 + 7, a3);
  }

  return v7;
}

- (CRLProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 inContext:(id)a5
{
  id v9;
  CRLProgressStage *v10;
  uint64_t v11;
  CRLProgressStage *m_parentStage;
  double v13;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRLProgressStage;
  v10 = -[CRLProgressStage init](&v15, "init");
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentStage"));
    m_parentStage = v10->m_parentStage;
    v10->m_parentStage = (CRLProgressStage *)v11;

    v10->m_currentPosition = 0.0;
    v10->m_totalSteps = a3;
    v10->m_stepsInParent = a4;
    -[CRLProgressStage currentPosition](v10->m_parentStage, "currentPosition");
    v10->m_startInParent = v13;
    v10->m_nextSubStageParentSize = 1.0;
    objc_storeStrong((id *)&v10->m_context, a5);
  }

  return v10;
}

- (void)dealloc
{
  CRLProgressStage *m_parentStage;
  objc_super v4;

  m_parentStage = self->m_parentStage;
  self->m_parentStage = 0;

  v4.receiver = self;
  v4.super_class = (Class)CRLProgressStage;
  -[CRLProgressStage dealloc](&v4, "dealloc");
}

- (void)advanceProgress:(double)a3
{
  -[CRLProgressStage setProgress:](self, "setProgress:", self->m_currentPosition + a3);
}

- (void)setProgress:(double)m_totalSteps
{
  double v4;
  CRLProgressStage *v5;
  uint64_t v6;
  double m_currentPosition;
  double v9;
  CRLProgressStage *m_parentStage;
  CRLProgressContext *m_context;
  double v12;

  v4 = m_totalSteps - self->m_totalSteps;
  if (v4 <= 0.0000001)
  {
    if (v4 > 0.0)
      m_totalSteps = self->m_totalSteps;
  }
  else
  {
    v5 = self;
    do
    {
      v6 = objc_claimAutoreleasedReturnValue(-[CRLProgressStage parentStage](v5, "parentStage"));

      v5 = (CRLProgressStage *)v6;
    }
    while (v6);
    m_totalSteps = self->m_totalSteps;
  }
  m_currentPosition = self->m_currentPosition;
  if (m_currentPosition - m_totalSteps <= 0.0 || m_currentPosition - m_totalSteps > 0.0000001)
    v9 = m_totalSteps;
  else
    v9 = self->m_currentPosition;
  if (m_currentPosition != v9)
  {
    self->m_currentPosition = v9;
    m_parentStage = self->m_parentStage;
    if (m_parentStage)
    {
      -[CRLProgressStage setProgress:](m_parentStage, "setProgress:", self->m_startInParent + v9 / self->m_totalSteps * self->m_stepsInParent);
    }
    else
    {
      m_context = self->m_context;
      -[CRLProgressStage overallProgress](self, "overallProgress");
      -[CRLProgressContext reportProgress:overallProgress:](m_context, "reportProgress:overallProgress:", v9, v12);
    }
  }
}

- (void)setProgressPercentage:(double)a3
{
  -[CRLProgressStage setProgress:](self, "setProgress:", self->m_totalSteps * a3 / 100.0);
}

- (void)end
{
  -[CRLProgressStage setProgress:](self, "setProgress:", self->m_totalSteps);
}

- (id)parentStage
{
  return self->m_parentStage;
}

- (double)currentPosition
{
  return self->m_currentPosition;
}

- (double)overallProgress
{
  double result;

  if (!self->m_parentStage)
    return self->m_currentPosition / self->m_totalSteps;
  -[CRLProgressStage overallProgress](self->m_parentStage, "overallProgress");
  return result;
}

- (double)nextSubStageParentSize
{
  return self->m_nextSubStageParentSize;
}

- (void)setNextSubStageParentSize:(double)a3
{
  self->m_nextSubStageParentSize = a3;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CRLProgressStage %p: At %g of %g steps. Takes %g steps in parent stage %p starting at %g"), self, *(_QWORD *)&self->m_currentPosition, *(_QWORD *)&self->m_totalSteps, *(_QWORD *)&self->m_stepsInParent, self->m_parentStage, *(_QWORD *)&self->m_startInParent);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_context, 0);
  objc_storeStrong((id *)&self->m_parentStage, 0);
}

@end
