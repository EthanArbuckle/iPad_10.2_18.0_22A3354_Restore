@implementation PGGraphHealthRecordingFactory

+ (id)graphUpdateHealthRecorderForChangeConsumer:(BOOL)a3 analytics:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  v6 = -[PGGraphUpdateHealthRecorder initForChangeConsumer:analytics:]([PGGraphUpdateHealthRecorder alloc], "initForChangeConsumer:analytics:", v4, v5);

  return v6;
}

@end
