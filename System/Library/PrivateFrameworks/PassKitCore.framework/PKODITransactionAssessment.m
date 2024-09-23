@implementation PKODITransactionAssessment

- (PKODITransactionAssessment)init
{
  return -[PKODITransactionAssessment initWithAssessmentType:](self, "initWithAssessmentType:", 0);
}

- (PKODITransactionAssessment)initWithAssessmentType:(unint64_t)a3
{
  PKODITransactionAssessment *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKODITransactionAssessment;
  result = -[PKODIAssessment init](&v5, sel_init);
  if (result)
    result->_assessmentType = a3;
  return result;
}

- (void)createODISession
{
  -[PKODITransactionAssessment createODISessionWithType:](self, "createODISessionWithType:", -[PKODITransactionAssessment assessmentType](self, "assessmentType"));
}

- (void)createODISessionWithType:(unint64_t)a3
{
  id *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    if (a3 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v4 = (id *)MEMORY[0x1E0D17768];
  }
  else
  {
    v4 = (id *)MEMORY[0x1E0D17760];
  }
  v8 = *v4;
LABEL_7:
  v5 = objc_alloc(MEMORY[0x1E0D17588]);
  PKPassKitCoreBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithServiceIdentifier:forDSIDType:andLocationBundle:", v8, 1, v6);
  -[PKODIAssessment setOdiSession:](self, "setOdiSession:", v7);

}

- (void)getAssessmentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[PKODIAssessment odiSession](self, "odiSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PKODIAssessment odiSession](self, "odiSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getAssessmentForTransaction:", v7);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
    v4 = v7;
  }

}

- (unint64_t)assessmentType
{
  return self->_assessmentType;
}

- (void)setAssessmentType:(unint64_t)a3
{
  self->_assessmentType = a3;
}

@end
