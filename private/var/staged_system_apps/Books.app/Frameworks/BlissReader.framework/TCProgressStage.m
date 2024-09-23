@implementation TCProgressStage

- (id)initRootStageInContext:(id)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TCProgressStage;
  result = -[TCProgressStage init](&v5, "init");
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_315BE0;
    *((_QWORD *)result + 5) = 0;
    *((_QWORD *)result + 6) = a3;
  }
  return result;
}

- (TCProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5 inContext:(id)a6
{
  TCProgressStage *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TCProgressStage;
  v10 = -[TCProgressStage init](&v12, "init");
  if (v10)
  {
    v10->m_parentStage = (TCProgressStage *)objc_msgSend(a6, "currentStage");
    v10->m_currentPosition = 0.0;
    v10->m_totalSteps = a3;
    v10->m_stepsInParent = a4;
    v10->m_name = (NSString *)a5;
    v10->m_context = (TCProgressContext *)a6;
  }
  return v10;
}

- (id)initBranchWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5 inContext:(id)a6
{
  TCProgressStage *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TCProgressStage;
  v10 = -[TCProgressStage init](&v12, "init");
  if (v10)
  {
    v10->m_parentStage = (TCProgressStage *)objc_msgSend(a6, "rootStage");
    v10->m_currentPosition = 0.0;
    v10->m_totalSteps = a3;
    v10->m_stepsInParent = a4;
    v10->m_name = (NSString *)a5;
    v10->m_context = (TCProgressContext *)a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->m_parentStage = 0;
  v3.receiver = self;
  v3.super_class = (Class)TCProgressStage;
  -[TCProgressStage dealloc](&v3, "dealloc");
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
      -[TCProgressContext reportProgress:](self->m_context, "reportProgress:", v4);
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

@end
