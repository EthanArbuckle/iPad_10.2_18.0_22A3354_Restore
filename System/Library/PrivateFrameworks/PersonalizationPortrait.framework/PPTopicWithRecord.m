@implementation PPTopicWithRecord

- (PPTopicWithRecord)initWithTopicIdentifier:(id)a3 mostRelevantRecord:(id)a4
{
  id v7;
  PPTopicWithRecord *v8;
  PPTopicWithRecord *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PPTopicWithRecord;
  v8 = -[PPTopic initWithTopicIdentifier:mostRelevantRecord:](&v11, sel_initWithTopicIdentifier_mostRelevantRecord_, a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_mostRelevantRecord, a4);

  return v9;
}

- (id)mostRelevantRecord
{
  return self->_mostRelevantRecord;
}

- (double)sentimentScore
{
  PPTopicRecord *mostRelevantRecord;
  double result;

  mostRelevantRecord = self->_mostRelevantRecord;
  if (!mostRelevantRecord)
    return 0.0;
  -[PPTopicRecord sentimentScore](mostRelevantRecord, "sentimentScore");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRelevantRecord, 0);
}

@end
