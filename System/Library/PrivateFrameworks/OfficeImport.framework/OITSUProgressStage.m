@implementation OITSUProgressStage

- (id)initRootStageInContext:(id)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSUProgressStage;
  result = -[OITSUProgressStage init](&v5, sel_init);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_22A4BD1A0;
    *((_QWORD *)result + 5) = 0x3FF0000000000000;
    *((_QWORD *)result + 6) = 0;
    *((_QWORD *)result + 7) = a3;
  }
  return result;
}

- (OITSUProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 inContext:(id)a5
{
  OITSUProgressStage *v8;
  OITSUProgressStage *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OITSUProgressStage;
  v8 = -[OITSUProgressStage init](&v12, sel_init);
  if (v8)
  {
    v9 = (OITSUProgressStage *)(id)objc_msgSend(a5, "currentStage");
    v8->m_parentStage = v9;
    v8->m_currentPosition = 0.0;
    v8->m_totalSteps = a3;
    v8->m_stepsInParent = a4;
    -[OITSUProgressStage currentPosition](v9, "currentPosition");
    v8->m_startInParent = v10;
    v8->m_nextSubStageParentSize = 1.0;
    v8->m_context = (OITSUProgressContext *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->m_parentStage = 0;
  v3.receiver = self;
  v3.super_class = (Class)OITSUProgressStage;
  -[OITSUProgressStage dealloc](&v3, sel_dealloc);
}

- (void)advanceProgress:(double)a3
{
  -[OITSUProgressStage setProgress:](self, "setProgress:", self->m_currentPosition + a3);
}

- (void)setProgress:(double)a3
{
  OITSUProgressStage *v3;
  double m_totalSteps;
  double m_currentPosition;
  double v7;
  OITSUProgressStage *m_parentStage;
  OITSUProgressContext *m_context;
  double v10;

  v3 = self;
  m_totalSteps = self->m_totalSteps;
  if (a3 - m_totalSteps <= 0.0000001)
  {
    if (a3 - m_totalSteps <= 0.0)
      goto LABEL_6;
  }
  else
  {
    do
      self = -[OITSUProgressStage parentStage](self, "parentStage");
    while (self);
    m_totalSteps = v3->m_totalSteps;
  }
  a3 = m_totalSteps;
LABEL_6:
  m_currentPosition = v3->m_currentPosition;
  if (m_currentPosition - a3 <= 0.0 || m_currentPosition - a3 > 0.0000001)
    v7 = a3;
  else
    v7 = v3->m_currentPosition;
  if (m_currentPosition != v7)
  {
    v3->m_currentPosition = v7;
    m_parentStage = v3->m_parentStage;
    if (m_parentStage)
    {
      -[OITSUProgressStage setProgress:](m_parentStage, "setProgress:", v3->m_startInParent + v7 / m_totalSteps * v3->m_stepsInParent);
    }
    else
    {
      m_context = v3->m_context;
      -[OITSUProgressStage overallProgress](v3, "overallProgress");
      -[OITSUProgressContext reportProgress:overallProgress:](m_context, "reportProgress:overallProgress:", v7, v10);
    }
  }
}

- (void)setProgressPercentage:(double)a3
{
  -[OITSUProgressStage setProgress:](self, "setProgress:", self->m_totalSteps * a3 / 100.0);
}

- (void)end
{
  -[OITSUProgressStage setProgress:](self, "setProgress:", self->m_totalSteps);
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
  -[OITSUProgressStage overallProgress](self->m_parentStage, "overallProgress");
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
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TSUProgressStage %p: At %g of %g steps. Takes %g steps in parent stage %p starting at %g"), self, *(_QWORD *)&self->m_currentPosition, *(_QWORD *)&self->m_totalSteps, *(_QWORD *)&self->m_stepsInParent, self->m_parentStage, *(_QWORD *)&self->m_startInParent);
}

@end
